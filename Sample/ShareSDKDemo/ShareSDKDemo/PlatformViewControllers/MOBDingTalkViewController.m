//
//  MOBDingTalkViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 2017/5/26.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBDingTalkViewController.h"

@interface MOBDingTalkViewController ()

@end

@implementation MOBDingTalkViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    platformType = SSDKPlatformTypeDingTalk;
    self.title = @"钉钉";
    shareIconArray = @[@"textIcon",@"imageIcon",@"webURLIcon"];
    shareTypeArray = @[@"文字",@"图片",@"链接"];
    selectorNameArray = @[@"shareText",@"shareImage",@"shareWebPage"];
}

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
//    [parameters SSDKSetupDingTalkParamsByText:@"Share SDK"
//                                        image:nil
//                                        title:nil
//                                          url:nil
//                                         type:SSDKContentTypeText];
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
    
//    [parameters SSDKSetupDingTalkParamsByText:@"Share SDK"
//                                        image:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
//                                        title:nil
//                                          url:nil
//                                         type:SSDKContentTypeImage];
    
    [self shareWithParameters:parameters];
}

/**
 分享网址
 */
- (void)shareWebPage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:SHARESDKDEMO_IMAGE_LOCALPATH
                                       url:[NSURL URLWithString:SHARESDKDEMO_URLSTRING]
                                     title:SHARESDKDEMO_TITLE
                                      type:SSDKContentTypeWebPage];
    //平台定制
//    [parameters SSDKSetupDingTalkParamsByText:@"Share SDK"
//                                        image:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
//                                        title:@"Share SDK"
//                                          url:[NSURL URLWithString:@"https://www.mob.com"]
//                                         type:SSDKContentTypeWebPage];
    [self shareWithParameters:parameters];
}

@end
