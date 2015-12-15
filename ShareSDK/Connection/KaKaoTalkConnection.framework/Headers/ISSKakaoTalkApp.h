//
//  ISSKakaoTalkApp.h
//  KakaoTalkConnection
//
//  Created by chenjd on 15/9/8.
//  Copyright (c) 2015年 Mob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDK/ShareSDKPlugin.h>
@protocol ISSKakaoTalkApp <ISSPlatformApp>

/**
 *  分享文本内容
 *
 *  @param content 文本内容
 *  @param result 回调
 */
- (void) shareContentWithText:(NSString *)content result:(SSShareResultEvent)result;

/**
 *  分享图片
 *
 *  @param content    文字内容
 *  @param attachment 图片
 *  @param imageSizeValue  图片尺寸
 *  @param result    回调
 */
- (void) shareContentWithText:(NSString *)content
                          pic:(id<ISSCAttachment>)attachment
               imageSizeValue:(NSValue *)imageSizeValue
                       result:(SSShareResultEvent)result;


/**
 *  分享链接
 *
 *  @param content          文字内容
 *  @param attachment       图片
 *  @param imageSizeValue   图片尺寸
 *  @param newsTitle        链接标题
 *  @param url              链接
 *  @param result           回调
 */
- (void) shareContentWithText:(NSString *)content
                          pic:(id<ISSCAttachment>)attachment
               imageSizeValue:(NSValue *)imageSizeValue
                    newsTitle:(NSString *)newsTitle
                          url:(NSString *)url
                       result:(SSShareResultEvent)result;

/**
 *  分享应用
 *
 *  @param content          文本内容
 *  @param attachment       图片
 *  @param imageSizeValue   图片尺寸
 *  @param newsTitle        链接标题
 *  @param url              链接
 *  @param appTitle         应用标题
 *  @param andriodParam     启动安卓版应用时传入参数
 *  @param iphoneParam      启动iPhone版应用时传入参数
 *  @param ipadParam        启动iPad版应用时传入参数
 *  @param result           回调
 */
- (void) shareContentWithText:(NSString *)content
                          pic:(id<ISSCAttachment>)attachment
               imageSizeValue:(NSValue *)imageSizeValue
                    newsTitle:(NSString *)newsTitle
                          url:(NSString *)url
                     appTitle:(NSString *)appTitle
             andriodExecParam:(NSDictionary *)andriodParam
              iphoneExecParam:(NSDictionary *)iphoneParam
                ipadExecParam:(NSDictionary *)ipadParam
                       result:(SSShareResultEvent)result;
@end
