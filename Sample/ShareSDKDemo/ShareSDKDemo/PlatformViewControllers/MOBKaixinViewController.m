//
//  MOBKaixinViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 2017/6/7.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBKaixinViewController.h"

@implementation MOBKaixinViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    platformType = SSDKPlatformTypeKaixin;
    self.title = @"开心网";
    shareIconArray = @[@"textIcon",@"imageIcon"];
    shareTypeArray = @[@"文字",@"图片"];
    selectorNameArray = @[@"shareText",@"shareImage"];
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
//    [parameters SSDKSetupKaiXinParamsByText:@"Share SDK"
//                                      image:nil
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
    //平台定制
    [parameters SSDKSetupKaiXinParamsByText:@"Share SDK"
                                      image:[[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"]
                                       type:SSDKContentTypeImage];
    [self shareWithParameters:parameters];
}

@end
