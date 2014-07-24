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

///#begin zh-cn
/**
 *	@brief	附件信息
 */
///#end
///#begin en
/**
 *	@brief	Attachment.
 */
///#end
@interface SSVKontakteAttachment : NSObject
{
@private
    NSString *_type;
    NSString *_ownerId;
    NSString *_mediaId;
}

///#begin zh-cn
/**
 *	@brief	附件类型
 */
///#end
///#begin en
/**
 *	@brief	Attachment type.
 */
///#end
@property (nonatomic,copy) NSString *type;

///#begin zh-cn
/**
 *	@brief	媒体标识
 */
///#end
///#begin en
/**
 *	@brief	Media id.
 */
///#end
@property (nonatomic,copy) NSString *mediaId;

///#begin zh-cn
/**
 *	@brief	媒体所属用户标识
 */
///#end
///#begin en
/**
 *	@brief	Media belongs user ID.
 */
///#end
@property (nonatomic,copy) NSString *ownerId;

///#begin zh-cn
/**
 *	@brief	创建附件信息
 *
 *	@param 	type 	附件类型
 *	@param 	mediaId 	媒体标识
 *	@param 	ownerId 	媒体所属用户标识
 *
 *	@return	附件信息
 */
///#end
///#begin en
/**
 *	@brief	Create an attachment.
 *
 *	@param 	type 	Attachment type.
 *	@param 	mediaId 	Media id.
 *	@param 	ownerId 	Media belongs user ID.
 *
 *	@return	Attachment object.
 */
///#end
+ (SSVKontakteAttachment *)attachmentWithType:(NSString *)type
                                      mediaId:(NSString *)mediaId
                                      ownerId:(NSString *)ownerId;


@end
