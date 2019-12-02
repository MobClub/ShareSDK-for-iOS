//
//  MOBAlipaymomentsViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 2017/5/26.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBAliSocialmomentsViewController.h"

@interface MOBAliSocialmomentsViewController ()

@end

@implementation MOBAliSocialmomentsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    platformType = SSDKPlatformTypeAliSocialTimeline;
    self.title = @"支付宝朋友圈";
    shareIconArray = @[@"imageIcon",@"webURLIcon"];
    shareTypeArray = @[@"图片",@"链接"];
    selectorNameArray = @[@"shareImage",@"shareWebPage"];
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
    //                                            image:SHARESDKDEMO_IMAGE_STRING
    //                                            title:nil
    //                                              url:nil
    //                                             type:SSDKContentTypeImage
    //                                     platformType:platformType];
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
    //    [parameters SSDKSetupAliPaySocialParamsByText:@"Share SDK"
    //                                            image:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
    //                                            title:@"Share SDK"
    //                                              url:[NSURL URLWithString:@"https://www.mob.com"]
    //                                             type:SSDKContentTypeWebPage
    //                                     platformType:platformType];
    [self shareWithParameters:parameters];
}

@end
