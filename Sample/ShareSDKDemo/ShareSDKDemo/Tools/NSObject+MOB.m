//
//  NSObject+MOB.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/9/18.
//  Copyright © 2019 mob. All rights reserved.
//

#import "NSObject+MOB.h"
#import <objc/message.h>

static const void *MOBRuntimeDeallocTasks = &MOBRuntimeDeallocTasks;
static const void *MOBRuntimeDeallocClassTag = &MOBRuntimeDeallocClassTag;


static inline void mob_swizzleDeallocIfNeed(Class swizzleClass){
    @synchronized (swizzleClass) {
        if (objc_getAssociatedObject(swizzleClass, MOBRuntimeDeallocClassTag)) return;
        objc_setAssociatedObject(swizzleClass, MOBRuntimeDeallocClassTag, @1, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        SEL deallocSelector = sel_registerName("dealloc");
        
        __block void (* oldImp) (__unsafe_unretained id, SEL) = NULL;
        
        id newImpBlock = ^ (__unsafe_unretained id self){
            
            NSMutableArray *deallocTask = objc_getAssociatedObject(self, &MOBRuntimeDeallocTasks);
            @synchronized (deallocTask) {
                if (deallocTask.count > 0) {
                    [deallocTask enumerateObjectsUsingBlock:^(mob_deallocTask obj, NSUInteger idx, BOOL * _Nonnull stop) {
                        if (obj) {
                            obj(self);
                        }
                    }];
                    [deallocTask removeAllObjects];
                }
            }
            if (oldImp == NULL) {
                struct objc_super supperInfo = {
                    .receiver = self,
                    .super_class = class_getSuperclass(swizzleClass)
                };
                ((void (*) (struct objc_super *, SEL))objc_msgSendSuper)(&supperInfo, deallocSelector);
            }else{
                oldImp(self,deallocSelector);
            }
        };
        IMP newImp = imp_implementationWithBlock(newImpBlock);
        if (!class_addMethod(swizzleClass, deallocSelector, newImp, "v@:")) {
            Method deallocMethod = class_getInstanceMethod(swizzleClass, deallocSelector);
            oldImp = (__typeof__ (oldImp))method_getImplementation(deallocMethod);
            oldImp = (__typeof__ (oldImp))method_setImplementation(deallocMethod, newImp);
        }
    }
}


@implementation NSObject (MOB)
- (NSMutableArray<mob_deallocTask> *)mob_deallocTasks{
    NSMutableArray *tasks = objc_getAssociatedObject(self, &MOBRuntimeDeallocTasks);
    if (tasks) return tasks;
    tasks = [NSMutableArray array];
    mob_swizzleDeallocIfNeed(object_getClass(self));
    objc_setAssociatedObject(self, &MOBRuntimeDeallocTasks, tasks, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return tasks;
}

- (void)mob_addDellocTask:(mob_deallocTask)task{
    @synchronized ([self mob_deallocTasks]) {
        [[self mob_deallocTasks] addObject:task];
    }
}
@end
