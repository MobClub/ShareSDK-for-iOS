//
//  MOBPlatformInstagramExample.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/20.
//  Copyright © 2019 mob. All rights reserved.
//  文档地址:https://www.mob.com/wiki/detailed?wiki=ShareSDK_chanpinjianjie&id=14

#import "MOBPlatformInstagramExample.h"

@implementation MOBPlatformInstagramExample

/**
 分享图片
 */
- (void)shareImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    //通用参数设置
//    [parameters SSDKSetupShareParamsByText:nil
//                                    images:SHARESDKDEMO_IMAGE_LOCALPATH
//                                       url:nil
//                                     title:nil
//                                      type:SSDKContentTypeImage];
    //平台定制
    [parameters SSDKSetupInstagramByImage:SHARESDKDEMO_IMAGE_LOCALPATH
                         menuDisplayPoint:CGPointMake(0, 0)];
    
    [self shareWithParameters:parameters];
}

- (void)shareVideo
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:nil
                                    images:nil
                                       url:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]
                                     title:nil
                                      type:SSDKContentTypeVideo];
    //平台定制
//    [parameters SSDKSetupInstagramByVideo:[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]];
    
    [self shareWithParameters:parameters];
}

+ (SSDKPlatformType)platformType{
    return SSDKPlatformTypeInstagram;
}
@end
