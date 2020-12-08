//
//  MOBPlatformLinkedInExample.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/20.
//  Copyright © 2019 mob. All rights reserved.
//  文档地址:https://www.mob.com/wiki/detailed?wiki=ShareSDK_chanpinjianjie&id=14

#import "MOBPlatformLinkedInExample.h"

@implementation MOBPlatformLinkedInExample

+ (SSDKPlatformType)platformType{
    return SSDKPlatformTypeLinkedIn;
}

- (void)setup{
    SSDKWEAK
    [self addListItemWithImage:MOBApplicationShareIcon name:@"系统分享-文字" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareTextBySystem];
    }];
    [self addListItemWithImage:MOBApplicationShareIcon name:@"系统分享-链接" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareLinkBySystem];
    }];
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
//    [parameters SSDKSetupLinkedInParamsByText:@"Share SDK Link Desc"
//                                        image:nil
//                                          url:nil
//                                        title:nil
//                                      urlDesc:nil
//                                   visibility:nil
//                                         type:SSDKContentTypeText];
    [self shareWithParameters:parameters];
}


/**
 分享链接
 */
- (void)shareLink
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
//    [parameters SSDKSetupShareParamsByText:@"Share SDK Link Desc"
//                                    images:@"http://ww4.sinaimg.cn/bmiddle/005Q8xv4gw1evlkov50xuj30go0a6mz3.jpg"
//                                       url:[NSURL URLWithString:@"http://www.mob.com"]
//                                     title:@"Share SDK"
//                                      type:SSDKContentTypeWebPage];
    //平台定制
    [parameters SSDKSetupLinkedInParamsByText:SHARESDKDEMO_TEXT
                                        image:SHARESDKDEMO_IMAGE_STRING
                                          url:[NSURL URLWithString:SHARESDKDEMO_URLSTRING]
                                        title:SHARESDKDEMO_TITLE
                                      urlDesc:@"Mob"
                                   visibility:nil
                                         type:SSDKContentTypeWebPage];
    [self shareWithParameters:parameters];
}

#pragma mark - 系统分享
//注：此方法text如果字符串包含网络地址，如SHARESDKDEMO_TEXT，会变成链接分享
- (void)shareTextBySystem
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:@"ShareSDK"
                                    images:nil
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeText];
    
    [self shareByActivityWithParameters:parameters];
}

- (void)shareLinkBySystem
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:nil
                                    images:nil
                                       url:[NSURL URLWithString:@"https://www.qq.com"]
                                     title:nil
                                      type:SSDKContentTypeWebPage];
    
    [self shareByActivityWithParameters:parameters];
}

@end
