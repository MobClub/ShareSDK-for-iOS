//
//  MOBPlatformTwitterExample.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/19.
//  Copyright © 2019 mob. All rights reserved.
//  文档地址:https://www.mob.com/wiki/detailed?wiki=ShareSDK_chanpinjianjie&id=14

#import "MOBPlatformTwitterExample.h"
#import "MOBLoadingViewController.h"
#import "MOBCustomeShareVC.h"
#import <MOBFoundation/MOBFoundation.h>
@implementation MOBPlatformTwitterExample{
    MOBLoadingViewController *loadingViewController;
}
+ (SSDKPlatformType)platformType{
    return SSDKPlatformTypeTwitter;
}
- (void)setup{
    SSDKWEAK
    [self addListItemWithImage:MOBTextImageShareIcon name:@"图文" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareTextAndImage];
    }];
    [self addListItemWithImage:MOBTextImageShareIcon name:@"系统分享-文字" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareTextBySystem];
    }];
    [self addListItemWithImage:MOBTextImageShareIcon name:@"系统分享-图片（单图/多图）" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareImageBySystem];
    }];
    [self addListItemWithImage:MOBTextImageShareIcon name:@"系统分享-图文" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareTextAndImageBySystem];
    }];
    [self addListItemWithImage:MOBTextImageShareIcon name:@"系统分享-链接" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareLinkBySystem];
    }];
    [self addListItemWithImage:MOBTextImageShareIcon name:@"系统分享-本地视频" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareVideoBySystem];
    }];
    [self addListItemWithImage:MOBMiniProgramShareIcon name:@"自定义参数分享" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        [weakSelf shareWithCustom];
    }];
    loadingViewController = [[MOBLoadingViewController alloc] initWithNibName:@"MOBLoadingViewController" bundle:nil];
    loadingViewController.view.frame = [SSDKScenePackage mainBounds];
    [self setAuthSetting:@{@"scopes":@"read"}];
}


/**
 分享文字
 */
-(void)shareText
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
     NSInteger tmpInt = [MOBFNumber randomInteger:100000];
    NSString *txt = [NSString stringWithFormat:@"%@_%ld",SHARESDKDEMO_TEXT,tmpInt];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:txt
                                    images:nil
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeText];
    //平台定制
    //    [parameters SSDKSetupTwitterParamsByText:@"Share SDK"
    //                                      images:nil
    //                                    latitude:0
    //                                   longitude:0
    //                                        type:SSDKContentTypeText];
    [self shareWithParameters:parameters];
}

/**
 分享图文
 */
- (void)shareTextAndImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //图片最多4张 GIF只能1张
    NSString *path1 = SHARESDKDEMO_IMAGE_LOCALPATH;
    //文本,避免报重复错误
    NSInteger tmpInt = [MOBFNumber randomInteger:100000];
    NSString *txt = [NSString stringWithFormat:@"%@_%ld",SHARESDKDEMO_TEXT,tmpInt];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:txt
                                    images:@[path1]
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    [self shareWithParameters:parameters];
}

/**
 分享单图
 */
- (void)shareImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //图片最多4张 GIF只能1张
    NSString *path1 = SHARESDKDEMO_IMAGE_LOCALPATH;
    //文本,避免报重复错误
    NSInteger tmpInt = [MOBFNumber randomInteger:100000];
    NSString *txt = [NSString stringWithFormat:@"%@_%ld",@"Share SDK",tmpInt];
    //通用参数设置
//    [parameters SSDKSetupShareParamsByText:nil
//                                    images:@[path1]
//                                       url:nil
//                                     title:nil
//                                      type:SSDKContentTypeImage];
    //平台定制
            [parameters SSDKSetupTwitterParamsByText:txt
                                              images:@[path1]
                                            latitude:113.27599
                                           longitude:23.11705
                                                type:SSDKContentTypeImage];
    [self shareWithParameters:parameters];
}

/**
 分享多图
 */
