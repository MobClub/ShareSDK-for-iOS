//
//  MOBPlatformWeworkExample.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/19.
//  Copyright © 2019 mob. All rights reserved.
//  文档地址:https://www.mob.com/wiki/detailed?wiki=ShareSDK_chanpinjianjie&id=14

#import "MOBPlatformWeworkExample.h"

@implementation MOBPlatformWeworkExample

+ (SSDKPlatformType)platformType{
    return SSDKPlatformTypeWework;
}

- (void)shareText
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:nil
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeText];
    
    [self shareWithParameters:parameters];
}

- (void)shareImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:nil
                                    images:SHARESDKDEMO_IMAGE_LOCALPATH
                                       url:nil
                                     title:@"share.jpg"
                                      type:SSDKContentTypeImage];
    
    [self shareWithParameters:parameters];
}

- (void)shareLink
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:[[NSBundle mainBundle] pathForResource:@"Icon@2x" ofType:@"png"]
                                       url:[NSURL URLWithString:SHARESDKDEMO_URLSTRING]
                                     title:SHARESDKDEMO_TITLE
                                      type:SSDKContentTypeWebPage];
    
    [self shareWithParameters:parameters];
}

- (void)shareVideo
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupWeWorkParamsByText:nil
                                      title:@"share.mp4"
                                        url:nil
                                 thumbImage:nil
                                      image:nil
                                      video:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]
                                   fileData:nil
                                       type:SSDKContentTypeVideo];
    [self shareWithParameters:parameters];
}

- (void)shareFile
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupWeWorkParamsByText:nil
                                      title:@"share.mp3"
                                        url:nil
                                 thumbImage:nil
                                      image:nil
                                      video:nil
                                   fileData:[[NSBundle mainBundle] pathForResource:@"music" ofType:@"mp3"]
                                       type:SSDKContentTypeFile];
    [self shareWithParameters:parameters];
}


@end
