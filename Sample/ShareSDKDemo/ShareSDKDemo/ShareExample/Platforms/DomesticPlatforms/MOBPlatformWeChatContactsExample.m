//
//  MOBPlatformWeChatContactsExample.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/19.
//  Copyright © 2019 mob. All rights reserved.
//  文档地址:https://www.mob.com/wiki/detailed?wiki=ShareSDK_chanpinjianjie&id=14

#import "MOBPlatformWeChatContactsExample.h"
#import <WechatConnector/WeChatConnector.h>
#import "MOBCustomeShareVC.h"
#import <MOBFoundation/MOBFoundation.h>
//#import "WXApi.h"
@implementation MOBPlatformWeChatContactsExample
+ (SSDKPlatformType)platformType{
    return SSDKPlatformSubTypeWechatSession;
}
- (void)setup{
    
    //当用户自己想处理返回的token时，可以传入appsecret为nil，然后设置一下两个block。
    //       [WeChatConnector setRefreshAuthTokenOperation:^(NSString *uid, void (^getUserinfo)(NSString *token)) {
    //           getUserinfo(@"");
    //       }];
    //
    //
    //       [WeChatConnector setRequestAuthTokenOperation:^(NSString *authCode, void (^getUserinfo)(NSString *uid, NSString *token)) {
    //           //回调处理结果
    //           getUserinfo(@"",@"");
    //       }];
    //
    //
    //       //获取到微信回调的结果
    //       [WeChatConnector setWXCallbackOperation:^(id req, id resp) {
    //
    //       }];
    SSDKWEAK
    [self addListItemWithImage:MOBImageShareIcon name:@"相册图片" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareAssetImage];
    }];
    
    [self addListItemWithImage:MOBMiniProgramShareIcon name:@"打开小程序" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        [weakSelf openMiniProgram];
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
/**
 分享文字
 */
-(void)shareText
{
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
    //                         forPlatformSubType:SSDKPlatformSubTypeWechatSession];
    
    [self shareWithParameters:parameters];
}

/**
 分享图片
 */
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

/**
 分享相册图片
 */
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
    ////    [parameters SSDKSetupShareParamsByText:@"Share SDK"
    ////                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
    ////                                       url:nil
    ////                                     title:nil
    ////                                      type:SSDKContentTypeImage];
    //    //平台定制
    //        [parameters SSDKSetupWeChatParamsByText:SHARESDKDEMO_TEXT
    //                                          title:nil
    //                                            url:nil
    //                                     thumbImage:nil
    //                                          image:SHARESDKDEMO_IMAGE_LOCALPATH
    //                                   musicFileURL:nil
    //                                        extInfo:nil
    //                                       fileData:nil
    //                                   emoticonData:nil
    //                            sourceFileExtension:nil
    //                                 sourceFileData:nil
    //                                           type:SSDKContentTypeAuto
    //                             forPlatformSubType:SSDKPlatformSubTypeWechatSession];
    //
    //    [self shareWithParameters:parameters];
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
    //                             forPlatformSubType:SSDKPlatformSubTypeWechatSession];
    
    [self shareWithParameters:parameters];
}

- (void)shareAudio
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //网络音频
    //通用参数设置
    //    [parameters SSDKSetupShareParamsByText:@"Vitas"
    //                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
    //                                       url:[NSURL URLWithString:@"http://music.163.com/#/song?id=19674655"]
    //                                     title:@"第七元素"
    //                                      type:SSDKContentTypeAudio];
    
    //平台定制
    [parameters SSDKSetupWeChatParamsByText:@"Vitas"
                                      title:@"第七元素"
                                        url:[NSURL URLWithString:@"https://i.y.qq.com/v8/playsong.html?songmid=&_wv=1&songid=4797678&source=qq&platform=1&appsongtype=1&_wv=1&appshare=iphone&type=0&media_mid=001AFWGk4MKbvX&hosteuin=owEzoivFoio5"]
                                 thumbImage:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                      image:nil
                               musicFileURL:[NSURL URLWithString:@"http://music.163.com/song/media/outer/url?id=133998.mp3"]
                                    extInfo:nil
                                   fileData:nil
                               emoticonData:nil
                        sourceFileExtension:nil
                             sourceFileData:nil
                                       type:SSDKContentTypeAudio
                         forPlatformSubType:SSDKPlatformSubTypeWechatSession];
    [self shareWithParameters:parameters];
}

- (void)shareVideo
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //网络视频
    //通用参数设置
    //    [parameters SSDKSetupShareParamsByText:@"视频"
    //                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
    //                                       url:[NSURL URLWithString:@"http://v.youku.com/v_show/id_XNTUxNDY1NDY4.html"]
    //                                     title:@"乔布斯"
    //                                      type:SSDKContentTypeVideo];
    //平台定制
    [parameters SSDKSetupWeChatParamsByText:SHARESDKDEMO_TEXT
                                      title:SHARESDKDEMO_TITLE
                                        url:[NSURL URLWithString:SHARESDKDEMO_VIDEO_AD_STRING]
                                 thumbImage:SHARESDKDEMO_IMAGE_LOCALPATH
                                      image:nil
                               musicFileURL:nil
                                    extInfo:nil
                                   fileData:nil
                               emoticonData:nil
                        sourceFileExtension:nil
                             sourceFileData:nil
                                       type:SSDKContentTypeVideo
                         forPlatformSubType:SSDKPlatformSubTypeWechatSession];
    [self shareWithParameters:parameters];
}

