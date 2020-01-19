//
//  NSArray+SSDKCategory.h
//  SSDKCategory
//
//  Created by maxl on 2018/11/25.
//  Copyright © 2018 mob. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray<__covariant ObjectType> (SSDKCategory)
- (ObjectType)safe_objectAtIndex:(NSUInteger)index;

- (ObjectType)randomObject;
/**
 快捷计算
 */
- (CGFloat)maxObject;

- (CGFloat)minObject;

- (CGFloat)sumObject;

@end

@interface NSArray<ObjectType> (Plist)

/**
 从一个二进制数据中读取一个数组
 */
+ (nullable NSArray <ObjectType>*)arrayWithPlistData:(NSData *)plist;

+ (nullable NSArray <ObjectType>*)arrayWithPlistString:(NSString *)plist;

/**
 数组转换为plist二进制数据
 */
- (nullable NSData *)plistData;

/**
 数组转化为xml字符串
 */
- (nullable NSString *)plistString;

/**
 json字符串
 */
- (NSString *)jsonString;

/**
 更具可读性的json字符串
 */
- (NSString *)jsonPrettyString;

@end

#define SSDKMUTABLEARRAY_PROPERTY @property (nonatomic, strong, readonly) NSMutableArray <ObjectType>*
@interface NSMutableArray <ObjectType>(SSDKCategory)

+ (nullable NSMutableArray <ObjectType>*)arrayWithPlistData:(NSData *)plist;

+ (nullable NSMutableArray <ObjectType>*)arrayWithPlistString:(NSString *)plist;

- (void)removeFirstObject;

- (ObjectType)popFirstObject;

- (ObjectType)popLastObject;

SSDKMUTABLEARRAY_PROPERTY (^addObjectChain) (ObjectType anObject);

SSDKMUTABLEARRAY_PROPERTY (^removeObjectChain) (ObjectType anObject);

SSDKMUTABLEARRAY_PROPERTY (^addObjectChainPre) (ObjectType anObject);

SSDKMUTABLEARRAY_PROPERTY (^addObjectsChain) (NSArray <ObjectType>* objects);

SSDKMUTABLEARRAY_PROPERTY (^addObjectsChainPre) (NSArray <ObjectType>* objects);

SSDKMUTABLEARRAY_PROPERTY (^insertObjectsChainAtIndex) (NSArray <ObjectType>* objects, NSUInteger index);

- (void)reverse;

- (void)shuffle;

@end
NS_ASSUME_NONNULL_END
