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
#import "Base/ShareType.h"
#import "Base/EventHandler.h"
#import "Base/ISSPublishContent.h"
#import "Base/NSArray+ShareSDK.h"
#import "Base/SSNotifiationType.h"
#import "Base/ShareViewStyle.h"
#import "Base/UserParamType.h"
#import "Base/IMailAttachment.h"
#import "Base/IShareViewOptions.h"
#import "Base/IAuthOptions.h"
#import "Base/AuthViewStyle.h"
#import "Base/IOAuth2ClientToken.h"
#import "Base/IOAuthClientToken.h"
#import "Base/IAttachment.h"
#import "Base/IShareContainer.h"
#import "Base/ISSShareActionSheetItem.h"
#import "Base/ISSImage.h"
#import "Base/ITwitterPage.h"
#import "Base/ICommPage.h"

/**
 *	@brief	将ShareType转换为NSNumber类型
 *
 *	@param 	type 	分享平台类型
 */
#define SHARE_TYPE_NUMBER(type) [NSNumber numberWithInteger:type]


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
 *  @deprecated     此方法已过时，建议使用getFriendsWithType:page:authOptions:result:;方法代替
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
+ (NSArray *)getShareListWithType:(ShareType)shareType, ... NS_REQUIRES_NIL_TERMINATION;

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
 *  @deprecated     此方法已过时，建议使用getFriendsWithType:page:authOptions:result:;方法代替
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

#pragma mark - Since ver1.1.0

/**
 *	@brief	显示分享菜单
 *
 *  @since  ver1.1.0
 *
 *	@param 	containerController 	用于显示分享界面的容器视图控制器
 *	@param 	shareList 	社会化平台类型列表
 *	@param 	content 	分享内容
 *  @param  statusBarTips   状态栏提示标识：YES：显示； NO：隐藏
 *  @param  oneKeyShareList 一键显示分享列表,此参数只在shareViewStyle为ShareViewStyleDefault时有效
 *  @param  autoAuth    自动授权标志，当分享内容时发现授权过期是否委托SDK处理授权问题，YES：表示委托授权， NO：表示不委托授权，需要自己根据返回值进行判断和处理
 *  @param  convertUrl  转换URL链接，YES：表示转换链接。NO：表示不转换链接，设置不转换链接后分享内容中的链接将不纳入回流统计中。
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
                  convertUrl:(BOOL)convertUrl
              shareViewStyle:(ShareViewStyle)shareViewStyle
              shareViewTitle:(NSString *)shareViewTitle
                      result:(PublishContentEventHandler)result;


/**
 *	@brief	分享内容
 *
 *  @since  ver1.1.0
 *
 *	@param 	shareType 	社会化平台类型
 *	@param 	content 	分享内容
 *	@param 	containerController  用于显示分享界面的容器视图控制器
 *  @param  statusBarTips   状态栏提示标识：YES：显示； NO：隐藏
 *  @param  oneKeyShareList 一键显示分享列表
 *  @param  autoAuth    自动授权标志，当分享内容时发现授权过期是否委托SDK处理授权问题，YES：表示委托授权， NO：表示不委托授权，需要自己根据返回值进行判断和处理
 *  @param  convertUrl  转换URL链接，YES：表示转换链接。NO：表示不转换链接，设置不转换链接后分享内容中的链接将不纳入回流统计中。
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
                  convertUrl:(BOOL)convertUrl
              shareViewStyle:(ShareViewStyle)shareViewStyle
              shareViewTitle:(NSString *)shareViewTitle
                      result:(PublishContentEventHandler)result;

/**
 *	@brief	分享内容，此接口不弹分享界面直接分享到指定的社区平台
 *
 *  @since  ver1.1.0
 *
 *	@param 	shareList 	分享的目标平台类型列表
 *	@param 	content 	分享内容
 *	@param 	statusBarTips 	状态栏提示标识：YES：显示； NO：隐藏
 *  @param  autoAuth    自动授权标志，当分享内容时发现授权过期是否委托SDK处理授权问题，YES：表示委托授权， NO：表示不委托授权，需要自己根据返回值进行判断和处理
 *  @param  convertUrl  转换URL链接，YES：表示转换链接。NO：表示不转换链接，设置不转换链接后分享内容中的链接将不纳入回流统计中。
 *	@param 	result 	分享返回事件处理
 */
