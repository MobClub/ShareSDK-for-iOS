//
//  MOBPlatformFacebookExample.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/19.
//  Copyright © 2019 mob. All rights reserved.
//  文档地址 : https://www.mob.com/wiki/detailed?wiki=ShareSDK_chanpinjianjie&id=14

#import "MOBPlatformFacebookExample.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>

@implementation MOBPlatformFacebookExample

+ (SSDKPlatformType)platformType{
    return SSDKPlatformTypeFacebook;
}
- (void)setup{
    //
    [self setAuthSetting:@{@"isBrowser":@(YES)}];
    SSDKWEAK
    [self addListItemWithImage:MOBApplicationShareIcon name:@"相册图片" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareAssetImage];
    }];
    [self addListItemWithImage:MOBApplicationShareIcon name:@"相册视频" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareAssetsVideo];
    }];
    [self addListItemWithImage:MOBApplicationShareIcon name:@"系统分享-文字" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareTextBySystem];
    }];
    [self addListItemWithImage:MOBApplicationShareIcon name:@"系统分享-图片（单图/多图）" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
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
    [self addListItemWithImage:MOBApplicationShareIcon name:@"系统分享-相册图片（单图/多图）" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareAssetImageBySystem];
    }];
    [self addListItemWithImage:MOBApplicationShareIcon name:@"系统分享-相册视频" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareAssetVideoBySystem];
    }];
}

- (void)shareImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //    //通用参数设置
    //    [parameters SSDKSetupShareParamsByText:nil
    //                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
    //                                       url:nil
    //                                     title:nil
    //                                      type:SSDKContentTypeImage];
    //平台定制
    [parameters SSDKSetupFacebookParamsByText:SHARESDKDEMO_TEXT
                                        image:SHARESDKDEMO_IMAGE_LOCALPATH
     //                                        image:UIImageNamed(@"Icon-72.png")
                                          url:nil
                                     urlTitle:nil
                                      urlName:nil
                               attachementUrl:nil
                                      hashtag:nil
                                        quote:nil
                                    shareType:SSDKFacebookShareTypeNative
                                         type:SSDKContentTypeImage];
    [self shareWithParameters:parameters];
}

- (void)shareLink
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    //Facebook分享链接带图片参数已失效,如分享链接时显示卡片效果需在链接中配置meta标签
    //   具体配置请参考Facebook官方文档：https://developers.facebook.com/docs/sharing/webmasters#markup
    //   及工具分享调试器：https://developers.facebook.com/tools/debug/
    //   测试链接大图效果http://m.93lj.com/facebook/bigcard/、小图效果http://m.93lj.com/facebook/smallcard/
    //        [parameters SSDKSetupShareParamsByText:@"Share SDK Link Desc"
    //                                        images:nil
    //                                           url:[NSURL URLWithString:@"http://tech.diary.support.mob.com/sharesdk/demo/index.html"]
    //                                         title:@"Share SDK"
    //                                          type:SSDKContentTypeWebPage];
    //平台定制
    [parameters SSDKSetupFacebookParamsByText:@"Share SDK Link Desc"
                                        image:nil
                                          url:[NSURL URLWithString:@"https://tech.diary.support.mob.com/sharesdk/demo/index.html"]
                                     urlTitle:@"Share SDK"
                                      urlName:nil
                               attachementUrl:nil
                                      hashtag:@"#MobData"
                                        quote:@"Mob官网 - 全球领先的移动开发者服务平台"
                                    shareType:SSDKFacebookShareTypeNative
                                         type:SSDKContentTypeWebPage];
    
//    [parameters SSDKSetupFacebookParamsByText:@"Share SDK Link Desc"
//                                        image:nil
//                                          url:[NSURL URLWithString:@"http://tech.diary.support.mob.com/sharesdk/demo/index.html"]
//                                     urlTitle:@"Share SDK"
//                                      urlName:nil
//                               attachementUrl:nil
//                                      hashtag:@"#MobData"
//                                        quote:@"Mob官网 - 全球领先的移动开发者服务平台"
//                               sortShareTypes:@[
//                                   @(SSDKFacebookShareTypeShareSheet),
//                                   @(SSDKFacebookShareTypeBrowser),
//                                   @(SSDKFacebookShareTypeNative)
//                               ]
//                                         type:SSDKContentTypeWebPage];
    
    [self shareWithParameters:parameters];
}

