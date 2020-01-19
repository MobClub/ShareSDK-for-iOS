//
//  MOBPlaformTumblrExmaple.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/20.
//  Copyright © 2019 mob. All rights reserved.
//  文档地址:https://www.mob.com/wiki/detailed?wiki=ShareSDK_chanpinjianjie&id=14

#import "MOBPlaformTumblrExmaple.h"

@implementation MOBPlaformTumblrExmaple

/**
 分享文字
 */
-(void)shareText
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:nil
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeText];
    //平台定制
//    [parameters SSDKSetupTumblrParamsByText:@"Share SDK"
//                                      image:nil
//                                        url:nil
//                                      title:nil
//                                   blogName:nil
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
    [parameters SSDKSetupShareParamsByText:nil
                                    images:SHARESDKDEMO_IMAGE_LOCALPATH
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    //平台定制
//    [parameters SSDKSetupTumblrParamsByText:nil
//                                      image:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
//                                        url:nil
//                                      title:@"Share SDK"
//                                   blogName:nil
//                                       type:SSDKContentTypeImage];
    [self shareWithParameters:parameters];
}

+ (SSDKPlatformType)platformType{
    return SSDKPlatformTypeTumblr;
}
@end
