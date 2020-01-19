//
//  MOBPlatformInstapaperExample.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/19.
//  Copyright © 2019 mob. All rights reserved.
//  文档地址:https://www.mob.com/wiki/detailed?wiki=ShareSDK_chanpinjianjie&id=14

#import "MOBPlatformInstapaperExample.h"

@implementation MOBPlatformInstapaperExample

/**
 分享链接
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
//    [parameters SSDKSetupInstapaperParamsByUrl:[NSURL URLWithString:@"http://www.mob.com"]
//                                         title:@"Share SDK"
//                                          desc:@"Share SDK Link Desc"
//                                       content:@"Share SDK Link Desc"
//                           isPrivateFromSource:NO
//                                      folderId:0
//                               resolveFinalUrl:YES];
    [self shareWithParameters:parameters];
}


+ (SSDKPlatformType)platformType{
    return SSDKPlatformTypeInstapaper;
}
@end
