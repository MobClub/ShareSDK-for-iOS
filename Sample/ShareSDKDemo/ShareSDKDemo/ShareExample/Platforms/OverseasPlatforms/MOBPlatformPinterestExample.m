//
//  MOBPlatformPinterestExample.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/19.
//  Copyright © 2019 mob. All rights reserved.
//  文档地址:https://www.mob.com/wiki/detailed?wiki=ShareSDK_chanpinjianjie&id=14

#import "MOBPlatformPinterestExample.h"

@implementation MOBPlatformPinterestExample

/**
 分享图片
 */
- (void)shareImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];

    [parameters SSDKSetupPinterestParamsByImage:SHARESDKDEMO_IMAGE_STRING
                                           desc:SHARESDKDEMO_TEXT
                                            url:nil
                                      boardName:@"ShareSDK"];
    [self shareWithParameters:parameters];
    
}
- (void)shareLink
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];

    [parameters SSDKSetupPinterestParamsByImage:SHARESDKDEMO_IMAGE_STRING
                                           desc:SHARESDKDEMO_TEXT
                                            url:[NSURL URLWithString:SHARESDKDEMO_URLSTRING]
                                      boardName:@"ShareSDK"];
    [self shareWithParameters:parameters];
    
}

+ (SSDKPlatformType)platformType{
    return SSDKPlatformTypePinterest;
}
@end
