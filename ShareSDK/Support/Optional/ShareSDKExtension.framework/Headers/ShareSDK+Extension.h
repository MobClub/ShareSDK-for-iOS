//
//  ShareSDK+Extension.h
//  ShareSDKExtension
//
//  Created by fenghj on 15/7/28.
//  Copyright (c) 2015年 mob. All rights reserved.
//

#import <ShareSDK/ShareSDK.h>
#import "SSETypeDefine.h"

/**
 *  ShareSDK扩展类目
 */
@interface ShareSDK (Extension)

/**
 *  是否安装客户端（支持平台：微博、微信、QQ、QZone、Facebook）
 *
 *  @param platformType 平台类型
 *
 *  @return YES 已安装，NO 尚未安装
 */
+ (BOOL)isClientInstalled:(SSDKPlatformType)platformType;

/**
 *  根据API接口返回的原始数据来创建用户对象
 *
 *  @param rawData 原始数据
 *  @param platformType 平台类型
 *
 *  @return 用户信息对象
 */
+ (SSDKUser *)userByRawData:(NSDictionary *)rawData forPlatformType:(SSDKPlatformType)platformType;

/**
 *  添加/关注好友
 *
 *  @param platformType       平台类型
 *  @param user               添加/关注用户信息，注：用户信息中的Id或者name项必须有一项填写（不同平台要求不一样），其他字段可选填
 *  @param stateChangedHandler 状态变更回调处理
 */
+ (void)addFriend:(SSDKPlatformType)platformType
             user:(SSDKUser *)user
   onStateChanged:(SSDKAddFriendStateChangedHandler)stateChangedHandler;

/**
 *  添加好友
 *
 *  @param platformType         平台类型
 *  @param user                 需要加为好友的用户信息
 *  @param authorizeHandler     授权处理器
 *  @param viewDisplayHandler   视图显示处理器
 *  @param stateChangedHandler  状态变更回调处理器
 */
+ (void)addFriend:(SSDKPlatformType)platformType
             user:(SSDKUser *)user
      onAuthorize:(SSDKNeedAuthorizeHandler)authorizeHandler
    onViewDisplay:(SSDKAddFriendViewDisplayHandler)viewDisplayHandler
   onStateChanged:(SSDKAddFriendStateChangedHandler)stateChangedHandler;

/**
 *  获取好友列表
 *
 *  @param platformType       平台类型
 *  @param cursor             分页游标
 *  @param size               分页大小
 *  @param stateChangeHandler 状态变更回调处理
 */
+ (void)getFriends:(SSDKPlatformType)platformType
            cursor:(NSUInteger)cursor
              size:(NSUInteger)size
    onStateChanged:(SSDKGetFriendsStateChangedHandler)stateChangedHandler;

/**
 *  获取好友列表
 *
 *  @param platformType       平台类型
 *  @param cursor             分页游标
 *  @param size               分页大小
 *  @param authorizeHandler   授权处理器
 *  @param stateChangeHandler 状态变更回调处理
 */
+ (void)getFriends:(SSDKPlatformType)platformType
            cursor:(NSUInteger)cursor
              size:(NSUInteger)size
       onAuthorize:(SSDKNeedAuthorizeHandler)authorizeHandler
    onStateChanged:(SSDKGetFriendsStateChangedHandler)stateChangedHandler;

#pragma - mark 原Base层

/**
 *  调用分享平台API
 *
 *  @param type                平台类型
 *  @param url                 接口请求地址
 *  @param method              请求方式：GET/POST/DELETE
 *  @param parameters          请求参数
 *  @param authorizeHandler    授权处理器
 *  @param stateChangedHandler 状态变更回调处理
 */
+ (void)callApi:(SSDKPlatformType)type
            url:(NSString *)url
         method:(NSString *)method
     parameters:(NSMutableDictionary *)parameters
    onAuthorize:(SSDKNeedAuthorizeHandler)authorizeHandler
 onStateChanged:(SSDKCallApiStateChangedHandler)stateChangedHandler;

/**
 *  调用分享平台API
 *
 *  @since v3.1.4
 *
 *  @param type                平台类型
 *  @param url                 接口请求地址
 *  @param method              请求方式：GET/POST/DELETE
 *  @param parameters          请求参数
 *  @param headers             请求头
 *  @param authorizeHandler    授权处理器
 *  @param stateChangedHandler 状态变更回调处理
 */
+ (void)callApi:(SSDKPlatformType)type
            url:(NSString *)url
         method:(NSString *)method
     parameters:(NSMutableDictionary *)parameters
        headers:(NSMutableDictionary *)headers
    onAuthorize:(SSDKNeedAuthorizeHandler)authorizeHandler
 onStateChanged:(SSDKCallApiStateChangedHandler)stateChangedHandler;


@end
