//
//  MOBYixincontactsViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 2017/6/7.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBYixincontactsViewController.h"

@implementation MOBYixincontactsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    platformType = SSDKPlatformSubTypeYiXinSession;
    self.title = @"易信好友";
    shareIconArray = @[@"textIcon",@"imageIcon",@"webURLIcon",@"audioURLIcon",@"videoURLIcon",@"appInfoIcon"];
    shareTypeArray = @[@"文字 APP",@"图片 APP",@"链接 APP",@"音乐链接 APP",@"视频链接 APP",@"应用消息 APP"];
    selectorNameArray = @[@"shareText",@"shareImage",@"shareLink",@"shareAudio",@"shareVideo",@"shareApp"];
}

/**
 分享文字
 */
-(void)shareText
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKEnableUseClientShare];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                    images:nil
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeText];
    //平台定制
//    [parameters SSDKSetupYiXinParamsByText:@"Share SDK"
//                                     title:nil
//                                       url:nil
//                                thumbImage:nil
//                                     image:nil
//                              musicFileURL:nil
//                                   extInfo:nil
//                                  fileData:nil
//                                   comment:nil
//                                  toUserId:nil
//                                      type:SSDKContentTypeText
//                        forPlatformSubType:platformType];
    
    [self shareWithParameters:parameters];
}

/**
 分享图片
 */
- (void)shareImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKEnableUseClientShare];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    //平台定制
//    [parameters SSDKSetupYiXinParamsByText:@"Share SDK"
//                                     title:nil
//                                       url:nil
//                                thumbImage:nil
//                                     image:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
//                              musicFileURL:nil
//                                   extInfo:nil
//                                  fileData:nil
//                                   comment:nil
//                                  toUserId:nil
//                                      type:SSDKContentTypeImage
//                        forPlatformSubType:platformType];
    
    [self shareWithParameters:parameters];
}

- (void)shareLink
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKEnableUseClientShare];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:@"Share SDK Link Desc"
                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:[NSURL URLWithString:@"https://www.mob.com"]
                                     title:@"Share SDK"
                                      type:SSDKContentTypeWebPage];
    //平台定制
//    [parameters SSDKSetupYiXinParamsByText:@"Share SDK"
//                                     title:@"Share SDK"
//                                       url:[NSURL URLWithString:@"https://www.mob.com"]
//                                thumbImage:nil
//                                     image:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
//                              musicFileURL:nil
//                                   extInfo:nil
//                                  fileData:nil
//                                   comment:nil
//                                  toUserId:nil
//                                      type:SSDKContentTypeWebPage
//                        forPlatformSubType:platformType];
    
    [self shareWithParameters:parameters];
}

- (void)shareAudio
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKEnableUseClientShare];
    //网络音频
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:@"崔健"
                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:[NSURL URLWithString:@"http://i.y.qq.com/v8/playsong.html?hostuin=0&songid=&songmid=002x5Jje3eUkXT&_wv=1&source=qq&appshare=iphone&media_mid=002x5Jje3eUkXT"]
                                     title:@"一无所有"
                                      type:SSDKContentTypeAudio];
    //平台定制
//        [parameters SSDKSetupYiXinParamsByText:@"Share SDK"
//                                         title:@"Share SDK"
//                                           url:[NSURL URLWithString:@"http://i.y.qq.com/v8/playsong.html?hostuin=0&songid=&songmid=002x5Jje3eUkXT&_wv=1&source=qq&appshare=iphone&media_mid=002x5Jje3eUkXT"]
//                                    thumbImage:nil
//                                         image:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
//                                  musicFileURL:[NSURL URLWithString:@"http://i.y.qq.com/v8/playsong.html?hostuin=0&songid=&songmid=002x5Jje3eUkXT&_wv=1&source=qq&appshare=iphone&media_mid=002x5Jje3eUkXT"]
//                                       extInfo:nil
//                                      fileData:nil
//                                       comment:nil
//                                      toUserId:nil
//                                          type:SSDKContentTypeAudio
//                            forPlatformSubType:platformType];
    [self shareWithParameters:parameters];
}

- (void)shareVideo
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKEnableUseClientShare];
    //网络视频
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:@"视频"
                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:[NSURL URLWithString:@"http://v.youku.com/v_show/id_XNTUxNDY1NDY4.html"]
                                     title:@"乔布斯"
                                      type:SSDKContentTypeVideo];
    //平台定制
//    [parameters SSDKSetupYiXinParamsByText:@"Share SDK"
//                                     title:@"Share SDK"
//                                       url:[NSURL URLWithString:@"http://v.youku.com/v_show/id_XNTUxNDY1NDY4.html"]
//                                thumbImage:nil
//                                     image:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
//                              musicFileURL:nil
//                                   extInfo:nil
//                                  fileData:nil
//                                   comment:nil
//                                  toUserId:nil
//                                      type:SSDKContentTypeVideo
//                        forPlatformSubType:platformType];
    [self shareWithParameters:parameters];
}

- (void)shareApp
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKEnableUseClientShare];
    //平台定制
    [parameters SSDKSetupYiXinParamsByText:@"Share SDK"
                                     title:@"App消息"
                                       url:[NSURL URLWithString:@"http://www.mob.com"]
                                thumbImage:nil
                                     image:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                              musicFileURL:nil
                                   extInfo:nil
                                  fileData:[@"13232" dataUsingEncoding:NSUTF8StringEncoding]
                                   comment:nil
                                  toUserId:nil
                                      type:SSDKContentTypeApp
                        forPlatformSubType:platformType];
    [self shareWithParameters:parameters];
}

@end
