//
//  AGShareType.h
//  SNSServiceSDK
//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:1955211608
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#ifndef SNSServiceSDK_AGShareType_h
#define SNSServiceSDK_AGShareType_h

/**
 *	@brief	分享类型
 */
typedef enum
{
	ShareTypeSinaWeibo = 1, /**< 新浪微博 */
	ShareTypeTencentWeibo = 2, /**< 腾讯微博 */
	ShareTypeSohuWeibo = 3, /**< 搜狐微博 */
	ShareType163Weibo = 4, /**< 网易微博 */
	ShareTypeDouBan = 5, /**< 豆瓣社区 */
	ShareTypeQQSpace = 6, /**< QQ空间 */
	ShareTypeRenren = 7, /**< 人人网 */
	ShareTypeKaixin = 8, /**< 开心网 */
	ShareTypePengyou = 9, /**< 朋友网 */
	ShareTypeFacebook = 10, /**< Facebook */
	ShareTypeTwitter = 11, /**< Twitter */
	ShareTypeEvernote = 12, /**< 印象笔记 */
	ShareTypeFoursquare = 13, /**< Foursquare */
	ShareTypeGooglePlus = 14, /**< Google＋ */
	ShareTypeInstagram = 15, /**< Instagram */
	ShareTypeLinkedIn = 16, /**< LinkedIn */
	ShareTypeTumbir = 17, /**< Tumbir */
    ShareTypeMail = 18, /**< 邮件分享 */
	ShareTypeSMS = 19, /**< 短信分享 */
	ShareTypeAirPrint = 20, /**< 打印 */
	ShareTypeCopy = 21, /**< 拷贝 */
    ShareTypeWeixiSession = 22, /**< 微信好友 */
	ShareTypeWeixiTimeline = 23, /**< 微信朋友圈 */
    ShareTypeQQ = 24, /**< QQ */
    ShareTypeInstapaper = 25, /**< Instapaper */
    ShareTypePocket = 26, /**< Pocket */
    ShareTypeYouDaoNote = 27,     /**< 有道云笔记 */
    ShareTypeAny = 99   /**< 任意平台 */
}
ShareType;


#endif