- (void)shareMutiImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //图片最多4张 GIF只能1张
    NSString *path1 = SHARESDKDEMO_IMAGE_LOCALPATH;
    NSString *path2 = [[NSBundle mainBundle] pathForResource:@"D11" ofType:@"jpg"];
    NSString *path3 = [[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"];
    
    //文本,避免报重复错误
    NSInteger tmpInt = [MOBFNumber randomInteger:100000];
    NSString *txt = [NSString stringWithFormat:@"%@_%ld",@"Share SDK",tmpInt];

    //通用参数设置
    [parameters SSDKSetupShareParamsByText:txt
                                    images:@[path1,path2,path3]
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    //平台定制
    //        [parameters SSDKSetupTwitterParamsByText:@"Share SDK"
    //                                          images:path4
    //                                        latitude:0
    //                                       longitude:0
    //                                            type:SSDKContentTypeImage];
    [self shareWithParameters:parameters];
}

- (void)shareLink
{
    //Twitter链接分享 卡片效果(小图、大图、视频、应用下载4种效果) 请查看官方API:https://developer.twitter.com/en/docs/tweets/optimize-with-cards/overview/abouts-cards
    // 注意：如果你的链接已经根据"Twitter官方API卡片效果文档"对网址内容进行改造 以下images参数请一定设置为nil 否则展示的是内容含有链接的图片分享。
    // 如Demo地址 http://f.moblink.mob.com/twitter/bigcard/ 和 http://f.moblink.mob.com/twitter/smallcard/ 网址内容html中head已经改造过
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //文本,避免报重复错误
    NSInteger tmpInt = [MOBFNumber randomInteger:100000];
    NSString *txt = [NSString stringWithFormat:@"%@_%ld",@"Share SDK",tmpInt];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:txt
                                    images:nil//[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:[NSURL URLWithString:@"http://tech.diary.support.mob.com/sharesdk/demo/index.html"]
                                     title:nil
                                      type:SSDKContentTypeWebPage];
//    [parameters SSDKSetupShareParamsByText:@"Share SDK"
//                                    images:nil
//                                       url:[NSURL URLWithString:@"http://f.moblink.mob.com/twitter/smallcard/"]
//                                     title:nil
//                                      type:SSDKContentTypeWebPage];
    [self shareWithParameters:parameters];
}

- (void)shareVideo
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //文本,避免报重复错误
    NSInteger tmpInt = [MOBFNumber randomInteger:100000];
    NSString *txt = [NSString stringWithFormat:@"%@_%ld",@"Share SDK",tmpInt];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:txt
                                    images:nil
                                       url:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]
                                     title:nil
                                      type:SSDKContentTypeVideo];
    //平台定制
    //    [parameters SSDKSetupTwitterParamsByText:@"Share SDK"
    //                                       video:[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]
    //                                    latitude:0
    //                                   longitude:0
    //                                         tag:@"Twitter_0001"];
    
    [self shareWithParameters:parameters];
}

#pragma mark - 系统分享

- (void)shareTextBySystem
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //文本,避免报重复错误
    NSInteger tmpInt = [MOBFNumber randomInteger:100000];
    NSString *txt = [NSString stringWithFormat:@"%@_%ld",SHARESDKDEMO_TEXT,tmpInt];
    
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:txt
                                    images:nil
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeText];
    [self shareByActivityWithParameters:parameters];
}

- (void)shareImageBySystem
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //图片最多4张 GIF只能1张
    NSString *path1 = SHARESDKDEMO_IMAGE_LOCALPATH;
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:nil
                                    images:@[path1]
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    [self shareByActivityWithParameters:parameters];
}

- (void)shareTextAndImageBySystem
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //图片最多4张 GIF只能1张
    NSString *path1 = SHARESDKDEMO_IMAGE_LOCALPATH;
    //文本,避免报重复错误
    NSInteger tmpInt = [MOBFNumber randomInteger:100000];
    NSString *txt = [NSString stringWithFormat:@"%@_%ld",SHARESDKDEMO_TEXT,tmpInt];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:txt
                                    images:@[path1]
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    [self shareByActivityWithParameters:parameters];
}

- (void)shareLinkBySystem
{
    //Twitter链接分享 卡片效果(小图、大图、视频、应用下载4种效果) 请查看官方API:https://developer.twitter.com/en/docs/tweets/optimize-with-cards/overview/abouts-cards
    // 注意：如果你的链接已经根据"Twitter官方API卡片效果文档"对网址内容进行改造 以下images参数请一定设置为nil 否则展示的是内容含有链接的图片分享。
    // 如Demo地址 http://f.moblink.mob.com/twitter/bigcard/ 和 http://f.moblink.mob.com/twitter/smallcard/ 网址内容html中head已经改造过
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //文本,避免报重复错误
    NSInteger tmpInt = [MOBFNumber randomInteger:100000];
    NSString *txt = [NSString stringWithFormat:@"%@_%ld",@"Share SDK",tmpInt];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:txt
                                    images:nil//[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:[NSURL URLWithString:@"http://tech.diary.support.mob.com/sharesdk/demo/index.html"]
                                     title:nil
                                      type:SSDKContentTypeWebPage];
    [self shareByActivityWithParameters:parameters];
}

- (void)shareVideoBySystem
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //文本,避免报重复错误
    NSInteger tmpInt = [MOBFNumber randomInteger:100000];
    NSString *txt = [NSString stringWithFormat:@"%@_%ld",@"Share SDK",tmpInt];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:txt
                                    images:nil
                                       url:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]
                                     title:nil
                                      type:SSDKContentTypeVideo];
    
    [self shareByActivityWithParameters:parameters];
}

- (void)shareWithCustom{
    MOBCustomeShareVC *vc = [[MOBCustomeShareVC alloc]init];
    vc.platformType = self.platformType;
    [[MOBFViewController currentViewController].navigationController pushViewController:vc animated:YES];
}
@end
