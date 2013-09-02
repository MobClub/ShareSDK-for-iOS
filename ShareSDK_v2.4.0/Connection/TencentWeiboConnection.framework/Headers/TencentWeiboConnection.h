//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ISSTencentWeiboApp.h"

/**
 *	@brief	腾讯微博链接器
 */
@interface TencentWeiboConnection : NSObject


/**
 *	@brief	注册应用,同一个AppKey只需要注册一次。
 *
 *  @param  account 授权帐号，使用ShareSDK注册的应用Key换取。
 *	@param 	appKey 	应用Key
 *	@param 	appSecret 	应用密钥
 *	@param 	redirectUri 	回调地址
 *  @param  wbApiCls    腾讯微博Api类型，引入WBApi.h，并将[WBApi class]传入参数，注：不使用SSO时可以传入nil
 *
 *	@return	应用对象,返回nil则表示应用注册失败。
 */
+ (id<ISSTencentWeiboApp>)registerApp:(id<ISSCAccount>)account
                               appKey:(NSString *)appKey
                            appSecret:(NSString *)appSecret
                          redirectUri:(NSString *)redirectUri
                             wbApiCls:(Class)wbApiCls;

/**
 *	@brief	注销应用
 *
 *	@param 	app 	应用对象
 *
 *	@return	YES表示注销成功，NO表示注销失败
 */
+ (BOOL)unregisterApp:(id<ISSTencentWeiboApp>)app;


/**
 *	@brief	取的已注册新浪应用
 *
 *	@param 	appKey 	应用Key
 *
 *	@return	应用对象，返回nil则表示应用尚未注册
 */
+ (id<ISSTencentWeiboApp>)getApp:(NSString *)appKey;

/**
 *	@brief	创建授权凭证
 *
 *	@param 	sourceData 	源数据
 *
 *	@return	授权凭证
 */
+ (SSTencentWeiboCredential *)credentialWithData:(NSDictionary *)sourceData;

/**
 *	@brief	创建授权凭证
 *
 *	@param 	credentialData 	授权数据
 *
 *	@return	授权凭证
 */
+ (SSTencentWeiboCredential *)credentialWithCredentialData:(NSDictionary *)credentialData;

/**
 *	@brief	获取错误描述
 *
 *	@param 	code 	错误码
 *	@param 	ret 	返回值
 *	@param 	request 	请求地址
 *
 *	@return	错误描述
 */
+ (NSString *)getErrorDescriptionWithCode:(NSInteger)code
                                      ret:(NSInteger)ret
                                  request:(NSString *)request;


@end
