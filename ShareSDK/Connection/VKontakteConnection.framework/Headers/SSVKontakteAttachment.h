//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>

/**
 *	@brief	Attachment.
 */
@interface SSVKontakteAttachment : NSObject
{
@private
    NSString *_type;
    NSString *_ownerId;
    NSString *_mediaId;
}

/**
 *	@brief	Attachment type.
 */
@property (nonatomic,copy) NSString *type;

/**
 *	@brief	Media id.
 */
@property (nonatomic,copy) NSString *mediaId;

/**
 *	@brief	Media belongs user ID.
 */
@property (nonatomic,copy) NSString *ownerId;

/**
 *	@brief	Create an attachment.
 *
 *	@param 	type 	Attachment type.
 *	@param 	mediaId 	Media id.
 *	@param 	ownerId 	Media belongs user ID.
 *
 *	@return	Attachment object.
 */
+ (SSVKontakteAttachment *)attachmentWithType:(NSString *)type
                                      mediaId:(NSString *)mediaId
                                      ownerId:(NSString *)ownerId;


@end
