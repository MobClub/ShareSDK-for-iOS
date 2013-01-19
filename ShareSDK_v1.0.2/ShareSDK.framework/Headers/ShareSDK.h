//
//  SNSServiceSDK.h
//  SNSServiceSDK
//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:1955211608
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShareType.h"
#import "EventHandler.h"
#import "ISSPublishContent.h"
#import "NSArray+ShareSDK.h"
#import "SSNotifiationType.h"
#import "ShareViewStyle.h"
#import "UserParamType.h"

@interface ShareSDK : NSObject

/**
 *	@brief	注册应用,此方法在应用启动时调用一次
 *
 *	@param 	appKey 	应用Key
 */
+ (void)registerApp:(NSString *)appKey;

/**
 *	@brief	处理打开链接信息
 *
 *	@param 	url 	链接信息
 *  @param  wxDelegate  微信协议对象，用来接收微信触发的消息。如果没有集成微信接口，此处可填nil
 *
 *  @return YES：接受处理请求；NO：拒绝请求
 */
+ (BOOL)handleOpenURL:(NSURL *)url wxDelegate:(id)wxDelegate;

/**
 *	@brief	生成分享内容,不考虑发送微信或QQ平台的其他类型时使用（即只发送文本或图片）
 *
 *	@param 	content 	内容
 *  @param  defaultContent  默认内容
 *	@param 	image 	图片
 *  @param  imageQuality    图片质量,图片质量指定在分享时上传图片的质量，取值范围在0~1之间，默认0.8
 *	@param 	mediaType 	分享类型，仅用于微信和QQ平台
 *
 *	@return	分享内容
 */
+ (id<ISSPublishContent>)publishContent:(NSString *)content
                         defaultContent:(NSString *)defaultContent
                                  image:(UIImage *)image
                           imageQuality:(CGFloat)imageQuality
                              mediaType:(SSPublishContentMediaType)mediaType;


/**
 *	@brief	生成分享内容
 *
 *	@param 	content 	内容
 *  @param  defaultContent  默认内容
 *	@param 	image 	图片
 *  @param  imageQuality    图片质量,图片质量指定在分享时上传图片的质量，取值范围在0~1之间，默认0.8
 *	@param 	mediaType 	分享类型
 *	@param 	title 	标题，仅用于微信和QQ平台，当发送类型为News、Music、Video和App时有效
 *	@param 	url 	链接，仅用于微信和QQ平台，当发送类型为News、Music、Video和App时有效
 *	@param 	musicFileUrl 	音乐文件链接，仅用于微信平台，当发送类型为Music时有效
 *	@param 	extInfo 	扩展信息，仅用于微信平台，当发送类型为App时有效
 *	@param 	fileData 	文件数据，仅用于微信平台，当发送类型为App时有效
 *
 *	@return	分享内容
 */
+ (id<ISSPublishContent>)publishContent:(NSString *)content
                         defaultContent:(NSString *)defaultContent
                                  image:(UIImage *)image
                           imageQuality:(CGFloat)imageQuality
                              mediaType:(SSPublishContentMediaType)mediaType
                                  title:(NSString *)title
                                    url:(NSString *)url
                           musicFileUrl:(NSString *)musicFileUrl
                                extInfo:(NSString *)extInfo
                               fileData:(NSData *)fileData;


/**
 *	@brief	判断是否授权
 *
 *	@param 	type 	社会化平台类型
 *
 *	@return	YES 已授权； NO 未授权
 */
+ (BOOL)hasAuthorizedWithType:(ShareType)type;


/**
 *	@brief	显示授权界面
 *
 *	@param 	type    社会化平台类型
 *  @param  result    授权返回事件处理
 */
+ (void)authWithType:(ShareType)type result:(AuthEventHandler)result;

/**
 *	@brief	取消授权
 *
 *	@param 	type 	社会化平台类型
 */
+ (void)cancelAuthWithType:(ShareType)type;

/**
 *	@brief	显示分享菜单
 *
 *	@param 	containerController 	用于显示分享界面的容器视图控制器
 *	@param 	shareList 	社会化平台类型列表
 *	@param 	content 	分享内容
 *  @param  statusBarTips   状态栏提示标识：YES：显示； NO：隐藏
 *  @param  oneKeyShareList 一键显示分享列表,此参数只在shareViewStyle为ShareViewStyleDefault时有效
 *  @param  shareViewStyle  分享视图样式
 *  @param  shareViewTitle  分析视图标题
 *  @param  result  分享返回事件处理
 */
+ (void)showShareActionSheet:(UIViewController *)containerController
                   shareList:(NSArray *)shareList
                     content:(id<ISSPublishContent>)content
               statusBarTips:(BOOL)statusBarTips
             oneKeyShareList:(NSArray *)oneKeyShareList
              shareViewStyle:(ShareViewStyle)shareViewStyle
              shareViewTitle:(NSString *)shareViewTitle
                      result:(PublishContentEventHandler)result;

