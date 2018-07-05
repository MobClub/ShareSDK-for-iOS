//
//  TYRZUILogin.h
//  TYRZ
//
//  Created by 林涛 on 2017/6/21.
//  Copyright © 2017年 林涛. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
//一键登录页（无短信验证码） 值类型：NSDictionary
FOUNDATION_EXPORT NSString *const UAAuthPage;
//快捷登录页（有短信验证码） 值类型：NSDictionary
FOUNDATION_EXPORT NSString *const UASMSPage;
//导航栏左上返回logo 值类型：UIImage
FOUNDATION_EXPORT NSString *const UAPageNavLeftLogo;
//导航背景色 值类型：UIColor
FOUNDATION_EXPORT NSString *const UAPageNavBackgroundColor;
//导航标题 值类型：NSString
FOUNDATION_EXPORT NSAttributedString *const UAPageNavTitle;
//导航栏右上角 值类型：UIButton 传入按钮目的是让开发者可以自行控制按钮的点击方法
FOUNDATION_EXPORT NSString *const UAPageNavRightItem;
//logo图标 值类型：UIImage
FOUNDATION_EXPORT NSString *const UAPageContentLogo;
//号码区域底色 值类型：UIColor
FOUNDATION_EXPORT NSString *const UAPageContentPhoneNumberBGColor;
//手机号码清除图标（短信验证页）值类型：UIImage
FOUNDATION_EXPORT NSString *const UAPageContentPhoneNumberClearImage;
//短信验证码区域底色 值类型：UIColor
FOUNDATION_EXPORT NSString *const UAPageContentSMSCodeBGColor;
//切换账号按钮隐藏开关 NSNumber @(YES)或者@(NO)
FOUNDATION_EXPORT NSString *const UAPageContentAccountSwitchHidden;
//按钮背景颜色 值类型：UIColor
FOUNDATION_EXPORT NSString *const UAPageContentLoginButtonBGColor;
//按钮不可点击背景颜色 值类型：UIColor
FOUNDATION_EXPORT NSString *const UAPageContentLoginButtonUnableBGColor;
//按钮背景图片 值类型：UIImage
FOUNDATION_EXPORT NSString *const UAPageContentLoginButtonBGImage;
//按钮不可点击背景图 值类型：UIImage
FOUNDATION_EXPORT NSString *const UAPageContentLoginButtonUnableBGImage;
//按钮圆角半径 值类型：NSNumber（针对按钮的高度设置）
FOUNDATION_EXPORT NSString *const UAPageContentLoginButtonCornerRadius;
//按钮标题字体 值类型：UIFont
FOUNDATION_EXPORT NSString *const UAPageContentLoginButtonTitleFont;
//按钮标题颜色 值类型：UIColor
FOUNDATION_EXPORT NSString *const UAPageContentLoginButtonTitleColor;
//按钮标题文本 值类型：NSString
FOUNDATION_EXPORT NSString *const UAPageContentLoginButtonTitle;
//logo下的分割线隐藏开关 (NSNumber) @(YES)或者@(NO)
FOUNDATION_EXPORT NSString *const UAPageContentSeperatorHidden;
*/

@interface TYRZUILogin : NSObject

/**
 SDK版本号
 */
@property (nonatomic,class,readonly) NSString *sdkVersion;

/**
 初始化SDK参数

 @param appId 申请能力平台成功后，分配给网站的appId
 @param appKey 申请能力平台成功后，分配给网站的appKey
 */
+ (void)initializeWithAppId:(NSString *)appId appKey:(NSString *)appKey;

/**
 控制台日志输出控制（默认关闭）

 @param enable 开关参数
 */
+ (void)printConsoleEnable:(BOOL)enable;

//预取号
+ (void)preGetPhonenumber:(void (^)(id sender))complete;

/**
 自定义UI样式参数

 @param customUIParams UI样式参数（见顶部声明的key）
 @param customViews 自定义视图
 */
+ (void)customUIWithParams:(NSDictionary *)customUIParams
               customViews:(void(^)(NSDictionary *customAreaView))customViews;

/**
 自定义短信验证码开关

 @param flag 开关标记
 */
+ (void)enableCustomSMS:(BOOL)flag;

//显式登录
+ (void)getTokenExpWithController:(UIViewController *)vc
                         complete:(void (^)(id sender))complete;

//隐式登录
+ (void)getTokenImpWithComplete:(void (^)(id sender))complete;

@end
