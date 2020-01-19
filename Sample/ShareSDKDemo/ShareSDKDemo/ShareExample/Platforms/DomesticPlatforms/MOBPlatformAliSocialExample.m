//
//  MOBPlatformAliSocialExample.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/20.
//  Copyright © 2019 mob. All rights reserved.
//  文档地址:https://www.mob.com/wiki/detailed?wiki=ShareSDK_chanpinjianjie&id=14

#import "MOBPlatformAliSocialExample.h"

@implementation MOBPlatformAliSocialExample


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
//    [parameters SSDKSetupAliPaySocialParamsByText:@"Share SDK"
//                                            image:nil
//                                            title:nil
//                                              url:nil
//                                             type:SSDKContentTypeText
//                                     platformType:platformType];
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
                                    images:SHARESDKDEMO_IMAGE_STRING //[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    
//    [parameters SSDKSetupAliPaySocialParamsByText:@"Share SDK"
//                                            image:@"http://ww4.sinaimg.cn/bmiddle/005Q8xv4gw1evlkov50xuj30go0a6mz3.jpg"
//                                            title:nil
//                                              url:nil
//                                             type:SSDKContentTypeImage
//                                     platformType:platformType];
    [self shareWithParameters:parameters];
}

/**
 分享网址
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
//    [parameters SSDKSetupAliPaySocialParamsByText:@"Share SDK"
//                                            image:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
//                                            title:@"Share SDK"
//                                              url:[NSURL URLWithString:@"https://www.mob.com"]
//                                             type:SSDKContentTypeWebPage
//                                     platformType:platformType];
    [self shareWithParameters:parameters];
}


+ (SSDKPlatformType)platformType{
    return SSDKPlatformTypeAliSocial;
}
@end
