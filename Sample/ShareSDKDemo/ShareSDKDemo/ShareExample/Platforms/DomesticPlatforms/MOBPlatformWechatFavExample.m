//
//  MOBPlatformWechatExample.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/19.
//  Copyright © 2019 mob. All rights reserved.
//  文档地址:https://www.mob.com/wiki/detailed?wiki=ShareSDK_chanpinjianjie&id=14

#import "MOBPlatformWechatFavExample.h"

@implementation MOBPlatformWechatFavExample




- (void)shareText{
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
    //                         forPlatformSubType:SSDKPlatformSubTypeWechatFav];
    
   [self shareWithParameters:parameters];
}

- (void)shareImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:SHARESDKDEMO_IMAGE_LOCALPATH
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
    //                             forPlatformSubType:SSDKPlatformSubTypeWechatFav];
    
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
    //                             forPlatformSubType:SSDKPlatformSubTypeWechatFav];
    
   [self shareWithParameters:parameters];
}

- (void)shareAudio
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //网络音频
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:@"崔健"
                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:[NSURL URLWithString:@"https://www.mob.com"]
                                     title:@"一无所有"
                                      type:SSDKContentTypeAudio];
    //平台定制
    //    [parameters SSDKSetupWeChatParamsByText:@"崔健"
    //                                      title:@"一无所有"
    //                                        url:[NSURL URLWithString:@"https://www.mob.com"]
    //                                 thumbImage:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
    //                                      image:nil
    //                               musicFileURL:[NSURL URLWithString:@"http://stream20.qqmusic.qq.com/32464723.mp3"]
    //                                    extInfo:nil
    //                                   fileData:nil
    //                               emoticonData:nil
    //                        sourceFileExtension:nil
    //                             sourceFileData:nil
    //                                       type:SSDKContentTypeAudio
    //                         forPlatformSubType:SSDKPlatformSubTypeWechatFav];
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
    //                             forPlatformSubType:SSDKPlatformSubTypeWechatFav];
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
                         forPlatformSubType:SSDKPlatformSubTypeWechatFav];
    
    [self shareWithParameters:parameters];
}



+ (SSDKPlatformType)platformType{
    return SSDKPlatformSubTypeWechatFav;
}
@end
