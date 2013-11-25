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
#import "SSQZoneUser.h"
#import "SSQZoneErrorInfo.h"
#import "SSQZoneShareInfo.h"
#import <ShareSDK/ShareSDKPlugin.h>

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
@protocol ISSQZoneApp <ISSPlatformApp>

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
- (NSString *)appId;

/**
 *	@brief	获取SSO回调地址
 *
 *	@return	SSO回调地址
 */
- (NSString *)ssoCallbackUrl;

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
       user:(id<ISSPlatformUser>)user
     result:(void(^)(id responder))result
      fault:(void(^)(CMErrorInfo *error))fault;

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
           result:(void(^)(BOOL result, id image, CMErrorInfo *error))result;

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
                     type:(NSNumber *)type
                  playUrl:(NSString *)playUrl
                     nswb:(NSNumber *)nswb
                   result:(SSShareResultEvent)result;


@end
