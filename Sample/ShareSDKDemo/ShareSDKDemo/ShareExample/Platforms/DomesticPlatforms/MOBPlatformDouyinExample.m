//
//  MOBPlatformDouyinExample.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/20.
//  Copyright © 2019 mob. All rights reserved.
//  文档地址:https://www.mob.com/wiki/detailed?wiki=ShareSDK_chanpinjianjie&id=14

#import "MOBPlatformDouyinExample.h"
#import <Photos/Photos.h>
@implementation MOBPlatformDouyinExample
+ (SSDKPlatformType)platformType{
    return SSDKPlatformTypeDouyin;
}
- (void)setup{
    SSDKWEAK
    [self addListItemWithImage:MOBMutiImageShareIcon name:@"多相册图片" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareMulPhotos];
    }];
    [self addListItemWithImage:MOBVideoShareIcon name:@"多相册视频" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareMulVideos];
    }];
    
    [self addListItemWithImage:MOBMutiImageShareIcon name:@"分享图片到抖音IM" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareImageToIM];
    }];
    [self addListItemWithImage:MOBMutiImageShareIcon name:@"分享相册图片到抖音IM" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self sharePhotoLibiaryImageToIM];
    }];
    
    [self addListItemWithImage:MOBLinkShareIcon name:@"分享链接到抖音IM" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareLinkToIM];
    }];
    
}

- (void)shareImage
{
    // 通用参数设置----图片分享可以使用相册地址、沙盒路径、网络图片地址
    
    NSString *path = SHARESDKDEMO_IMAGE_LOCALPATH;
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:nil
                                    images:SHARESDKDEMO_IMAGE_STRING
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    [self shareWithParameters:parameters];
}

- (void)shareImageToIM
{
    // 通用参数设置----图片分享可以使用相册地址、沙盒路径、网络图片地址
    
    NSString *path = SHARESDKDEMO_IMAGE_LOCALPATH;
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:nil
                                    images:SHARESDKDEMO_IMAGE_STRING
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    //分享给抖音好友/群还是发布到抖音（注：目前分享到IM只支持传入一个图片，传入多图会变成发布，分享IM只支持图片或链接，不支持视频)
    [parameters setValue:@(SSDKDouyinOpenSDKShareTypeShareContentToIM) forKey:SSDKDouYinShareActionKey];
    [self shareWithParameters:parameters];
}

- (void)shareMutiImage
{
    // 通用参数设置----图片分享可以使用相册地址、沙盒路径、网络图片地址
    
    NSString *path = SHARESDKDEMO_IMAGE_LOCALPATH;
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:nil
                                    images:@[path,path]
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    [self shareWithParameters:parameters];
}

- (void)shareMulPhotos
{
    // 平台定制----只能使用相册且使用相册标识localIdentifier
    __weak typeof(self) weakSelf = self;
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [SSDKImagePickerController initWithNavgationControllerConfigureBlock:^(SSDKImagePickerConfigure * _Nonnull configure) {
        configure.openSmartAlbumUserLibrary = YES;
        configure.mediaType = SSDKImagePickerMediaTypeImage;
        configure.operationConfigure.minimumNumberOfVideoSelection = 1;
        configure.operationConfigure.maximumNumberOfVideoSelection = 12;
    } result:^(SSDKImagePickerCompleteStatus status, SSDKImagePickerResult * _Nullable result) {
        if (status == SSDKImagePickerCompleteStatusCancel) {
            
        }else{
            NSMutableArray *strArr = [NSMutableArray array];
            for (PHAsset *asset in result.selectedElements) {
                [strArr addObject:asset.localIdentifier];
            }
            [parameters SSDKSetupDouyinParamesByAssetLocalIds:strArr
                                                      hashtag:@"ShareSDK"
                                                    extraInfo:nil
                                              shareActionMode:SSDKDouyinOpenSDKShareTypePublishMedia
                                                         type:SSDKContentTypeImage];
            [weakSelf shareWithParameters:parameters];
        }
    }].presentAnimated();
    
}

- (void)sharePhotoLibiaryImageToIM
{
    // 平台定制----只能使用相册且使用相册标识localIdentifier
    __weak typeof(self) weakSelf = self;
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [SSDKImagePickerController initWithNavgationControllerConfigureBlock:^(SSDKImagePickerConfigure * _Nonnull configure) {
        configure.openSmartAlbumUserLibrary = YES;
        configure.mediaType = SSDKImagePickerMediaTypeImage;
        configure.operationConfigure.minimumNumberOfImageSelection = 1;
        configure.operationConfigure.maximumNumberOfImageSelection = 1;
    } result:^(SSDKImagePickerCompleteStatus status, SSDKImagePickerResult * _Nullable result) {
        if (status == SSDKImagePickerCompleteStatusCancel) {
            
        }else{
            NSMutableArray *strArr = [NSMutableArray array];
            for (PHAsset *asset in result.selectedElements) {
                [strArr addObject:asset.localIdentifier];
            }
            [parameters SSDKSetupDouyinParamesByAssetLocalIds:strArr
                                                      hashtag:@"ShareSDK"
                                                    extraInfo:nil
                                              shareActionMode:SSDKDouyinOpenSDKShareTypeShareContentToIM
                                                         type:SSDKContentTypeImage];
            [weakSelf shareWithParameters:parameters];
        }
    }].presentAnimated();
    
}

- (void)shareVideo
{
    // 通用参数设置----视频分享可以使用相册地址、沙盒路径，不支持网络视频，如果使用网络视频请先下载放到沙盒目录下或相册里
    NSString *videoPath = [[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:nil
                                    images:nil
                                       url:[NSURL URLWithString:videoPath]
                                     title:nil
                                      type:SSDKContentTypeVideo];
    [self shareWithParameters:parameters];
}

- (void)shareMulVideos
{
    // 平台定制----只能使用相册且使用相册标识localIdentifier
    __weak typeof(self) weakSelf = self;
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [SSDKImagePickerController initWithNavgationControllerConfigureBlock:^(SSDKImagePickerConfigure * _Nonnull configure) {
        configure.openSmartAlbumUserLibrary = YES;
        configure.mediaType = SSDKImagePickerMediaTypeVideo;
        configure.operationConfigure.minimumNumberOfVideoSelection = 1;
        configure.operationConfigure.maximumNumberOfVideoSelection = 12;
    } result:^(SSDKImagePickerCompleteStatus status, SSDKImagePickerResult * _Nullable result) {
        if (status == SSDKImagePickerCompleteStatusCancel) {
            
        }else{
            NSMutableArray *strArr = [NSMutableArray array];
            for (PHAsset *asset in result.selectedElements) {
                [strArr addObject:asset.localIdentifier];
            }
            [parameters SSDKSetupDouyinParamesByAssetLocalIds:strArr
                                                      hashtag:@"ShareSDK"
                                                    extraInfo:nil
                                              shareActionMode:SSDKDouyinOpenSDKShareTypePublishMedia
                                                         type:SSDKContentTypeVideo];
            [weakSelf shareWithParameters:parameters];
        }
    }].presentAnimated();
}

- (void)shareLinkToIM{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:@"Share Desc"
                                    images:SHARESDKDEMO_IMAGE_STRING
                                       url:[NSURL URLWithString:@"https://www.mob.com"]
                                     title:@"ShareSDK Title"
                                      type:SSDKContentTypeWebPage];
    [self shareWithParameters:parameters];
}

@end
