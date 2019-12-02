//
//  MOBMessengerViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 17/3/7.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBQQViewController.h"
#import <MOBFoundation/MOBFoundation.h>
@interface MOBQQViewController ()

@end

@implementation MOBQQViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    platformType = SSDKPlatformSubTypeQQFriend;
    self.title = @"QQ好友";
    shareIconArray = @[@"textIcon",@"imageIcon",@"webURLIcon",@"audioURLIcon",@"videoIcon",@"miniIcon"];
    shareTypeArray = @[@"文字",@"图片",@"链接",@"音乐链接",@"视频链接",@"小程序"];
    selectorNameArray = @[@"shareText",@"shareImage",@"shareLink",@"shareAudio",@"shareVideo",@"shareMiniProgram"];
}

/**
 分享文字
 */
- (void)shareText
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
//    [parameters SSDKSetupShareParamsByText:@"Share SDK"
//                                    images:nil
//                                       url:nil
//                                     title:nil
//                                      type:SSDKContentTypeText];
    
    //平台定制
    [parameters SSDKSetupQQParamsByText:SHARESDKDEMO_TEXT
                                  title:nil
                                    url:nil
                          audioFlashURL:nil
                          videoFlashURL:nil
                             thumbImage:nil
                                 images:nil
                                   type:SSDKContentTypeText
                     forPlatformSubType:SSDKPlatformSubTypeQQFriend];
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
                                            images:SHARESDKDEMO_IMAGE_STRING//[[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"]//SHARESDKDEMO_IMAGE_STRING //[[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"]
                                               url:nil
                                             title:nil
                                              type:SSDKContentTypeImage];
        //    [parameters SSDKEnableExtensionShare];
            
            
            //平台定制
        //    [parameters SSDKSetupQQParamsByText:@"Share SDK"
        //                                  title:nil
        //                                    url:nil
        //                          audioFlashURL:nil
        //                          videoFlashURL:nil
        //                             thumbImage:nil
        //                                 images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
        //                                   type:SSDKContentTypeImage
        //                     forPlatformSubType:SSDKPlatformSubTypeQQFriend];
            [self shareWithParameters:parameters];
    
    
}

- (void)shareLink
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置

        [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
        images:SHARESDKDEMO_IMAGE_STRING
           url:[NSURL URLWithString:SHARESDKDEMO_URLSTRING]
         title:@"Share SDK"
          type:SSDKContentTypeWebPage];
        [self shareWithParameters:parameters];
    
    
    
    //平台定制
//    [parameters SSDKSetupQQParamsByText:@"Share SDK Link Desc"
//                                  title:@"Share SDK"
//                                    url:[NSURL URLWithString:@"https://www.mob.com"]
//                          audioFlashURL:nil
//                          videoFlashURL:nil
//                             thumbImage:nil
//                                 images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
//                                   type:SSDKContentTypeWebPage
//                     forPlatformSubType:SSDKPlatformSubTypeQQFriend];
    
    
}

- (void)shareAudio
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
//    //通用参数设置
//    [parameters SSDKSetupShareParamsByText:@"Share SDK Link Desc"
//                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
//                                       url:[NSURL URLWithString:@"http://i.y.qq.com/v8/playsong.html?hostuin=0&songid=&songmid=002x5Jje3eUkXT&_wv=1&source=qq&appshare=iphone&media_mid=002x5Jje3eUkXT"]
//                                     title:@"Share SDK"
//                                      type:SSDKContentTypeAudio];
    
    //平台定制
        [parameters SSDKSetupQQParamsByText:@"Share SDK Link Desc"
                                      title:@"Share SDK"
                                        url:[NSURL URLWithString:@"https://i.y.qq.com/v8/playsong.html?songmid=&_wv=1&songid=4797678&source=qq&platform=1&appsongtype=1&_wv=1&appshare=iphone&type=0&media_mid=001AFWGk4MKbvX&hosteuin=owEzoivFoio5"]
                              audioFlashURL:[NSURL URLWithString:@"http://ra01.sycdn.kuwo.cn/resource/n3/32/56/3260586875.mp3"]
                              videoFlashURL:nil
                                 thumbImage:nil
                                     images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       type:SSDKContentTypeAudio
                         forPlatformSubType:SSDKPlatformSubTypeQQFriend];
    
    [self shareWithParameters:parameters];
}

- (void)shareVideo
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
//    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
//                                    images:SHARESDKDEMO_IMAGE_LOCALPATH
//                                       url:[NSURL URLWithString:@"http://www.mob.com"]
//                                     title:SHARESDKDEMO_TITLE
//                                      type:SSDKContentTypeVideo];
    
    //平台定制
        [parameters SSDKSetupQQParamsByText:SHARESDKDEMO_TEXT
                                      title:SHARESDKDEMO_TITLE
                                        url:[NSURL URLWithString:SHARESDKDEMO_VIDEO_AD_STRING]
                              audioFlashURL:nil
                              videoFlashURL:[NSURL URLWithString:SHARESDKDEMO_VIDEO_AD_STRING]
                                 thumbImage:nil
                                     images:SHARESDKDEMO_IMAGE_LOCALPATH
                                       type:SSDKContentTypeVideo
                         forPlatformSubType:SSDKPlatformSubTypeQQFriend];
    
    [self shareWithParameters:parameters];
}

- (void)shareMiniProgram
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupQQMiniProgramShareParamsByTitle:SHARESDKDEMO_TITLE
                                             description:SHARESDKDEMO_TEXT
                                              webpageUrl:[NSURL URLWithString:SHARESDKDEMO_VIDEO_AD_STRING]
                                            hdThumbImage:SHARESDKDEMO_IMAGE_STRING//SHARESDKDEMO_IMAGE_LOCALPATH
                                               miniAppID:@"1108318575"
                                                miniPath:@"pages/index/index"
                                          miniWebpageUrl:@"www.qq.com"
                                         miniProgramType:3
                                      forPlatformSubType:SSDKPlatformSubTypeQQFriend];
    [self shareWithParameters:parameters];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