+ (void)shareContentWithShareList:(NSArray *)shareList
                          content:(id<ISSPublishContent>)content
                    statusBarTips:(BOOL)statusBarTips
                         autoAuth:(BOOL)autoAuth
                       convertUrl:(BOOL)convertUrl
                           result:(PublishContentEventHandler)result;

/**
 *	@brief	刷新离线分享
 *
 *  @since  ver1.1.0
 *
 *  @param  statusBarTips   状态栏提示标识：YES：显示；NO：隐藏
 *  @param  autoAuth    自动授权标志，当分享内容时发现授权过期是否委托SDK处理授权问题，YES：表示委托授权， NO：表示不委托授权，需要自己根据返回值进行判断和处理
 *  @param  convertUrl  转换URL链接，YES：表示转换链接。NO：表示不转换链接，设置不转换链接后分享内容中的链接将不纳入回流统计中。
 *	@param 	result 	分享事件处理
 */
+ (void)flushOfflineShare:(BOOL)statusBarTips
                 autoAuth:(BOOL)autoAuth
               convertUrl:(BOOL)convertUrl
                   result:(PublishContentEventHandler)result;


/**
 *	@brief	创建邮件附件对象,在分享内容附加附件信息时使用此方法创建附件对象
 *
 *  @since  ver1.1.0
 *
 *	@param 	data 	附件数据
 *	@param 	mimeType 	附件类型
 *	@param 	fileName 	附件文件名称
 *
 *	@return	附件结构
 */
+ (id<IMailAttachment>)mailAttachment:(NSData *)data
                             mimeType:(NSString *)mimeType
                             fileName:(NSString *)fileName;

#pragma mark - Since ver1.1.2

/**
 *	@brief	SSO登录方式使能
 *
 *  @since  ver1.1.2
 *
 *	@param 	ssoEnabled 	YES表示使用SSO方式登录，NO表示不使用SSO方式登录，默认为YES
 */
+ (void)ssoEnabled:(BOOL)ssoEnabled;

/**
 *	@brief	显示分享菜单
 *
 *  @since  ver1.1.2
 *
 *	@param 	containerController 	用于显示分享界面的容器视图控制器
 *	@param 	shareList 	社会化平台类型列表
 *	@param 	content 	分享内容
 *  @param  statusBarTips   状态栏提示标识：YES：显示； NO：隐藏
 *  @param  autoAuth    自动授权标志，当分享内容时发现授权过期是否委托SDK处理授权问题，YES：表示委托授权， NO：表示不委托授权，需要自己根据返回值进行判断和处理
 *  @param  convertUrl  转换URL链接，YES：表示转换链接。NO：表示不转换链接，设置不转换链接后分享内容中的链接将不纳入回流统计中。
 *  @param  shareViewOptions    分享视图选项，用于定义分享视图部分属性（如：标题、一键分享列表、功能按钮等）
 *  @param  result  分享返回事件处理
 */
+ (void)showShareActionSheet:(UIViewController *)containerController
                   shareList:(NSArray *)shareList
                     content:(id<ISSPublishContent>)content
               statusBarTips:(BOOL)statusBarTips
                    autoAuth:(BOOL)autoAuth
                  convertUrl:(BOOL)convertUrl
            shareViewOptions:(id<IShareViewOptions>)shareViewOptions
                      result:(PublishContentEventHandler)result;


/**
 *	@brief	分享内容
 *
 *  @since  ver1.1.2
 *
 *	@param 	shareType 	社会化平台类型
 *	@param 	content 	分享内容
 *	@param 	containerController  用于显示分享界面的容器视图控制器
 *  @param  statusBarTips   状态栏提示标识：YES：显示； NO：隐藏
 *  @param  autoAuth    自动授权标志，当分享内容时发现授权过期是否委托SDK处理授权问题，YES：表示委托授权， NO：表示不委托授权，需要自己根据返回值进行判断和处理
 *  @param  convertUrl  转换URL链接，YES：表示转换链接。NO：表示不转换链接，设置不转换链接后分享内容中的链接将不纳入回流统计中。
 *  @param  shareViewOptions    分享视图选项，用于定义分享视图部分属性（如：标题、一键分享列表、功能按钮等）
 *  @param  result  分享返回事件处理
 */
