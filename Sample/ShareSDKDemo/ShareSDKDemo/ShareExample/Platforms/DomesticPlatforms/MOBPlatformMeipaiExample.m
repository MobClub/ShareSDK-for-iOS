//
//  MOBPlatformMeipaiExample.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/19.
//  Copyright © 2019 mob. All rights reserved.
//  文档地址:https://www.mob.com/wiki/detailed?wiki=ShareSDK_chanpinjianjie&id=14

#import "MOBPlatformMeipaiExample.h"
#import <AssetsLibrary/AssetsLibrary.h>

@implementation MOBPlatformMeipaiExample

- (void)setup{
    SSDKWEAK
    [self addListItemWithImage:MOBVideoShareIcon name:@"本地视频" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
           SSDKSTRONG
           [self shareAssetVideo];
    }];
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
                                    images:SHARESDKDEMO_IMAGE_LOCALPATH
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
    NSString *path = SHARESDKDEMO_IMAGE_LOCALPATH;
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


+ (SSDKPlatformType)platformType{
    return SSDKPlatformTypeMeiPai;
}
@end
