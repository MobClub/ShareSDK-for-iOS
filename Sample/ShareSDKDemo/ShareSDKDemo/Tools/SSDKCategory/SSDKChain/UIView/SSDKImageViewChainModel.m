//
//  SSDKImageViewChainModel.m
//  SSDKCategory
//
//  Created by maxl on 2018/12/27.
//  Copyright © 2018 mob. All rights reserved.
//

#import "SSDKImageViewChainModel.h"
#define SSDKCATEGORY_CHAIN_IMAGEVIEW_IMPLEMENTATION(SSDKMethod,SSDKParaType) SSDKCATEGORY_CHAIN_VIEWCLASS_IMPLEMENTATION(SSDKMethod,SSDKParaType, SSDKImageViewChainModel *,UIImageView)
@implementation SSDKImageViewChainModel

SSDKCATEGORY_CHAIN_IMAGEVIEW_IMPLEMENTATION(image, UIImage *);
SSDKCATEGORY_CHAIN_IMAGEVIEW_IMPLEMENTATION(highlightedImage, UIImage *);
SSDKCATEGORY_CHAIN_IMAGEVIEW_IMPLEMENTATION(highlighted, BOOL);
SSDKCATEGORY_CHAIN_IMAGEVIEW_IMPLEMENTATION(animationImages, NSArray<UIImage *> *)
SSDKCATEGORY_CHAIN_IMAGEVIEW_IMPLEMENTATION(highlightedAnimationImages, NSArray<UIImage *> *)
SSDKCATEGORY_CHAIN_IMAGEVIEW_IMPLEMENTATION(animationDuration, NSTimeInterval)
SSDKCATEGORY_CHAIN_IMAGEVIEW_IMPLEMENTATION(animationRepeatCount, NSInteger)

- (SSDKImageViewChainModel * _Nonnull (^)(void))startAnimating{
    return ^ (){
        [self enumerateObjectsUsingBlock:^(UIImageView * _Nonnull obj) {
            [obj startAnimating];
        }];
        return self;
    };
}

- (SSDKImageViewChainModel * _Nonnull (^)(void))stopAnimating{
    return ^ (){
        [self enumerateObjectsUsingBlock:^(UIImageView * _Nonnull obj) {
            [obj stopAnimating];
        }];
        return self;
    };
}

@end
SSDKCATEGORY_VIEW_IMPLEMENTATION(UIImageView, SSDKImageViewChainModel)
#undef SSDKCATEGORY_CHAIN_IMAGEVIEW_IMPLEMENTATION
