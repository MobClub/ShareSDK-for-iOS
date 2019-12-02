//
//  MOBMessengerViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 17/3/7.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBSinaWeiboViewController.h"
#import <Photos/Photos.h>
#import <ShareSDKExtension/ShareSDK+Extension.h>

@interface MOBSinaWeiboViewController ()

@end

@implementation MOBSinaWeiboViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    platformType = SSDKPlatformTypeSinaWeibo;
    self.title = @"新浪微博";
    shareIconArray = @[@"textIcon",@"textAndImageIcon",@"mutImageIcon",@"imageIcon",@"videoIcon",@"videoIcon",@"webURLIcon",@"webURLIcon"];
    shareTypeArray = @[@"文字 SDK",@"文字+单图 SDK",@"文字+多图 SDK",@"故事板图片 SDK",@"视频 SDK",@"故事板视频 SDK",@"链接 SDK",@"分享LinkCard"];
    selectorNameArray = @[@"shareText",@"shareImage",@"shareImages",@"shareImageStory",@"shareVideos",@"shareVideoStory",@"shareLink",@"shareLinkCard"];
}

- (void)shareText
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:nil
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeText];
    //平台定制
//    [parameters SSDKSetupSinaWeiboShareParamsByText:@"Share SDK"
//                                              title:nil
//                                             images:nil
//                                              video:nil
//                                                url:nil
//                                           latitude:0
//                                          longitude:0
//                                           objectID:0
//                                     isShareToStory:false
//                                               type:SSDKContentTypeText];
    [self shareWithParameters:parameters];
}

- (void)shareImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:@[SHARESDKDEMO_IMAGE_STRING]
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    //平台定制
//    [parameters SSDKSetupSinaWeiboShareParamsByText:@"Share SDK"
//                                              title:nil
//                                             images:@[[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
//                                                      ]
//                                              video:nil
//                                                url:nil
//                                           latitude:0 longitude:0
//                                           objectID:nil
//                                     isShareToStory:NO
//                                               type:SSDKContentTypeImage];
    [self shareWithParameters:parameters];
}

- (void)shareImages
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:@[@"http://www.mob.com/assets/images/ShareSDK_pic_1-09d293a6.png",SHARESDKDEMO_IMAGE_LOCALPATH]
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    //平台定制
    //    [parameters SSDKSetupSinaWeiboShareParamsByText:@"Share SDK"
    //                                              title:nil
    //                                             images:@[[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
    //                                                      ,[[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"]
    //                                                      ]
    //                                              video:nil
    //                                                url:nil
    //                                           latitude:0 longitude:0
    //                                           objectID:nil
    //                                     isShareToStory:NO
    //                                               type:SSDKContentTypeImage];
    [self shareWithParameters:parameters];
}

- (void)shareImageStory
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //平台定制
    [parameters SSDKSetupSinaWeiboShareParamsByText:SHARESDKDEMO_TEXT
                                              title:nil
                                             images:@[SHARESDKDEMO_IMAGE_LOCALPATH
                                                      ]
                                              video:nil
                                                url:nil
                                           latitude:0 longitude:0
                                           objectID:nil
                                     isShareToStory:YES
                                               type:SSDKContentTypeImage];
    [self shareWithParameters:parameters];
}

- (void)shareLink
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:SHARESDKDEMO_IMAGE_LOCALPATH
                                       url:[NSURL URLWithString:SHARESDKDEMO_URLSTRING]
                                     title:SHARESDKDEMO_TITLE
                                      type:SSDKContentTypeWebPage];
    
    [self shareWithParameters:parameters];
}

// LinkCard功能需要去管理后台申请
- (void)shareLinkCard
{
    //图片必须为网络地址图片
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    [parameters SSDKSetupSinaWeiboLinkCardShareParamsByText:@"我是Text"
                                                  cardTitle:@"cardTitle"
                                                cardSummary:@"summary"
                                                     images:@"http://download.sdk.mob.com/web/images/2019/06/20/10/1560998253715/635_635_42.62.png"
                                                        url:[NSURL URLWithString:SHARESDKDEMO_URLSTRING]];
    
    [self shareWithParameters:parameters];
}

- (void)shareVideos
{
    NSString *videoPath = [[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"];

    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupSinaWeiboShareParamsByText:@"ShareSDK"
                                              title:nil
                                             images:nil
                                              video:videoPath
                                                url:nil
                                           latitude:0
                                          longitude:0
                                           objectID:nil
                                     isShareToStory:NO
                                               type:SSDKContentTypeVideo];

    [self shareWithParameters:parameters];
}

- (void)shareVideoStory
{
    NSString *videoPath = [[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"];
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupSinaWeiboShareParamsByText:@"ShareSDK"
                                              title:nil
                                             images:nil
                                              video:videoPath
                                                url:nil
                                           latitude:0
                                          longitude:0
                                           objectID:nil
                                     isShareToStory:YES
                                               type:SSDKContentTypeVideo];
    
    [self shareWithParameters:parameters];
}

@end