- (void)shareApplication
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //平台定制
    [parameters SSDKSetupWeChatParamsByText:@"share SDK"
                                      title:@"App消息"
                                        url:[NSURL URLWithString:@"http://www.mob.com"]
                                 thumbImage:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                      image:nil
                               musicFileURL:nil
                                    extInfo:nil
                                   fileData:[@"13232" dataUsingEncoding:NSUTF8StringEncoding]
                               emoticonData:nil
                        sourceFileExtension:nil
                             sourceFileData:nil
                                       type:SSDKContentTypeApp
                         forPlatformSubType:SSDKPlatformSubTypeWechatSession];
    [self shareWithParameters:parameters];
}

- (void)shareEmoji
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //gif 或 普通格式图片
    //平台定制
    [parameters SSDKSetupWeChatParamsByText:nil
                                      title:nil
                                        url:nil
                                 thumbImage:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                      image:nil
                               musicFileURL:nil
                                    extInfo:nil
                                   fileData:nil
                               emoticonData:[[NSBundle mainBundle] pathForResource:@"res6" ofType:@"gif"]
                        sourceFileExtension:nil
                             sourceFileData:nil
                                       type:SSDKContentTypeImage
                         forPlatformSubType:SSDKPlatformSubTypeWechatSession];
    
    [self shareWithParameters:parameters];
}

- (void)shareFile
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //平台定制
    [parameters SSDKSetupWeChatParamsByText:@"share SDK"
                                      title:@"file.mp4"
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
                         forPlatformSubType:SSDKPlatformSubTypeWechatSession];
    
    [self shareWithParameters:parameters];
}

- (void)shareMiniProgram
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    [parameters SSDKSetupWeChatMiniProgramShareParamsByTitle:@"MiniProgram"
                                                 description:@"test MiniProgram"
                                                  webpageUrl:[NSURL URLWithString:@"http://www.mob.com"]
                                                        path:@"pages/index/index"
                                                  thumbImage:SHARESDKDEMO_IMAGE_STRING
                                                hdThumbImage:SHARESDKDEMO_IMAGE_STRING
                                                    userName:@"gh_afb25ac019c9"
                                             withShareTicket:YES
                                             miniProgramType:0
                                          forPlatformSubType:SSDKPlatformSubTypeWechatSession];
    
    [self shareWithParameters:parameters];
}

- (void)openMiniProgram
{
    //    BOOL success = [WeChatConnector openMiniProgramWithUserName:@"gh_52568203455c"
    //                                                           path:@"pages/index/index"
    //                                                miniProgramType:0];
    //    if (success)
    //    {
    //        NSLog(@"打开小程序成功");
    //    }
    //    else
    //    {
    //        NSLog(@"打开小程序失败");
    //    }
    
    // 小程序打开当前应用(回传参数)监听 此回调block将被单例持有 可通过[WeChatConnector openAppFromMiniProgramWithCallback:nil]进行取消监听或更换
    // 注意：只有应用打开的小程序才能进行小程序打开应用且可以多次打开
    [WeChatConnector openAppFromMiniProgramWithCallback:^(SSDKResponseState state, NSString *extStr, NSError *error) {
        NSString *title = @"";
        NSString *typeStr = @"";
        switch (state) {
            case SSDKResponseStateSuccess:
            {
                NSLog(@"小程序打开应用回调成功");
                title = @"小程序打开应用回调成功";
                typeStr = [NSString stringWithFormat:@"成功 extStr:%@",extStr?:@""];
            }
                break;
            case SSDKResponseStateFail:
            {
                NSLog(@"小程序打开应用回调失败");
                title = @"小程序打开应用回调失败";
                typeStr = [NSString stringWithFormat:@"失败 error:%@",error?error:@""];
            }
                break;
            default:
                break;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            UIAlertControllerAlertCreate(title, typeStr).addCancelAction(@"确定").present();
        });
    }];
    
    // 应用打开小程序
    [WeChatConnector openMiniProgramWithUserName:@"gh_52568203455c"
                                            path:@"pages/index/index"
                                 miniProgramType:0
                                               extMsg:@"extMsg"
                                               extDic:@{@"key1":@"value1",@"key2":@"value2"}
                                        complete:^(BOOL success) {
        if (success)
        {
            NSLog(@"打开小程序成功");
        }
        else
        {
            NSLog(@"打开小程序失败");
        }
    }];
    
}

#pragma mark - 系统分享

//- (void)shareTextBySystem
//{
//    //系统分享文字
//    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
//    //通用参数设置
//    [parameters SSDKSetupShareParamsByText:@"aaaaaa"
//                                    images:nil
//                                       url:nil
//                                     title:nil
//                                      type:SSDKContentTypeText];
//    [self shareByActivityWithParameters:parameters];
//}

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
    [parameters SSDKSetupShareParamsByText:nil
                                    images:SHARESDKDEMO_IMAGE_LOCALPATH
                                       url:[NSURL URLWithString:@"https://www.mob.com"]
                                     title:@"Share SDK"
                                      type:SSDKContentTypeWebPage];

    [self shareByActivityWithParameters:parameters];
}

- (void)shareVideoBySystem{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"];
    NSURL *url = [NSURL fileURLWithPath:path];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:nil
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
