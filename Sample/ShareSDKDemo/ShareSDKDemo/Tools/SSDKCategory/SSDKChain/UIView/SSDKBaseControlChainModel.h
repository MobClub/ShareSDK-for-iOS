//
//  SSDKBaseControlChainModel.h
//  SSDKCategory
//
//  Created by maxl on 2019/1/15.
//  Copyright © 2019 mob. All rights reserved.
//

#import "SSDKBaseViewChainModel.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^SSDKTargetActionBlock)(__kindof UIControl *sender);
@interface SSDKBaseControlChainModel <__covariant ObjectType>: SSDKBaseViewChainModel<ObjectType>
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ enabled)(BOOL enabled);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ selected)(BOOL selected);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ highlighted)(BOOL highlighted);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ contentVerticalAlignment)(UIControlContentVerticalAlignment contentVerticalAlignment);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ contentHorizontalAlignment)(UIControlContentHorizontalAlignment contentHorizontalAlignment);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ addTargetBlock)(SSDKTargetActionBlock addTargetBlock, UIControlEvents controlEvents);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ setTargetBlock)(SSDKTargetActionBlock addTargetBlock, UIControlEvents controlEvents);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ addTarget)(id target, SEL action, UIControlEvents controlEvents);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ setTarget)(id target, SEL action, UIControlEvents controlEvents);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ removeTarget) (id target,SEL action, UIControlEvents controlEvents);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ removeAllTarget)(void);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ removeAllTargetBlock)(UIControlEvents controlEvents);
@end

NS_ASSUME_NONNULL_END
