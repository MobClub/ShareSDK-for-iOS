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
    platformType = SSDKPlatformTypeAliSocial;
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
                                    images:@"http://ww4.sinaimg.cn/bmiddle/005Q8xv4gw1evlkov50xuj30go0a6mz3.jpg"//[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    
    //    [parameters SSDKSetupAliPaySocialParamsByText:@"Share SDK"
    //                                            image:@"http://ww4.sinaimg.cn/bmiddle/005Q8xv4gw1evlkov50xuj30go0a6mz3.jpg"
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
    [parameters SSDKSetupShareParamsByText:@"Share SDK Link Desc"
                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:[NSURL URLWithString:@"https://www.mob.com"]
                                     title:@"Share SDK"
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
