///#begin zh-cn
//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
///#end
///#begin en
//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
///#end

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import "SSFlickrUser.h"
#import "SSFlickrErrorInfo.h"
#import "SSFlickrCredential.h"
#import "SSFlickrPhoto.h"
#import <ShareSDK/ShareSDKPlugin.h>

///#begin zh-cn
/**
 *	@brief	Flickr应用协议
 */
///#end
///#begin en
/**
 *	@brief	Flickr App Protocol.
 */
///#end
@protocol ISSFlickrApp <ISSPlatformApp>

///#begin zh-cn
/**
 *	@brief	获取消费者Key
 *
 *	@return	消费者Key
 */
///#end
///#begin en
/**
 *	@brief	Get consumer key.
 *
 *	@return	Consumer key.
 */
///#end
- (NSString *)consumerKey;

///#begin zh-cn
/**
 *	@brief	获取消费者密钥
 *
 *	@return	消费者密钥
 */
///#end
///#begin en
/**
 *	@brief	Get consumer secret.
 *
 *	@return	Consuemr secret.
 */
///#end
- (NSString *)consumerSecret;

///#begin zh-cn
/**
 *	@brief	上传图片
 *
 *	@param 	photo 	图片对象
 *	@param 	title 	标题
 *	@param 	description 	相片描述。可能包含某受限的 HTML。
 *	@param 	tags 	適用於相片的以空格分隔的標籤清單。
 *	@param 	isPublic 	設定為 0 表示否，1 表示是。指定誰可以檢視相片。
 *	@param 	isFriend 	設定為 0 表示否，1 表示是。指定誰可以檢視相片。
 *	@param 	isFamily 	設定為 0 表示否，1 表示是。指定誰可以檢視相片。
 *	@param 	safetyLevel 	設置 1 為「安全級」、2 為「輔導級」、3 為「限制級」。
 *	@param 	contentType 	設置 1 為「相片」、2 為「螢幕截圖」、3 為「其他」。
 *	@param 	hidden 	設置 1 為「相片」、2 為「螢幕截圖」、3 為「其他」。
 *  @param  result  返回回调
 */
///#end
///#begin en
/**
 *	@brief	Upload image.
 *
 *	@param 	photo 	Image object.
 *	@param 	title 	Title string.
 *	@param 	description 	Image description。Contains restricted HTML。
 *	@param 	tags 	Apply to the photo space-separated list of labels。
 *	@param 	isPublic 	Set to 0 for no, 1 means yes. Specify who can view photos。
 *	@param 	isFriend 	Set to 0 for no, 1 means yes. Specify who can view photos。
 *	@param 	isFamily 	Set to 0 for no, 1 means yes. Specify who can view photos。
 *	@param 	safetyLevel 	Set to 1 "safe level", 2 "PG", 3 "X-rated"
 *	@param 	contentType 	Set to 1 is the "Photo", 2 "screen shots", 3 "Other."
 *	@param 	hidden 	Set to 1 is the "Photo", 2 "screen shots", 3 "Other."
 *  @param  result  Result handler.
 */
///#end
- (void)uploadPhoto:(id<ISSCAttachment>)photo
              title:(NSString *)title
        description:(NSString *)description
               tags:(NSString *)tags
           isPublic:(NSNumber *)isPublic
           isFriend:(NSNumber *)isFriend
           isFamily:(NSNumber *)isFamily
        safetyLevel:(NSNumber *)safetyLevel
        contentType:(NSNumber *)contentType
             hidden:(NSNumber *)hidden
             result:(SSShareResultEvent)result;

@end