+ (void)shareContentWithType:(ShareType)shareType
                     content:(id<ISSPublishContent>)content
         containerController:(UIViewController *)containerController
               statusBarTips:(BOOL)statusBarTips
                    autoAuth:(BOOL)autoAuth
                  convertUrl:(BOOL)convertUrl
            shareViewOptions:(id<IShareViewOptions>)shareViewOptions
                      result:(PublishContentEventHandler)result;


/**
 *	@brief	创建默认分享样式视图选项
 *
 *  @since  ver1.1.2
 *
 *	@param 	title 	标题
 *	@param 	oneKeyShareList 	一键显示分享列表
 *	@param 	qqButtonHidden 	工具栏中QQ按钮的隐藏，默认为NO
 *	@param 	wxSessionButtonHidden 	工具栏中微信好友按钮的隐藏，默认为NO
 *	@param 	wxTimelineButtonHidden 	工具栏中微信朋友圈按钮的隐藏，默认为NO
 *
 *	@return	视图选项对象
 */
+ (id<IShareViewOptions>)defaultShareViewOptionsWithTitle:(NSString *)title
                                          oneKeyShareList:(NSArray *)oneKeyShareList
                                           qqButtonHidden:(BOOL)qqButtonHidden
                                    wxSessionButtonHidden:(BOOL)wxSessionButtonHidden
                                   wxTimelineButtonHidden:(BOOL)wxTimelineButtonHidden;

/**
 *	@brief	创建简约分享样式视图选项
 *
 *  @since  ver1.1.2
 *
 *	@param 	title 	标题
 *
 *	@return	视图选项对象
 */
+ (id<IShareViewOptions>)simpleShareViewOptionWithTitle:(NSString *)title;

/**
 *	@brief	创建应用推荐分享样式视图选项
 *
 *  @since  ver1.1.2
 *
 *	@param 	title 	标题
 *
 *	@return	视图选项对象
 */
+ (id<IShareViewOptions>)appRecommendShareViewOptionWithTitle:(NSString *)title;

#pragma mark - Since ver1.1.4

/**
 *	@brief	创建授权选项
 *
 *  @since  ver1.1.4
 *
 *	@param 	autoAuth 	自动授权标志，当分享内容时发现授权过期是否委托SDK处理授权问题，YES：表示委托授权， NO：表示不委托授权，需要自己根据返回值进行判断和处理
 *	@param 	authViewStyle 	授权视图样式，参考AuthViewStyle枚举类型
 *
 *	@return	授权选项
 */
+ (id<IAuthOptions>)authOptionsWithAutoAuth:(BOOL)autoAuth
                              authViewStyle:(AuthViewStyle)authViewStyle;


/**
 *	@brief	显示分享菜单
 *
 *  @since  ver1.1.4
 *
 *	@param 	containerController 	用于显示分享界面的容器视图控制器
 *	@param 	shareList 	社会化平台类型列表
 *	@param 	content 	分享内容
 *  @param  statusBarTips   状态栏提示标识：YES：显示； NO：隐藏
 *  @param  convertUrl  转换URL链接，YES：表示转换链接。NO：表示不转换链接，设置不转换链接后分享内容中的链接将不纳入回流统计中。
 *  @param  authOptions 授权选项，用于指定接口在需要授权时的一些属性（如：是否自动授权，授权视图样式等）
 *  @param  shareViewOptions    分享视图选项，用于定义分享视图部分属性（如：标题、一键分享列表、功能按钮等）
 *  @param  result  分享返回事件处理
 */
+ (void)showShareActionSheet:(UIViewController *)containerController
                   shareList:(NSArray *)shareList
                     content:(id<ISSPublishContent>)content
               statusBarTips:(BOOL)statusBarTips
                  convertUrl:(BOOL)convertUrl
                 authOptions:(id<IAuthOptions>)authOptions
            shareViewOptions:(id<IShareViewOptions>)shareViewOptions
                      result:(PublishContentEventHandler)result;


/**
 *	@brief	分享内容
 *
 *  @since  ver1.1.4
 *
 *	@param 	shareType 	社会化平台类型
 *	@param 	content 	分享内容
 *	@param 	containerController  用于显示分享界面的容器视图控制器
 *  @param  statusBarTips   状态栏提示标识：YES：显示； NO：隐藏
 *  @param  convertUrl  转换URL链接，YES：表示转换链接。NO：表示不转换链接，设置不转换链接后分享内容中的链接将不纳入回流统计中。
 *  @param  authOptions 授权选项，用于指定接口在需要授权时的一些属性（如：是否自动授权，授权视图样式等）
 *  @param  shareViewOptions    分享视图选项，用于定义分享视图部分属性（如：标题、一键分享列表、功能按钮等）
 *  @param  result  分享返回事件处理
 */
