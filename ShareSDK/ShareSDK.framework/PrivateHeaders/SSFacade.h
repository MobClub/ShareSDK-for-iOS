//
//  SSFacade.h
//  ShareSDKInterface
//
//  Created by 冯 鸿杰 on 13-3-29.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import <AGCommon/CMImageCacheManager.h>
#import "SSStatusBar.h"
#import "SSContainer.h"

#import "SSPopover.h"
#import "SSShareOptions.h"
#import "SSPage.h"

#ifdef __SHARESDK_HEADER__
#import "ShareSDKTypeDef.h"
#import "ShareSDKPlugin.h"
#import "ShareSDKEventHandlerDef.h"
#else
#import "../Headers/ShareSDKTypeDef.h"
#import "../Headers/ShareSDKPlugin.h"
#import "../Headers/ShareSDKEventHandlerDef.h"
#endif

/**
 *	@brief	前置器
 */
@interface SSFacade : NSObject
{
@private
    id<ISSCAccount> _account;
    NSMutableDictionary *_platformConfig;                   //用于记录Platform类型对应的PlatformType
    NSMutableDictionary *_connectedPlatforms;
    NSMutableArray *_connectedPlatformTypes;
    SSStatusBar *_statusBar;
    
    CMImageCacheManager *_imageCacheManager;
    id<ISSShareActionSheet> _popover;
    SSInterfaceOrientationMask _interfaceOrientationMask;   //屏幕方向掩码
    BOOL _initializedPlatInfo;
    BOOL _getingPlatInfo;
    
    dispatch_queue_t _waitingQueue;
    dispatch_semaphore_t _getAppSettingSema;
    SSUIStyle _uiStyle;
}

/**
 *	@brief	图片缓存管理器
 */
@property (nonatomic,readonly) CMImageCacheManager *imageCacheManager;

/**
 *	@brief	授权账号
 */
@property (nonatomic,readonly) id<ISSCAccount> account;

/**
 *	@brief	已连接的平台列表
 */
@property (nonatomic,readonly) NSDictionary *connectedPlatforms;

/**
 *	@brief	已连接平台的类型列表
 */
@property (nonatomic,readonly) NSArray *connectedPlatformTypes;

/**
 *	@brief	屏幕方向掩码
 */
@property (nonatomic) SSInterfaceOrientationMask interfaceOrientationMask;

/**
 *	@brief	应用托管标识
 */
@property (nonatomic) BOOL useAppTrusteeship;

/**
 *	@brief	UI风格
 */
@property (nonatomic) SSUIStyle uiStyle;


/**
 *	@brief	获取前置器共享实例
 *
 *	@return	前置器对象
 */
+ (SSFacade *)sharedInstance;

#pragma mark 配置

/**
 *	@brief	更新应用信息
 */
- (void)updateAppSetting;

#pragma mark 辅助

/**
 *	@brief	获取平台应用
 *
 *	@param 	type 	平台类型
 *
 *	@return	平台应用
 */
- (id<ISSPlatformApp>)getPlatformAppWithType:(ShareType)type;


/**
 *	@brief	获取客户端名称
 *
 *	@param 	shareType 	平台类型
 *
 *	@return	名称
 */
- (NSString *)getOpenAppNameWithType:(ShareType)shareType;

/**
 *	@brief	获取客户端图标
 *
 *  @since  ver1.2.4
 *
 *	@param 	shareType 	分享类型
 *
 *	@return	图标
 */
- (UIImage *)getOpenAppIconWithType:(ShareType)shareType;

/**
 *	@brief	允许旋转屏幕方向
 *
 *	@param 	toInterfaceOrientation 	目标屏幕方向
 *
 *	@return	YES 表示允许旋转, NO 不允许。
 */
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation;

/**
 *	@brief	获取容器视图控制器
 *
 *	@return	视图控制器
 */
- (UIViewController *)getContainerViewController;

/**
 *	@brief	添加立即显示状态栏消息
 *
 *	@param 	message 	消息内容
 *	@param 	icon 	图标
 *	@param 	loading 	是否显示等待提示
 */
- (void)addStatusBarImmediMessage:(NSString *)message
                             icon:(UIImage *)icon
                          loading:(BOOL)loading;

/**
 *	@brief	显示永久状态栏消息
 *
 *	@param 	message 	消息内容
 *	@param 	icon 	图标
 *	@param 	loading 	是否显示等待提示
 */
- (void)showStatusBarAlwaysMessage:(NSString *)message
                              icon:(UIImage *)icon
                           loading:(BOOL)loading;

/**
 *	@brief	隐藏永久状态栏消息
 */
- (void)hideStatusBarAlwaysMessage;

/**
 *	@brief	获取错误提示
 *
 *	@param 	error 	错误对象
 *  @param  shareType   平台类型
 *
 *	@return	错误提示
 */
- (NSString *)getErrorTips:(id<ICMErrorInfo>)error shareType:(ShareType)shareType;

/**
 *	@brief	获取默认用户信息
 *
 *	@param 	shareType 	平台类型
 *
 *	@return	默认用户信息
 */
- (id<ISSPlatformUser>)defaultUserInfoWithType:(ShareType)shareType;

/**
 *	@brief	创建弹出窗口管理器
 *
 *	@param 	container 	容器
 *	@param 	shareList 	分享列表
 *  @param  clickHandler    点击菜单项事件
 *  @param  cancelHandler   取消事件
 */
