//
//  MOBPlatformDoubanExample.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/19.
//  Copyright © 2019 mob. All rights reserved.
//  文档地址:https://www.mob.com/wiki/detailed?wiki=ShareSDK_chanpinjianjie&id=14

#import "MOBPlatformDoubanExample.h"

@implementation MOBPlatformDoubanExample

+ (SSDKPlatformType)platformType{
    return SSDKPlatformTypeDouBan;
}
/**
 分享文字
 */
- (void)shareText
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:nil
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeText];
    //平台定制
//    [parameters SSDKSetupDouBanParamsByText:@"Share SDK"
//                                      image:nil
//                                      title:nil
//                                        url:nil
//                                    urlDesc:nil
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
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:SHARESDKDEMO_IMAGE_LOCALPATH
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    
    
    //平台定制
//    [parameters SSDKSetupDouBanParamsByText:@"Share SDK"
//                                      image:[[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"]
//                                      title:nil
//                                        url:nil
//                                    urlDesc:nil
//                                       type:SSDKContentTypeImage];
    [self shareWithParameters:parameters];
}

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
//    [parameters SSDKSetupDouBanParamsByText:@"Share SDK"
//                                      image:[[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"]
//                                      title:@"Share SDK"
//                                        url:[NSURL URLWithString:@"http://www.mob.com"]
//                                    urlDesc:@"Share SDK DESC"
//                                       type:SSDKContentTypeWebPage];
    [self shareWithParameters:parameters];
}



@end
