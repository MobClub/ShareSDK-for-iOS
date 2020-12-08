//
//  MOBPlatformKakaoStoryExample.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/20.
//  Copyright © 2019 mob. All rights reserved.
//  文档地址:https://www.mob.com/wiki/detailed?wiki=ShareSDK_chanpinjianjie&id=14

#import "MOBPlatformKakaoStoryExample.h"
#import <KakaoOpenSDK/KakaoOpenSDK.h>
@implementation MOBPlatformKakaoStoryExample

+ (SSDKPlatformType)platformType{
    return SSDKPlatformSubTypeKakaoStory;
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
}

/**
 分享文字
 */
- (void)shareText
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupKakaoStoryParamsByContent:SHARESDKDEMO_TEXT
                                             title:nil
                                            images:nil
                                               url:nil
                                        permission:1
                                          sharable:YES
                                  androidExecParam:nil
                                      iosExecParam:nil
                                              type:SSDKContentTypeText
     ];
    
    
    [self shareWithParameters:parameters];
}

/**
 分享单图
 */
- (void)shareImage
{
    
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    
    [parameters SSDKSetupKakaoStoryParamsByContent:@""
                                             title:nil
                                            images:@[[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]]
                                               url:nil
                                        permission:0
                                          sharable:YES
                                  androidExecParam:@{@"andParam1":@"value1", @"andParam2":@"value2"}
                                      iosExecParam:@{@"iosParam1":@"value1", @"iosParam2":@"value2"}
                                              type:SSDKContentTypeImage
     ];
    
    [self shareWithParameters:parameters];
}

/**
 分享多图
 */
- (void)shareMutiImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    
    [parameters SSDKSetupKakaoStoryParamsByContent:@""
                                             title:nil
                                            images:@[[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"],[[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"]]
                                               url:nil
                                        permission:0
                                          sharable:YES
                                  androidExecParam:@{@"andParam1":@"value1", @"andParam2":@"value2"}
                                      iosExecParam:@{@"iosParam1":@"value1", @"iosParam2":@"value2"}
                                              type:SSDKContentTypeImage
     ];
    
    [self shareWithParameters:parameters];
}

- (void)shareLink
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
//    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
//                                    images:@[SHARESDKDEMO_IMAGE_STRING]
//                                       url:nil
//                                     title:SHARESDKDEMO_TITLE
//                                      type:SSDKContentTypeWebPage];
    
    //平台定制
        [parameters SSDKSetupKaKaoParamsByText:@"Share SDK"
                                        images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                         title:@"Share SDK"
                                           url:[NSURL URLWithString:@"https://www.qq.com"]
                                    permission:nil
                                   enableShare:YES
                                     imageSize:CGSizeZero
                                appButtonTitle:nil
                              androidExecParam:nil
                              androidMarkParam:nil
                              iphoneExecParams:nil
                               iphoneMarkParam:nil
                                ipadExecParams:nil
                                 ipadMarkParam:nil
                                          type:SSDKContentTypeWebPage
                            forPlatformSubType:self.platformType];
    
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

//注：此方法不能传text，如果传text，会变成分享文字的样式
- (void)shareLinkBySystem
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:nil
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
@end
