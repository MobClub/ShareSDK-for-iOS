//
//  SSDKTypeDefine.h
//  ShareSDK
//
//  Created by 冯 鸿杰 on 15/2/6.
//  Copyright (c) 2015年 掌淘科技. All rights reserved.
//

#ifndef ShareSDK_SSDKTypeDefine_h
#define ShareSDK_SSDKTypeDefine_h

@protocol ISSDKAuthView;

@class SSDKUser;
@class SSDKFriendsPaging;
@class SSDKContentEntity;
@class UIView;
@class SSDKAddFriendView;

/**
 *  结合SSO和Web授权方式
 */
extern NSString *const SSDKAuthTypeBoth;
/**
 *  SSO授权方式
 */
extern NSString *const SSDKAuthTypeSSO;
/**
 *  网页授权方式
 */
extern NSString *const SSDKAuthTypeWeb;

/**
 *  HTTP的GET请求方式
 */
extern NSString *const SSDKHttpMethodGet;
/**
 *  HTTP的POST请求方式
 */
extern NSString *const SSDKHttpMethodPost;
/**
 *  HTTP的DELETE请求方式
 */
extern NSString *const SSDKHttpMethodDelete;
/**
 *  HTTP的PUT请求方式
 */
extern NSString *const SSDKHttpMethodPut;
/**
 *  HTTP的HEAD请求方式
 */
extern NSString *const SSDKHttpMethodHead;

/**
 *  授权设置键名， 其对应键值为NSArray，数组中元素为NSString，如:@{SSDKAuthSettingKeyScopes : @[@"all", @"mail"]}
 */
extern NSString *const SSDKAuthSettingKeyScopes;

/**
 *  平台类型
 */
typedef NS_ENUM(NSUInteger, SSDKPlatformType){
    /**
     *  未知
     */
    SSDKPlatformTypeUnknown             = 0,
    /**
     *  新浪微博
     */
    SSDKPlatformTypeSinaWeibo           = 1,
    /**
     *  腾讯微博
     */
    SSDKPlatformTypeTencentWeibo        = 2,
    /**
     *  豆瓣
     */
    SSDKPlatformTypeDouBan              = 5,
    /**
     *  QQ空间
     */
    SSDKPlatformSubTypeQZone            = 6,
    /**
     *  人人网
     */
    SSDKPlatformTypeRenren              = 7,
    /**
     *  开心网
     */
    SSDKPlatformTypeKaixin              = 8,
    /**
     *  Facebook
     */
    SSDKPlatformTypeFacebook            = 10,
    /**
     *  Twitter
     */
    SSDKPlatformTypeTwitter             = 11,
    /**
     *  印象笔记
     */
    SSDKPlatformTypeYinXiang            = 12,
    /**
     *  Google+
     */
    SSDKPlatformTypeGooglePlus          = 14,
    /**
     *  Instagram
     */
    SSDKPlatformTypeInstagram           = 15,
    /**
     *  LinkedIn
     */
    SSDKPlatformTypeLinkedIn            = 16,
    /**
     *  Tumblr
     */
    SSDKPlatformTypeTumblr              = 17,
    /**
     *  邮件
     */
    SSDKPlatformTypeMail                = 18,
    /**
     *  短信
     */
    SSDKPlatformTypeSMS                 = 19,
    /**
     *  打印
     */
    SSDKPlatformTypePrint               = 20,
    /**
     *  拷贝
     */
    SSDKPlatformTypeCopy                = 21,
    /**
     *  微信好友
     */
    SSDKPlatformSubTypeWechatSession    = 22,
    /**
     *  微信朋友圈
     */
    SSDKPlatformSubTypeWechatTimeline   = 23,
    /**
     *  QQ好友
     */
    SSDKPlatformSubTypeQQFriend         = 24,
    /**
     *  Instapaper
     */
    SSDKPlatformTypeInstapaper          = 25,
    /**
     *  Pocket
     */
    SSDKPlatformTypePocket              = 26,
    /**
     *  有道云笔记
     */
    SSDKPlatformTypeYouDaoNote          = 27,
    /**
     *  Pinterest
     */
    SSDKPlatformTypePinterest           = 30,
    /**
     *  Flickr
     */
    SSDKPlatformTypeFlickr              = 34,
    /**
     *  Dropbox
     */
    SSDKPlatformTypeDropbox             = 35,
    /**
     *  VKontakte
     */
    SSDKPlatformTypeVKontakte           = 36,
    /**
     *  微信收藏
     */
    SSDKPlatformSubTypeWechatFav        = 37,
    /**
     *  易信好友
     */
    SSDKPlatformSubTypeYiXinSession     = 38,
    /**
     *  易信朋友圈
     */
    SSDKPlatformSubTypeYiXinTimeline    = 39,
    /**
     *  易信收藏
     */
    SSDKPlatformSubTypeYiXinFav         = 40,
    /**
     *  明道
     */
    SSDKPlatformTypeMingDao             = 41,
    /**
     *  Line
     */
    SSDKPlatformTypeLine                = 42,
    /**
     *  WhatsApp
     */
    SSDKPlatformTypeWhatsApp            = 43,
    /**
     *  KaKao Talk
     */
    SSDKPlatformSubTypeKakaoTalk        = 44,
    /**
     *  KaKao Story
     */
    SSDKPlatformSubTypeKakaoStory       = 45,
    /**
     *  Facebook Messenger
     */
    SSDKPlatformTypeFacebookMessenger   = 46,
    /**
     *  支付宝好友
     */
    SSDKPlatformTypeAliPaySocial        = 50,
    /**
     *  支付宝朋友圈
     */
    SSDKPlatformTypeAliPaySocialTimeline= 51,
    /**
     *  钉钉
     */
    SSDKPlatformTypeDingTalk            = 52,
    /**
     *  易信
     */
    SSDKPlatformTypeYiXin               = 994,
    /**
     *  KaKao
     */
    SSDKPlatformTypeKakao               = 995,
    /**
     *  印象笔记国际版
     */
    SSDKPlatformTypeEvernote            = 996,
    /**
     *  微信平台,
     */
    SSDKPlatformTypeWechat              = 997,
    /**
     *  QQ平台
     */
    SSDKPlatformTypeQQ                  = 998,
    /**
     *  任意平台
     */
    SSDKPlatformTypeAny                 = 999
};

