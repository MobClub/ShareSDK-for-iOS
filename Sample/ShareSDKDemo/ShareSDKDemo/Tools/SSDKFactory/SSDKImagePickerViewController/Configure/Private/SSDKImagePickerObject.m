//
//  SSDKImagePickerObject.m
//  ShareSDKDemo
//
//  Created by PP on 2020/2/21.
//  Copyright © 2020 mob. All rights reserved.
//

#import "SSDKImagePickerObject.h"
#import <objc/message.h>
#import <objc/runtime.h>
#import "SSDKImagePickerConfigure.h"

static inline NSMutableArray *SSDKGetPropertyList(Class class){
    NSMutableArray *propertyList = [NSMutableArray array];
    unsigned int count;
    objc_property_t *list = class_copyPropertyList(class, &count);
    for (unsigned int i = 0; i < count; i++) {
        objc_property_t property = list[i];
        [propertyList addObject:[NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding]];
    }
    return propertyList;
}

static inline NSArray *SSDKObjectPropertyList(Class class){
    static NSMutableDictionary *dic = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dic = [NSMutableDictionary dictionary];
    });
    NSString *classString = NSStringFromClass(class);
    NSArray *list = dic[classString];
    if (list) {
        return list;
    }else{
        NSArray *objectList = dic[@"NSObject"];
        if (!objectList) {
            objectList = SSDKGetPropertyList([NSObject class]);
            dic[@"NSObject"] = objectList;
        }
        NSMutableArray *mutablelist = SSDKGetPropertyList(class);
        [mutablelist removeObjectsInArray:objectList];
        dic[classString] = mutablelist;
        return mutablelist;
    }
}

@interface SSDKImagePickerObject ()
{
    NSUInteger __configureId;
}
@end

@implementation SSDKImagePickerObject

- (NSUInteger)configureId{
    return __configureId;
}

- (void)setConfigureId:(NSUInteger)configureId{
    __configureId = configureId;
}

- (SSDKImagePickerObject *)configure{
    return [SSDKImagePickerConfigure configureWithId:self.configureId];
}

- (id)copy{
    NSArray *list = SSDKObjectPropertyList([self class]);
    id object = [[self class] new];
    for (NSString *property in list) {
        id value = [self valueForKey:property];
        if (value) {
            if ([value isKindOfClass:[SSDKImagePickerObject class]]) {
                [object setValue:[value copy] forKey:property];
            }else{
                [object setValue:value forKey:property];
            }
        }
    }
    return object;
}

@end

@interface SSDKImagePickerChangeInfo ()
{
    NSMutableArray * _insertIndexs;
    
    NSMutableArray * _removeIndexs;
    
    NSMutableArray * _changeIndexs;
    
    NSInteger isRow;
}

@end

@implementation SSDKImagePickerChangeInfo

- (NSArray *)removeIndexes{
    if (isRow == -1) {
        return _removeIndexs;
    }

    NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.removeCount];
    for (NSNumber *number in _removeIndexs) {
        [array addObject:isRow?[NSIndexPath indexPathForRow:number.integerValue inSection:0]:[NSIndexPath indexPathForItem:number.integerValue inSection:0]];
    }
    return array;
}

- (NSArray *)changeIndexes{
    if (isRow == -1) {
        return _changeIndexs;
    }
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.changeCount];
    for (NSNumber *number in _changeIndexs) {
        [array addObject:isRow?[NSIndexPath indexPathForRow:number.integerValue inSection:0]:[NSIndexPath indexPathForItem:number.integerValue inSection:0]];
    }
    return array;
}

- (NSArray *)insertIndexs{
    if (isRow == -1) {
        return _insertIndexs;
    }
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.insertCount];
    for (NSNumber *number in _insertIndexs) {
        [array addObject:isRow?[NSIndexPath indexPathForRow:number.integerValue inSection:0]:[NSIndexPath indexPathForItem:number.integerValue inSection:0]];
    }
    return array;
}

- (BOOL)isChange{
    return _changeIndexs.count || _removeIndexs.count || _insertIndexs.count;
}

- (NSInteger)changeCount{
    return _changeIndexs.count;
}

- (NSInteger)removeCount{
    return _removeIndexs.count;
}

- (NSInteger)insertCount{
    return _insertIndexs.count;
}

- (void)insertIndex:(NSInteger)index{
    [self addArray:&_insertIndexs index:index];
    [_changeIndexs removeObject:@(index)];
}

- (void)removeIndex:(NSInteger)index{
    [self addArray:&_removeIndexs index:index];
    [_changeIndexs removeObject:@(index)];
    [_insertIndexs removeObject:@(index)];
}



- (void)changeIndex:(NSInteger)index{
    if ([_removeIndexs containsObject:@(index)]) return;
    if ([_insertIndexs containsObject:@(index)]) return;
    [self addArray:&_changeIndexs index:index];
    
}

- (void)addArray:(NSMutableArray * __strong *)array index:(NSInteger)index{
    
    if (* array == nil) {
        * array = [NSMutableArray array];
    }
    
    if (![* array containsObject:@(index)]) {
        [* array addObject:@(index)];
    }
}

- (SSDKImagePickerChangeInfo *)item{
    isRow = 0;
    return self;
}
- (SSDKImagePickerChangeInfo *)row{
    isRow = 1;
    return self;
}

- (SSDKImagePickerChangeInfo *)numbers{
    isRow = -1;
    return self;
}

@end



