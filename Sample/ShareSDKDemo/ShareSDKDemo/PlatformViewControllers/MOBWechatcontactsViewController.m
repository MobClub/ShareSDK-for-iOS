//
//  MOBMessengerViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 17/3/7.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBWechatcontactsViewController.h"

@interface MOBWechatcontactsViewController ()

@end

@implementation MOBWechatcontactsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    platformType = SSDKPlatformSubTypeWechatSession;
    self.title = @"微信好友";
    shareIconArray = @[@"textIcon",@"imageIcon",@"webURLIcon",@"audioURLIcon",@"videoURLIcon",@"appInfoIcon",@"emoIcon",@"videoIcon",@"miniIcon"];
    shareTypeArray = @[@"文字",@"图片",@"链接",@"音乐链接",@"视频链接",@"应用消息",@"表情",@"文件（本地视频）",@"小程序"];
    selectorNameArray = @[@"shareText",@"shareImage",@"shareLink",@"shareAudio",@"shareVideo",@"shareApp",@"shareEmoticon",@"shareFile",@"shareMiniProgram"];
}

/**
 分享文字
 */
-(void)shareText
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:@"Share SDK"
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
    [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    //平台定制
//        [parameters SSDKSetupWeChatParamsByText:@"Share SDK"
//                                          title:nil
//                                            url:nil
//                                     thumbImage:nil
//                                          image:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
//                                   musicFileURL:nil
//                                        extInfo:nil
//                                       fileData:nil
//                                   emoticonData:nil
//                            sourceFileExtension:nil
//                                 sourceFileData:nil
//                                           type:SSDKContentTypeImage
//                             forPlatformSubType:SSDKPlatformSubTypeWechatSession];
    
    [self shareWithParameters:parameters];
}

- (void)shareLink
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:@"Share SDK Link Desc"
                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:[NSURL URLWithString:@"https://www.mob.com"]
                                     title:@"Share SDK"
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
//                                        url:[NSURL URLWithString:@"http://i.y.qq.com/v8/playsong.html?hostuin=0&songid=&songmid=002x5Jje3eUkXT&_wv=1&source=qq&appshare=iphone&media_mid=002x5Jje3eUkXT"]
//                                 thumbImage:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
//                                      image:nil
//                               musicFileURL:[NSURL URLWithString:@"http://i.y.qq.com/v8/playsong.html?hostuin=0&songid=&songmid=002x5Jje3eUkXT&_wv=1&source=qq&appshare=iphone&media_mid=002x5Jje3eUkXT"]
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
    [parameters SSDKSetupShareParamsByText:@"视频"
                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:[NSURL URLWithString:@"http://v.youku.com/v_show/id_XNTUxNDY1NDY4.html"]
                                     title:@"乔布斯"
                                      type:SSDKContentTypeVideo];
    //平台定制
//        [parameters SSDKSetupWeChatParamsByText:@"视频"
//                                          title:@"乔布斯"
//                                            url:[NSURL URLWithString:@"http://v.youku.com/v_show/id_XNTUxNDY1NDY4.html"]
//                                     thumbImage:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
//                                          image:nil
//                                   musicFileURL:nil
//                                        extInfo:nil
//                                       fileData:nil
//                                   emoticonData:nil
//                            sourceFileExtension:nil
//                                 sourceFileData:nil
//                                           type:SSDKContentTypeVideo
//                             forPlatformSubType:SSDKPlatformSubTypeWechatSession];
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
                                      title:@"file"
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
    //平台定制
    [parameters SSDKSetupWeChatParamsByTitle:@"MiniProgram"
                                 description:@"test MiniProgram"
                                  webpageUrl:[NSURL URLWithString:@"http://www.mob.com"]
                                        path:@"/page/API/pages/share/share"
                                  thumbImage:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                    userName:@"gh_d43f693ca31f"
                          forPlatformSubType:SSDKPlatformSubTypeWechatSession];
    
    [self shareWithParameters:parameters];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
