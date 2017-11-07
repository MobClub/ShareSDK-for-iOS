//
//  MOBVKontakteViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 2017/6/7.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBVKontakteViewController.h"

@implementation MOBVKontakteViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    platformType = SSDKPlatformTypeVKontakte;
    self.title = @"VKontakte";
    shareIconArray = @[@"textIcon",@"webURLIcon",@"imageIcon"];
    shareTypeArray = @[@"文字",@"链接",@"图片"];
    selectorNameArray = @[@"shareText",@"shareLink",@"shareImage"];
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
//    [parameters SSDKSetupVKontakteParamsByText:@"Share SDK"
//                                        images:nil
//                                           url:nil
//                                       groupId:nil
//                                   friendsOnly:NO
//                                      latitude:0
//                                     longitude:0
//                                          type:SSDKContentTypeText];
    [self shareWithParameters:parameters];
}


/**
 分享链接
 */
- (void)shareLink
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"shareImg" ofType:@"png"]];
    [parameters SSDKSetupShareParamsByText:@"Share SDK Link Desc"
                                    images:image
                                       url:[NSURL URLWithString:@"http://www.mob.com"]
                                     title:@"Share SDK"
                                      type:SSDKContentTypeWebPage];
    //平台定制
//    [parameters SSDKSetupVKontakteParamsByText:@"Share SDK Link Desc"
//                                        images:image
//                                           url:[NSURL URLWithString:@"http://www.mob.com"]
//                                       groupId:nil
//                                   friendsOnly:NO
//                                      latitude:0
//                                     longitude:0
//                                          type:SSDKContentTypeWebPage];
    [self shareWithParameters:parameters];
}

/**
 分享图片
 */
- (void)shareImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"shareImg" ofType:@"png"]];
    [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                    images:image
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    //平台定制
    //    [parameters SSDKSetupVKontakteParamsByText:@"Share SDK Link Desc"
    //                                        images:image
    //                                           url:nil
    //                                       groupId:nil
    //                                   friendsOnly:NO
    //                                      latitude:0
    //                                     longitude:0
    //                                          type:SSDKContentTypeImage];
    [self shareWithParameters:parameters];
}

@end
