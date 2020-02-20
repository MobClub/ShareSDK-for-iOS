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
    __block NSMutableArray *assetLocalIds = [NSMutableArray array];
    __weak typeof(self) weakSelf = self;
    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
        UIImage *image1 = [UIImage imageWithContentsOfFile:SHARESDKDEMO_IMAGE_LOCALPATH];
        UIImage *image2 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"D11" ofType:@"jpg"]];
        //        UIImage *image3 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"shareImg" ofType:@"png"]];
        //        UIImage *image4 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"]];
        
        PHAssetChangeRequest *req_1 = [PHAssetChangeRequest creationRequestForAssetFromImage:image1];
        NSString *localId_1 = req_1.placeholderForCreatedAsset.localIdentifier;
        [assetLocalIds addObject:localId_1];
        
        PHAssetChangeRequest *req_2 = [PHAssetChangeRequest creationRequestForAssetFromImage:image2];
        NSString *localId_2 = req_2.placeholderForCreatedAsset.localIdentifier;
        [assetLocalIds addObject:localId_2];
    } completionHandler:^(BOOL success, NSError * _Nullable error) {
        if (success) {
            dispatch_async(dispatch_get_main_queue(), ^{
                NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
                [parameters SSDKSetupOasisParamsByTitle:@"ShareSDK" text:@"为开发者提供40+主流平台的分享与授权等社会化功能，效果稳定，完整清晰统计分享数据" assetLocalIds:assetLocalIds image:nil video:nil fileExtension:nil type:SSDKContentTypeImage];
                [weakSelf shareWithParameters:parameters];
            });
        }
    }];
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
    __block NSMutableArray *assetLocalIds = [NSMutableArray array];
    __weak typeof(self) weakSelf = self;
    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
        
        NSURL *url_1 = [[NSBundle mainBundle] URLForResource:@"cat" withExtension:@"mp4"];
        NSURL *url_2 = [[NSBundle mainBundle] URLForResource:@"cat" withExtension:@"mp4"];
        
        PHAssetChangeRequest *req_1 = [PHAssetChangeRequest creationRequestForAssetFromVideoAtFileURL:url_1];
        NSString *localId_1 = req_1.placeholderForCreatedAsset.localIdentifier;
        [assetLocalIds addObject:localId_1];
        
        PHAssetChangeRequest *req_2 = [PHAssetChangeRequest creationRequestForAssetFromVideoAtFileURL:url_2];
        NSString *localId_2 = req_2.placeholderForCreatedAsset.localIdentifier;
        [assetLocalIds addObject:localId_2];
        
    } completionHandler:^(BOOL success, NSError * _Nullable error) {
        if (success) {
            dispatch_async(dispatch_get_main_queue(), ^{
                NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
                [parameters SSDKSetupOasisParamsByTitle:@"ShareSDK" text:@"为开发者提供40+主流平台的分享与授权等社会化功能，效果稳定，完整清晰统计分享数据" assetLocalIds:assetLocalIds image:nil video:nil fileExtension:nil type:SSDKContentTypeVideo];
                [weakSelf shareWithParameters:parameters];
            });
        }else{
            UIAlertControllerAlertCreate(@"", [NSString stringWithFormat:@"%@",error])
            .addCancelAction(@"OK")
            .present();
        }
    }];
}

+ (SSDKPlatformType)platformType{
    return SSDKPlatformTypeOasis;
}
@end
