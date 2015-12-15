//
//  ISSKakaoStoryApp.h
//  KakaoStoryConnection
//
//  Created by chenjd on 15/11/17.
//  Copyright © 2015年 Mob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDK/ShareSDKPlugin.h>

@protocol ISSKakaoStoryApp <ISSPlatformApp>

/**
 *  设定是否通过客户客户端分享(仅用于Text分享)
 *
 *  @param enable YES/NO 是/否
 *  
 *  注：若要通过客户端进行Text类型分享时,仅支持通过接口 [ShareSDK shareContent:type:authOptions:shareOptions:statusBarTips:result:]
 *  进行分享,不支持通过分享编辑页面和分享菜单进行分享。
 */
- (void)setIsEnableClientShare:(BOOL)enable;

/**
 *  文本分享
 *
 *  @param content          文本内容
 *  @param iphoneMarkParam  iphone应用下载地址
 *  @param androidMarkParam 安卓应用下载地址
 *  @param permission       查看权限
 *  @param enaleShare       是否允许二次分享
 *  @param aResult          回调
 */
- (void) shareContentWithText:(NSString *)content
            iphoneMarketParam:(NSString *)iphoneMarkParam
           androidMarketParam:(NSString *)androidMarkParam
                   permission:(NSString *)permission
                  enableShare:(BOOL)enaleShare
                       result:(SSShareResultEvent)result;

/**
 *  图片分享
 *
 *  @param content          文本内容
 *  @param images           图片(支持数组)
 *  @param iphoneMarkParam  iphone应用下载地址
 *  @param androidMarkParam 安卓应用下载地址
 *  @param permission       查看权限
 *  @param enaleShare       是否允许二次分享
 *  @param result           回调
 */
- (void) shareContentWithText:(NSString *)content
                       images:(id)images
            iphoneMarketParam:(NSString *)iphoneMarkParam
           androidMarketParam:(NSString *)androidMarkParam
                   permission:(NSString *)permission
                  enableShare:(BOOL)enaleShare
                       result:(SSShareResultEvent)result;


/**
 *  图片分享
 *
 *  @param content          文本内容
 *  @param url              链接地址
 *  @param iphoneMarkParam  iphone应用下载地址
 *  @param androidMarkParam 安卓应用下载地址
 *  @param permission       查看权限
 *  @param enaleShare       是否允许二次分享
 *  @param result           回调
 */
- (void) shareContentWithText:(NSString *)content
                          url:(NSString *)url
            iphoneMarketParam:(NSString *)iphoneMarkParam
           androidMarketParam:(NSString *)androidMarkParam
                   permission:(NSString *)permission
                  enableShare:(BOOL)enaleShare
                       result:(SSShareResultEvent)result;

@end
