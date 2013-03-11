//
//  SSPublishContentMediaType.h
//  AppgoFramework
//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:1955211608
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#ifndef AppgoFramework_SSPublishContentMediaType_h
#define AppgoFramework_SSPublishContentMediaType_h

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
    SSPublishContentMediaTypeApp = 5, /**< 应用,仅供微信使用 */
    SSPublishContentMediaTypeNonGif = 6, /**< 非Gif消息,仅供微信使用 */
    SSPublishContentMediaTypeGif = 7 /**< Gif消息,仅供微信使用 */
}
SSPublishContentMediaType;

#endif
