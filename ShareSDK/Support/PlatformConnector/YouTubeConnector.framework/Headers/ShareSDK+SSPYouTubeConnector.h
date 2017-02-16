//
//  ShareSDK+SSPConnector.h
//  ShareSDKConnector
//
//  Created by youzu on 17/1/20.
//  Copyright © 2017年 mob. All rights reserved.
//

#import <ShareSDK/ShareSDK.h>
#import <MOBFoundation/MOBFoundation.h>

@interface ShareSDK (SSPYouTubeConnector)


/**
 分享内容

 @param platformType 平台类型
 @param parameters 分享参数
 @param uploadProgressHandler 上传进度
 @param stateChangedHandler 状态变更回调处理
 @return 返回 sessionId 用于关闭上传链接
 */
+ (NSString *)share:(SSDKPlatformType)platformType
   parameters:(NSMutableDictionary *)parameters
   onUploadProgress:(SSDKHttpUploadProgressHandler)uploadProgressHandler
   onStateChanged:(SSDKShareStateChangedHandler)stateChangedHandler;

+ (void)stopUploadBySessionId:(NSString *)sessionId;
@end
