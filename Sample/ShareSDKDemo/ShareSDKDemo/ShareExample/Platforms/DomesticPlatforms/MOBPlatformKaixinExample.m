//
//  MOBPlatformKaixinExample.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/19.
//  Copyright © 2019 mob. All rights reserved.
//  文档地址:https://www.mob.com/wiki/detailed?wiki=ShareSDK_chanpinjianjie&id=14

#import "MOBPlatformKaixinExample.h"

@implementation MOBPlatformKaixinExample

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
//    [parameters SSDKSetupKaiXinParamsByText:@"Share SDK"
//                                      image:nil
//                                       type:SSDKContentTypeText];
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
    //平台定制
    [parameters SSDKSetupKaiXinParamsByText:SHARESDKDEMO_TEXT
                                      image:SHARESDKDEMO_IMAGE_LOCALPATH
                                       type:SSDKContentTypeImage];
    [self shareWithParameters:parameters];
}

+ (SSDKPlatformType)platformType{
    return SSDKPlatformTypeKaixin;
}
@end
