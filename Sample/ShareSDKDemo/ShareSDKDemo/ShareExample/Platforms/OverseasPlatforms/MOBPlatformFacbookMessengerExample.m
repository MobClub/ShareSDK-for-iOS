//
//  MOBPlatformFacbookMessengerExample.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/19.
//  Copyright © 2019 mob. All rights reserved.
//  文档地址:https://www.mob.com/wiki/detailed?wiki=ShareSDK_chanpinjianjie&id=14

#import "MOBPlatformFacbookMessengerExample.h"
#import <AssetsLibrary/AssetsLibrary.h>
@implementation MOBPlatformFacbookMessengerExample

- (void)setup{
    
    SSDKWEAK
    [self addListItemWithImage:MOBVideoShareIcon name:@"本地视频" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareAssetVideo];
    }];
}
/**
 分享图片
 */
- (void)shareImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:nil
                                    images:SHARESDKDEMO_IMAGE_LOCALPATH
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
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:SHARESDKDEMO_IMAGE_STRING
                                       url:[NSURL URLWithString:SHARESDKDEMO_URLSTRING]
                                     title:SHARESDKDEMO_TITLE
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

- (void)shareTextImage{
    [self shareMutiImage];
}

- (void)shareMutiImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    NSString *path1 = SHARESDKDEMO_IMAGE_LOCALPATH;
    NSString *path2 = [[NSBundle mainBundle] pathForResource:@"shareImg" ofType:@"png"];
    
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:nil
                                    images:@[path1,path2]
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


+ (SSDKPlatformType)platformType{
    return SSDKPlatformTypeFacebookMessenger;
}
@end
