//
//  NSArray+SSDKCategory.m
//  SSDKCategory
//
//  Created by maxl on 2018/11/25.
//  Copyright © 2018 mob. All rights reserved.
//

#import "NSArray+SSDKCategory.h"
#import "NSData+SSDKCategory.h"
#import "NSString+SSDKCategory.h"
@implementation NSArray (SSDKCategory)
- (id)randomObject{
    NSInteger count = self.count;
    if (count == 0) return nil;
    return self[arc4random_uniform((u_int32_t)count)];
}

- (id)safe_objectAtIndex:(NSUInteger)index{
    return index < self.count ? self[index]:nil;
}

- (CGFloat)maxObject{
    return [[self valueForKeyPath:@"@max.self"] floatValue];
}

- (CGFloat)minObject{
    return [[self valueForKeyPath:@"@min.self"] floatValue];
}

- (CGFloat)sumObject{
    return [[self valueForKeyPath:@"@sum.self"] floatValue];
}

@end
@implementation NSArray (Plist)
+ (nullable NSArray *)arrayWithPlistData:(NSData *)plist{
    if (!plist) return nil;
    NSArray *array = [NSPropertyListSerialization propertyListWithData:plist options:NSPropertyListImmutable format:NULL error:NULL];
    if ([array isKindOfClass:[NSArray class]]) return array;
    return nil;
}

+ (nullable NSArray *)arrayWithPlistString:(NSString *)plist{
    if (!plist) return nil;
    return [self arrayWithPlistData:plist.utf8Data];
}

- (nullable NSData *)plistData{
    return [NSPropertyListSerialization dataWithPropertyList:self format:NSPropertyListBinaryFormat_v1_0 options:0 error:NULL];
}
- (NSString *)plistString{
    NSData *xmlData = [NSPropertyListSerialization dataWithPropertyList:self format:NSPropertyListXMLFormat_v1_0 options:kNilOptions error:NULL];
    if (xmlData) return xmlData.utf8String;
    return nil;
}


- (NSString *)jsonString{
    if ([NSJSONSerialization isValidJSONObject:self]) {
        return [NSJSONSerialization dataWithJSONObject:self options:0 error:NULL].utf8String;
    }
    return nil;
}

- (NSString *)jsonPrettyString{
    if ([NSJSONSerialization isValidJSONObject:self]) {
        return [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:NULL].utf8String;
    }
    return nil;
}

@end

@implementation NSMutableArray (SSDKCategory)
+ (NSMutableArray *)arrayWithPlistData:(NSData *)plist {
    if (!plist) return nil;
    NSMutableArray *array = [NSPropertyListSerialization propertyListWithData:plist options:NSPropertyListMutableContainersAndLeaves format:NULL error:NULL];
    if ([array isKindOfClass:[NSMutableArray class]]) return array;
    return nil;
}

+ (NSMutableArray *)arrayWithPlistString:(NSString *)plist {
    if (!plist) return nil;
    NSData* data = plist.utf8Data;
    return [self arrayWithPlistData:data];
}

- (void)removeFirstObject{
    if (self.count) {
        [self removeObjectAtIndex:0];
    }
}

- (id)popLastObject{
    id obj = nil;
    if (self.count) {
        obj = self.lastObject;
        [self removeLastObject];
    }
    return obj;
}

- (id)popFirstObject{
    id obj = nil;
    if (self.count) {
        obj = self.firstObject;
        [self removeFirstObject];
    }
    return obj;
}

- (NSMutableArray <id>* _Nonnull (^)(id _Nonnull))addObjectChain{
    return ^ (id data){
        if (data) {
            [self addObject:data];
        }
        return self;
    };
}

- (NSMutableArray <id>* _Nonnull (^)(id _Nonnull))removeObjectChain{
    return ^ (id data){
        if (data) {
            [self removeObject:data];
        }
        return self;
    };
}

- (NSMutableArray <id>* _Nonnull (^)(id _Nonnull))addObjectChainPre{
    return ^ (id data){
        if (data) {
            [self insertObject:data atIndex:0];
        }
        return self;
    };
}

- (NSMutableArray <id>* _Nonnull (^)(NSArray <id> * _Nonnull))addObjectsChain{
    return ^ (id data){
        if (data) {
            [self addObjectsFromArray:data];
        }
        return self;
    };
}

- (NSMutableArray <id>* _Nonnull (^)(NSArray <id>* _Nonnull, NSUInteger))insertObjectsChainAtIndex{
    return ^ (NSArray * data, NSUInteger index){
        if (data) {
            NSUInteger i = index;
            for (id obj in data) {
                [self insertObject:obj atIndex:i++];
            }
        }
        return self;
    };
}

- (NSMutableArray <id>* _Nonnull (^)(NSArray<id> * _Nonnull))addObjectsChainPre{
    return ^ (NSArray * data){
        if (data) {
            NSUInteger i = 0;
            for (id obj in data) {
                [self insertObject:obj atIndex:i++];
            }
        }
        return self;
    };
}

- (void)reverse {
    NSUInteger count = self.count;
    int mid = floor(count / 2.0);
    for (NSUInteger i = 0; i < mid; i++) {
        [self exchangeObjectAtIndex:i withObjectAtIndex:(count - (i + 1))];
    }
}

- (void)shuffle {
    for (NSUInteger i = self.count; i > 1; i--) {
        [self exchangeObjectAtIndex:(i - 1)
                  withObjectAtIndex:arc4random_uniform((u_int32_t)i)];
    }
}

@end
