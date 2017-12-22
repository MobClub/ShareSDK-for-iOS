//
//  MOBMessengerViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 17/3/7.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBQZoneViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface MOBQZoneViewController ()

@end

@implementation MOBQZoneViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    platformType = SSDKPlatformSubTypeQZone;
    self.title = @"QZone";
    shareIconArray = @[@"textIcon",@"imageIcon",@"webURLIcon",@"videoIcon"];
    shareTypeArray = @[@"文字",@"图片",@"链接",@"相册视频"];
    selectorNameArray = @[@"shareText",@"shareImage",@"shareLink",@"shareAssetVideo"];
}

/**
 分享文字
 */
-(void)shareText
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
//                                   type:SSDKContentTypeVideo
//                     forPlatformSubType:SSDKPlatformSubTypeQZone];
    [self shareWithParameters:parameters];
}

/**
 分享图片
 */
- (void)shareImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"];
    NSString *path2 = [[NSBundle mainBundle] pathForResource:@"D11" ofType:@"jpg"];
    NSString *path3 = [[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"];
    NSString *path4 = [[NSBundle mainBundle] pathForResource:@"shareImg" ofType:@"png"];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                    images:@[path1,path2,path3,path4]
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
//                                 images:@[path1,path2,path3,path4]
//                                   type:SSDKContentTypeImage
//                     forPlatformSubType:SSDKPlatformSubTypeQZone];
    [self shareWithParameters:parameters];
}

- (void)shareLink
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://n1.itc.cn/img8/wb/common/2016/08/13/qianfan.png"]];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:@"Share SDK Link Desc"
                                    images:[UIImage imageWithData:data]
                                       url:[NSURL URLWithString:@"https://www.mob.com"]
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
    //                     forPlatformSubType:SSDKPlatformSubTypeQZone];
    
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
        //iPad版本QQ 暂时未支持此功能
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:nil
                                        images:nil
                                           url:assetURL
                                         title:@"Share SDK"
                                          type:SSDKContentTypeVideo];
        //平台定制
//            [parameters SSDKSetupQQParamsByText:nil
//                                          title:nil
//                                            url:assetURL
//                                  audioFlashURL:nil
//                                  videoFlashURL:nil
//                                     thumbImage:nil
//                                         images:nil
//                                           type:SSDKContentTypeVideo
//                             forPlatformSubType:SSDKPlatformSubTypeQZone];
        [weakSelf shareWithParameters:parameters];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
