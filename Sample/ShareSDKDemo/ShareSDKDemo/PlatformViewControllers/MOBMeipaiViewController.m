//
//  MOBMessengerViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 17/3/7.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBMeipaiViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface MOBMeipaiViewController ()

@end

@implementation MOBMeipaiViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    platformType = SSDKPlatformTypeMeiPai;
    self.title = @"美拍";
    shareIconArray = @[@"imageIcon",@"videoIcon",@"imageIcon",@"videoIcon"];
    shareTypeArray = @[@"图片",@"视频",@"相册图片",@"相册视频"]; //相册视频
    selectorNameArray = @[@"shareImage",@"shareVideo",@"shareAssetImage",@"shareAssetVideo"];
}


/**
 分享本地图片
 */
- (void)shareImage
{
    //仅支持单张图片
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:nil
                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    //平台定制
//    [parameters SSDKSetupMeiPaiParamsByUrl:[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]] type:SSDKContentTypeImage];
    [self shareWithParameters:parameters];
}

/**
 分享本地视频
 */
- (void)shareVideo
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:nil
                                    images:nil
                                       url:[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]
                                     title:nil
                                      type:SSDKContentTypeVideo];
    //平台定制
//    [parameters SSDKSetupMeiPaiParamsByUrl:[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]] type:SSDKContentTypeVideo];
    [self shareWithParameters:parameters];
}

/**
 分享相册图片
 */
- (void)shareAssetImage
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"];
    ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
    __weak __typeof__ (self) weakSelf = self;
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    [assetsLibrary writeImageToSavedPhotosAlbum:[image CGImage]
                                    orientation:(ALAssetOrientation)image.imageOrientation
                                completionBlock:^(NSURL *assetURL, NSError *error) {
                                    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
                                    //通用参数设置
                                    [parameters SSDKSetupShareParamsByText:nil
                                                                    images:nil
                                                                       url:assetURL
                                                                     title:nil
                                                                      type:SSDKContentTypeImage];
                                    //平台定制
                                    //        [parameters SSDKSetupMeiPaiParamsByUrl:assetURL type:SSDKContentTypeImage];
                                    [weakSelf shareWithParameters:parameters];
                                }];
}

/**
 分享相册视频
 */
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
                                          type:SSDKContentTypeVideo];
        //平台定制
        //        [parameters SSDKSetupMeiPaiParamsByUrl:assetURL type:SSDKContentTypeVideo];
        
        [weakSelf shareWithParameters:parameters];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
