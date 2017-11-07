//
//  MOBMessengerViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 17/3/7.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBYinxiangViewController.h"

@interface MOBYinxiangViewController ()

@end

@implementation MOBYinxiangViewController


//支持沙盒模式 及 https://dev.yinxiang.com 上线的 appkey

- (void)viewDidLoad
{
    [super viewDidLoad];
    platformType = SSDKPlatformTypeYinXiang;
    self.title = @"印象笔记";
    shareIconArray = @[@"textIcon",@"imageIcon",@"videoIcon"];
    shareTypeArray = @[@"文字",@"图片",@"视频"];
    selectorNameArray = @[@"shareText",@"shareImage",@"shareVideo"];
}

/**
 分享文字
 */
- (void)shareText
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                    images:nil
                                       url:nil
                                     title:@"Share SDK"
                                      type:SSDKContentTypeText];
    // title text 必填
//    [parameters SSDKSetupEvernoteParamsByText:@"Share SDK"
//                                       images:nil
//                                        video:nil
//                                        title:@"Share SDK"
//                                     notebook:nil
//                                         tags:nil
//                                 platformType:platformType];
    [self shareWithParameters:parameters];
}

/**
 分享图片
 */
- (void)shareImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:nil
                                     title:@"Share SDK"
                                      type:SSDKContentTypeImage];
    // title text 必填
//    [parameters SSDKSetupEvernoteParamsByText:@"Share SDK"
//                                       images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
//                                        video:nil
//                                        title:@"Share SDK"
//                                     notebook:nil
//                                         tags:nil
//                                 platformType:platformType];
    [self shareWithParameters:parameters];
}

- (void)shareVideo
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]
                                     title:@"Share SDK"
                                      type:SSDKContentTypeVideo];
    //通用参数设置
//    [parameters SSDKSetupEvernoteParamsByText:@"Share SDK"
//                                       images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
//                                        video:[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]
//                                        title:@"Share SDK"
//                                     notebook:nil
//                                         tags:nil
//                                 platformType:platformType];
    
    [self shareWithParameters:parameters];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
