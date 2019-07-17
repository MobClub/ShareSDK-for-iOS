//
//  MOBTelegramViewController.m
//  ShareSDKDemo
//
//  Created by wukx on 2018/8/3.
//  Copyright © 2018年 mob. All rights reserved.
//

#import "MOBTelegramViewController.h"

@interface MOBTelegramViewController ()

@end

@implementation MOBTelegramViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    platformType = SSDKPlatformTypeTelegram;
    self.title = @"Telegram";
    shareIconArray = @[@"textIcon",@"webURLIcon",@"imageIcon",@"audioURLIcon",@"videoIcon",@"imageIcon"];
    shareTypeArray = @[@"文字",@"链接",@"图片",@"音频",@"视频",@"文件(图片、音频、视频及其他类型)"];
    selectorNameArray = @[@"shareText",@"shareLink",@"shareImage",@"shareAudio",@"shareVideo",@"shareFile"];
}

/**
 分享文字
 */
-(void)shareText
{
    //通用参数设置
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:nil
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeText];
    //平台定制
    //    [parameters SSDKSetupTelegramParamsByText:@"Share SDK"
    //                                        image:nil
    //                                        audio:nil
    //                                        video:nil
    //                                         file:nil
    //                             menuDisplayPoint:CGPointZero
    //                                         type:SSDKContentTypeText];
    [self shareWithParameters:parameters];
}

-(void)shareLink
{
    //通用参数设置
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:nil
                                       url:[NSURL URLWithString:SHARESDKDEMO_URLSTRING]
                                     title:nil
                                      type:SSDKContentTypeWebPage];
    [self shareWithParameters:parameters];
}

/**
 分享图片
 */
- (void)shareImage
{
    //通用参数设置
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:SHARESDKDEMO_IMAGE_LOCALPATH
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    //平台定制
    //    [parameters SSDKSetupTelegramParamsByText:@"Share SDK"
    //                                        image:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
    //                                        audio:nil
    //                                        video:nil
    //                                         file:nil
    //                             menuDisplayPoint:CGPointZero
    //                                         type:SSDKContentTypeImage];
    [self shareWithParameters:parameters];
}

/**
 分享音频
 */
- (void)shareAudio
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];

    [parameters SSDKSetupTelegramParamsByText:@"Share SDK"
                                        image:nil
                                        audio:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"music" ofType:@"mp3"]]
                                        video:nil
                                         file:nil
                             menuDisplayPoint:CGPointZero
                                         type:SSDKContentTypeAudio];

    [self shareWithParameters:parameters];
}


/**
 分享视频
 */
- (void)shareVideo
{
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //平台定制
    [parameters SSDKSetupTelegramParamsByText:@"Share SDK"
                                        image:nil
                                        audio:nil
                                        video:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]
                                         file:nil
                             menuDisplayPoint:CGPointZero
                                         type:SSDKContentTypeVideo];
    [self shareWithParameters:parameters];
}

/**
 分享文件
 */
- (void)shareFile
{
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //平台定制
    [parameters SSDKSetupTelegramParamsByText:@"Share SDK"
                                        image:nil
                                        audio:nil
                                        video:nil
                                         file:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"res6" ofType:@"gif"]]
                             menuDisplayPoint:CGPointZero
                                         type:SSDKContentTypeFile];
    [self shareWithParameters:parameters];
}

@end
