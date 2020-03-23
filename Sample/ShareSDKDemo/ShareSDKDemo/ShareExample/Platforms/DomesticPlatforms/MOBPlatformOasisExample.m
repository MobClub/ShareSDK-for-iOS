//
//  MOBPlatformOasisExample.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/24.
//  Copyright © 2019 mob. All rights reserved.
//

#import "MOBPlatformOasisExample.h"
#import <Photos/Photos.h>
@implementation MOBPlatformOasisExample

- (void)setup{
    SSDKWEAK
    [self addListItemWithImage:MOBImageShareIcon name:@"相册图片" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareAssetImage];
    }];
    [self addListItemWithImage:MOBVideoShareIcon name:@"相册视频" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
       SSDKSTRONG
        [self shareAssetVideo];
    }];
    
}

- (void)shareImage{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupOasisParamsByTitle:@"SHARESDK"
                                        text:@"为开发者提供40+主流平台的分享与授权等社会化功能，效果稳定，完整清晰统计分享数据"
                               assetLocalIds:nil
                                      image:[UIImage imageWithContentsOfFile:SHARESDKDEMO_IMAGE_LOCALPATH]
                                       video:nil
                               fileExtension:nil
                                        type:SSDKContentTypeImage];
    [self shareWithParameters:parameters];
}

- (void)shareAssetImage{
    
    [SSDKImagePickerController initWithNavgationControllerConfigureBlock:^(SSDKImagePickerConfigure * _Nonnull configure) {
        configure.openSmartAlbumUserLibrary = YES;
        configure.mediaType = SSDKImagePickerMediaTypeImage;
        //视频只能传1个
        configure.operationConfigure.minimumNumberOfImageSelection = 1;
        configure.operationConfigure.maximumNumberOfImageSelection= 12;
    } result:^(SSDKImagePickerCompleteStatus status, SSDKImagePickerResult * _Nullable result) {
        if (status == SSDKImagePickerCompleteStatusCancel) {
            
        }else{
            
            //选择图片后分享
           NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
           [parameters SSDKSetupOasisParamsByTitle:@"ShareSDK" text:@"为开发者提供40+主流平台的分享与授权等社会化功能，效果稳定，完整清晰统计分享数据" assetLocalIds:[result.selectedElements valueForKeyPath:@"localIdentifier"] image:nil video:nil fileExtension:nil type:SSDKContentTypeImage];
           [self shareWithParameters:parameters];
        }
    }].presentAnimated();
}

- (void)shareTextImage{
    [self shareMutiImage];
}

- (void)shareMutiImage{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupOasisParamsByTitle:@"ShareSDK"
                                        text:@"为开发者提供40+主流平台的分享与授权等社会化功能，效果稳定，完整清晰统计分享数据"
                               assetLocalIds:nil
                                       image:@[
                                           [UIImage imageWithContentsOfFile:SHARESDKDEMO_IMAGE_LOCALPATH],
                                           [UIImage imageWithContentsOfFile:SHARESDKDEMO_IMAGE_LOCALPATH]]
                                       video:nil
                               fileExtension:nil
                                        type:SSDKContentTypeImage];
    [self shareWithParameters:parameters];
}

- (void)shareVideo{
    
    NSURL *url_1 = [[NSBundle mainBundle] URLForResource:@"cat" withExtension:@"mp4"];
    NSData *data = [NSData dataWithContentsOfURL:url_1];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupOasisParamsByTitle:@"SHARESDK" text:@"为开发者提供40+主流平台的分享与授权等社会化功能，效果稳定，完整清晰统计分享数据" assetLocalIds:nil image:nil video:data fileExtension:@"mp4" type:SSDKContentTypeVideo];
    [self shareWithParameters:parameters];
}

- (void)shareAssetVideo{
    [SSDKImagePickerController initWithNavgationControllerConfigureBlock:^(SSDKImagePickerConfigure * _Nonnull configure) {
        configure.openSmartAlbumUserLibrary = YES;
        configure.mediaType = SSDKImagePickerMediaTypeVideo;
        //视频只能传1个
        configure.operationConfigure.minimumNumberOfVideoSelection = 1;
        configure.operationConfigure.maximumNumberOfVideoSelection = 1;
    } result:^(SSDKImagePickerCompleteStatus status, SSDKImagePickerResult * _Nullable result) {
        if (status == SSDKImagePickerCompleteStatusCancel) {
            
        }else{
           NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
            [parameters SSDKSetupOasisParamsByTitle:@"ShareSDK" text:@"为开发者提供40+主流平台的分享与授权等社会化功能，效果稳定，完整清晰统计分享数据" assetLocalIds:@[result.selectedElements.firstObject.localIdentifier] image:nil video:nil fileExtension:nil type:SSDKContentTypeVideo];
            [self shareWithParameters:parameters];
        }
    }].presentAnimated();
}

+ (SSDKPlatformType)platformType{
    return SSDKPlatformTypeOasis;
}
@end