+ (void)shareContentWithType:(ShareType)shareType
                     content:(id<ISSPublishContent>)content
         containerController:(UIViewController *)containerController
               statusBarTips:(BOOL)statusBarTips
                  convertUrl:(BOOL)convertUrl
                 authOptions:(id<IAuthOptions>)authOptions
            shareViewOptions:(id<IShareViewOptions>)shareViewOptions
                      result:(PublishContentEventHandler)result;

/**
 *	@brief	分享内容，此接口不弹分享界面直接分享到指定的社区平台
 *
 *  @since  ver1.1.4
 *
 *	@param 	shareList 	分享的目标平台类型列表
 *	@param 	content 	分享内容
 *	@param 	statusBarTips 	状态栏提示标识：YES：显示； NO：隐藏
 *  @param  convertUrl  转换URL链接，YES：表示转换链接。NO：表示不转换链接，设置不转换链接后分享内容中的链接将不纳入回流统计中。
 *  @param  authOptions 授权选项，用于指定接口在需要授权时的一些属性（如：是否自动授权，授权视图样式等）
 *	@param 	result 	分享返回事件处理
 */
+ (void)shareContentWithShareList:(NSArray *)shareList
                          content:(id<ISSPublishContent>)content
                    statusBarTips:(BOOL)statusBarTips
                       convertUrl:(BOOL)convertUrl
                      authOptions:(id<IAuthOptions>)authOptions
                           result:(PublishContentEventHandler)result;

/**
 *	@brief	刷新离线分享
 *
 *  @since  ver1.1.4
 *
 *  @param  statusBarTips   状态栏提示标识：YES：显示；NO：隐藏
 *  @param  convertUrl  转换URL链接，YES：表示转换链接。NO：表示不转换链接，设置不转换链接后分享内容中的链接将不纳入回流统计中。
 *  @param  authOptions 授权选项，用于指定接口在需要授权时的一些属性（如：是否自动授权，授权视图样式等）
 *	@param 	result 	分享事件处理
 */
+ (void)flushOfflineShare:(BOOL)statusBarTips
               convertUrl:(BOOL)convertUrl
              authOptions:(id<IAuthOptions>)authOptions
                   result:(PublishContentEventHandler)result;

/**
 *	@brief	获取当前授权用户信息
 *
 *  @since  ver1.1.4
 *
 *	@param 	shareType 	社会化平台类型
 *  @param  authOptions 授权选项，用于指定接口在需要授权时的一些属性（如：是否自动授权，授权视图样式等）
 *  @param  result  获取用户信息返回事件
 */
+ (void)getUserInfoWithType:(ShareType)shareType
                authOptions:(id<IAuthOptions>)authOptions
                     result:(GetUserInfoEventHandler)result;

/**
 *	@brief	关注用户
 *
 *  @since  ver1.1.4
 *
 *	@param 	name 	用户名称
 *	@param 	shareType 	社会化平台类型
 *  @param  authOptions 授权选项，用于指定接口在需要授权时的一些属性（如：是否自动授权，授权视图样式等）
 *  @param  result  关注用户返回事件
 */
+ (void)followUserWithName:(NSString *)name
                 shareType:(ShareType)shareType
               authOptions:(id<IAuthOptions>)authOptions
                    result:(FollowUserEventHandler)result;

/**
 *	@brief	获取授权用户的关注用户列表
 *
 *  @since  ver1.1.4
 *
 *  @deprecated     此方法已过时，建议使用getFriendsWithType:page:authOptions:result:;方法代替
 *
 *	@param 	type 	社会化平台类型
 *	@param 	pageNo 	页码
 *  @param  authOptions 授权选项，用于指定接口在需要授权时的一些属性（如：是否自动授权，授权视图样式等）
 *	@param 	result 	获取关注用户返回事件
 */
+ (void)getFriendsWithType:(ShareType)type
                    pageNo:(NSInteger)pageNo
               authOptions:(id<IAuthOptions>)authOptions
                    result:(GetFriendsEventHandler)result;