/**
 *	@brief	分享内容
 *
 *	@param 	shareType 	社会化平台类型
 *	@param 	content 	分享内容
 *	@param 	containerController  用于显示分享界面的容器视图控制器
 *  @param  statusBarTips   状态栏提示标识：YES：显示； NO：隐藏
 *  @param  oneKeyShareList 一键显示分享列表
 *  @param  shareViewStyle  分享视图样式
 *  @param  shareViewTitle  分析视图标题
 *  @param  result  分享返回事件处理
 */
+ (void)shareContentWithType:(ShareType)shareType
                     content:(id<ISSPublishContent>)content
         containerController:(UIViewController *)containerController
               statusBarTips:(BOOL)statusBarTips
             oneKeyShareList:(NSArray *)oneKeyShareList
              shareViewStyle:(ShareViewStyle)shareViewStyle
              shareViewTitle:(NSString *)shareViewTitle
                      result:(PublishContentEventHandler)result;

/**
 *	@brief	分享内容，此接口不弹分享界面直接分享到指定的社区平台
 *
 *	@param 	shareList 	分享的目标平台类型列表
 *	@param 	content 	分享内容
 *	@param 	statusBarTips 	状态栏提示标识：YES：显示； NO：隐藏
 *	@param 	result 	分享返回事件处理
 */
+ (void)shareContentWithShareList:(NSArray *)shareList
                          content:(id<ISSPublishContent>)content
                    statusBarTips:(BOOL)statusBarTips
                           result:(PublishContentEventHandler)result;


/**
 *	@brief	刷新离线分享
 *
 *  @param  statusBarTips   状态栏提示标识：YES：显示；NO：隐藏
 *	@param 	result 	分享事件处理
 */
+ (void)flushOfflineShare:(BOOL)statusBarTips
                   result:(PublishContentEventHandler)result;

/**
 *	@brief	获取当前授权用户信息
 *
 *	@param 	shareType 	社会化平台类型
 *  @param  result  获取用户信息返回事件
 */
+ (void)getUserInfoWithType:(ShareType)shareType
                     result:(GetUserInfoEventHandler)result;

/**
 *	@brief	关注用户(目前仅支持新浪微博和腾讯微博)
 *
 *	@param 	name 	用户名称
 *	@param 	shareType 	社会化平台类型
 *  @param  result  关注用户返回事件
 */
+ (void)followUserWithName:(NSString *)name
                 shareType:(ShareType)shareType
                    result:(FollowUserEventHandler)result;

/**
 *	@brief	关注微信号
 *
 *	@param 	userData 	用户数据
 */
+ (void)followWeixinUser:(NSString *)userData;


/**
 *	@brief	获取授权用户的关注用户列表
 *
 *	@param 	type 	社会化平台类型
 *	@param 	pageNo 	页码
 *	@param 	result 	获取关注用户返回事件
 */
+ (void)getFriendsWithType:(ShareType)type
                    pageNo:(NSInteger)pageNo
                    result:(GetFriendsEventHandler)result;


/**
 *	@brief	获取分享列表
 *
 *	@param 	shareType 	社会化平台类型
 *
 *	@return	分享列表
 */
+ (NSArray *)getShareListWithType:(ShareType)shareType,...;

/**
 *	@brief	添加通知监听
 *
 *	@param 	name 	通知名称
 *	@param 	target 	目标对象
 *	@param 	action 	处理方法
 */
+ (void)addNotificationWithName:(NSString *)name
                         target:(id)target
                         action:(SEL)action;

/**
 *	@brief	移除通知监听
 *
 *	@param 	name 	通知名称
 *	@param 	target 	目标对象
 */
+ (void)removeNotificationWithName:(NSString *)name
                            target:(id)target;

#pragma mark - Since ver1.0.1


/**
 *	@brief	显示分享菜单
 *
 *  @since  ver1.0.1
 *
 *	@param 	containerController 	用于显示分享界面的容器视图控制器
 *	@param 	shareList 	社会化平台类型列表
 *	@param 	content 	分享内容
 *  @param  statusBarTips   状态栏提示标识：YES：显示； NO：隐藏
 *  @param  oneKeyShareList 一键显示分享列表,此参数只在shareViewStyle为ShareViewStyleDefault时有效
 *  @param  autoAuth    自动授权标志，当分享内容时发现授权过期是否委托SDK处理授权问题，YES：表示委托授权， NO：表示不委托授权，需要自己根据返回值进行判断和处理
 *  @param  shareViewStyle  分享视图样式
 *  @param  shareViewTitle  分析视图标题
 *  @param  result  分享返回事件处理
 */
+ (void)showShareActionSheet:(UIViewController *)containerController
                   shareList:(NSArray *)shareList
                     content:(id<ISSPublishContent>)content
               statusBarTips:(BOOL)statusBarTips
             oneKeyShareList:(NSArray *)oneKeyShareList
                    autoAuth:(BOOL)autoAuth
              shareViewStyle:(ShareViewStyle)shareViewStyle
              shareViewTitle:(NSString *)shareViewTitle
                      result:(PublishContentEventHandler)result;


