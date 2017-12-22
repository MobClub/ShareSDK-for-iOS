//
//  MOBMessengerViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 17/3/7.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBWechatmomentsViewController.h"

@interface MOBWechatmomentsViewController ()

@end

@implementation MOBWechatmomentsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    platformType = SSDKPlatformSubTypeWechatTimeline;
    self.title = @"微信朋友圈";
    shareIconArray = @[@"textIcon",@"imageIcon",@"webURLIcon",@"audioURLIcon",@"videoURLIcon"];
    shareTypeArray = @[@"文字",@"图片",@"链接",@"音乐链接",@"视频链接"];
    selectorNameArray = @[@"shareText",@"shareImage",@"shareLink",@"shareAudio",@"shareVideo"];
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
    //                         forPlatformSubType:SSDKPlatformSubTypeWechatTimeline];
    
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
    //                             forPlatformSubType:SSDKPlatformSubTypeWechatTimeline];
    
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
    //                             forPlatformSubType:SSDKPlatformSubTypeWechatTimeline];
    
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
    //                         forPlatformSubType:SSDKPlatformSubTypeWechatTimeline];
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
    //                             forPlatformSubType:SSDKPlatformSubTypeWechatTimeline];
    [self shareWithParameters:parameters];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