/**
 *	@brief	获取用户信息
 *
 *  @since  ver1.1.4
 *
 *	@param 	type 	社会化平台类型
 *	@param 	uid 	用户标识，标识根据参数类型来指定为用户ID或者是用户名称。
 *	@param 	parameterType 	参数类型
 *  @param  authOptions 授权选项，用于指定接口在需要授权时的一些属性（如：是否自动授权，授权视图样式等）
 *  @param  result  获取用户信息返回事件
 */
+ (void)getUserInfoWithType:(ShareType)type
                        uid:(NSString *)uid
              parameterType:(UserParamType)parameterType
                authOptions:(id<IAuthOptions>)authOptions
                     result:(GetUserInfoEventHandler)result;

/**
 *	@brief	显示授权界面
 *
 *  @since  ver1.1.4    增加授权选项
 *
 *	@param 	type    社会化平台类型
 *  @param  options 授权选项，用于指定接口在需要授权时的一些属性（如：是否自动授权，授权视图样式等）
 *  @param  result    授权返回事件处理
 */
+ (void)authWithType:(ShareType)type
             options:(id<IAuthOptions>)options
              result:(AuthEventHandler)result;

/**
 *	@brief	获取客户端授权令牌
 *
 *  @since  ver1.1.4
 *
 *	@param 	type 	社会化平台类型
 *
 *	@return	客户端授权令牌对象,如果客户端为OAuth授权则对象类型为IOAuthClientToken,如果客户端为OAuth2授权则对象类型为IOAuth2ClientToken,
 *          如果指定的平台类型非OAuth验证(微信，QQ)或者尚未授权则返回nil
 */
+ (id<IClientToken>)getClientTokenWithType:(ShareType)type;

#pragma mark - Since ver1.2.0

/**
 *	@brief	创建附件信息,用于设置有道云笔记平台的附件信息。
 *
 *  @since  ver1.2.0
 *
 *	@param 	data 	附件数据
 *	@param 	mimeType 	附件类型
 *  @param  fileName    附件名称
 *
 *	@return	附件信息
 */
+ (id<IAttachment>)attachmentWithData:(NSData *)data mimeType:(NSString *)mimeType fileName:(NSString *)fileName;

/**
 *	@brief	创建分页对象,为提供获取关注用户列表中的page参数提供的构造方法
 *
 *  @since  ver1.2.0
 *
 *	@param 	cursor 	Twitter中游标,如果获取起始页请传入-1
 *
 *	@return 分页对象
 */
+ (id<IPage>)pageWithTwitterCursor:(long long)cursor;

/**
 *	@brief	创建分页对象,为提供获取关注用户列表中的page参数提供的构造方法
 *
 *  @since  ver1.2.0
 *
 *	@param 	pageNo 	页码
 *	@param 	pageSize 	分页尺寸
 *
 *	@return	分页对象
 */
+ (id<IPage>)pageWithPageNo:(NSInteger)pageNo pageSize:(NSInteger)pageSize;


/**
 *	@brief	获取授权用户的关注用户列表
 *
 *  @since  ver1.2.0
 *
 *	@param 	type 	社会化平台类型
 *	@param 	page 	分页对象，可以使用
 *  @param  authOptions 授权选项，用于指定接口在需要授权时的一些属性（如：是否自动授权，授权视图样式等）
 *	@param 	result 	获取关注用户返回事件
 */
+ (void)getFriendsWithType:(ShareType)type
                      page:(id<IPage>)page
               authOptions:(id<IAuthOptions>)authOptions
                    result:(GetFriendsEventHandler_1_2)result;

#pragma mark - Since ver1.2.1

/**
 *	@brief	创建iPad分享容器
 *
 *  @since  ver1.2.1
 *
 *	@param 	view 	容器视图
 *	@param 	arrowDirect 	显示分享列表方向
 *
 *	@return	分享容器
 */
+ (id<IShareContainer>)iPadShareContainerWithView:(UIView *)view
                                      arrowDirect:(UIPopoverArrowDirection)arrowDirect;

/**
 *	@brief	创建iPad分享容器
 *
 *  @since  ver1.2.1
 *
 *	@param 	view 	容器视图
 *	@param 	rect 	显示区域
 *	@param 	arrowDirect 	显示分享列表方向
 *
 *	@return	分享容器
 */
+ (id<IShareContainer>)iPadShareContainerWithView:(UIView *)view
                                             rect:(CGRect)rect
                                      arrowDirect:(UIPopoverArrowDirection)arrowDirect;



