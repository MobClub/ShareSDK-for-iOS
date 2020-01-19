//
//  MOBPlatformTencentWeiboExample.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/20.
//  Copyright © 2019 mob. All rights reserved.
//  文档地址:https://www.mob.com/wiki/detailed?wiki=ShareSDK_chanpinjianjie&id=14

#import "MOBPlatformTencentWeiboExample.h"

@implementation MOBPlatformTencentWeiboExample

/**
 分享文字
 */
- (void)shareText
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:nil
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeText];
    //平台定制
//    [parameters SSDKSetupTencentWeiboShareParamsByText:@"Share SDK"
//                                                images:nil
//                                              latitude:0
//                                              longitude:0
//                                                  type:SSDKContentTypeText];
    [self shareWithParameters:parameters];
}

/**
 分享图片
 */
- (void)shareImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:SHARESDKDEMO_IMAGE_LOCALPATH
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    
    
    //平台定制
//    [parameters SSDKSetupTencentWeiboShareParamsByText:@"Share SDK"
//                                                images:[[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"]
//                                              latitude:0
//                                             longitude:0
//                                                  type:SSDKContentTypeText];
    [self shareWithParameters:parameters];
}


+ (SSDKPlatformType)platformType{
    return SSDKPlatformTypeTencentWeibo;
}
@end
