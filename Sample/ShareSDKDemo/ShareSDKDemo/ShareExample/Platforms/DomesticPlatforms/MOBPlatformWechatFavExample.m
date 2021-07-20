//
//  MOBPlatformWechatExample.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/19.
//  Copyright © 2019 mob. All rights reserved.
//  文档地址:https://www.mob.com/wiki/detailed?wiki=ShareSDK_chanpinjianjie&id=14

#import "MOBPlatformWechatFavExample.h"
#import "SSDKImagePicker.h"
#import "MOBCustomeShareVC.h"
#import <MOBFoundation/MOBFoundation.h>
@implementation MOBPlatformWechatFavExample



+ (SSDKPlatformType)platformType{
    return SSDKPlatformSubTypeWechatFav;
}

- (void)setup{
    SSDKWEAK
    [self addListItemWithImage:MOBImageShareIcon name:@"相册图片" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareAssetImage];
    }];
    
    [self addListItemWithImage:MOBApplicationShareIcon name:@"系统分享-图片（单图）" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareImageBySystem];
    }];
    [self addListItemWithImage:MOBApplicationShareIcon name:@"系统分享-本地视频" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareVideoBySystem];
    }];
    [self addListItemWithImage:MOBApplicationShareIcon name:@"系统分享-链接" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareLinkBySystem];
    }];
    [self addListItemWithImage:MOBApplicationShareIcon name:@"系统分享-相册图片（单图）" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
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

- (void)shareText{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:nil
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeText];
    //平台定制
    //    [parameters SSDKSetupWeChatParamsByText:@"Share SDK"
    //                                      title:nil
    //                                        url:nil
    //                                 thumbImage:nil
    //                                      image:nil
    //                               musicFileURL:nil
    //                                    extInfo:nil
    //                                   fileData:nil
    //                               emoticonData:nil
    //                        sourceFileExtension:nil
    //                             sourceFileData:nil
    //                                       type:SSDKContentTypeText
    //                         forPlatformSubType:SSDKPlatformSubTypeWechatFav];
    
    [self shareWithParameters:parameters];
}

- (void)shareImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:SHARESDKDEMO_IMAGE_LOCALPATH
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    [self shareWithParameters:parameters];
}

- (void)shareAssetImage
{
    [SSDKImagePickerController initWithNavgationControllerConfigureBlock:^(SSDKImagePickerConfigure * _Nonnull configure) {
        configure.mediaType = SSDKImagePickerMediaTypeImage;
        configure.operationConfigure.maximumNumberOfImageSelection =1;
        configure.operationConfigure.minimumNumberOfImageSelection =1;
    } result:^(SSDKImagePickerCompleteStatus status, SSDKImagePickerResult * _Nullable result) {
        if (status == SSDKImagePickerCompleteStatusCancel) return;
        PHAsset *asset = result.selectedElements.firstObject;
        PHImageRequestOptions *options = [PHImageRequestOptions new];
        options.networkAccessAllowed = YES;
        [[PHImageManager defaultManager] requestImageDataForAsset:asset options:options resultHandler:^(NSData * _Nullable imageData, NSString * _Nullable dataUTI, UIImageOrientation orientation, NSDictionary * _Nullable info) {
            if (![info[@"PHImageResultIsDegradedKey"] boolValue]) {
                SSDKImage *image = [SSDKImage imageWithObject:imageData];
                NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
                //通用参数设置
                [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                                images:image.URL
                                                   url:nil
                                                 title:nil
                                                  type:SSDKContentTypeImage];
                [self shareWithParameters:parameters];
            }
        }];
        
    }].presentAnimated();
    //    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //    //通用参数设置
    //    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
    //                                    images:SHARESDKDEMO_IMAGE_LOCALPATH
    //                                       url:nil
    //                                     title:nil
    //                                      type:SSDKContentTypeImage];
    //    //平台定制
    //    //        [parameters SSDKSetupWeChatParamsByText:@"Share SDK"
    //    //                                          title:nil
    //    //                                            url:nil
    //    //                                     thumbImage:nil
    //    //                                          image:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
    //    //                                   musicFileURL:nil
    //    //                                        extInfo:nil
    //    //                                       fileData:nil
    //    //                                   emoticonData:nil
    //    //                            sourceFileExtension:nil
    //    //                                 sourceFileData:nil
    //    //                                           type:SSDKContentTypeImage
    //    //                             forPlatformSubType:SSDKPlatformSubTypeWechatFav];
    //
    //   [self shareWithParameters:parameters];
}

