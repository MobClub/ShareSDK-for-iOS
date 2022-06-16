//
//  SSDKProgressViewChainModel.m
//  SSDKCategory
//
//  Created by maxl on 2019/1/11.
//  Copyright © 2019 mob. All rights reserved.
//

#import "SSDKProgressViewChainModel.h"
#define SSDKCATEGORY_CHAIN_PROGRESS_IMPLEMENTATION(SSDKMethod,SSDKParaType) SSDKCATEGORY_CHAIN_VIEWCLASS_IMPLEMENTATION(SSDKMethod,SSDKParaType, SSDKProgressViewChainModel *,UIProgressView)
SSDKCATEGORY_VIEW_IMPLEMENTATION(UIProgressView, SSDKProgressViewChainModel)
@implementation SSDKProgressViewChainModel
SSDKCATEGORY_CHAIN_PROGRESS_IMPLEMENTATION(progressViewStyle, UIProgressViewStyle)
SSDKCATEGORY_CHAIN_PROGRESS_IMPLEMENTATION(progress, float)
SSDKCATEGORY_CHAIN_PROGRESS_IMPLEMENTATION(progressTintColor, UIColor*)
SSDKCATEGORY_CHAIN_PROGRESS_IMPLEMENTATION(trackTintColor, UIColor*)
SSDKCATEGORY_CHAIN_PROGRESS_IMPLEMENTATION(progressImage, UIImage*)
SSDKCATEGORY_CHAIN_PROGRESS_IMPLEMENTATION(trackImage, UIImage*)
SSDKCATEGORY_CHAIN_PROGRESS_IMPLEMENTATION(observedProgress, NSProgress *)

- (SSDKProgressViewChainModel * _Nonnull (^)(float, BOOL))setProgressAnimated{
    return ^ (float p, BOOL a){
        [self enumerateObjectsUsingBlock:^(UIProgressView * _Nonnull obj) {
            [obj setProgress:p animated:a];            
        }];
        return self;
    };
}

@end
#undef SSDKCATEGORY_CHAIN_PROGRESS_IMPLEMENTATION
