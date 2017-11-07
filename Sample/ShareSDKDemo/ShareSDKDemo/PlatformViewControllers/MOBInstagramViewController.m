//
//  MOBMessengerViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 17/3/7.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBInstagramViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface MOBInstagramViewController ()

@end

@implementation MOBInstagramViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    platformType = SSDKPlatformTypeInstagram;
    self.title = @"Instagram";
    shareIconArray = @[@"imageIcon",@"videoIcon"];
    shareTypeArray = @[@"图片",@"视频"];
    selectorNameArray = @[@"shareImage",@"shareVideo"];
}



/**
 分享图片
 */
- (void)shareImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:nil
                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    //平台定制
//    [parameters SSDKSetupInstagramByImage:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
//                         menuDisplayPoint:CGPointMake(0, 0)];
    
    [self shareWithParameters:parameters];
}

- (void)shareVideo
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:nil
                                    images:nil
                                       url:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]
                                     title:nil
                                      type:SSDKContentTypeVideo];
    //平台定制
//    [parameters SSDKSetupInstagramByVideo:[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]];
    
    [self shareWithParameters:parameters];
}


@end
