//
//  MOBPlatformTelegramExample.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/20.
//  Copyright © 2019 mob. All rights reserved.
//  文档地址:https://www.mob.com/wiki/detailed?wiki=ShareSDK_chanpinjianjie&id=14

#import "MOBPlatformTelegramExample.h"

@implementation MOBPlatformTelegramExample

+ (SSDKPlatformType)platformType{
    return SSDKPlatformTypeTelegram;
}

/**
 分享文字
 */
-(void)shareText
{
    //通用参数设置
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:nil
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeText];
    //平台定制
    //    [parameters SSDKSetupTelegramParamsByText:@"Share SDK"
    //                                        image:nil
    //                                        audio:nil
    //                                        video:nil
    //                                         file:nil
    //                             menuDisplayPoint:CGPointZero
    //                                         type:SSDKContentTypeText];
    [self shareWithParameters:parameters];
}

#define SHARESDKDEMO_TEXT_NEW @"分享是一个 非常https://www.okx.com/join/12887156好用的功能"    //通用参数设置

//#define SHARESDKDEMO_TEXT_NEW @"Download the OKX App via https://www.okx.com/join/12887156 and sign up. Get Mystery Boxes up to $10,000 in crypto."    //通用参数设置

-(void)shareLink
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT_NEW
                                    images:nil
                                       url:[NSURL URLWithString:SHARESDKDEMO_URLSTRING]
                                     title:nil
                                      type:SSDKContentTypeWebPage];
    [self shareWithParameters:parameters];
}

/**
 分享图片
 */
- (void)shareImage
{
    //通用参数设置
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:SHARESDKDEMO_IMAGE_LOCALPATH
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    //平台定制
    //    [parameters SSDKSetupTelegramParamsByText:@"Share SDK"
    //                                        image:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
    //                                        audio:nil
    //                                        video:nil
    //                                         file:nil
    //                             menuDisplayPoint:CGPointZero
    //                                         type:SSDKContentTypeImage];
    [self shareWithParameters:parameters];
}

/**
 分享音频
 */
- (void)shareAudio
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];

    [parameters SSDKSetupTelegramParamsByText:@"Share SDK"
                                        image:nil
                                        audio:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"music" ofType:@"mp3"]]
                                        video:nil
                                         file:nil
                             menuDisplayPoint:CGPointZero
                                         type:SSDKContentTypeAudio];

    [self shareWithParameters:parameters];
}


/**
 分享视频
 */
- (void)shareVideo
{
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //平台定制
    [parameters SSDKSetupTelegramParamsByText:@"Share SDK"
                                        image:nil
                                        audio:nil
                                        video:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]
                                         file:nil
                             menuDisplayPoint:CGPointZero
                                         type:SSDKContentTypeVideo];
    [self shareWithParameters:parameters];
}

/**
 分享文件
 */
- (void)shareFile
{
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //平台定制
    [parameters SSDKSetupTelegramParamsByText:@"Share SDK"
                                        image:nil
                                        audio:nil
                                        video:nil
                                         file:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"res6" ofType:@"gif"]]
                             menuDisplayPoint:CGPointZero
                                         type:SSDKContentTypeFile];
    [self shareWithParameters:parameters];
}


@end
