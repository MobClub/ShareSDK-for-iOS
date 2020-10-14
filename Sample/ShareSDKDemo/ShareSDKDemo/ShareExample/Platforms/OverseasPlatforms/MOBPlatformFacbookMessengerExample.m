//
//  MOBPlatformFacbookMessengerExample.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/19.
//  Copyright © 2019 mob. All rights reserved.
//  文档地址:https://www.mob.com/wiki/detailed?wiki=ShareSDK_chanpinjianjie&id=14

#import "MOBPlatformFacbookMessengerExample.h"

@implementation MOBPlatformFacbookMessengerExample
+ (SSDKPlatformType)platformType{
    return SSDKPlatformTypeFacebookMessenger;
}
- (void)shareLink
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    //图片必须为网络图片
    //    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
    //                                    images:SHARESDKDEMO_IMAGE_STRING
    //                                       url:[NSURL URLWithString:@"http://m.93lj.com/sharelink?mobid=ziqMNf"]
    //                                     title:SHARESDKDEMO_TITLE
    //                                      type:SSDKContentTypeWebPage];
    //平台定制
    [parameters SSDKSetupFacebookMessengerParamsByTitle:@"Share SDK"
                                                    url:[NSURL URLWithString:@"http://www.mob.com"]
                                              quoteText:@"Share SDK Link Desc"
                                                 images:@"http://qzonestyle.gtimg.cn/qzone/app/weishi/client/testimage/1024/1.jpg"
                                                    gif:nil
                                                  audio:nil
                                                  video:nil
                                                   type:SSDKContentTypeWebPage];
    
    [self shareWithParameters:parameters];
}

- (void)shareAudio{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    //图片必须为网络图片
    //    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
    //                                    images:SHARESDKDEMO_IMAGE_STRING
    //                                       url:[NSURL URLWithString:@"http://m.93lj.com/sharelink?mobid=ziqMNf"]
    //                                     title:SHARESDKDEMO_TITLE
    //                                      type:SSDKContentTypeWebPage];
    
    //[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"music" ofType:@"mp3"]]
    //平台定制
    [parameters SSDKSetupFacebookMessengerParamsByTitle:@"Share SDK"
                                                    url:[NSURL URLWithString:@"http://www.mob.com"]
                                              quoteText:@"Share SDK Link Desc"
                                                 images:@"http://qzonestyle.gtimg.cn/qzone/app/weishi/client/testimage/1024/1.jpg"
                                                    gif:nil
                                                  audio:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"music" ofType:@"mp3"]]
                                                  video:nil
                                                   type:SSDKContentTypeAudio];
    
    [self shareWithParameters:parameters];
}

- (void)shareImage{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    //图片必须为网络图片
    //    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
    //                                    images:SHARESDKDEMO_IMAGE_STRING
    //                                       url:[NSURL URLWithString:@"http://m.93lj.com/sharelink?mobid=ziqMNf"]
    //                                     title:SHARESDKDEMO_TITLE
    //                                      type:SSDKContentTypeWebPage];
    
    //[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"music" ofType:@"mp3"]]
    //平台定制
    [parameters SSDKSetupFacebookMessengerParamsByTitle:@"Share SDK"
                                                    url:[NSURL URLWithString:@"http://www.mob.com"]
                                              quoteText:@"Share SDK Link Desc"
                                                 images:@"http://qzonestyle.gtimg.cn/qzone/app/weishi/client/testimage/1024/1.jpg"
                                                    gif:nil
                                                  audio:nil
                                                  video:nil
                                                   type:SSDKContentTypeImage];
    
    [self shareWithParameters:parameters];
}


- (void)shareVideo{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    //图片必须为网络图片
    //    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
    //                                    images:SHARESDKDEMO_IMAGE_STRING
    //                                       url:[NSURL URLWithString:@"http://m.93lj.com/sharelink?mobid=ziqMNf"]
    //                                     title:SHARESDKDEMO_TITLE
    //                                      type:SSDKContentTypeWebPage];
    
    //[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"music" ofType:@"mp3"]]
    //平台定制
    [parameters SSDKSetupFacebookMessengerParamsByTitle:@"Share SDK"
                                                    url:[NSURL URLWithString:@"http://www.mob.com"]
                                              quoteText:@"Share SDK Link Desc"
                                                 images:@"http://qzonestyle.gtimg.cn/qzone/app/weishi/client/testimage/1024/1.jpg"
                                                    gif:nil
                                                  audio:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"music" ofType:@"mp3"]]
                                                  video:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]
                                                   type:SSDKContentTypeVideo];
    
    [self shareWithParameters:parameters];
}
@end
