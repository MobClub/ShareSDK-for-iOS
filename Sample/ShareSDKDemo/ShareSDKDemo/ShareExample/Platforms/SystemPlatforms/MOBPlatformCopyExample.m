//
//  MOBPlatformCopyExample.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/19.
//  Copyright © 2019 mob. All rights reserved.
//  文档地址:https://www.mob.com/wiki/detailed?wiki=ShareSDK_chanpinjianjie&id=14

#import "MOBPlatformCopyExample.h"

@implementation MOBPlatformCopyExample

/**
 拷贝文字
 */
- (void)shareText
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                    images:nil
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeText];
    //平台定制
//    [parameters SSDKSetupCopyParamsByText:@"Share SDK"
//                                   images:nil
//                                      url:nil
//                                     type:SSDKContentTypeText];
    [self shareWithParameters:parameters];
}

/**
 拷贝图片
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
    //    [parameters SSDKSetupCopyParamsByText:nil
    //                                   images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
    //                                      url:nil
    //                                     type:SSDKContentTypeImage];
    [self shareWithParameters:parameters];
}


- (void)shareLink
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:nil
                                    images:nil
                                       url:[NSURL URLWithString:SHARESDKDEMO_URLSTRING]
                                     title:nil
                                      type:SSDKContentTypeWebPage];
    //平台定制
//    [parameters SSDKSetupCopyParamsByText:nil
//                                   images:nil
//                                      url:[NSURL URLWithString:@"https://www.mob.com"]
//                                     type:SSDKContentTypeWebPage];
    [self shareWithParameters:parameters];
}

+ (SSDKPlatformType)platformType{
    return SSDKPlatformTypeCopy;
}
@end
