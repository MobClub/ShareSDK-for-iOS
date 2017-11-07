//
//  MOBMessengerViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 17/3/7.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBMessengerViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface MOBMessengerViewController ()

@end

@implementation MOBMessengerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    platformType = SSDKPlatformTypeFacebookMessenger;
    self.title = @"Messenger";
    shareIconArray = @[@"imageIcon",@"imageIcon",@"videoIcon",@"audioURLIcon",@"webURLIcon",@"mutImageIcon",@"videoIcon"];
    shareTypeArray = @[@"图片",@"GIF",@"本地视频",@"本地音频",@"链接",@"多图",@"相册视频"];
    selectorNameArray = @[@"shareImage",@"shareGIF",@"shareVideo",@"shareAudio",@"shareLink",@"shareImages",@"shareAssetVideo"];
}


/**
 分享图片
 */
- (void)shareImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:nil
                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    //平台定制
//    [parameters SSDKSetupFacebookMessengerParamsByTitle:nil
//                                                    url:nil
//                                              quoteText:nil
//                                                  image:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
//                                                    gif:nil
//                                                  audio:nil
//                                                  video:nil
//                                                   type:SSDKContentTypeImage];
    [self shareWithParameters:parameters];
}


- (void)shareGIF
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    
    //平台定制
    [parameters SSDKSetupFacebookMessengerParamsByTitle:nil
                                                    url:nil
                                              quoteText:nil
                                                 images:nil
                                                    gif:[[NSBundle mainBundle] pathForResource:@"res6" ofType:@"gif"]
                                                  audio:nil
                                                  video:nil
                                                   type:SSDKContentTypeImage];
    
    [self shareWithParameters:parameters];
}


- (void)shareVideo
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    [parameters SSDKSetupShareParamsByText:nil
                                    images:nil
                                       url:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]
                                     title:nil
                                      type:SSDKContentTypeVideo];
    
//    //平台定制
//    [parameters SSDKSetupFacebookMessengerParamsByTitle:nil
//                                                    url:nil
//                                              quoteText:nil
//                                                 images:nil
//                                                    gif:nil
//                                                  audio:nil
//                                                  video:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]
//                                                   type:SSDKContentTypeVideo];
    
    [self shareWithParameters:parameters];
}

- (void)shareAudio
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    //平台定制
    [parameters SSDKSetupFacebookMessengerParamsByTitle:nil
                                                    url:nil
                                              quoteText:nil
                                                 images:nil
                                                    gif:nil
                                                  audio:[[NSBundle mainBundle] pathForResource:@"music" ofType:@"mp3"]
                                                  video:nil
                                                   type:SSDKContentTypeAudio];
    
    [self shareWithParameters:parameters];
}

- (void)shareLink
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    //图片必须为网络图片
    [parameters SSDKSetupShareParamsByText:@"Share SDK Link Desc"
                                    images:@"http://ww4.sinaimg.cn/bmiddle/005Q8xv4gw1evlkov50xuj30go0a6mz3.jpg"
                                       url:[NSURL URLWithString:@"http://sharesdk.mob.com/"]
                                     title:@"Share SDK"
                                      type:SSDKContentTypeWebPage];
    //平台定制
//        [parameters SSDKSetupFacebookMessengerParamsByTitle:@"Share SDK"
//                                                        url:[NSURL URLWithString:@"http://www.mob.com"]
//                                                  quoteText:@"Share SDK Link Desc"
//                                                     images:@"http://weixintest.ihk.cn/ihkwx_upload/heji/material/img/20160414/1460616012469.jpg"
//                                                        gif:nil
//                                                      audio:nil
//                                                      video:nil
//                                                       type:SSDKContentTypeWebPage];
    
    [self shareWithParameters:parameters];
}

- (void)shareImages
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"];
    NSString *path2 = [[NSBundle mainBundle] pathForResource:@"D11" ofType:@"jpg"];
    NSString *path3 = [[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"];
    NSString *path4 = [[NSBundle mainBundle] pathForResource:@"shareImg" ofType:@"png"];
    
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:nil
                                    images:@[path1,path2,path3,path4]
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeFBMessageImages];
    //平台定制
//    [parameters SSDKSetupFacebookMessengerParamsByTitle:nil
//                                                    url:nil
//                                              quoteText:nil
//                                                 images:@[path1,path2,path3,path4]
//                                                    gif:nil
//                                                  audio:nil
//                                                  video:nil
//                                                   type:SSDKContentTypeFBMessageImages];
    
    [self shareWithParameters:parameters];
}

- (void)shareAssetVideo
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"];
    NSURL *url = [NSURL URLWithString:path];
    ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
    __weak __typeof__ (self) weakSelf = self;
    [assetsLibrary writeVideoAtPathToSavedPhotosAlbum:url completionBlock:^(NSURL *assetURL, NSError *error) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:nil
                                        images:nil
                                           url:assetURL
                                         title:nil
                                          type:SSDKContentTypeFBMessageVideo];
        //平台定制
//        [parameters SSDKSetupFacebookMessengerParamsByTitle:nil
//                                                        url:nil
//                                                  quoteText:nil
//                                                     images:nil
//                                                        gif:nil
//                                                      audio:nil
//                                                      video:assetURL
//                                                       type:SSDKContentTypeFBMessageVideo];
        [weakSelf shareWithParameters:parameters];
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
