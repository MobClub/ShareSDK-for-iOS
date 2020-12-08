//
//  MOBPlatformPinterestExample.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/19.
//  Copyright © 2019 mob. All rights reserved.
//  文档地址:https://www.mob.com/wiki/detailed?wiki=ShareSDK_chanpinjianjie&id=14

#import "MOBPlatformPinterestExample.h"

@implementation MOBPlatformPinterestExample
+ (SSDKPlatformType)platformType{
    return SSDKPlatformTypePinterest;
}

- (void)setup{
    SSDKWEAK

    [self addListItemWithImage:MOBApplicationShareIcon name:@"系统分享-图片(单图/多图，本地/网络图片均可)" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareImageBySystem];
    }];
    [self addListItemWithImage:MOBApplicationShareIcon name:@"系统分享-相册图片（单图/多图）" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareAssetImageBySystem];
    }];
}

/**
 分享图片
 */
- (void)shareImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];

    [parameters SSDKSetupPinterestParamsByImage:SHARESDKDEMO_IMAGE_STRING
                                           desc:SHARESDKDEMO_TEXT
                                            url:nil
                                      boardName:@"ShareSDK"];
    [self shareWithParameters:parameters];
    
}
- (void)shareLink
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];

    [parameters SSDKSetupPinterestParamsByImage:SHARESDKDEMO_IMAGE_STRING
                                           desc:SHARESDKDEMO_TEXT
                                            url:[NSURL URLWithString:SHARESDKDEMO_URLSTRING]
                                      boardName:@"ShareSDK"];
    [self shareWithParameters:parameters];
    
}

#pragma mark - 系统分享

- (void)shareImageBySystem
{
    //不支持图文，text传参也不会显示出来
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:nil
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
@end
