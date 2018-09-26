//
//  MOBKakaoStoryViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 2017/6/7.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBKakaoStoryViewController.h"

@implementation MOBKakaoStoryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    platformType = SSDKPlatformSubTypeKakaoStory;
    self.title = @"KakaoStory";
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
    [parameters SSDKSetupKakaoStoryParamsByContent:@"ShareSDK test" title:nil images:nil url:nil permission:1 sharable:YES androidExecParam:nil iosExecParam:nil];
    
    
    [self shareWithParameters:parameters];
}

/**
 分享图片
 */
- (void)shareImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    
    [parameters SSDKSetupKakaoStoryParamsByContent:@"images" title:nil images:@[@"http://g.hiphotos.baidu.com/image/pic/item/060828381f30e92446c5b90241086e061d95f7a4.jpg",@"http://a.hiphotos.baidu.com/image/pic/item/0824ab18972bd4077557733177899e510eb3096d.jpg"] url:nil permission:0 sharable:YES androidExecParam:@{@"andParam1":@"value1", @"andParam2":@"value2"} iosExecParam:@{@"iosParam1":@"value1", @"iosParam2":@"value2"}];
    
    [self shareWithParameters:parameters];
}

- (void)shareLink
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:@"Share SDK Link Desc"
                                    images:@[@"http://g.hiphotos.baidu.com/image/pic/item/060828381f30e92446c5b90241086e061d95f7a4.jpg",@"http://a.hiphotos.baidu.com/image/pic/item/0824ab18972bd4077557733177899e510eb3096d.jpg"]
                                       url:[NSURL URLWithString:@"http://www.mob.com"]
                                     title:@"Share SDK"
                                      type:SSDKContentTypeWebPage];
    
    //平台定制
    //    [parameters SSDKSetupKaKaoParamsByText:@"Share SDK"
    //                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
    //                                     title:@"Share SDK"
    //                                       url:[NSURL URLWithString:@"http://www.mob.com"]
    //                                permission:nil
    //                               enableShare:YES
    //                                 imageSize:CGSizeZero
    //                            appButtonTitle:nil
    //                          androidExecParam:nil
    //                          androidMarkParam:nil
    //                          iphoneExecParams:nil
    //                           iphoneMarkParam:nil
    //                            ipadExecParams:nil
    //                             ipadMarkParam:nil
    //                                      type:SSDKContentTypeWebPage
    //                        forPlatformSubType:platformType];
    
    [self shareWithParameters:parameters];
}

@end