- (void)shareLink
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:SHARESDKDEMO_IMAGE_LOCALPATH
                                       url:[NSURL URLWithString:SHARESDKDEMO_URLSTRING]
                                     title:SHARESDKDEMO_TITLE
                                      type:SSDKContentTypeWebPage];
    //平台定制
    //        [parameters SSDKSetupWeChatParamsByText:@"Share SDK Link Desc"
    //                                          title:@"Share SDK"
    //                                            url:[NSURL URLWithString:@"https://www.mob.com"]
    //                                     thumbImage:nil
    //                                          image:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
    //                                   musicFileURL:nil
    //                                        extInfo:nil
    //                                       fileData:nil
    //                                   emoticonData:nil
    //                            sourceFileExtension:nil
    //                                 sourceFileData:nil
    //                                           type:SSDKContentTypeWebPage
    //                             forPlatformSubType:SSDKPlatformSubTypeWechatFav];
    
    [self shareWithParameters:parameters];
}

- (void)shareAudio
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:@"Vitas"
                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:[NSURL URLWithString:@"http://music.163.com/#/song?id=19674655"]
                                     title:@"第七元素"
                                      type:SSDKContentTypeAudio];
    //平台定制
    //    [parameters SSDKSetupWeChatParamsByText:@"崔健"
    //                                      title:@"一无所有"
    //                                        url:[NSURL URLWithString:@"https://www.mob.com"]
    //                                 thumbImage:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
    //                                      image:nil
    //                               musicFileURL:[NSURL URLWithString:@"http://stream20.qqmusic.qq.com/32464723.mp3"]
    //                                    extInfo:nil
    //                                   fileData:nil
    //                               emoticonData:nil
    //                        sourceFileExtension:nil
    //                             sourceFileData:nil
    //                                       type:SSDKContentTypeAudio
    //                         forPlatformSubType:SSDKPlatformSubTypeWechatFav];
    [self shareWithParameters:parameters];
}

- (void)shareVideo
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //网络视频
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:SHARESDKDEMO_IMAGE_LOCALPATH
                                       url:[NSURL URLWithString:SHARESDKDEMO_VIDEO_AD_STRING]
                                     title:SHARESDKDEMO_TITLE
                                      type:SSDKContentTypeVideo];
    //平台定制
    //        [parameters SSDKSetupWeChatParamsByText:@"视频"
    //                                          title:@"乔布斯"
    //                                            url:[NSURL URLWithString:@"http://v.youku.com/v_show/id_XNTUxNDY1NDY4.html"]
    //                                     thumbImage:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
    //                                          image:nil
    //                                   musicFileURL:nil
    //                                        extInfo:nil
    //                                       fileData:nil
    //                                   emoticonData:nil
    //                            sourceFileExtension:nil
    //                                 sourceFileData:nil
    //                                           type:SSDKContentTypeVideo
    //                             forPlatformSubType:SSDKPlatformSubTypeWechatFav];
    [self shareWithParameters:parameters];
}

- (void)shareFile
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //平台定制
    [parameters SSDKSetupWeChatParamsByText:@"share SDK"
                                      title:@"file"
                                        url:nil
                                 thumbImage:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                      image:nil
                               musicFileURL:nil
                                    extInfo:nil
                                   fileData:nil
                               emoticonData:nil
                        sourceFileExtension:@"mp4"
                             sourceFileData:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]
                                       type:SSDKContentTypeFile
                         forPlatformSubType:SSDKPlatformSubTypeWechatFav];
    
    [self shareWithParameters:parameters];
}

#pragma mark - 系统分享

- (void)shareImageBySystem
{
    //系统分享图片（单图/多图，注：该平台不支持图文分享）
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

- (void)shareLinkBySystem{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //平台定制
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:nil
                                       url:[NSURL URLWithString:@"https://tech.diary.support.mob.com/sharesdk/demo/index.html"]
                                     title:@"Share SDK"
                                      type:SSDKContentTypeWebPage];

    [self shareByActivityWithParameters:parameters];
}

- (void)shareVideoBySystem{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"];
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
