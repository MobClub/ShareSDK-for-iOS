//
//  MOBKakaoTalkViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 2017/6/7.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBKakaoTalkViewController.h"

@implementation MOBKakaoTalkViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    platformType = SSDKPlatformSubTypeKakaoTalk;
    self.title = @"KakaoTalk";
    shareIconArray = @[@"textIcon",@"imageIcon",@"webURLIcon",@"appInfoIcon"];
    shareTypeArray = @[@"文字",@"图片",@"链接",@"应用消息"];
    selectorNameArray = @[@"shareText",@"shareImage",@"shareLink",@"shareApp"];
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
//    [parameters SSDKSetupKaKaoParamsByText:@"Share SDK"
//                                    images:nil
//                                     title:nil
//                                       url:nil
//                                permission:nil
//                               enableShare:YES
//                                 imageSize:CGSizeZero
//                            appButtonTitle:nil
//                          androidExecParam:nil
//                          androidMarkParam:nil
//                          iphoneExecParams:nil
//                           iphoneMarkParam:nil
//                            ipadExecParams:nil
//                             ipadMarkParam:nil
//                                      type:SSDKContentTypeText
//                        forPlatformSubType:platformType];
    [self shareWithParameters:parameters];
}

/**
 分享图片
 */
- (void)shareImage
{
    //只支持网络图片
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                    images:@"http://www.mob.com/images/logo_black.png"
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    
    //平台定制
//    [parameters SSDKSetupKaKaoParamsByText:@"Share SDK"
//                                    images:@"http://www.mob.com/images/logo_black.png"
//                                     title:nil
//                                       url:nil
//                                permission:nil
//                               enableShare:YES
//                                 imageSize:CGSizeZero
//                            appButtonTitle:nil
//                          androidExecParam:nil
//                          androidMarkParam:nil
//                          iphoneExecParams:nil
//                           iphoneMarkParam:nil
//                            ipadExecParams:nil
//                             ipadMarkParam:nil
//                                      type:SSDKContentTypeImage
//                        forPlatformSubType:platformType];
    [self shareWithParameters:parameters];
}

- (void)shareLink
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:@"Share SDK Link Desc"
                                    images:@"http://www.mob.com/images/logo_black.png"
                                       url:[NSURL URLWithString:@"http://www.mob.com"]
                                     title:@"Share SDK"
                                      type:SSDKContentTypeWebPage];
    
    //平台定制
//    [parameters SSDKSetupKaKaoParamsByText:@"Share SDK"
//                                    images:@"http://www.mob.com/images/logo_black.png"
//                                     title:@"Share SDK"
//                                       url:[NSURL URLWithString:@"http://www.mob.com"]
//                                permission:nil
//                               enableShare:YES
//                                 imageSize:CGSizeZero
//                            appButtonTitle:nil
//                          androidExecParam:nil
//                          androidMarkParam:nil
//                          iphoneExecParams:nil
//                           iphoneMarkParam:nil
//                            ipadExecParams:nil
//                             ipadMarkParam:nil
//                                      type:SSDKContentTypeWebPage
//                        forPlatformSubType:platformType];
    
    [self shareWithParameters:parameters];
}

- (void)shareApp
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //平台定制
    [parameters SSDKSetupKaKaoParamsByText:@"Share SDK"
                                    images:@"http://www.mob.com/images/logo_black.png"
                                     title:@"Share SDK"
                                       url:[NSURL URLWithString:@"http://www.mob.com"]
                                permission:nil
                               enableShare:YES
                                 imageSize:CGSizeZero
                            appButtonTitle:@"appButtonTitle"
                          androidExecParam:nil
                          androidMarkParam:nil
                          iphoneExecParams:nil
                           iphoneMarkParam:nil
                            ipadExecParams:nil
                             ipadMarkParam:nil
                                      type:SSDKContentTypeApp
                        forPlatformSubType:platformType];
    [self shareWithParameters:parameters];
}

@end
