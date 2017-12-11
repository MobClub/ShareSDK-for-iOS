//
//  MOBMessengerViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 17/3/7.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBMailViewController.h"

@interface MOBMailViewController ()

@end

@implementation MOBMailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    platformType = SSDKPlatformTypeMail;
    self.title = @"Mail";
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
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                    images:nil
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeText];
    //平台定制
//    [parameters SSDKSetupMailParamsByText:@"Share SDK"
//                                    title:nil
//                                   images:nil
//                              attachments:nil
//                               recipients:nil
//                             ccRecipients:nil
//                            bccRecipients:nil
//                                     type:SSDKContentTypeText];
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
//    [parameters SSDKSetupMailParamsByText:@"Share SDK"
//                                    title:nil
//                                   images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
//                              attachments:nil
//                               recipients:nil
//                             ccRecipients:nil
//                            bccRecipients:nil
//                                     type:SSDKContentTypeImage];
    [self shareWithParameters:parameters];
}

- (void)shareVideo
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                    images:nil
                                       url:[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]
                                     title:nil
                                      type:SSDKContentTypeVideo];
    //平台定制
//        [parameters SSDKSetupMailParamsByText:@"Share SDK"
//                                        title:nil
//                                       images:nil
//                                  attachments:@[[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]]
//                                   recipients:nil
//                                 ccRecipients:nil
//                                bccRecipients:nil
//                                         type:SSDKContentTypeAuto];
    [self shareWithParameters:parameters];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
