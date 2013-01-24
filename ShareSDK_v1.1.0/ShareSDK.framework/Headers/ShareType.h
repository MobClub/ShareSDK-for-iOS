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
	ShareTypeTencentWeibo, /**< 腾讯微博 */
	ShareTypeSohuWeibo, /**< 搜狐微博 */
	ShareType163Weibo, /**< 网易微博 */
	ShareTypeDouBan, /**< 豆瓣社区 */
	ShareTypeQQSpace, /**< QQ空间 */
	ShareTypeRenren, /**< 人人网 */
	ShareTypeKaixin, /**< 开心网 */
	ShareTypePengyou, /**< 朋友网 */
	ShareTypeFacebook, /**< Facebook */
	ShareTypeTwitter, /**< Twitter */
	ShareTypeEvernote, /**< 印象笔记 */
	ShareTypeFoursquare, /**< Foursquare */
	ShareTypeGooglePlus, /**< Google＋ */
	ShareTypeInstagram, /**< Instagram */
	ShareTypeLinkedIn, /**< LinkedIn */
	ShareTypeTumbir, /**< Tumbir */
    ShareTypeMail, /**< 邮件分享 */
	ShareTypeSMS, /**< 短信分享 */
	ShareTypeAirPrint, /**< 打印 */
	ShareTypeCopy, /**< 拷贝 */
    ShareTypeWeixiSession, /**< 微信好友 */
	ShareTypeWeixiTimeline, /**< 微信朋友圈 */
    ShareTypeQQ, /**< QQ */
    ShareTypeInstapaper, /**< Instapaper */
    ShareTypePocket /**< Pocket */
}
ShareType;


#endif
