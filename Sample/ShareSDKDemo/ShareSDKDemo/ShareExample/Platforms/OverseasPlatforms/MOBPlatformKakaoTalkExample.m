//
//  MOBPlatformKakaoTalkExample.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/20.
//  Copyright © 2019 mob. All rights reserved.
//  文档地址:https://www.mob.com/wiki/detailed?wiki=ShareSDK_chanpinjianjie&id=14

#import "MOBPlatformKakaoTalkExample.h"
#import "MOBCustomeShareVC.h"
#import <MOBFoundation/MOBFoundation.h>
@implementation MOBPlatformKakaoTalkExample
+ (SSDKPlatformType)platformType{
    return SSDKPlatformSubTypeKakaoTalk;
}

- (void)setup{
    SSDKWEAK

    [self addListItemWithImage:MOBApplicationShareIcon name:@"系统分享-文字" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareTextBySystem];
    }];
    [self addListItemWithImage:MOBApplicationShareIcon name:@"系统分享-链接" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareLinkBySystem];
    }];
    [self addListItemWithImage:MOBApplicationShareIcon name:@"系统分享-图片(单图/多图，本地/网络图片均可)" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareImageBySystem];
    }];
    [self addListItemWithImage:MOBApplicationShareIcon name:@"系统分享-相册图片（单图/多图）" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareAssetImageBySystem];
    }];
    [self addListItemWithImage:MOBApplicationShareIcon name:@"系统分享-本地视频" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareVideoBySystem];
    }];
    [self addListItemWithImage:MOBApplicationShareIcon name:@"系统分享-相册视频" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareAssetVideoBySystem];
    }];
    [self addListItemWithImage:MOBApplicationShareIcon name:@"系统分享-文件（仅支持本地文件）" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareFileBySystem];
    }];
    [self addListItemWithImage:MOBMiniProgramShareIcon name:@"自定义参数分享" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        [weakSelf shareWithCustom];
    }];
}

- (void)shareLink
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
//    //通用参数设置
//    [parameters SSDKSetupShareParamsByText:@"Share SDK Link Desc"
//                                    images:@"http://www.mob.com/images/logo_black.png"
//                                       url:[NSURL URLWithString:@"http://www.mob.com"]
//                                     title:@"Share SDK"
//                                      type:SSDKContentTypeWebPage];
    
    //平台定制
    [parameters SSDKSetupKaKaoTalkParamsByUrl:[NSURL URLWithString:@"http://www.mob.com/"] templateId:@"11820" templateArgs:nil];
//    [parameters SSDKSetupKaKaoTalkParamsByUrl:nil templateId:@"11820" templateArgs:nil];
    [self shareWithParameters:parameters];
}

#pragma mark - 系统分享
- (void)shareTextBySystem
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:nil
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeText];
    
    [self shareByActivityWithParameters:parameters];
}

- (void)shareLinkBySystem
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                    images:nil
                                       url:[NSURL URLWithString:@"https://www.qq.com"]
                                     title:nil
                                      type:SSDKContentTypeWebPage];
    
    [self shareByActivityWithParameters:parameters];
}

- (void)shareImageBySystem
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:@[SHARESDKDEMO_IMAGE]
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
        configure.operationConfigure.maximumNumberOfImageSelection = 29;
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

- (void)shareVideoBySystem
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"];

    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:nil
                                       url:[NSURL fileURLWithPath:path]
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

- (void)shareFileBySystem
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];

    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:nil
                                       url:[NSURL fileURLWithPath:SHARESDKDEMO_IMAGE_LOCALPATH]
                                     title:nil
                                      type:SSDKContentTypeFile];
    
    [self shareByActivityWithParameters:parameters];
}

- (void)shareWithCustom{
    MOBCustomeShareVC *vc = [[MOBCustomeShareVC alloc]init];
    vc.platformType = self.platformType;
    [[MOBFViewController currentViewController].navigationController pushViewController:vc animated:YES];
}
@end
