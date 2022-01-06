//
//  MOBPlatformSnapChatExample.m
//  ShareSDKDemo
//
//  Created by maxl on 2020/3/30.
//  Copyright © 2020 mob. All rights reserved.
//

#import "MOBPlatformSnapChatExample.h"
#import "MOBCustomeShareVC.h"
#import <MOBFoundation/MOBFoundation.h>
@implementation MOBPlatformSnapChatExample

- (void)setup{
    SSDKWEAK
    [self addListItemWithImage:MOBImageShareIcon name:@"贴纸" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self sharesticker];
    }];
    
    [self addListItemWithImage:MOBApplicationShareIcon name:@"系统分享-图片（单图/多图）" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareImageBySystem];
    }];
    [self addListItemWithImage:MOBApplicationShareIcon name:@"系统分享-本地视频" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareVideoBySystem];
    }];
    [self addListItemWithImage:MOBApplicationShareIcon name:@"系统分享-相册图片（单图/多图）" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareAssetImageBySystem];
    }];
    [self addListItemWithImage:MOBApplicationShareIcon name:@"系统分享-相册视频" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareAssetVideoBySystem];
    }];
    
    [self addListItemWithImage:MOBMiniProgramShareIcon name:@"自定义参数分享" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        [weakSelf shareWithCustom];
    }];
}

+ (SSDKPlatformType)platformType{
    return SSDKPlatformTypeSnapChat;
}

- (void)shareImage{
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter SSDKSetupSnapChatParamsByCaption:@"https://www.mobtech.com"
                                  attachmentUrl:SHARESDKDEMO_URLSTRING
                                          image:SHARESDKDEMO_IMAGE_LOCALPATH
                                          video:nil
                                       sticker:[UIImage imageNamed:@"ren_nv"]
                               stickerAnimated:NO
                               stickerRotation:0
                                cameraViewState:0
                                           type:SSDKContentTypeImage];
    [self shareWithParameters:parameter];
}


- (void)shareVideo{
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter SSDKSetupSnapChatParamsByCaption:@"ShareSDK"
                                  attachmentUrl:SHARESDKDEMO_URLSTRING
                                          image:nil
                                          video:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]
                                       sticker:[UIImage imageNamed:@"ren_nv"]
                               stickerAnimated:NO
                               stickerRotation:0
                                cameraViewState:0
                                           type:SSDKContentTypeVideo];
    [self shareWithParameters:parameter];
}

- (void)sharesticker{
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter SSDKSetupSnapChatParamsByCaption:@"ShareSDK"
                                  attachmentUrl:SHARESDKDEMO_URLSTRING
                                          image:nil
                                          video:nil
                                       sticker:[UIImage imageNamed:@"ren_nv"]
                               stickerAnimated:NO
                               stickerRotation:0
                                cameraViewState:0
                                           type:SSDKContentTypeImage];
    [self shareWithParameters:parameter];
    
}

#pragma mark - 系统分享

- (void)shareImageBySystem
{
    //系统分享图片（单图/多图）
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:@[SHARESDKDEMO_IMAGE_LOCALPATH]
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    [self shareByActivityWithParameters:parameters];
}

- (void)shareAssetImageBySystem
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //系统分享相册图片（单图/多图）
    [SSDKImagePickerController initWithNavgationControllerConfigureBlock:^(SSDKImagePickerConfigure * _Nonnull configure) {
        configure.openSmartAlbumUserLibrary = YES;
        configure.mediaType = SSDKImagePickerMediaTypeImage;
        configure.operationConfigure.minimumNumberOfImageSelection = 1;
        configure.operationConfigure.maximumNumberOfImageSelection = 10;
    } result:^(SSDKImagePickerCompleteStatus status, SSDKImagePickerResult * _Nullable result) {
        if (status == SSDKImagePickerCompleteStatusCancel) {
            
        }else{
            //分享参数为PHAsset数组
            [parameters SSDKSetupShareParamsByImageAsset:result.selectedElements videoAsset:nil completeHandle:^(BOOL complete) {
                if(complete){
                    [self shareByActivityWithParameters:parameters];
                }
            }];
        }}].presentAnimated();
}

- (void)shareVideoBySystem{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"shareVideo2" ofType:@"mp4"];
    NSURL *url = [NSURL fileURLWithPath:path];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:nil
                                       url:url
                                     title:nil
                                      type:SSDKContentTypeVideo];
    [self shareByActivityWithParameters:parameters];
}

- (void)shareAssetVideoBySystem{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [SSDKImagePickerController initWithNavgationControllerConfigureBlock:^(SSDKImagePickerConfigure * _Nonnull configure) {
        configure.openSmartAlbumUserLibrary = YES;
        configure.mediaType = SSDKImagePickerMediaTypeVideo;
        //视频只能传1个
        configure.operationConfigure.minimumNumberOfVideoSelection = 1;
        configure.operationConfigure.maximumNumberOfVideoSelection = 1;
    } result:^(SSDKImagePickerCompleteStatus status, SSDKImagePickerResult * _Nullable result) {
        if (status == SSDKImagePickerCompleteStatusCancel) {
            
        }else{
            //分享参数为PHAsset数组
            [parameters SSDKSetupShareParamsByImageAsset:nil videoAsset:result.selectedElements.firstObject completeHandle:^(BOOL complete) {
                if(complete){
                    [self shareByActivityWithParameters:parameters];
                }
            }];
        }
    }].presentAnimated();
}

- (void)shareWithCustom{
    MOBCustomeShareVC *vc = [[MOBCustomeShareVC alloc]init];
    vc.platformType = self.platformType;
    [[MOBFViewController currentViewController].navigationController pushViewController:vc animated:YES];
}
@end
