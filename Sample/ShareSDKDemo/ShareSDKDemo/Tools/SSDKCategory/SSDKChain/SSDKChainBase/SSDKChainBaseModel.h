//
//  SSDKChainBaseModel.h
//  ShareSDKDemo
//
//  Created by maxl on 2020/1/16.
//  Copyright © 2020 mob. All rights reserved.
//

#import "SSDKChainDefine.h"

NS_ASSUME_NONNULL_BEGIN

@interface SSDKChainBaseModel<__covariant  ObjectType> : NSObject

- (instancetype)init NS_UNAVAILABLE;

+ (instancetype)new NS_UNAVAILABLE;

@property (nonatomic, strong, readonly) NSMutableArray *allOjects;

@property (nonatomic, strong, readonly) NSMutableArray * effectiveObjects;

//添加的数量，包括原来的创建对象的数量
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ multiple) (NSInteger count);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ part_first) (void);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ part_sencond) (void);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ part_third) (void);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ part_fourth) (void);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ part_fifth) (void);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ part_sixth) (void);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ part_seventh) (void);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ part_eighth) (void);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ part_ninth) (void);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ part_tenth) (void);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ part_sequence) (NSUInteger index);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ part_range) (NSRange range);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ part_all) (void);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ assignToObjects)(void (^ objs) (NSArray * objs));

- (void)enumerateObjectsUsingBlock:(void (^)(id _Nonnull))block;

@end



NS_ASSUME_NONNULL_END
