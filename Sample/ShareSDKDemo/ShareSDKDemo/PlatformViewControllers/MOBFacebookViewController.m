//
//  MOBMessengerViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 17/3/7.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBFacebookViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "MOBLoadingViewController.h"
#import <ShareSDK/SSDKVideoUploadCenter.h>

@interface MOBFacebookViewController ()
{
    NSString *sessionId;
    
    MOBLoadingViewController *loadingViewController;
    SSDKHttpServiceModel *httpServiceModel;
}

@end

@implementation MOBFacebookViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    platformType = SSDKPlatformTypeFacebook;
    self.title = @"Facebook";
    shareIconArray = @[@"textAndImageIcon",@"mutImageIcon",@"webURLIcon",@"videoURLIcon",@"webURLIcon"];
    shareTypeArray = @[@"单图",@"多图",@"链接",@"相册视频",@"应用邀请"];
    selectorNameArray = @[@"shareImage",@"shareImages",@"shareLink",@"shareAssetVideo",@"shareApp"];
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
//    [parameters SSDKSetupFacebookParamsByText:@"Share SDK"
//                                        image:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
//                                          url:nil
//                                     urlTitle:nil
//                                      urlName:nil
//                               attachementUrl:nil
//                                         type:SSDKContentTypeImage];
    [self shareWithParameters:parameters];
}

- (void)shareLink
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    //图片必须为网络图片
    [parameters SSDKSetupShareParamsByText:@"Share SDK Link Desc"
                                    images:@"http://ww4.sinaimg.cn/bmiddle/005Q8xv4gw1evlkov50xuj30go0a6mz3.jpg"
                                       url:[NSURL URLWithString:@"https://www.mob.com"]
                                     title:@"Share SDK"
                                      type:SSDKContentTypeWebPage];
    //平台定制
//        [parameters SSDKSetupFacebookParamsByText:@"Share SDK Link Desc"
//                                            image:@"http://ww4.sinaimg.cn/bmiddle/005Q8xv4gw1evlkov50xuj30go0a6mz3.jpg"
//                                              url:[NSURL URLWithString:@"https://www.mob.com"]
//                                         urlTitle:@"Share SDK"
//                                          urlName:nil
//                                   attachementUrl:nil
//                                             type:SSDKContentTypeWebPage];
    
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
                                      type:SSDKContentTypeImage];
    //平台定制
//    [parameters SSDKSetupFacebookParamsByText:nil
//                                        image:@[path1,path2,path3,path4]
//                                          url:nil
//                                     urlTitle:nil
//                                      urlName:nil
//                               attachementUrl:nil
//                                         type:SSDKContentTypeImage];
    
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
                                          type:SSDKContentTypeVideo];
        //平台定制
//         [parameters SSDKSetupFacebookParamsByText:nil
//                                             image:nil
//                                               url:assetURL
//                                          urlTitle:nil
//                                           urlName:nil
//                                    attachementUrl:nil
//                                              type:SSDKContentTypeVideo];
        
        [weakSelf shareWithParameters:parameters];
    }];
}

- (void)shareApp
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params SSDKSetupFacebookParamsByText:nil
                                    image:@"http://www.mob.com/public/images/logo_black.png"
                                      url:[NSURL URLWithString:@"https://fb.me/1492137904189216"]
                                 urlTitle:nil
                                  urlName:nil
                           attachementUrl:nil
                                     type:SSDKContentTypeApp];
    
    [self shareWithParameters:params];
}
@end
