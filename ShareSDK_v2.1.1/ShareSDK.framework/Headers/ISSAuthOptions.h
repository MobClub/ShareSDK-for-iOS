//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ISSViewDelegate.h"

/**
 *	@brief	授权选项
 */
@protocol ISSAuthOptions <NSObject,
                          NSCopying>

/**
 *	@brief	获取视图样式
 *
 *  @return 视图样式
 */
- (SSAuthViewStyle)viewStyle;

/**
 *	@brief	设置视图样式
 *
 *	@param 	viewStyle 	视图样式
 */
- (void)setViewStyle:(SSAuthViewStyle)viewStyle;

/**
 *	@brief	自动授权标志，当分享内容时发现授权过期是否委托SDK处理授权问题，YES：表示委托授权， NO：表示不委托授权，需要自己根据返回值进行判断和处理
 *
 *  @return 自动授权标识
 */
- (BOOL)autoAuth;

/**
 *	@brief	设置自动授权标识,当分享内容时发现授权过期是否委托SDK处理授权问题，YES：表示委托授权， NO：表示不委托授权，需要自己根据返回值进行判断和处理
 *
 *	@param 	autoAuth 	自动授权标识
 */
- (void)setAutoAuth:(BOOL)autoAuth;

/**
 *	@brief	是否允许授权后回调到服务器，默认为YES，对于没有服务器或者不需要回调服务器的应用可以设置为NO
 *
 *  @return YES表示回调服务器，NO表示不回调服务器
 */
- (BOOL)allowCallback;

/**
 *	@brief	设置是否允许授权后回调服务器
 *
 *	@param 	allowCallback 	YES表示回调服务器，NO表示不回调服务器
 */
- (void)setAllowCallback:(BOOL)allowCallback;

/**
 *	@brief	获取授权视图协议委托
 *  
 *  @return 协议委托
 */
- (id<ISSViewDelegate>)viewDelegate;

/**
 *	@brief	设置授权视图协议委托
 *
 *	@param 	viewDelegate 	协议委托
 */
- (void)setViewDelegate:(id<ISSViewDelegate>)viewDelegate;

/**
 *	@brief	授权管理视图协议委托
 */
- (id<ISSViewDelegate>)authManagerViewDelegate;

/**
 *	@brief	设置授权管理视图协议委托
 *
 *	@param 	authManagerViewDelegate 	协议委托
 */
- (void)setAuthManagerViewDelegate:(id<ISSViewDelegate>)authManagerViewDelegate;

/**
 *	@brief	获取授权权限
 *
 *	@return	授权权限
 */
- (NSDictionary *)scopes;

/**
 *	@brief	设置授权权限
 *
 *	@param 	scopes 	授权权限
 */
- (void)setScopes:(NSDictionary *)scopes;

/**
 *	@brief	获取版权隐藏标识
 *
 *	@return	YES 表示隐藏， NO 表示不隐藏
 */
- (BOOL)powerByHidden;

/**
 *	@brief	设置版本信息隐藏标识
 *
 *	@param 	powerByHidden 	YES 表示隐藏， NO 表示不隐藏
 */
- (void)setPowerByHidden:(BOOL)powerByHidden;

/**
 *	@brief	获取关注帐号
 *
 *	@return	关注帐号的字典结构
 */
- (NSDictionary *)followAccounts;

/**
 *	@brief	设置关注帐号
 *
 *	@param 	followAccounts 	关注帐号的字典结构
 */
- (void)setFollowAccounts:(NSDictionary *)followAccounts;

/**
 *	@brief	拷贝授权选项对象
 *
 *	@return	授权选项对象
 */
- (id<ISSAuthOptions>)clone;


@end