/**
 *	@brief	显示分享菜单
 *
 *  @since  ver1.2.1
 *
 *	@param 	containerController 	用于显示分享界面的容器视图控制器
 *  @param  iPadContainer       用于显示分享界面得iPad容器视图
 *	@param 	shareList 	社会化平台类型列表
 *	@param 	content 	分享内容
 *  @param  statusBarTips   状态栏提示标识：YES：显示； NO：隐藏
 *  @param  convertUrl  转换URL链接，YES：表示转换链接。NO：表示不转换链接，设置不转换链接后分享内容中的链接将不纳入回流统计中。
 *  @param  authOptions 授权选项，用于指定接口在需要授权时的一些属性（如：是否自动授权，授权视图样式等）
 *  @param  shareViewOptions    分享视图选项，用于定义分享视图部分属性（如：标题、一键分享列表、功能按钮等）
 *  @param  result  分享返回事件处理
 */
+ (void)showShareActionSheet:(UIViewController *)containerController
               iPadContainer:(id<IShareContainer>)iPadContainer
                   shareList:(NSArray *)shareList
                     content:(id<ISSPublishContent>)content
               statusBarTips:(BOOL)statusBarTips
                  convertUrl:(BOOL)convertUrl
                 authOptions:(id<IAuthOptions>)authOptions
            shareViewOptions:(id<IShareViewOptions>)shareViewOptions
                      result:(PublishContentEventHandler)result;

#pragma mark - Since ver1.2.3

/**
 *	@brief	设置客户端令牌，通过外部授权返回信息来指定ShareSDK中平台授权。
 *
 *  @since  ver1.2.3
 *
 *	@param 	token 	令牌对象
 */
+ (void)setClientToken:(id<IClientToken>)token;

/**
 *	@brief	创建客户端令牌
 *
 *  @since  ver1.2.3
 *
 *	@param 	data 	授权数据
 *	@param 	type 	平台类型
 *
 *	@return	令牌对象
 */
+ (id<IClientToken>)clientTokenWithData:(NSDictionary *)data type:(ShareType)type;

/**
 *	@brief	创建默认分享样式视图选项
 *
 *  @since  ver1.2.3
 *
 *	@param 	title 	标题
 *	@param 	oneKeyShareList 	一键显示分享列表
 *	@param 	qqButtonHidden 	工具栏中QQ按钮的隐藏，默认为NO
 *	@param 	wxSessionButtonHidden 	工具栏中微信好友按钮的隐藏，默认为NO
 *	@param 	wxTimelineButtonHidden 	工具栏中微信朋友圈按钮的隐藏，默认为NO
 *  @param  showKeyboardOnAppear    当显示视图时显示键盘, 默认为NO
 *
 *	@return	视图选项对象
 */
+ (id<IShareViewOptions>)defaultShareViewOptionsWithTitle:(NSString *)title
                                          oneKeyShareList:(NSArray *)oneKeyShareList
                                           qqButtonHidden:(BOOL)qqButtonHidden
                                    wxSessionButtonHidden:(BOOL)wxSessionButtonHidden
                                   wxTimelineButtonHidden:(BOOL)wxTimelineButtonHidden
                                     showKeyboardOnAppear:(BOOL)showKeyboardOnAppear;

/**
 *	@brief	创建自定义分享列表
 *
 *	@param 	item 分享列表项，可以为包含ShareType的NSNumber类型，也可以为由shareActionSheetItemWithTitle创建的ISSShareActionSheetItem类型对象。
 *
 *	@return	分享列表
 */
+ (NSArray *)customShareListWithType:(id)item, ... NS_REQUIRES_NIL_TERMINATION;

/**
 *	@brief	创建自定义分享菜单项
 *
 *  @since  ver1.2.3
 *
 *	@param 	title 	标题
 *	@param 	icon 	图标
 *	@param 	clickHandler 	点击事件处理器
 *
 *	@return	分享菜单项
 */
+ (id<ISSShareActionSheetItem>)shareActionSheetItemWithTitle:(NSString *)title
                                                        icon:(UIImage *)icon
                                                clickHandler:(SSShareActionSheetItemClickHandler)clickHandler;

/**
 *	@brief	设置屏幕方向,默认是所有方向
 *
 *  @since  ver1.2.3
 *
 *	@param 	interfaceOrientationMask 	屏幕方向掩码
 */
