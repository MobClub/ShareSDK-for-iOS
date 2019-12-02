//
//  MOBWhatsAppViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 2017/5/26.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBWhatsAppViewController.h"

@interface MOBWhatsAppViewController ()

@end

@implementation MOBWhatsAppViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    platformType = SSDKPlatformTypeWhatsApp;
    self.title = @"WhatsApp";
    shareIconArray = @[@"textIcon",@"textIcon",@"imageIcon",@"audioURLIcon",@"videoIcon"];
    shareTypeArray = @[@"文字", @"文字-系统",@"图片-只有系统",@"音频-只有系统",@"视频-只有系统"];
    selectorNameArray = @[@"shareText", @"shareTextSystem", @"shareImage",@"shareAudio",@"shareVideo"];
}

/**
 分享文字
 */
-(void)shareText
{
    //通用参数设置
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
//    [parameters SSDKSetupShareParamsByText:@"https://www.mob.com"
//                                        images:nil
//                                           url:nil
//                                         title:nil
//                                          type:SSDKContentTypeText];
    //平台定制
    [parameters SSDKSetupWhatsAppParamsByText:SHARESDKDEMO_TEXT
                                        image:nil
                                        audio:nil
                                        video:nil
                             menuDisplayPoint:CGPointZero
                                         type:SSDKContentTypeText];
    [self shareWithParameters:parameters];
}

/**
 分享文字
 */
-(void)shareTextSystem
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];

    //平台定制
    [parameters SSDKSetupWhatsAppParamsByText:SHARESDKDEMO_TEXT
                                        image:nil
                                        audio:nil
                                        video:nil
                             menuDisplayPoint:CGPointZero
                                    useSystem:YES
                                         type:SSDKContentTypeText];
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
//    [parameters SSDKSetupWhatsAppParamsByText:@"Share SDK"
//                                        image:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
//                                        audio:nil
//                                        video:nil
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
    
    [parameters SSDKSetupWhatsAppParamsByText:@"Share SDK"
                                        image:nil
                                        audio:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"music" ofType:@"mp3"]]
                                        video:nil
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
    [parameters SSDKSetupWhatsAppParamsByText:@"Share SDK"
                                        image:nil
                                        audio:nil
                                        video:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]
                             menuDisplayPoint:CGPointZero
                                         type:SSDKContentTypeVideo];
    [self shareWithParameters:parameters];
}

@end