- (void)shareMutiImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"];
    NSString *path2 = [[NSBundle mainBundle] pathForResource:@"D11" ofType:@"jpg"];
    NSString *path3 = [[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"];
    NSString *path4 = [[NSBundle mainBundle] pathForResource:@"shareImg" ofType:@"png"];
    //通用参数设置
    //    [parameters SSDKSetupShareParamsByText:nil
    //                                    images:@[path1,path2,path3,path4]
    //                                       url:nil
    //                                     title:nil
    //                                      type:SSDKContentTypeImage];
    //平台定制
    [parameters SSDKSetupFacebookParamsByText:@"1231231"
                                        image:@[path1,path2,path3,path4]
                                          url:nil
                                     urlTitle:nil
                                      urlName:nil
                               attachementUrl:nil
                                      hashtag:@"#MOBData"
                                        quote:nil
                                    shareType:SSDKFacebookShareTypeNative
                                         type:SSDKContentTypeImage];
    
    [self shareWithParameters:parameters];
}

//相册图片不可以使用ShareSheet样式，必须要有imageData
- (void)shareAssetImage{
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"];
    NSString *path2 = [[NSBundle mainBundle] pathForResource:@"D11" ofType:@"jpg"];
    NSString *path3 = [[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"];
    NSString *path4 = [[NSBundle mainBundle] pathForResource:@"shareImg" ofType:@"png"];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //    //通用参数设置
    [parameters SSDKSetupShareParamsByText:nil
                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    //    [parameters SSDKSetupFacebookParamsByText:@"1231231"
    //                                            image:@[path1,path2,path3,path4]
    ////                                            image:nil
    //                                              url:nil
    //                                         urlTitle:nil
    //                                          urlName:nil
    //                                   attachementUrl:nil
    //                                          hashtag:@"#MOBData"
    //                                            quote:nil
    //                                        shareType:SSDKFacebookShareTypeNative
    //                                             type:SSDKContentTypeImage];
    [SSDKImagePickerController initWithNavgationControllerConfigureBlock:^(SSDKImagePickerConfigure * _Nonnull configure) {
        configure.openSmartAlbumUserLibrary = YES;
        configure.mediaType = SSDKImagePickerMediaTypeImage;
        configure.operationConfigure.minimumNumberOfImageSelection = 1;
        configure.operationConfigure.maximumNumberOfImageSelection = 29;
    } result:^(SSDKImagePickerCompleteStatus status, SSDKImagePickerResult * _Nullable result) {
        if (status == SSDKImagePickerCompleteStatusCancel) {
            
        }else{
            NSArray *shareAssets = nil;
            
            //分享参数为PHAsset
            shareAssets = result.selectedElements;
            
            //或者PHAsset和localIdentifier混合
            //              shareAssets = result.selectedElements.count > 1?@[result.selectedElements.firstObject,[result.selectedElements.lastObject valueForKeyPath:@"localIdentifier"]]:result.selectedElements;
            
            
            //或者是localIdentifier的数组
            //                shareAssets = [result.selectedElements valueForKeyPath:@"localIdentifier"];
            
            
            [parameters SSDKSetupFacebookParamsByImagePHAsset:shareAssets videoPHAsset:nil];
            [self shareWithParameters:parameters];
        }}].presentAnimated();
}

- (void)shareVideo
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"];
    NSURL *url = [NSURL URLWithString:path];
    ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
    __weak __typeof__ (self) weakSelf = self;
    [assetsLibrary writeVideoAtPathToSavedPhotosAlbum:url completionBlock:^(NSURL *assetURL, NSError *error) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        //        [parameters SSDKSetupShareParamsByText:nil
        //                                        images:nil
        //                                           url:assetURL
        //                                         title:nil
        //                                          type:SSDKContentTypeVideo];
        NSString *path1 = [[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"];
        NSString *path2 = [[NSBundle mainBundle] pathForResource:@"D11" ofType:@"jpg"];
        NSString *path3 = [[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"];
        NSString *path4 = [[NSBundle mainBundle] pathForResource:@"shareImg" ofType:@"png"];
        
        //        //平台定制
        [parameters SSDKSetupFacebookParamsByText:nil
                                            image:@[path1,path2,path3,path4]
                                              url:assetURL
                                         urlTitle:nil
                                          urlName:nil
                                   attachementUrl:nil
                                          hashtag:@"MobData"
                                            quote:nil
                                        shareType:SSDKFacebookShareTypeNative
                                             type:SSDKContentTypeVideo];
        //
        [weakSelf shareWithParameters:parameters];
    }];
    
}

- (void)shareAssetsVideo
{
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
            [parameters SSDKSetupFacebookParamsByText:nil image:nil
                                                  url:nil
                                             urlTitle:nil
                                              urlName:nil
                                       attachementUrl:nil
                                              hashtag:@"MobData"
                                                quote:nil shareType:SSDKFacebookShareTypeNative
                                                 type:SSDKContentTypeVideo];
            [parameters SSDKSetupFacebookParamsByImagePHAsset:nil videoPHAsset:result.selectedElements.firstObject];
            [self shareWithParameters:parameters];
        }
    }].presentAnimated();
    
}

#pragma mark - 系统分享

- (void)shareTextBySystem
{
    //系统分享文字
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:nil
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeText];
    [self shareByActivityWithParameters:parameters];
}

- (void)shareImageBySystem
{
    //系统分享图片（单图/多图，注：该平台不支持图文分享）
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:@[SHARESDKDEMO_IMAGE_LOCALPATH,SHARESDKDEMO_IMAGE_LOCALPATH]
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

@end
