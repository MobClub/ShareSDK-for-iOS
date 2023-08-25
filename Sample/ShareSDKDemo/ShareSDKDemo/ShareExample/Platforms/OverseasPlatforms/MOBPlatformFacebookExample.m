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
#import "MOBCustomeShareVC.h"
#import <MOBFoundation/MOBFoundation.h>
@implementation MOBPlatformFacebookExample

+ (SSDKPlatformType)platformType{
    return SSDKPlatformTypeFacebook;
}
- (void)setup{
    [self setAuthSetting:@{@"isBrowser":@(YES),@"mode":@(SSDKFBSDKProfilePictureModeNormal),@"size":@(CGSizeMake(600, 600))}];
    SSDKWEAK
    [self addListItemWithImage:MOBApplicationShareIcon name:@"多相册图片" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareAssetImage];
    }];
    [self addListItemWithImage:MOBApplicationShareIcon name:@"单相册视频" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareAssetsVideo];
    }];
//    [self addListItemWithImage:MOBApplicationShareIcon name:@"视频与图片" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
//        SSDKSTRONG
//        [self shareVideoImage];
//    }];
    [self addListItemWithImage:MOBApplicationShareIcon name:@"系统分享-文字" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareTextBySystem];
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
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
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
        
        //平台定制
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
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (status == SSDKImagePickerCompleteStatusCancel) {
            
        }else{
            NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
            [parameters SSDKSetupFacebookParamsByImagePHAsset:nil videoPHAsset:result.selectedElements.lastObject];
            [self shareWithParameters:parameters];
        }
        });

    }].presentAnimated();
    
}

////SSDKContentTypeAuto会默认将url视作视频，在有图片与视频时可以支持混合分享，只支持shareSheet类型，不支持Navtive类型，所以即使你设置Navtive也会显示为ShareSheet样式，没有视频时有图片时会按图片分享处理，有视频没图片时会当做视频分享处理，图片或者视频分享可以支持ShareSheet和Navtive类型
//- (void)shareVideoImage{
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"];
//    NSURL *url = [NSURL fileURLWithPath:path];
//    ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
//    __weak __typeof__ (self) weakSelf = self;
//
//    [assetsLibrary writeVideoAtPathToSavedPhotosAlbum:url completionBlock:^(NSURL *assetURL, NSError *error) {
//        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
//
//        NSString *path1 = [[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"];
//        NSString *path2 = [[NSBundle mainBundle] pathForResource:@"D11" ofType:@"jpg"];
//        NSString *path3 = [[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"];
//        NSString *path4 = [[NSBundle mainBundle] pathForResource:@"shareImg" ofType:@"png"];
//
//        //平台定制
//        [parameters SSDKSetupFacebookParamsByText:nil
//                                            image:@[path1,path2,path3,path4]
//                                              url:assetURL
//                                         urlTitle:nil
//                                          urlName:nil
//                                   attachementUrl:nil
//                                          hashtag:@"MobData"
//                                            quote:nil
//                                        shareType:SSDKFacebookShareTypeShareSheet
//                                             type:SSDKContentTypeAuto];
//        //
//        [weakSelf shareWithParameters:parameters];
//    }];
//}


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
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (status == SSDKImagePickerCompleteStatusCancel) {
            
        }else{
            //分享参数为PHAsset数组
            [parameters SSDKSetupShareParamsByImageAsset:nil videoAsset:result.selectedElements.firstObject completeHandle:^(BOOL complete) {
                if(complete){
                    [self shareByActivityWithParameters:parameters];
                }
            }];
        }
        });

    }].presentAnimated();
}

- (void)shareWithCustom{
    MOBCustomeShareVC *vc = [[MOBCustomeShareVC alloc]init];
    vc.platformType = self.platformType;
    [[MOBFViewController currentViewController].navigationController pushViewController:vc animated:YES];
}

@end
