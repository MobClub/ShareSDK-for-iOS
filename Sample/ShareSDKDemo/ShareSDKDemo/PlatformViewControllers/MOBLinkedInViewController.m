//
//  MOBLinkedInViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 2017/6/7.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBLinkedInViewController.h"

@implementation MOBLinkedInViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    platformType = SSDKPlatformTypeLinkedIn;
    self.title = @"LinkedIn";
    shareIconArray = @[@"textIcon",@"webURLIcon"];
    shareTypeArray = @[@"文字",@"链接"];
    selectorNameArray = @[@"shareText",@"shareLink"];
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
//    [parameters SSDKSetupLinkedInParamsByText:@"Share SDK Link Desc"
//                                        image:nil
//                                          url:nil
//                                        title:nil
//                                      urlDesc:nil
//                                   visibility:nil
//                                         type:SSDKContentTypeText];
    [self shareWithParameters:parameters];
}


/**
 分享链接
 */
- (void)shareLink
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
//    [parameters SSDKSetupShareParamsByText:@"Share SDK Link Desc"
//                                    images:@"http://ww4.sinaimg.cn/bmiddle/005Q8xv4gw1evlkov50xuj30go0a6mz3.jpg"
//                                       url:[NSURL URLWithString:@"http://www.mob.com"]
//                                     title:@"Share SDK"
//                                      type:SSDKContentTypeWebPage];
    //平台定制
    [parameters SSDKSetupLinkedInParamsByText:@"Share SDK Link Desc"
                                        image:@"http://ww4.sinaimg.cn/bmiddle/005Q8xv4gw1evlkov50xuj30go0a6mz3.jpg"
                                          url:[NSURL URLWithString:@"http://www.mob.com"]
                                        title:@"Share SDK"
                                      urlDesc:@"Mob"
                                   visibility:nil
                                         type:SSDKContentTypeWebPage];
    [self shareWithParameters:parameters];
}

@end
