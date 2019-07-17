//
//  MOBWeworkViewController.m
//  ShareSDKDemo
//
//  Created by wkx on 2019/7/11.
//  Copyright © 2019年 mob. All rights reserved.
//

#import "MOBWeworkViewController.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDK/NSMutableDictionary+SSDKShare.h>

@interface MOBWeworkViewController ()

@end

@implementation MOBWeworkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [super viewDidLoad];
    platformType = SSDKPlatformTypeWework;
    self.title = @"企业微信";
    shareIconArray = @[@"textIcon",@"imageIcon",@"webURLIcon",@"videoIcon",@"miniIcon"];
    shareTypeArray = @[@"文字",@"图片",@"链接",@"视频",@"文件"];
    selectorNameArray = @[@"shareText",@"shareImage",@"shareLink",@"shareVideo",@"shareFile"];
}

- (void)shareText
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:nil
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeText];
    
    [self shareWithParameters:parameters];
}

- (void)shareImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:nil
                                    images:SHARESDKDEMO_IMAGE_LOCALPATH
                                       url:nil
                                     title:@"share.jpg"
                                      type:SSDKContentTypeImage];
    
    [self shareWithParameters:parameters];
}

- (void)shareLink
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:[[NSBundle mainBundle] pathForResource:@"Icon@2x" ofType:@"png"]
                                       url:[NSURL URLWithString:SHARESDKDEMO_URLSTRING]
                                     title:SHARESDKDEMO_TITLE
                                      type:SSDKContentTypeWebPage];
    
    [self shareWithParameters:parameters];
}

- (void)shareVideo
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupWeWorkParamsByText:nil
                                      title:@"share.mp4"
                                        url:nil
                                 thumbImage:nil
                                      image:nil
                                      video:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]
                                   fileData:nil
                                       type:SSDKContentTypeVideo];
    [self shareWithParameters:parameters];
}

- (void)shareFile
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupWeWorkParamsByText:nil
                                      title:@"share.mp3"
                                        url:nil
                                 thumbImage:nil
                                      image:nil
                                      video:nil
                                   fileData:[[NSBundle mainBundle] pathForResource:@"music" ofType:@"mp3"]
                                       type:SSDKContentTypeFile];
    [self shareWithParameters:parameters];
}

@end
