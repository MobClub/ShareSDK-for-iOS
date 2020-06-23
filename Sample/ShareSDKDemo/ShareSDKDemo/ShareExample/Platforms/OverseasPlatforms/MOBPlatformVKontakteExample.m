//
//  MOBPlatformKntakteExample.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/20.
//  Copyright © 2019 mob. All rights reserved.
//  文档地址:https://www.mob.com/wiki/detailed?wiki=ShareSDK_chanpinjianjie&id=14

#import "MOBPlatformVKontakteExample.h"

@implementation MOBPlatformVKontakteExample

+ (SSDKPlatformType)platformType{
    return SSDKPlatformTypeVKontakte;
}
- (void)setup{
    
    self.authHandler = ^(SSDKResponseState state, SSDKUser * _Nonnull user, NSError * _Nonnull error) {
        
    };
}
/**
 分享文字
 */
- (void)shareText
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                    images:nil
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeText];
    //平台定制
//    [parameters SSDKSetupVKontakteParamsByText:@"Share SDK"
//                                        images:nil
//                                           url:nil
//                                       groupId:nil
//                                   friendsOnly:NO
//                                      latitude:0
//                                     longitude:0
//                                          type:SSDKContentTypeText];
    [self shareWithParameters:parameters];
}


/**
 分享链接
 */
- (void)shareLink
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    UIImage *image = [UIImage imageWithContentsOfFile:SHARESDKDEMO_IMAGE_LOCALPATH];
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:image
                                       url:[NSURL URLWithString:SHARESDKDEMO_URLSTRING]
                                     title:SHARESDKDEMO_TITLE
                                      type:SSDKContentTypeWebPage];
    [parameters setValue:@(0) forKey:@"group_id"];

    //平台定制
//    [parameters SSDKSetupVKontakteParamsByText:@"Share SDK Link Desc"
//                                        images:image
//                                           url:[NSURL URLWithString:@"http://www.mob.com"]
//                                       groupId:nil
//                                   friendsOnly:NO
//                                      latitude:0
//                                     longitude:0
//                                          type:SSDKContentTypeWebPage];
    
    [self shareWithParameters:parameters];
}

/**
 分享图片
 */
- (void)shareImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    UIImage *image = SHARESDKDEMO_IMAGE;
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:image
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    //平台定制
    //    [parameters SSDKSetupVKontakteParamsByText:@"Share SDK Link Desc"
    //                                        images:image
    //                                           url:nil
    //                                       groupId:nil
    //                                   friendsOnly:NO
    //                                      latitude:0
    //                                     longitude:0
    //                                          type:SSDKContentTypeImage];
    [self shareWithParameters:parameters];
}



@end
