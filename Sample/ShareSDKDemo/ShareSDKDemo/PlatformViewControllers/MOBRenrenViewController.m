//
//  MOBRenrenViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 2017/6/7.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBRenrenViewController.h"

@implementation MOBRenrenViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    platformType = SSDKPlatformTypeRenren;
    self.title = @"人人网";
    shareIconArray = @[@"imageIcon",@"webURLIcon"];
    shareTypeArray = @[@"图片",@"链接"];
    selectorNameArray = @[@"shareImage",@"shareLink"];

}

/**
 分享图片
 */
- (void)shareImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:SHARESDKDEMO_IMAGE_LOCALPATH
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    
    
    //平台定制
//    [parameters SSDKSetupRenRenParamsByText:@"Share SDK"
//                                      image:[[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"]
//                                        url:nil
//                                    albumId:nil
//                                       type:SSDKContentTypeImage];
    [self shareWithParameters:parameters];
}

/**
 链接
 */
- (void)shareLink
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:SHARESDKDEMO_IMAGE_LOCALPATH
                                       url:[NSURL URLWithString:SHARESDKDEMO_URLSTRING]
                                     title:SHARESDKDEMO_TITLE
                                      type:SSDKContentTypeWebPage];
    
    //平台定制
//    [parameters SSDKSetupRenRenParamsByText:@"Share SDK"
//                                      image:nil
//                                        url:[NSURL URLWithString:@"http://www.mob.com"]
//                                    albumId:nil
//                                       type:SSDKContentTypeWebPage];
    [self shareWithParameters:parameters];
}

@end