- (id<ISSShareActionSheet>)popoverWithContainer:(SSContainer *)container
                                      ShareList:(NSArray *)shareList
                                   clickHandler:(void(^)(ShareType type))clickHandler
                                  cancelHandler:(void(^)())cancelHandler;

/**
 *	@brief	创建授权凭证
 *
 *  @param  type    平台类型
 *	@param 	uid 	授权用户标识
 *	@param 	token 	访问令牌，在OAuth中为oauth_token，在OAuth2中为access_token
 *	@param 	secret 	访问令牌密钥，仅用于OAuth授权中，为oauth_token_secret。
 *	@param 	expired 	过期时间，仅用于OAuth2授权中，需要将返回的秒数转换为时间。
 *	@param 	extInfo 	扩展信息。用于存放除上述信息外的其它信息。
 *
 *	@return	授权凭证
 */
- (id<ISSPlatformCredential>)credentialWithType:(ShareType)type
                                            uid:(NSString *)uid
                                         token:(NSString *)token
                                        secret:(NSString *)secret
                                       expired:(NSDate *)expired
                                       extInfo:(NSDictionary *)extInfo;



/**
 *	@brief	等待获取应用设置
 *
 *  @param  completeHandler     完成事件
 */
- (void)waitGetAppSetting:(void(^)())completeHandler;

/**
 *	@brief	判断客户端是否安装
 *
 *	@param 	type 	平台类型
 *
 *	@return	YES 表示安装， NO 表示尚未安装
 */
- (BOOL)isClientInstalledWithType:(ShareType)type;


#pragma mark 授权

/**
 *	@brief	获取授权凭证
 *
 *	@param 	type 	类型
 *
 *	@return	授权凭证
 */
- (id<ISSPlatformCredential>)getCredentialType:(ShareType)type;

/**
 *	@brief	设置授权凭证
 *
 *	@param 	credential 	凭证
 *	@param 	type 	类型
 */
- (void)setCredential:(id<ISSPlatformCredential>)credential type:(ShareType)type;

/**
 *	@brief	创建授权控制器，此方法用于自定义授权页面时使用,可以自由控制授权UI及过程。(注：微信、QQ、邮件、短信、打印、拷贝类型不支持授权功能。)
 *
 *	@param 	type 	平台类型
 *
 *	@return	授权会话
 */
- (id<ISSPlatformAuthSession>)authorizeController:(ShareType)type;


/**
 *	@brief	判断是否授权,微信、QQ、邮件、短信、打印、拷贝类型不支持授权功能。
 *
 *	@param 	type 	社会化平台类型
 *
 *	@return	YES 已授权； NO 未授权
 */
- (BOOL)hasAuthorizedWithType:(ShareType)type;

/**
 *	@brief	取消授权,微信、QQ、邮件、短信、打印、拷贝类型不支持授权功能。
 *
 *	@param 	type 	社会化平台类型
 */
- (void)cancelAuthWithType:(ShareType)type;

/**
 *	@brief	检查应用是否尚未授权
 *
 *	@param 	type 	平台类型
 *	@param 	error 	错误信息
 *
 *	@return	YES 尚未授权，NO 已经授权
 */
- (BOOL)checkUnauthWithType:(ShareType)type error:(id<ICMErrorInfo>)error;

#pragma mark 用户信息

/**
 *	@brief	获取默认用户信息
 *
 *	@param 	type 	平台类型
 *	@param 	result 	返回事件
 */
- (void)getDefaultUserInfo:(ShareType)type result:(SSGetUserInfoResultEvent)result;

/**
 *	@brief	获取用户信息
 *
 *  @param  type    平台类型
 *	@param 	field 	用户标识字段值
 *	@param 	fieldType 	用户标识类型
 *	@param 	result 	返回事件
 */
- (void)getUserInfo:(ShareType)type
              field:(NSString *)field
          fieldType:(SSUserFieldType)fieldType
             result:(SSGetUserInfoResultEvent)result;

#pragma mark 关系

/**
 *	@brief	关注用户
 *
 *	@param 	type 	平台类型
 *	@param 	field 	用户标识字段值
 *	@param 	fieldType 	用户标识字段类型
 *  @param  viewDelegate    视图委托
 *	@param 	result 	返回事件
 */
- (void)followUser:(ShareType)type
             field:(NSString *)field
         fieldType:(SSUserFieldType)fieldType
      viewDelegate:(id<ISSViewDelegate>)viewDelegate
            result:(SSAddFriendResultEvent)result;

/**
 *	@brief	获取好友列表
 *
 *	@param 	type 	平台类型
 *	@param 	page 	分页信息
 *	@param 	result 	返回事件
 */
- (void)getMyFriends:(ShareType)type
                page:(SSPage *)page
              result:(SSFriendsResultEvent)result;

#pragma mark 分享

/**
 *	@brief	分享内容
 *
 *	@param 	content 	内容单元
 *	@param 	shareType   平台类型
 *  @param  shareOptions    授权选项
 *	@param 	result 	返回时间
 */
- (void)shareContent:(id<ISSContent>)content
           shareType:(ShareType)shareType
        shareOptions:(SSShareOptions *)shareOptions
              resutl:(SSShareResultEvent)result;

/**
 *	@brief	使用客户端分享内容
 *
 *	@param 	content 	内容单元
 *	@param 	shareType 	平台类型
 *  @param  result      返回时间
 */
- (void)clientShareContent:(id<ISSContent>)content
                 shareType:(ShareType)shareType
                    resutl:(SSShareResultEvent)result;


@end
