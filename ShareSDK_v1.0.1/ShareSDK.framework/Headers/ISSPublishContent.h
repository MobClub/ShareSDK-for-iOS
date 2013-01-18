//
//  ISSPublishContent.h
//  AppgoFramework
//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:1955211608
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	分享内容的消息类型，仅对微信、QQApi有效
 */
typedef enum
{
	SSPublishContentMediaTypeText = 0, /**< 文本 */
	SSPublishContentMediaTypeImage = 1, /**< 图片 */
	SSPublishContentMediaTypeNews = 2, /**< 新闻 */
	SSPublishContentMediaTypeMusic = 3, /**< 音乐 */
	SSPublishContentMediaTypeVideo = 4, /**< 视频 */
    SSPublishContentMediaTypeApp = 5 /**< 应用,仅供微信使用 */
}
SSPublishContentMediaType;

/**
 *	@brief	分享内容协议
 */
@protocol ISSPublishContent <NSObject>

/**
 *	@brief	获取分享内容
 *
 *	@return	分享内容
 */
- (NSString *)content;

/**
 *	@brief	获取默认分享内容
 *
 *	@return	分享内容
 */
- (NSString *)defaultContent;

/**
 *	@brief	获取分享图片
 *
 *	@return	分享图片
 */
- (UIImage *)image;

/**
 *	@brief	获取分享图片质量,图片质量指定在分享时上传图片的质量，取值范围在0~1之间，默认0.8
 *
 *	@return	图片质量
 */
- (CGFloat)imageQuality;

/**
 *	@brief	获取分享标题，仅用于微信和QQ平台，当发送News、Music、Video和App时有效
 *
 *	@return	分享标题
 */
- (NSString *)title;

/**
 *	@brief	获取分享链接，仅用于微信和QQ平台，当发送News、Music、Video和App时有效
 *
 *	@return	分享链接
 */
- (NSString *)url;

/**
 *	@brief	获取分享类型，仅用于微信和QQ平台，
 *
 *	@return	分享类型
 */
- (SSPublishContentMediaType)mediaType;

/**
 *	@brief	获取音乐文件链接，仅用于微信平台,当发送Music时有效
 *
 *	@return	音乐文件链接
 */
- (NSString *)musicFileUrl;

/**
 *	@brief	获取扩展信息，仅用于微信平台,当发送App时有效
 *
 *	@return	扩展信息
 */
- (NSString *)extInfo;


/**
 *	@brief	获取文件数据，仅用于微信平台,当发送App时有效
 *
 *	@return	文件数据
 */
- (NSData *)fileData;


@end
