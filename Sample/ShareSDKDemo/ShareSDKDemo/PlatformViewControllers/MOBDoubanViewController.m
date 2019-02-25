//
//  MOBDouBanViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 2017/6/6.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBDoubanViewController.h"

@implementation MOBDoubanViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    platformType = SSDKPlatformTypeDouBan;
    self.title = @"豆瓣";
    shareIconArray = @[@"textIcon",@"imageIcon",@"webURLIcon"];
    shareTypeArray = @[@"文字",@"图片",@"链接"];
    selectorNameArray = @[@"shareText",@"shareImage",@"shareLink"];
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
//    [parameters SSDKSetupDouBanParamsByText:@"Share SDK"
//                                      image:nil
//                                      title:nil
//                                        url:nil
//                                    urlDesc:nil
//                                       type:SSDKContentTypeText];
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
                                    images:[[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"]
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    
    
    //平台定制
//    [parameters SSDKSetupDouBanParamsByText:@"Share SDK"
//                                      image:[[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"]
//                                      title:nil
//                                        url:nil
//                                    urlDesc:nil
//                                       type:SSDKContentTypeImage];
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
//    [parameters SSDKSetupDouBanParamsByText:@"Share SDK"
//                                      image:[[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"]
//                                      title:@"Share SDK"
//                                        url:[NSURL URLWithString:@"http://www.mob.com"]
//                                    urlDesc:@"Share SDK DESC"
//                                       type:SSDKContentTypeWebPage];
    [self shareWithParameters:parameters];
}

@end
