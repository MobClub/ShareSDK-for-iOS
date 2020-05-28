//
//  MOBPlatformSnapChatExample.m
//  ShareSDKDemo
//
//  Created by maxl on 2020/3/30.
//  Copyright © 2020 mob. All rights reserved.
//

#import "MOBPlatformSnapChatExample.h"

@implementation MOBPlatformSnapChatExample

- (void)setup{
    SSDKWEAK
    [self addListItemWithImage:MOBImageShareIcon name:@"贴纸" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self sharesticker];
    }];
}

+ (SSDKPlatformType)platformType{
    return SSDKPlatformTypeSnapChat;
}

- (void)shareImage{
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter SSDKSetupSnapChatParamsByCaption:@"https://www.mobtech.com"
                                  attachmentUrl:SHARESDKDEMO_URLSTRING
                                          image:SHARESDKDEMO_IMAGE_LOCALPATH
                                          video:nil
                                       sticker:[UIImage imageNamed:@"ren_nv"]
                               stickerAnimated:NO
                               stickerRotation:0
                                cameraViewState:0
                                           type:SSDKContentTypeImage];
    [self shareWithParameters:parameter];
}


- (void)shareVideo{
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter SSDKSetupSnapChatParamsByCaption:@"ShareSDK"
                                  attachmentUrl:SHARESDKDEMO_URLSTRING
                                          image:nil
                                          video:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]
                                       sticker:[UIImage imageNamed:@"ren_nv"]
                               stickerAnimated:NO
                               stickerRotation:0
                                cameraViewState:0
                                           type:SSDKContentTypeVideo];
    [self shareWithParameters:parameter];
}

- (void)sharesticker{
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter SSDKSetupSnapChatParamsByCaption:@"ShareSDK"
                                  attachmentUrl:SHARESDKDEMO_URLSTRING
                                          image:nil
                                          video:nil
                                       sticker:[UIImage imageNamed:@"ren_nv"]
                               stickerAnimated:NO
                               stickerRotation:0
                                cameraViewState:0
                                           type:SSDKContentTypeImage];
    [self shareWithParameters:parameter];
    
}

@end
