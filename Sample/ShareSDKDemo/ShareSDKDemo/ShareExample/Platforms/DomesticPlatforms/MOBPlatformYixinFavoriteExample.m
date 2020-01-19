//
//  MOBPlatformYixinFavoriteExample.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/19.
//  Copyright © 2019 mob. All rights reserved.
//  文档地址:https://www.mob.com/wiki/detailed?wiki=ShareSDK_chanpinjianjie&id=14

#import "MOBPlatformYixinFavoriteExample.h"

@implementation MOBPlatformYixinFavoriteExample

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
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:SHARESDKDEMO_IMAGE_STRING
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
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:SHARESDKDEMO_IMAGE_STRING
                                       url:[NSURL URLWithString:SHARESDKDEMO_URLSTRING]
                                     title:SHARESDKDEMO_TITLE
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
    //网络视频
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:SHARESDKDEMO_IMAGE_LOCALPATH
                                       url:[NSURL URLWithString:SHARESDKDEMO_VIDEO_AD_STRING]
                                     title:SHARESDKDEMO_TITLE
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

- (void)shareApplication
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //平台定制
    [parameters SSDKSetupYiXinParamsByText:@"Share SDK"
                                     title:@"App消息"
                                       url:[NSURL URLWithString:@"http://www.mob.com"]
                                thumbImage:nil
                                     image:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                              musicFileURL:nil
                                   extInfo:@"ext"
                                  fileData:[@"13232" dataUsingEncoding:NSUTF8StringEncoding]
                                   comment:nil
                                  toUserId:nil
                                      type:SSDKContentTypeApp
                        forPlatformSubType:self.platformType];
    [self shareWithParameters:parameters];
}

+ (SSDKPlatformType)platformType{
    return SSDKPlatformSubTypeYiXinFav;
}
@end
