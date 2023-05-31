//
//  MOBPlatformSinaExample.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/19.
//  Copyright © 2019 mob. All rights reserved.
//  文档地址:https://www.mob.com/wiki/detailed?wiki=ShareSDK_chanpinjianjie&id=14

#import "MOBPlatformSinaExample.h"
#import "MOBCustomeShareVC.h"
#import <MOBFoundation/MOBFoundation.h>
@implementation MOBPlatformSinaExample


+ (SSDKPlatformType)platformType{
    return SSDKPlatformTypeSinaWeibo;
}

- (void)setup{
    SSDKWEAK
    
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

- (void)shareText
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:nil
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeText];
    //平台定制
//    [parameters SSDKSetupSinaWeiboShareParamsByText:@"Share SDK"
//                                              title:nil
//                                             images:nil
//                                              video:nil
//                                                url:nil
//                                           latitude:0
//                                          longitude:0
//                                           objectID:0
//                                     isShareToStory:false
//                                               type:SSDKContentTypeText];
    [self shareWithParameters:parameters];
}

- (void)shareImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:@[SHARESDKDEMO_IMAGE_STRING]
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    //平台定制
//    [parameters SSDKSetupSinaWeiboShareParamsByText:@"Share SDK"
//                                              title:nil
//                                             images:@[[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
//                                                      ]
//                                              video:nil
//                                                url:nil
//                                           latitude:0 longitude:0
//                                           objectID:nil
//                                     isShareToStory:NO
//                                               type:SSDKContentTypeImage];
    [self shareWithParameters:parameters];
}

- (void)shareTextImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:@[SHARESDKDEMO_IMAGE_STRING]
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    //平台定制
//    [parameters SSDKSetupSinaWeiboShareParamsByText:@"Share SDK"
//                                              title:nil
//                                             images:@[[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
//                                                      ]
//                                              video:nil
//                                                url:nil
//                                           latitude:0 longitude:0
//                                           objectID:nil
//                                     isShareToStory:NO
//                                               type:SSDKContentTypeImage];
    [self shareWithParameters:parameters];
}

- (void)shareMutiImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:@[@"http://www.mob.com/assets/images/ShareSDK_pic_1-09d293a6.png",SHARESDKDEMO_IMAGE_LOCALPATH]
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    //平台定制
    //    [parameters SSDKSetupSinaWeiboShareParamsByText:@"Share SDK"
    //                                              title:nil
    //                                             images:@[[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
    //                                                      ,[[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"]
    //                                                      ]
    //                                              video:nil
    //                                                url:nil
    //                                           latitude:0 longitude:0
    //                                           objectID:nil
    //                                     isShareToStory:NO
    //                                               type:SSDKContentTypeImage];
    [self shareWithParameters:parameters];
}

- (void)shareLink
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:SHARESDKDEMO_IMAGE_LOCALPATH
                                       url:[NSURL URLWithString:SHARESDKDEMO_URLSTRING]
                                     title:SHARESDKDEMO_TITLE
                                      type:SSDKContentTypeWebPage];
    
    [self shareWithParameters:parameters];
}


- (void)shareVideo
{
    NSString *videoPath = [[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"];

    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupSinaWeiboShareParamsByText:@"ShareSDK"
                                              title:nil
                                             images:nil
                                              video:videoPath
                                                url:nil
                                           latitude:0
                                          longitude:0
                                           objectID:nil
                                     isShareToStory:NO
                                               type:SSDKContentTypeVideo];

    [self shareWithParameters:parameters];
}

#pragma mark - 系统分享

- (void)shareImageBySystem
{
    //系统分享图片（单图,不支持多图）
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
    //系统分享相册图片（单图,不支持多图）
    [SSDKImagePickerController initWithNavgationControllerConfigureBlock:^(SSDKImagePickerConfigure * _Nonnull configure) {
        configure.openSmartAlbumUserLibrary = YES;
        configure.mediaType = SSDKImagePickerMediaTypeImage;
        configure.operationConfigure.minimumNumberOfImageSelection = 1;
        configure.operationConfigure.maximumNumberOfImageSelection = 1;
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
