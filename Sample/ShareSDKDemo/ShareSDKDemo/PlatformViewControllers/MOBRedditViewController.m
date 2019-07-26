//
//  MOBRedditViewController.m
//  ShareSDKDemo
//
//  Created by wukx on 2018/8/14.
//  Copyright © 2018年 mob. All rights reserved.
//

#import "MOBRedditViewController.h"

@interface MOBRedditViewController ()

@end

@implementation MOBRedditViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    platformType = SSDKPlatformTypeReddit;
    self.title = @"Reddit";
    shareIconArray = @[@"textIcon",@"webURLIcon"];
    shareTypeArray = @[@"文字",@"链接"];
    selectorNameArray = @[@"shareText",@"shareLink"];
}

/**
 分享文字
 */
- (void)shareText
{
    //通用参数设置
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:nil
                                       url:nil
                                     title:@"mob"
                                      type:SSDKContentTypeText];
    [self shareWithParameters:parameters];
}

/**
 分享链接
 */
- (void)shareLink
{
    //通用参数设置
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:nil
                                    images:nil
                                       url:[NSURL URLWithString:SHARESDKDEMO_URLSTRING]
                                     title:@"mob"
                                      type:SSDKContentTypeWebPage];
    [self shareWithParameters:parameters];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