/**
 *	@brief	分享内容
 *
 *  @since  ver1.0.1
 *
 *	@param 	shareType 	社会化平台类型
 *	@param 	content 	分享内容
 *	@param 	containerController  用于显示分享界面的容器视图控制器
 *  @param  statusBarTips   状态栏提示标识：YES：显示； NO：隐藏
 *  @param  oneKeyShareList 一键显示分享列表
 *  @param  autoAuth    自动授权标志，当分享内容时发现授权过期是否委托SDK处理授权问题，YES：表示委托授权， NO：表示不委托授权，需要自己根据返回值进行判断和处理
 *  @param  shareViewStyle  分享视图样式
 *  @param  shareViewTitle  分析视图标题
 *  @param  result  分享返回事件处理
 */
+ (void)shareContentWithType:(ShareType)shareType
                     content:(id<ISSPublishContent>)content
         containerController:(UIViewController *)containerController
               statusBarTips:(BOOL)statusBarTips
             oneKeyShareList:(NSArray *)oneKeyShareList
                    autoAuth:(BOOL)autoAuth
              shareViewStyle:(ShareViewStyle)shareViewStyle
              shareViewTitle:(NSString *)shareViewTitle
                      result:(PublishContentEventHandler)result;

/**
 *	@brief	分享内容，此接口不弹分享界面直接分享到指定的社区平台
 *
 *  @since  ver1.0.1
 *
 *	@param 	shareList 	分享的目标平台类型列表
 *	@param 	content 	分享内容
 *	@param 	statusBarTips 	状态栏提示标识：YES：显示； NO：隐藏
 *  @param  autoAuth    自动授权标志，当分享内容时发现授权过期是否委托SDK处理授权问题，YES：表示委托授权， NO：表示不委托授权，需要自己根据返回值进行判断和处理
 *	@param 	result 	分享返回事件处理
 */
+ (void)shareContentWithShareList:(NSArray *)shareList
                          content:(id<ISSPublishContent>)content
                    statusBarTips:(BOOL)statusBarTips
                         autoAuth:(BOOL)autoAuth
                           result:(PublishContentEventHandler)result;

/**
 *	@brief	刷新离线分享
 *
 *  @since  ver1.0.1
 *
 *  @param  statusBarTips   状态栏提示标识：YES：显示；NO：隐藏
 *  @param  autoAuth    自动授权标志，当分享内容时发现授权过期是否委托SDK处理授权问题，YES：表示委托授权， NO：表示不委托授权，需要自己根据返回值进行判断和处理
 *	@param 	result 	分享事件处理
 */
+ (void)flushOfflineShare:(BOOL)statusBarTips
                 autoAuth:(BOOL)autoAuth
                   result:(PublishContentEventHandler)result;

/**
 *	@brief	获取当前授权用户信息
 *
 *  @since  ver1.0.1
 *
 *	@param 	shareType 	社会化平台类型
 *  @param  autoAuth    自动授权标志，当分享内容时发现授权过期是否委托SDK处理授权问题，YES：表示委托授权， NO：表示不委托授权，需要自己根据返回值进行判断和处理
 *  @param  result  获取用户信息返回事件
 */
+ (void)getUserInfoWithType:(ShareType)shareType
                   autoAuth:(BOOL)autoAuth
                     result:(GetUserInfoEventHandler)result;

/**
 *	@brief	关注用户
 *
 *  @since  ver1.0.1
 *
 *	@param 	name 	用户名称
 *	@param 	shareType 	社会化平台类型
 *  @param  autoAuth    自动授权标志，当分享内容时发现授权过期是否委托SDK处理授权问题，YES：表示委托授权， NO：表示不委托授权，需要自己根据返回值进行判断和处理
 *  @param  result  关注用户返回事件
 */
+ (void)followUserWithName:(NSString *)name
                 shareType:(ShareType)shareType
                  autoAuth:(BOOL)autoAuth
                    result:(FollowUserEventHandler)result;

/**
 *	@brief	获取授权用户的关注用户列表
 *
 *  @since  ver1.0.1
 *
 *	@param 	type 	社会化平台类型
 *	@param 	pageNo 	页码
 *  @param  autoAuth    自动授权标志，当分享内容时发现授权过期是否委托SDK处理授权问题，YES：表示委托授权， NO：表示不委托授权，需要自己根据返回值进行判断和处理
 *	@param 	result 	获取关注用户返回事件
 */
+ (void)getFriendsWithType:(ShareType)type
                    pageNo:(NSInteger)pageNo
                  autoAuth:(BOOL)autoAuth
                    result:(GetFriendsEventHandler)result;

/**
 *	@brief	获取用户信息
 *
 *	@param 	type 	社会化平台类型
 *	@param 	uid 	用户标识，标识根据参数类型来指定为用户ID或者是用户名称。
 *	@param 	parameterType 	参数类型
 *  @param  autoAuth    自动授权标志，当分享内容时发现授权过期是否委托SDK处理授权问题，YES：表示委托授权， NO：表示不委托授权，需要自己根据返回值进行判断和处理
 *  @param  result  获取用户信息返回事件
 */
+ (void)getUserInfoWithType:(ShareType)type
                        uid:(NSString *)uid
              parameterType:(UserParamType)parameterType
                   autoAuth:(BOOL)autoAuth
                     result:(GetUserInfoEventHandler)result;


@end
