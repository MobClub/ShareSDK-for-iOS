//
//  MOBMessengerViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 17/3/7.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBWechatcontactsViewController.h"
#import <WechatConnector/WechatConnector.h>

@interface MOBWechatcontactsViewController ()

@end

@implementation MOBWechatcontactsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    platformType = SSDKPlatformSubTypeWechatSession;
    self.title = @"微信好友";
    shareIconArray = @[@"textIcon",@"imageIcon",@"webURLIcon",@"audioURLIcon",@"videoURLIcon",@"appInfoIcon",@"emoIcon",@"videoIcon",@"miniIcon",@"miniIcon"];
    shareTypeArray = @[@"文字",@"图片",@"链接",@"音乐链接",@"视频链接",@"应用消息",@"表情",@"文件（本地视频）",@"分享小程序",@"打开小程序"];
    selectorNameArray = @[@"shareText",@"shareImage",@"shareLink",@"shareAudio",@"shareVideo",@"shareApp",@"shareEmoticon",@"shareFile",@"shareMiniProgram",@"openMiniProgram"];
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
//    [parameters SSDKSetupShareParamsByText:@"Share SDK"
//                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
//                                       url:nil
//                                     title:nil
//                                      type:SSDKContentTypeImage];
    //平台定制
        [parameters SSDKSetupWeChatParamsByText:SHARESDKDEMO_TEXT
                                          title:nil
                                            url:nil
                                     thumbImage:nil
                                          image:SHARESDKDEMO_IMAGE_LOCALPATH
                                   musicFileURL:nil
                                        extInfo:nil
                                       fileData:nil
                                   emoticonData:nil
                            sourceFileExtension:nil
                                 sourceFileData:nil
                                           type:SSDKContentTypeAuto
                             forPlatformSubType:SSDKPlatformSubTypeWechatSession];
    
    [self shareWithParameters:parameters];
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
    [parameters SSDKSetupShareParamsByText:@"崔健"
                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:[NSURL URLWithString:@"http://i.y.qq.com/v8/playsong.html?hostuin=0&songid=&songmid=002x5Jje3eUkXT&_wv=1&source=qq&appshare=iphone&media_mid=002x5Jje3eUkXT"]
                                     title:@"一无所有"
                                      type:SSDKContentTypeAudio];
    //平台定制
//    [parameters SSDKSetupWeChatParamsByText:@"崔健"
//                                      title:@"一无所有"
//                                        url:[NSURL URLWithString:@"https://i.y.qq.com/v8/playsong.html?songmid=&_wv=1&songid=4797678&source=qq&platform=1&appsongtype=1&_wv=1&appshare=iphone&type=0&media_mid=001AFWGk4MKbvX&hosteuin=owEzoivFoio5"]
//                                 thumbImage:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
//                                      image:nil
//                               musicFileURL:[NSURL URLWithString:@"http://ra01.sycdn.kuwo.cn/resource/n3/32/56/3260586875.mp3"]
//                                    extInfo:nil
//                                   fileData:nil
//                               emoticonData:nil
//                        sourceFileExtension:nil
//                             sourceFileData:nil
//                                       type:SSDKContentTypeAudio
//                         forPlatformSubType:SSDKPlatformSubTypeWechatSession];
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

- (void)shareApp
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

- (void)shareEmoticon
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
                                                  thumbImage:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                                hdThumbImage:@"http://download.sdk.mob.com/web/images/2019/06/20/10/1560998253715/635_635_42.62.png"
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
            UIAlertControllerAlertCreate(title, typeStr).addCancelAction(@"确定", 0).showFromViewController(MOBApplication.sharedApplication.window.rootViewController);
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

@end
