//
//  MOBPlatformYinxiangExample.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/20.
//  Copyright © 2019 mob. All rights reserved.
//  文档地址:https://www.mob.com/wiki/detailed?wiki=ShareSDK_chanpinjianjie&id=14

#import "MOBPlatformYinxiangExample.h"

@implementation MOBPlatformYinxiangExample


/**
 分享文字
 */
- (void)shareText
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:nil
                                       url:nil
                                     title:SHARESDKDEMO_TITLE
                                      type:SSDKContentTypeText];
    // title text 必填
//    [parameters SSDKSetupEvernoteParamsByText:@"Share SDK"
//                                       images:nil
//                                        video:nil
//                                        title:@"Share SDK"
//                                     notebook:nil
//                                         tags:nil
//                                 platformType:platformType];
    [self shareWithParameters:parameters];
}

/**
 分享图片
 */
- (void)shareImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:SHARESDKDEMO_IMAGE_LOCALPATH
                                       url:nil
                                     title:SHARESDKDEMO_TITLE
                                      type:SSDKContentTypeImage];
    // title text 必填
//    [parameters SSDKSetupEvernoteParamsByText:@"Share SDK"
//                                       images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
//                                        video:nil
//                                        title:@"Share SDK"
//                                     notebook:nil
//                                         tags:nil
//                                 platformType:platformType];
    [self shareWithParameters:parameters];
}

- (void)shareVideo
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]
                                     title:@"Share SDK"
                                      type:SSDKContentTypeVideo];
    //通用参数设置
//    [parameters SSDKSetupEvernoteParamsByText:@"Share SDK"
//                                       images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
//                                        video:[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]
//                                        title:@"Share SDK"
//                                     notebook:nil
//                                         tags:nil
//                                 platformType:platformType];
    
    [self shareWithParameters:parameters];
}


+ (SSDKPlatformType)platformType{
    return SSDKPlatformTypeYinXiang;
}

@end
