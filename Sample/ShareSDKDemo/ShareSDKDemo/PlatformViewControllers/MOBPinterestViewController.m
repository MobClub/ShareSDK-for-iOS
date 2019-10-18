//
//  MOBPinterestViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 2017/6/8.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBPinterestViewController.h"

@implementation MOBPinterestViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    platformType = SSDKPlatformTypePinterest;
    self.title = @"Pinterest";
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

    [parameters SSDKSetupPinterestParamsByImage:SHARESDKDEMO_IMAGE_STRING
                                           desc:SHARESDKDEMO_TEXT
                                            url:nil
                                      boardName:@"ShareSDK"];
    [self shareWithParameters:parameters];
    
}
- (void)shareLink
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];

    [parameters SSDKSetupPinterestParamsByImage:SHARESDKDEMO_IMAGE_STRING
                                           desc:SHARESDKDEMO_TEXT
                                            url:[NSURL URLWithString:SHARESDKDEMO_URLSTRING]
                                      boardName:@"ShareSDK"];
    [self shareWithParameters:parameters];
    
}
@end
