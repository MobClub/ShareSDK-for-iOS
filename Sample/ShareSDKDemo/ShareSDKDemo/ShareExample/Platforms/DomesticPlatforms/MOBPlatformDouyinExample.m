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
    [self addListItemWithImage:MOBVideoShareIcon name:@"多视频" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareMulVideos];
    }];
}

- (void)shareImage
{
    // 通用参数设置----图片分享可以使用相册地址、沙盒路径、网络图片地址
    
    NSString *path = SHARESDKDEMO_IMAGE_LOCALPATH;
    //    UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"shareImg" ofType:@"png"]];
    //    NSString *imageURL = @"http://www.mob.com/assets/images/ShareSDK_pic_1-09d293a6.png";
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //    [parameters SSDKSetupShareParamsByText:nil
    //                                    images:@[path]
    //                                       url:nil
    //                                     title:nil
    //                                      type:SSDKContentTypeImage];
    //    [parameters SSDKSetupShareParamsByText:nil
    //                                    images:@[image]
    //                                       url:nil
    //                                     title:nil
    //                                      type:SSDKContentTypeImage];
    [parameters SSDKSetupShareParamsByText:nil
                                    images:path
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    [self shareWithParameters:parameters];
}

//- (void)shareTextImage{
//    [self shareMutiImage];
//}

- (void)shareMutiImage
{
    // 通用参数设置----图片分享可以使用相册地址、沙盒路径、网络图片地址
    
    NSString *path = SHARESDKDEMO_IMAGE_LOCALPATH;
    //    UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"shareImg" ofType:@"png"]];
    //    NSString *imageURL = @"http://www.mob.com/assets/images/ShareSDK_pic_1-09d293a6.png";
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //    [parameters SSDKSetupShareParamsByText:nil
    //                                    images:@[path]
    //                                       url:nil
    //                                     title:nil
    //                                      type:SSDKContentTypeImage];
    //    [parameters SSDKSetupShareParamsByText:nil
    //                                    images:@[image]
    //                                       url:nil
    //                                     title:nil
    //                                      type:SSDKContentTypeImage];
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
    NSMutableArray *assetLocalIds = [NSMutableArray array];
    __weak typeof(self) weakSelf = self;
    
    // 异步
    //    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
    //
    //        UIImage *image1 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]];
    //        UIImage *image2 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"D11" ofType:@"jpg"]];
    //        UIImage *image3 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"shareImg" ofType:@"png"]];
    //        UIImage *image4 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"]];
    //
    //        PHAssetChangeRequest *req_1 = [PHAssetChangeRequest creationRequestForAssetFromImage:image1];
    //        NSString *localId_1 = req_1.placeholderForCreatedAsset.localIdentifier;
    //        [assetLocalIds addObject:localId_1];
    //
    //        PHAssetChangeRequest *req_2 = [PHAssetChangeRequest creationRequestForAssetFromImage:image2];
    //        NSString *localId_2 = req_2.placeholderForCreatedAsset.localIdentifier;
    //        [assetLocalIds addObject:localId_2];
    //
    //        PHAssetChangeRequest *req_3 = [PHAssetChangeRequest creationRequestForAssetFromImage:image3];
    //        NSString *localId_3 = req_3.placeholderForCreatedAsset.localIdentifier;
    //        [assetLocalIds addObject:localId_3];
    //
    //        PHAssetChangeRequest *req_4 = [PHAssetChangeRequest creationRequestForAssetFromImage:image4];
    //        NSString *localId_4 = req_4.placeholderForCreatedAsset.localIdentifier;
    //        [assetLocalIds addObject:localId_4];
    //
    //    } completionHandler:^(BOOL success, NSError * _Nullable error) {
    //        if (success) {
    //            dispatch_async(dispatch_get_main_queue(), ^{
    //                NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //                [parameters SSDKSetupDouyinParamesByAssetLocalIds:assetLocalIds type:SSDKContentTypeImage];
    //                [weakSelf shareWithParameters:parameters];
    //            });
    //        }
    //    }];
    
    // 同步
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
        if (error) return;
        //
        //        PHAssetChangeRequest *req_3 = [PHAssetChangeRequest creationRequestForAssetFromImage:image3];
        //        NSString *localId_3 = req_3.placeholderForCreatedAsset.localIdentifier;
        //        [assetLocalIds addObject:localId_3];
        //
        //        PHAssetChangeRequest *req_4 = [PHAssetChangeRequest creationRequestForAssetFromImage:image4];
        //        NSString *localId_4 = req_4.placeholderForCreatedAsset.localIdentifier;
        //        [assetLocalIds addObject:localId_4];
        //构造小程序信息
        if (success) {
            NSMutableDictionary *m_map_info = @{}.mutableCopy;
            m_map_info[@"identifier"] = @"1";
            m_map_info[@"title"] = @"2";
            m_map_info[@"desc"] = @"3";
            m_map_info[@"startPageURL"] = @"4";
            NSMutableDictionary *m_product_extra_info = @{}.mutableCopy;
            NSString *styleId = @"5";
            if (styleId > 0) {
                m_product_extra_info[@"styleID"] = styleId;
            }
            m_product_extra_info[@"mpInfo"] = m_map_info;
            m_product_extra_info[@"product_extra_info"] = m_map_info;
            
            NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
            //product_extra_info
            [parameters SSDKSetupDouyinParamesByAssetLocalIds:assetLocalIds
                                                      hashtag:@"ShareSDK"
                                                    extraInfo:m_product_extra_info
                                                         type:SSDKContentTypeImage];
            [weakSelf shareWithParameters:parameters];
        }
    }];
    
    
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
                [parameters SSDKSetupDouyinParamesByAssetLocalIds:assetLocalIds hashtag:nil extraInfo:nil type:SSDKContentTypeVideo];
                [weakSelf shareWithParameters:parameters];
            });
        }
    }];
}


@end
