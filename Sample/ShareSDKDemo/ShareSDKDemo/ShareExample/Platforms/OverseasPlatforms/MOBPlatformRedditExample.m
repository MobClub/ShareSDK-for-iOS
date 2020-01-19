//
//  MOBPlatformRedditExample.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/20.
//  Copyright © 2019 mob. All rights reserved.
//  文档地址:https://www.mob.com/wiki/detailed?wiki=ShareSDK_chanpinjianjie&id=14

#import "MOBPlatformRedditExample.h"

@implementation MOBPlatformRedditExample

/**
 分享文字
 */
- (void)shareText
{
    //通用参数设置
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:nil
                                       url:nil
                                     title:@"mob"
                                      type:SSDKContentTypeText];
    [self shareWithParameters:parameters];
}

/**
 分享链接
 */
- (void)shareLink
{
    //通用参数设置
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:nil
                                    images:nil
                                       url:[NSURL URLWithString:SHARESDKDEMO_URLSTRING]
                                     title:@"mob"
                                      type:SSDKContentTypeWebPage];
    [self shareWithParameters:parameters];
}


+ (SSDKPlatformType)platformType{
    return SSDKPlatformTypeReddit;
}
@end
