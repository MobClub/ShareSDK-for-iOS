//
//  MOBMessengerViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 17/3/7.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBQQViewController.h"

@interface MOBQQViewController ()

@end

@implementation MOBQQViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    platformType = SSDKPlatformSubTypeQQFriend;
    self.title = @"QQ好友";
    shareIconArray = @[@"textIcon",@"imageIcon",@"webURLIcon",@"audioURLIcon",@"videoIcon"];
    shareTypeArray = @[@"文字",@"图片",@"链接",@"音乐链接",@"视频链接"];
    selectorNameArray = @[@"shareText",@"shareImage",@"shareLink",@"shareAudio",@"shareVideo"];
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
//    [parameters SSDKSetupQQParamsByText:@"Share SDK"
//                                  title:nil
//                                    url:nil
//                          audioFlashURL:nil
//                          videoFlashURL:nil
//                             thumbImage:nil
//                                 images:nil
//                                   type:SSDKContentTypeText
//                     forPlatformSubType:SSDKPlatformSubTypeQQFriend];
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
//    [parameters SSDKSetupQQParamsByText:@"Share SDK"
//                                  title:nil
//                                    url:nil
//                          audioFlashURL:nil
//                          videoFlashURL:nil
//                             thumbImage:nil
//                                 images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
//                                   type:SSDKContentTypeImage
//                     forPlatformSubType:SSDKPlatformSubTypeQQFriend];
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
//    [parameters SSDKSetupQQParamsByText:@"Share SDK Link Desc"
//                                  title:@"Share SDK"
//                                    url:[NSURL URLWithString:@"https://www.mob.com"]
//                          audioFlashURL:nil
//                          videoFlashURL:nil
//                             thumbImage:nil
//                                 images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
//                                   type:SSDKContentTypeWebPage
//                     forPlatformSubType:SSDKPlatformSubTypeQQFriend];
    
    [self shareWithParameters:parameters];
}

- (void)shareAudio
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:@"Share SDK Link Desc"
                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:[NSURL URLWithString:@"http://i.y.qq.com/v8/playsong.html?hostuin=0&songid=&songmid=002x5Jje3eUkXT&_wv=1&source=qq&appshare=iphone&media_mid=002x5Jje3eUkXT""http://www.mob.com"]
                                     title:@"Share SDK"
                                      type:SSDKContentTypeAudio];
    
    //平台定制
//        [parameters SSDKSetupQQParamsByText:@"Share SDK Link Desc"
//                                      title:@"Share SDK"
//                                        url:[NSURL URLWithString:@"http://i.y.qq.com/v8/playsong.html?hostuin=0&songid=&songmid=002x5Jje3eUkXT&_wv=1&source=qq&appshare=iphone&media_mid=002x5Jje3eUkXT"]
//                              audioFlashURL:[NSURL URLWithString:@"http://i.y.qq.com/v8/playsong.html?hostuin=0&songid=&songmid=002x5Jje3eUkXT&_wv=1&source=qq&appshare=iphone&media_mid=002x5Jje3eUkXT"]
//                              videoFlashURL:nil
//                                 thumbImage:nil
//                                     images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
//                                       type:SSDKContentTypeAudio
//                         forPlatformSubType:SSDKPlatformSubTypeQQFriend];
    
    [self shareWithParameters:parameters];
}

- (void)shareVideo
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:@"Share SDK Link Desc"
                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:[NSURL URLWithString:@"http://www.mob.com"]
                                     title:@"Share SDK"
                                      type:SSDKContentTypeVideo];
    
    //平台定制
    //    [parameters SSDKSetupQQParamsByText:@"Share SDK Link Desc"
    //                                  title:@"Share SDK"
    //                                    url:[NSURL URLWithString:@"https://www.mob.com"]
    //                          audioFlashURL:nil
    //                          videoFlashURL:nil
    //                             thumbImage:nil
    //                                 images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
    //                                   type:SSDKContentTypeWebPage
    //                     forPlatformSubType:SSDKPlatformSubTypeQQFriend];
    
    [self shareWithParameters:parameters];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
