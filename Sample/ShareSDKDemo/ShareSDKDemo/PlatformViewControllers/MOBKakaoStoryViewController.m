//
//  MOBKakaoStoryViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 2017/6/7.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBKakaoStoryViewController.h"

@implementation MOBKakaoStoryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    platformType = SSDKPlatformSubTypeKakaoStory;
    self.title = @"KakaoStory";
    shareIconArray = @[@"textIcon",@"imageIcon",@"webURLIcon",@"textIcon"];
    shareTypeArray = @[@"文字",@"图片",@"链接",@"文字 APP"];
    selectorNameArray = @[@"shareText",@"shareImage",@"shareLink",@"shareTextForAPP"];
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
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    
    //平台定制
    //    [parameters SSDKSetupKaKaoParamsByText:@"Share SDK"
    //                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
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
                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:[NSURL URLWithString:@"http://www.mob.com"]
                                     title:@"Share SDK"
                                      type:SSDKContentTypeWebPage];
    
    //平台定制
    //    [parameters SSDKSetupKaKaoParamsByText:@"Share SDK"
    //                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
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

//文字 客户端
- (void)shareTextForAPP
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKEnableUseClientShare];
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
    //                               enableShare:nil
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

@end
