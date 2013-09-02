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
#import "SSWeChatErrorInfo.h"
#import "SSWeChatTypeDef.h"

/**
 *	@brief	微信应用协议
 */
@protocol ISSWeChatApp <ISSCOpenApp>

/**
 *	@brief	登录帐户
 *
 *	@return	帐户信息
 */
- (id<ISSCAccount>)account;


/**
 *	@brief	获取应用ID
 *
 *	@return	应用ID
 */
- (NSString *)appId;

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
 *	@brief	处理请求打开链接
 *
 *	@param 	url 	链接
 *  @param  wxDelegate  微信委托
 *
 *	@return	YES 表示接受请求 NO 表示不接受
 */
- (BOOL)handleOpenURL:(NSURL *)url wxDelegate:(id)wxDelegate;


/**
 *	@brief	处理请求打开链接
 *
 *	@param 	url 	链接
 *	@param 	sourceApplication 	源应用
 *	@param 	annotation 	源应用提供的信息
 *  @param  wxDelegate  微信委托
 *
 *	@return	YES 表示接受请求，NO 表示不接受请求
 */
- (BOOL)handleOpenURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation wxDelegate:(id)wxDelegate;

/**
 *	@brief	发送文本消息
 *
 *	@param 	content 	内容
 *	@param 	scene 	类型
 *  @param  result  返回回调
 */
- (void)sendText:(NSString *)content
           scene:(SSWeChatScene)scene
          result:(void(^)(SSCShareSessionState state, SSWeChatScene scene, SSWeChatErrorInfo *error))result;

/**
 *	@brief	发送图片消息
 *
 *  @param  title   标题
 *  @param  description 描述
 *	@param 	pic 	图片
 *	@param 	scene 	类型
 *  @param  result  返回回调
 */
- (void)sendPic:(NSString *)title
    description:(NSString *)description
            pic:(id<ISSCAttachment>)pic
          scene:(SSWeChatScene)scene
         result:(void(^)(SSCShareSessionState state, SSWeChatScene scene, SSWeChatErrorInfo *error))result;

/**
 *	@brief	发送新闻消息
 *
 *	@param 	title 	标题
 *	@param 	content 	内容
 *	@param 	pic 	预览图
 *	@param 	url 	链接
 *	@param 	scene 	类型
 *  @param  result  返回回调
 */
- (void)sendNews:(NSString *)title
         content:(NSString *)content
             pic:(id<ISSCAttachment>)pic
             url:(NSString *)url
           scene:(SSWeChatScene)scene
          result:(void(^)(SSCShareSessionState state, SSWeChatScene scene, SSWeChatErrorInfo *error))result;

/**
 *	@brief	发送音乐消息
 *
 *	@param 	title 	标题
 *	@param 	content 	内容
 *	@param 	pic 	预览图
 *	@param 	url 	链接
 *  @param  musicFileUrl    音乐文件路径
 *	@param 	scene 	类型
 *  @param  result  返回回调
 */
- (void)sendMusic:(NSString *)title
          content:(NSString *)content
              pic:(id<ISSCAttachment>)pic
              url:(NSString *)url
     musicFileUrl:(NSString *)musicFileUrl
            scene:(SSWeChatScene)scene
           result:(void(^)(SSCShareSessionState state, SSWeChatScene scene, SSWeChatErrorInfo *error))result;

/**
 *	@brief	发送视频消息
 *
 *	@param 	title 	标题
 *	@param 	content 	内容
 *	@param 	pic 	预览图
 *	@param 	url 	链接
 *	@param 	scene 	类型
 *  @param  result  返回回调
 */
- (void)sendVideo:(NSString *)title
          content:(NSString *)content
              pic:(id<ISSCAttachment>)pic
              url:(NSString *)url
            scene:(SSWeChatScene)scene
           result:(void(^)(SSCShareSessionState state, SSWeChatScene scene, SSWeChatErrorInfo *error))result;

/**
 *	@brief	发送App信息
 *
 *	@param 	title 	标题
 *	@param 	content 	内容
 *	@param 	pic 	预览图
 *	@param 	url 	链接
 *	@param 	extInfo 	扩展信息
 *	@param 	fileData 	文件数据
 *	@param 	scene 	类型
 *  @param  result  返回回调
 */
- (void)sendApp:(NSString *)title
        content:(NSString *)content
            pic:(id<ISSCAttachment>)pic
            url:(NSString *)url
        extInfo:(NSString *)extInfo
       fileData:(NSData *)fileData
          scene:(SSWeChatScene)scene
         result:(void(^)(SSCShareSessionState state, SSWeChatScene scene, SSWeChatErrorInfo *error))result;


/**
 *	@brief	发送非Gif图
 *
 *	@param 	pic 	预览图
 *	@param 	emoticonData 	图片数据
 *	@param 	scene 	类型
 *  @param  result  返回回调
 */
- (void)sendNonGif:(id<ISSCAttachment>)pic
      emoticonData:(NSData *)emoticonData
             scene:(SSWeChatScene)scene
            result:(void(^)(SSCShareSessionState state, SSWeChatScene scene, SSWeChatErrorInfo *error))result;

/**
 *	@brief	发送Gif图
 *
 *	@param 	pic 	预览图
 *	@param 	emoticonData 	图片数据
 *	@param 	scene 	类型
 *  @param  result  返回回调
 */
- (void)sendGif:(id<ISSCAttachment>)pic
   emoticonData:(NSData *)emoticonData
          scene:(SSWeChatScene)scene
         result:(void(^)(SSCShareSessionState state, SSWeChatScene scene, SSWeChatErrorInfo *error))result;


/**
 *	@brief	关注微信公众帐号
 *
 *	@param 	qrCodeData 	公众帐号的二维码数据
 */
- (void)followUser:(NSString *)qrCodeData;


@end
