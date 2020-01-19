//
//  MOBPlatformFacebookExample.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/19.
//  Copyright © 2019 mob. All rights reserved.
//  文档地址 : https://www.mob.com/wiki/detailed?wiki=ShareSDK_chanpinjianjie&id=14

#import "MOBPlatformFacebookExample.h"
#import <AssetsLibrary/AssetsLibrary.h>


@implementation MOBPlatformFacebookExample


- (void)setup{
    //
    [self setAuthSetting:@{@"isBrowser":@(YES)}];
    SSDKWEAK
    [self addListItemWithImage:MOBVideoShareIcon name:@"视频与图片" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareVideoImage];
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
                                    shareType:SSDKFacebookShareTypeShareSheet
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
//    [parameters SSDKSetupShareParamsByText:@"Share SDK Link Desc"
//                                    images:nil
//                                       url:[NSURL URLWithString:@"http://m.93lj.com/facebook/bigcard/"]
//                                     title:@"Share SDK"
//                                      type:SSDKContentTypeWebPage];
    //平台定制
        [parameters SSDKSetupFacebookParamsByText:@"Share SDK Link Desc"
                                            image:nil
                                              url:[NSURL URLWithString:@"http://tech.diary.support.mob.com/sharesdk/demo/index.html"]
                                         urlTitle:@"Share SDK"
                                          urlName:nil
                                   attachementUrl:nil
                                          hashtag:@"#MobData"
                                            quote:@"Mob官网 - 全球领先的移动开发者服务平台"
                                        shareType:SSDKFacebookShareTypeShareSheet
                                             type:SSDKContentTypeWebPage];
    
    [self shareWithParameters:parameters];
}


- (void)shareTextImage{
    [self shareMutiImage];
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
                                    shareType:SSDKFacebookShareTypeShareSheet
                                         type:SSDKContentTypeImage];

    [self shareWithParameters:parameters];
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
                                         shareType:SSDKFacebookShareTypeShareSheet
                                              type:SSDKContentTypeVideo];
//
        [weakSelf shareWithParameters:parameters];
    }];
    
}

//SSDKContentTypeAuto会默认将url视作视频，在有图片与视频时可以支持混合分享，只支持shareSheet类型，不支持Navtive类型，所以即使你设置Navtive也会显示为ShareSheet样式，没有视频时有图片时会按图片分享处理，有视频没图片时会当做视频分享处理，图片或者视频分享可以支持ShareSheet和Navtive类型
- (void)shareVideoImage{
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
                                                  type:SSDKContentTypeAuto];
    //
            [weakSelf shareWithParameters:parameters];
        }];
}

+ (SSDKPlatformType)platformType{
    return SSDKPlatformTypeFacebook;
}
@end