+ (void)setInterfaceOrientationMask:(UIInterfaceOrientationMask)interfaceOrientationMask;


#pragma mark - Since ver1.2.4

/**
 *	@brief	获取平台客户端名称
 *
 *  @since  ver1.2.4
 *
 *	@param 	type 	分享类型
 *
 *	@return	名称
 */
+ (NSString *)getClientNameWithType:(ShareType)type;

/**
 *	@brief	获取平台客户端图标
 *
 *  @since  ver1.2.4
 *
 *	@param 	type 	分享类型
 *
 *	@return	图标
 */
+ (UIImage *)getClientIconWithType:(ShareType)type;

/**
 *	@brief	创建发布内容
 *
 *  @since  ver1.2.4
 *
 *	@param 	content 	内容
 *	@param 	defaultContent 	默认内容
 *	@param 	imageObject 	图片对象
 *
 *	@return	发布内容对象
 */
+ (id<ISSPublishContent>)publishContent:(NSString *)content
                         defaultContent:(NSString *)defaultContent
                            imageObject:(id<ISSImage>)imageObject;

/**
 *	@brief	创建JPEG图片对象
 *
 *  @since  ver1.2.4
 *
 *	@param 	image 	图片
 *	@param 	quality 	图片质量
 *  @param  fileName    文件名称，如果为nil则默认image.jpg
 *
 *	@return	JPEG图片对象
 */
+ (id<ISSImage>)jpegImage:(UIImage *)image quality:(CGFloat)quality fileName:(NSString *)fileName;

/**
 *	@brief	创建JPEG图片对象
 *
 *  @since  ver1.2.4
 *
 *	@param 	data 	图片数据
 *  @param  fileName    文件名称，如果为nil则默认image.jpg
 *
 *	@return	JPEG图片对象
 */
+ (id<ISSImage>)jpegImageWithData:(NSData *)data fileName:(NSString *)fileName;

/**
 *	@brief	创建GIF图片对象
 *
 *  @since  ver1.2.4
 *
 *	@param 	data 	图片数据
 *  @param  fileName    文件名称，如果为nil则默认为image.gif
 *
 *	@return	GIF图片对象
 */
+ (id<ISSImage>)gifImageWithData:(NSData *)data fileName:(NSString *)fileName;

/**
 *	@brief	创建图片对象
 *
 *  @since  ver1.2.4
 *
 *	@param 	file 	文件路径
 *
 *	@return	图片对象
 */
+ (id<ISSImage>)imageWithContentOfFile:(NSString *)file;

/**
 *	@brief	创建iPad分享容器
 *
 *  @since  ver1.2.4
 *
 *	@param 	buttonItem 	导航栏/工具栏按钮项
 *	@param 	arrowDirect 	显示分享列表方向
 *
 *	@return	分享容器
 */
+ (id<IShareContainer>)iPadShareContainerWithBarButtonItem:(UIBarButtonItem *)buttonItem
                                               arrowDirect:(UIPopoverArrowDirection)arrowDirect;

/**
 *	@brief	设置统计设备信息使能状态, 默认为YES
 *
 *  @since  ver1.2.4
 *
 *	@param 	enabled 	使能状态
 */
+ (void)statDeviceEnabled:(BOOL)enabled;

/**
 *	@brief	设置统计用户信息使能状态，默认为YES
 *
 *  @since  ver1.2.4
 *
 *	@param 	enabled 	使能状态
 */
+ (void)statUserEnabled:(BOOL)enabled;

/**
 *	@brief	设置统计分享信息使能状态，默认为YES
 *
 *  @since  ver1.2.4
 *
 *	@param 	enabled 	使能状态
 */
+ (void)statShareEnabled:(BOOL)enabled;

/**
 *	@brief	注册应用,此方法在应用启动时调用一次
 *
 *  @since  ver1.2.4
 *
 *	@param 	appKey 	应用Key
 *  @param  statDeviceEnabled   统计设备使能
 *  @param  statUserEnabled     统计用户使能
 *  @param  statShareEnabled    统计分享使能
 */
+ (void)registerApp:(NSString *)appKey
  statDeviceEnabled:(BOOL)statDeviceEnabled
    statUserEnabled:(BOOL)statUserEnabled
   statShareEnabled:(BOOL)statShareEnabled;


@end
