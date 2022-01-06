//
//  UIControl+SSDKCategory.m
//  SSDKCategory
//
//  Created by maxl on 2018/12/27.
//  Copyright © 2018 mob. All rights reserved.
//

#import "UIControl+SSDKCategory.h"
#import <objc/runtime.h>
#import "NSDictionary+SSDKCategory.h"
static const int block_array_key;
static const int block_dic_key;
@interface SSDKControlTarget : NSObject

@property (nonatomic, copy) controlTargeAction block;

@property (nonatomic, assign) UIControlEvents  events;

@end

@implementation SSDKControlTarget

- (instancetype)initWithBlock:(controlTargeAction)block events:(UIControlEvents)events{
    if (self = [super init]) {
        _block = [block copy];
        _events = events;
    }
    return self;
}


- (void)sendControl:(UIControl *)control{
    if (_block) {
        _block(control);
    }
}
@end

@implementation UIControl (SSDKCategory)

- (void)addEventBlock:(controlTargeAction)block forEvents:(UIControlEvents)events{
    if (!events) return;
    if (!block) return;
    SSDKControlTarget *target = [[SSDKControlTarget alloc] initWithBlock:block events:events];
    [self addTarget:target action:@selector(sendControl:) forControlEvents:events];
    NSMutableArray *targets = [self ssdk_controlTargetsArray];
    [targets addObject:target];
}

- (void)removeAllEvents{
    [self.allTargets enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
        [self removeTarget:obj action:NULL forControlEvents:UIControlEventAllEvents];
    }];
    
    [[self ssdk_controlTargetsArray] removeAllObjects];
    [[self ssdk_controlTargetsDic] removeAllObjects];
}

- (void)setTarget:(id)target eventAction:(SEL)action forControlEvents:(UIControlEvents)events{
    if (!target || !action || !events) return;
    NSSet *targets = [self allTargets];
    for (id nowTarget in targets) {
        NSArray *actions = [self actionsForTarget:nowTarget forControlEvent:events];
        for (NSString *nowAction in actions) {
            [self removeTarget:nowTarget action:NSSelectorFromString(nowAction) forControlEvents:events];
        }
    }
    [self addTarget:target action:action forControlEvents:events];
}

- (void)setEventBlock:(controlTargeAction)block forEvents:(UIControlEvents)events{
    [self removeAllEventBlocksForEvents:events];
    [self addEventBlock:block forEvents:events];
}

- (BOOL)containsEventBlockForKey:(NSString *)key{
    NSMutableDictionary *dic = [self ssdk_controlTargetsDic];
    return [dic containsObjectForKey:key];
}

- (void)addEventBlock:(controlTargeAction)block forEvents:(UIControlEvents)events ForKey:(NSString *)key{
    if (!block || !events || !key) return;
    [self removeEventBlockForKey:key event:events];
    SSDKControlTarget *target = [[SSDKControlTarget alloc] initWithBlock:block events:events];
    [self addTarget:target action:@selector(sendControl:) forControlEvents:events];
    [[self ssdk_controlTargetsDic] setObject:target forKey:key];
}

- (void)removeEventBlockForKey:(NSString *)key event:(UIControlEvents)events{
    NSMutableDictionary *dic = [self ssdk_controlTargetsDic];
    SSDKControlTarget *target = [dic objectForKey:key];
    if (target) {
        UIControlEvents newEVent = target.events & (~events);
        if (newEVent) {
            [self removeTarget:target action:@selector(sendControl:) forControlEvents:target.events];
            target.events = newEVent;
            [self addTarget:target action:@selector(sendControl:) forControlEvents:target.events];
        }else{
            [self removeTarget:target action:@selector(sendControl:) forControlEvents:target.events];
            [dic removeObjectForKey:key];
        }
        
    }
}


- (void)removeAllEventBlocksForEvents:(UIControlEvents)controlEvents{
    if (!controlEvents) return;
    NSMutableArray *targets = [self ssdk_controlTargetsArray];
    NSMutableArray *removes = [NSMutableArray array];
    for (SSDKControlTarget *target in targets) {
        if (target.events & controlEvents) {
            UIControlEvents newEVent = target.events & (~controlEvents);
            if (newEVent) {
                [self removeTarget:target action:@selector(sendControl:) forControlEvents:target.events];
                target.events = newEVent;
                [self addTarget:target action:@selector(sendControl:) forControlEvents:target.events];
            }else{
                [self removeTarget:target action:@selector(sendControl:) forControlEvents:target.events];
                [removes addObject:target];
            }
        }
    }
    [targets removeObjectsInArray:removes];
    
    NSMutableArray *removeDicKeys = [NSMutableArray array];
    NSMutableDictionary *targetsDic = [self ssdk_controlTargetsDic];
    [targetsDic enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, SSDKControlTarget * _Nonnull target, BOOL * _Nonnull stop) {
        if (target.events & controlEvents) {
            UIControlEvents newEVent = target.events & (~controlEvents);
            if (newEVent) {
                [self removeTarget:target action:@selector(sendControl:) forControlEvents:target.events];
                target.events = newEVent;
                [self addTarget:target action:@selector(sendControl:) forControlEvents:target.events];
            }else{
                [self removeTarget:target action:@selector(sendControl:) forControlEvents:target.events];
                [removeDicKeys addObject:key];
            }
        }
    }];
    [targetsDic removeObjectsForKeys:removeDicKeys];
}


- (NSMutableArray <SSDKControlTarget *>*)ssdk_controlTargetsArray{
    NSMutableArray *targets = objc_getAssociatedObject(self, &block_array_key);
    if (!targets) {
        targets = [NSMutableArray array];
        objc_setAssociatedObject(self, &block_array_key, targets, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return targets;
}

- (NSMutableDictionary <NSString * ,SSDKControlTarget *>*)ssdk_controlTargetsDic{
    NSMutableDictionary *targets = objc_getAssociatedObject(self, &block_dic_key);
    if (!targets) {
        targets = [[NSMutableDictionary alloc] init];
        objc_setAssociatedObject(self, &block_dic_key, targets, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return targets;
}

@end
