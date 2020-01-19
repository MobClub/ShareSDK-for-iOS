//
//  MOBPlatformEmailExample.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/19.
//  Copyright © 2019 mob. All rights reserved.
//  文档地址:https://www.mob.com/wiki/detailed?wiki=ShareSDK_chanpinjianjie&id=14

#import "MOBPlatformEmailExample.h"

@implementation MOBPlatformEmailExample

/**
 分享文字
 */
- (void)shareText
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TITLE
                                    images:nil
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeText];
    //平台定制
//    [parameters SSDKSetupMailParamsByText:@"Share SDK"
//                                    title:nil
//                                   images:nil
//                              attachments:nil
//                               recipients:nil
//                             ccRecipients:nil
//                            bccRecipients:nil
//                                     type:SSDKContentTypeText];
    [self shareWithParameters:parameters];
}

/**
 分享图片
 */
- (void)shareImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TITLE
                                    images:SHARESDKDEMO_IMAGE_LOCALPATH
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    //平台定制
//    [parameters SSDKSetupMailParamsByText:@"Share SDK"
//                                    title:nil
//                                   images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
//                              attachments:nil
//                               recipients:nil
//                             ccRecipients:nil
//                            bccRecipients:nil
//                                     type:SSDKContentTypeImage];
    [self shareWithParameters:parameters];
}

- (void)shareVideo
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                    images:nil
                                       url:[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]
                                     title:nil
                                      type:SSDKContentTypeVideo];
    //平台定制
//        [parameters SSDKSetupMailParamsByText:@"Share SDK"
//                                        title:nil
//                                       images:nil
//                                  attachments:@[[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]]
//                                   recipients:nil
//                                 ccRecipients:nil
//                                bccRecipients:nil
//                                         type:SSDKContentTypeAuto];
    [self shareWithParameters:parameters];
}


+ (SSDKPlatformType)platformType{
    return SSDKPlatformTypeMail;
}
@end
