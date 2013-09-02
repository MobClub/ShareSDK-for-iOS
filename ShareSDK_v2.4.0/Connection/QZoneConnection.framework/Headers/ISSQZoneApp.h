//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import "ISSQZoneAuthSession.h"
#import "SSQZoneUser.h"
#import "SSQZoneErrorInfo.h"
#import "SSQZoneAlbumImage.h"
#import "SSQZoneShareInfo.h"

/**
 *	@brief	新浪微博请求方式
 */
typedef enum
{
	SSQZoneRequestMethodGet = 0, /**< GET方式 */
	SSQZoneRequestMethodPost = 1, /**< POST方式 */
	SSQZoneRequestMethodMultipartPost = 2 /**< Multipart POST方式，用于上传文件的api接口 */
}
SSQZoneRequestMethod;

/**
 *	@brief	QQ空间应用
 */
@protocol ISSQZoneApp <ISSCOpenApp>

/**
 *	@brief	获取授权帐号
 *
 *	@return	授权帐号
 */
- (id<ISSCAccount>)account;

/**
 *	@brief	获取应用Key
 *
 *	@return	应用Key
 */
- (NSString *)appKey;

/**
 *	@brief	获取应用密钥
 *
 *	@return	应用密钥
 */
- (NSString *)appSecret;

/**
 *	@brief	获取SSO回调地址
 *
 *	@return	SSO回调地址
 */
- (NSString *)ssoCallbackUrl;

/**
 *	@brief	获取是否转换链接标识
 *
 *	@return	YES 表示转换链接，NO 表示不转换链接
 */
- (BOOL)convertUrlEnabled;

/**
 *	@brief	设置是否转换链接标识
 *
 *	@param 	enabled 	YES 表示转换链接，NO 表示不转换链接
 */
- (void)setConvertUrlEnabled:(BOOL)enabled;

/**
 *	@brief	授权应用
 *
 *	@return	授权会话
 */
- (id<ISSQZoneAuthSession>)authorize;

/**
 *	@brief	SSO登录使能状态
 */
- (BOOL)ssoEnabled;

/**
 *	@brief	设置SSO登录使能状态
 */
- (void)setSsoEnabled:(BOOL)ssoEnabled;

/**
 *	@brief	注册用户信息
 *
 *	@param 	user 	用户信息
 *
 *	@return	YES 表示注册成功， NO 表示注册失败
 */
- (BOOL)registerUser:(SSQZoneUser *)user;

/**
 *	@brief	注销用户信息
 *
 *	@param 	user 	用户信息
 *
 *	@return	YES 表示注销成功， NO 表示注销失败
 */
- (BOOL)unregisterUser:(SSQZoneUser *)user;

/**
 *	@brief	获取注册用户信息
 *
 *	@param 	uid 	用户ID
 *
 *	@return	返回用户信息，nil表示尚未注册
 */
- (SSQZoneUser *)getUser:(NSString *)uid;

/**
 *	@brief	获取默认注册用户
 *
 *	@return	默认注册用户
 */
- (SSQZoneUser *)defaultUser;

/**
 *	@brief	设置默认注册用户
 *
 *	@param 	defaultUser 	默认注册用户
 */
- (void)setDefaultUser:(SSQZoneUser *)defaultUser;

/**
 *	@brief	检测用户是否已授权
 *
 *	@param 	error 	错误信息
 *
 *	@return	YES 表示没有授权，NO 表示已授权
 */
- (BOOL)checkUnauthWithError:(SSQZoneErrorInfo *)error;

/**
 *	@brief	设置凭证
 *
 *	@param 	credential 	授权凭证信息
 */
- (void)setCredential:(SSQZoneCredential *)credential;

/**
 *	@brief	处理请求打开链接
 *
 *	@param 	url 	链接
 *
 *	@return	YES 表示接受请求 NO 表示不接受
 */
- (BOOL)handleOpenURL:(NSURL *)url;


/**
 *	@brief	处理请求打开链接
 *
 *	@param 	url 	链接
 *	@param 	sourceApplication 	源应用
 *	@param 	annotation 	源应用提供的信息
 *
 *	@return	YES 表示接受请求，NO 表示不接受请求
 */
- (BOOL)handleOpenURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;

/**
 *	@brief	调用开放平台API
 *
 *	@param 	path 	路径
 *	@param 	params 	请求参数
 *  @param  user    授权用户,如果传入nil则表示默认的授权用户
 *  @param  result  返回回调
 *  @param  fault   失败回调
 */
- (void)api:(NSString *)path
     method:(SSQZoneRequestMethod)method
     params:(id<ISSCParameters>)params
       user:(SSQZoneUser *)user
     result:(void(^)(id responder))result
      fault:(void(^)(SSQZoneErrorInfo *error))fault;

/**
 *	@brief	显示默认授权用户信息
 *
 *  @param  result  返回回调
 */
- (void)showMe:(void(^)(BOOL result, SSQZoneUser *userInfo, SSQZoneErrorInfo *error))result;

/**
 *	@brief	上传照片
 *
 *	@param 	pic 	照片
 *	@param 	desc 	描述
 *	@param 	title 	标题
 *	@param 	albumid 	相册ID，为nil则表示默认相册
 */
- (void)uploadPic:(id<ISSCAttachment>)pic
             desc:(NSString *)desc
            title:(NSString *)title
          albumid:(NSString *)albumid
           result:(void(^)(BOOL result, SSQZoneAlbumImage *image, SSQZoneErrorInfo *error))result;

/**
 *	@brief	添加分享
 *
 *	@param 	title 	标题，最长36个中文字，超出部分会被截断。
 *	@param 	url 	分享所在网页资源的链接，点击后跳转至第三方网页
 *	@param 	site 	分享的来源网站名称，请填写网站申请接入时注册的网站名称
 *	@param 	fromUrl 	分享的来源网站对应的网站地址url
 *	@param 	comment 	用户评论内容，最长40个中文字，超出部分会被截断。
 *	@param 	summary 	所分享的网页资源的摘要内容，或者是网页的概要描述，最长80个中文字，超出部分会被截断。
 *	@param 	images 	所分享的网页资源的代表性图片链接
 *	@param 	type 	分享内容的类型。4表示网页；5表示视频（type=5时，必须传入playurl）。
 *	@param 	playUrl 	长度限制为256字节。仅在type=5的时候有效，表示视频的swf播放地址。
 *	@param 	nswb 	值为1时，表示分享不默认同步到微博，其他值或者不传此参数表示默认同步到微博。
 *  @param  result  返回回调
 */
- (void)addShareWithTitle:(NSString *)title
                      url:(NSString *)url
                     site:(NSString *)site
                  fromUrl:(NSString *)fromUrl
                  comment:(NSString *)comment
                  summary:(NSString *)summary
                   images:(NSArray *)images
                     type:(NSInteger)type
                  playUrl:(NSString *)playUrl
                     nswb:(NSInteger)nswb
                   result:(void(^)(SSCShareSessionState state, SSQZoneShareInfo *shareInfo, SSQZoneErrorInfo *error))result;


@end
