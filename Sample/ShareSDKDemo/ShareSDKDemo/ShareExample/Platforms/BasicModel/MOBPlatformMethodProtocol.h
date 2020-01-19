//
//  MOBPlatformMethodProtocol.h
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/16.
//  Copyright © 2019 mob. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MOBPlatformMethodProtocol <NSObject>

@optional

//文字
- (void)shareText;

//单图
- (void)shareImage;

//多图
- (void)shareMutiImage;

//图文
- (void)shareTextImage;

//音频
- (void)shareAudio;

//文件
- (void)shareFile;

//分享链接
- (void)shareLink;

//视频
- (void)shareVideo;


//应用
- (void)shareApplication;

//表情
- (void)shareEmoji;

//小程序
- (void)shareMiniProgram;

+ (SSDKPlatformType)platformType;

- (SSDKPlatformType)platformType;

- (SSDKPlatformType)converntPlatformType;

+ (SSDKPlatformType)converntPlatformType;

- (SSDKPlatformType)converntImagePlatformType;

@end




NS_ASSUME_NONNULL_END
