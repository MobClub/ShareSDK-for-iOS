//
//  MOBPocketViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 2017/6/6.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBPocketViewController.h"

@interface MOBPocketViewController ()

@end

@implementation MOBPocketViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    platformType = SSDKPlatformTypePocket;
    self.title = @"Pocket";
    shareIconArray = @[@"webURLIcon"];
    shareTypeArray = @[@"链接"];
    selectorNameArray = @[@"shareLink"];
}


/**
 分享链接
 */
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
//    [parameters SSDKSetupPocketParamsByUrl:[NSURL URLWithString:@"http://www.mob.com"]
//                                     title:@"Share SDK"
//                                      tags:@"page"
//                                   tweetId:nil];
    [self shareWithParameters:parameters];
}

@end
