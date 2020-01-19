//
//  MOBPlatformFlickrExample.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/19.
//  Copyright © 2019 mob. All rights reserved.
//  文档地址:https://www.mob.com/wiki/detailed?wiki=ShareSDK_chanpinjianjie&id=14

#import "MOBPlatformFlickrExample.h"

@implementation MOBPlatformFlickrExample

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
                                      type:SSDKContentTypeText];
    //平台定制
//    [parameters SSDKSetupFlickrParamsByText:@"Share SDK"
//                                      image:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
//                                      title:@"Share SDK"
//                                       tags:nil
//                                   isPublic:NO
//                                   isFriend:NO
//                                   isFamily:NO
//                                safetyLevel:1
//                                contentType:1
//                                     hidden:1];
    [self shareWithParameters:parameters];
}



+ (SSDKPlatformType)platformType{
    return SSDKPlatformTypeFlickr;
}
@end
