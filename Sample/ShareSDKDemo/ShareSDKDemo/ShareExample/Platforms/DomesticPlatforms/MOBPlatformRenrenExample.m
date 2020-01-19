//
//  MOBPlatformRenrenExample.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/19.
//  Copyright © 2019 mob. All rights reserved.
//  文档地址:https://www.mob.com/wiki/detailed?wiki=ShareSDK_chanpinjianjie&id=14

#import "MOBPlatformRenrenExample.h"

@implementation MOBPlatformRenrenExample

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
//    [parameters SSDKSetupRenRenParamsByText:@"Share SDK"
//                                      image:[[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"]
//                                        url:nil
//                                    albumId:nil
//                                       type:SSDKContentTypeImage];
    [self shareWithParameters:parameters];
}

/**
 链接
 */
- (void)shareLink
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:SHARESDKDEMO_IMAGE_LOCALPATH
                                       url:[NSURL URLWithString:SHARESDKDEMO_URLSTRING]
                                     title:SHARESDKDEMO_TITLE
                                      type:SSDKContentTypeWebPage];
    
    //平台定制
//    [parameters SSDKSetupRenRenParamsByText:@"Share SDK"
//                                      image:nil
//                                        url:[NSURL URLWithString:@"http://www.mob.com"]
//                                    albumId:nil
//                                       type:SSDKContentTypeWebPage];
    [self shareWithParameters:parameters];
}


+ (SSDKPlatformType)platformType{
    return SSDKPlatformTypeRenren;
}
@end
