//
//  SSDKActivityIndicatorViewModel.m
//  SSDKCategory
//
//  Created by maxl on 2019/1/11.
//  Copyright © 2019 mob. All rights reserved.
//

#import "SSDKActivityIndicatorViewChainModel.h"
#define SSDKCATEGORY_CHAIN_ACTIVITY_IMPLEMENTATION(SSDKMethod,SSDKParaType) SSDKCATEGORY_CHAIN_VIEWCLASS_IMPLEMENTATION(SSDKMethod,SSDKParaType, SSDKActivityIndicatorViewModel *,UIActivityIndicatorView)
@implementation SSDKActivityIndicatorViewModel

SSDKCATEGORY_CHAIN_ACTIVITY_IMPLEMENTATION(activityIndicatorViewStyle,UIActivityIndicatorViewStyle)
SSDKCATEGORY_CHAIN_ACTIVITY_IMPLEMENTATION(hidesWhenStopped,BOOL)
SSDKCATEGORY_CHAIN_ACTIVITY_IMPLEMENTATION(color,UIColor *)

- (SSDKActivityIndicatorViewModel * _Nonnull (^)(void))startAnimating{
    return ^()
    {
        [self enumerateObjectsUsingBlock:^(UIActivityIndicatorView * _Nonnull obj) {
            [obj startAnimating];
        }];
        return self;
    };
}


- (SSDKActivityIndicatorViewModel * _Nonnull (^)(void))stopAnimating{
    return ^()
    {
        [self enumerateObjectsUsingBlock:^(UIActivityIndicatorView * _Nonnull obj) {
            [obj stopAnimating];
        }];
        return self;
    };
}
@end

SSDKCATEGORY_VIEW_IMPLEMENTATION(UIActivityIndicatorView, SSDKActivityIndicatorViewModel)
#undef SSDKCATEGORY_CHAIN_ACTIVITY_IMPLEMENTATION