/**
 *  印象笔记服务器类型
 */
typedef NS_ENUM(NSUInteger, SSDKEvernoteHostType){
    /**
     *  沙箱
     */
    SSDKEvernoteHostTypeSandbox         = 0,
    /**
     *  印象笔记
     */
    SSDKEvernoteHostTypeCN              = 1,
    /**
     *  Evernote International
     */
    SSDKEvernoteHostTypeUS              = 2,
};

/**
 *  回复状态
 */
typedef NS_ENUM(NSUInteger, SSDKResponseState){
    
    /**
     *  开始
     */
    SSDKResponseStateBegin     = 0,
    
    /**
     *  成功
     */
    SSDKResponseStateSuccess    = 1,
    
    /**
     *  失败
     */
    SSDKResponseStateFail       = 2,
    
    /**
     *  取消
     */
    SSDKResponseStateCancel     = 3
};

/**
 *  内容类型
 */
typedef NS_ENUM(NSUInteger, SSDKContentType){
    
    /**
     *  自动适配类型，视传入的参数来决定
     */
    SSDKContentTypeAuto         = 0,
    
    /**
     *  文本
     */
    SSDKContentTypeText         = 1,
    
    /**
     *  图片
     */
    SSDKContentTypeImage        = 2,
    
    /**
     *  网页
     */
    SSDKContentTypeWebPage      = 3,
    
    /**
     *  应用
     */
    SSDKContentTypeApp          = 4,
    
    /**
     *  音频
     */
    SSDKContentTypeAudio        = 5,
    
    /**
     *  视频
     */
    SSDKContentTypeVideo        = 6,
    
    /**
     *  文件类型(暂时仅微信可用)
     */
    SSDKContentTypeFile         = 7

};

/**
 *  配置分享平台回调处理器
 *
 *  @param platformType 需要初始化的分享平台类型
 *  @param appInfo      需要初始化的分享平台应用信息
 */
typedef void(^SSDKConfigurationHandler) (SSDKPlatformType platformType, NSMutableDictionary *appInfo);

/**
 *  导入原平台SDK回调处理器
 *
 *  @param platformType 需要导入原平台SDK的平台类型
 */
typedef void(^SSDKImportHandler) (SSDKPlatformType platformType);

/**
 *  授权视图显示回调处理器
 *
 *  @param view 授权视图
 */
typedef void(^SSDKAuthorizeViewDisplayHandler) (UIView<ISSDKAuthView> *view);

/**
 *  添加好友视图显示回调处理器，仅用于Facebook添加好友时触发
 *
 *  @param view 添加好友视图
 */
typedef void(^SSDKAddFriendViewDisplayHandler) (SSDKAddFriendView *view);

/**
 *  授权状态变化回调处理器
 *
 *  @param state      状态
 *  @param user       授权用户信息，当且仅当state为SSDKResponseStateSuccess时返回
 *  @param error      错误信息，当且仅当state为SSDKResponseStateFail时返回
 */
typedef void(^SSDKAuthorizeStateChangedHandler) (SSDKResponseState state, SSDKUser *user, NSError *error);

/**
 *  获取用户状态变更回调处理器
 *
 *  @param state 状态
 *  @param user  用户信息，当且仅当state为SSDKResponseStateSuccess时返回
 *  @param error 错误信息，当且仅当state为SSDKResponseStateFail时返回
 */
typedef void(^SSDKGetUserStateChangedHandler) (SSDKResponseState state, SSDKUser *user, NSError *error);


/**
 *  分享内容状态变更回调处理器
 *
 *  @param state            状态
 *  @param userData         附加数据, 返回状态以外的一些数据描述，如：邮件分享取消时，标识是否保存草稿等
 *  @param contentEntity    分享内容实体,当且仅当state为SSDKResponseStateSuccess时返回
 *  @param error            错误信息,当且仅当state为SSDKResponseStateFail时返回
 */
typedef void(^SSDKShareStateChangedHandler) (SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity,  NSError *error);

/**
 *  调用API状态变更回调处理器
 *
 *  @param state            状态
 *  @param data             返回数据
 *  @param error            错误信息
 */
typedef void(^SSDKCallApiStateChangedHandler)(SSDKResponseState state, id data, NSError *error);

/**
 *  需要授权回调处理器
 *
 *  @param authorizeStateChangedHandler 授权状态回调
 */
typedef void(^SSDKNeedAuthorizeHandler)(SSDKAuthorizeStateChangedHandler authorizeStateChangedHandler);

#endif
