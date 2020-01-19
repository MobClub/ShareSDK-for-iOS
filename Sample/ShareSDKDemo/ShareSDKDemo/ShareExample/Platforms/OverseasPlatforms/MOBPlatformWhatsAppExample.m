//
//  MOBPlatformWhatsAppExample.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/20.
//  Copyright © 2019 mob. All rights reserved.
//  文档地址:https://www.mob.com/wiki/detailed?wiki=ShareSDK_chanpinjianjie&id=14

#import "MOBPlatformWhatsAppExample.h"

@implementation MOBPlatformWhatsAppExample
 
- (void)setup{
    SSDKWEAK
    [self addListItemWithImage:MOBTextShareIcon name:@"分享系统文字" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareTextSystem];
        
    }];
}
/**
 分享文字
 */
-(void)shareText
{
    //通用参数设置
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
//    [parameters SSDKSetupShareParamsByText:@"https://www.mob.com"
//                                        images:nil
//                                           url:nil
//                                         title:nil
//                                          type:SSDKContentTypeText];
    //平台定制
    [parameters SSDKSetupWhatsAppParamsByText:SHARESDKDEMO_TEXT
                                        image:nil
                                        audio:nil
                                        video:nil
                             menuDisplayPoint:CGPointZero
                                         type:SSDKContentTypeText];
    [self shareWithParameters:parameters];
}

/**
 分享文字
 */
-(void)shareTextSystem
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];

    //平台定制
    [parameters SSDKSetupWhatsAppParamsByText:SHARESDKDEMO_TEXT
                                        image:nil
                                        audio:nil
                                        video:nil
                             menuDisplayPoint:CGPointZero
                                    useSystem:YES
                                         type:SSDKContentTypeText];
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
//    [parameters SSDKSetupWhatsAppParamsByText:@"Share SDK"
//                                        image:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
//                                        audio:nil
//                                        video:nil
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
    
    [parameters SSDKSetupWhatsAppParamsByText:@"Share SDK"
                                        image:nil
                                        audio:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"music" ofType:@"mp3"]]
                                        video:nil
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
    [parameters SSDKSetupWhatsAppParamsByText:@"Share SDK"
                                        image:nil
                                        audio:nil
                                        video:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]
                             menuDisplayPoint:CGPointZero
                                         type:SSDKContentTypeVideo];
    [self shareWithParameters:parameters];
}


+ (SSDKPlatformType)platformType{
    return SSDKPlatformTypeWhatsApp;
}
@end
