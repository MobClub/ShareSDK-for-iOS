//
//  MOBPlatformKakaoTalkExample.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/20.
//  Copyright © 2019 mob. All rights reserved.
//  文档地址:https://www.mob.com/wiki/detailed?wiki=ShareSDK_chanpinjianjie&id=14

#import "MOBPlatformKakaoTalkExample.h"

@implementation MOBPlatformKakaoTalkExample
+ (SSDKPlatformType)platformType{
    return SSDKPlatformSubTypeKakaoTalk;
}
- (void)shareLink
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
//    [parameters SSDKSetupShareParamsByText:@"Share SDK Link Desc"
//                                    images:@"http://www.mob.com/images/logo_black.png"
//                                       url:[NSURL URLWithString:@"http://www.mob.com"]
//                                     title:@"Share SDK"
//                                      type:SSDKContentTypeWebPage];
    
    //平台定制
//    [parameters SSDKSetupKaKaoTalkParamsByUrl:[NSURL URLWithString:@"http://www.mob.com/"] templateId:@"11820" templateArgs:nil];
    [parameters SSDKSetupKaKaoTalkParamsByUrl:nil templateId:@"11820" templateArgs:nil];
    [self shareWithParameters:parameters];
}

- (void)shareFile
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //平台定制
    
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"];
    [parameters SSDKSetupKaKaoTalkParamsByUrl:[NSURL fileURLWithPath:path ] templateId:@"11820" templateArgs:nil];
    
    [self shareWithParameters:parameters];
}



@end
