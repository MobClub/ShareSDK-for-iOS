//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "SSDouBanEntityReader.h"
#import "SSDouBanSourceReader.h"

@class SSDouBanUserReader;

/**
 *	@brief	Broadcast reader.
 */
@interface SSDouBanStatusReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	Raw data.
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	Can reply.
 */
@property (nonatomic,readonly) BOOL canReply;

/**
 *	@brief	attachments is a json array format string, array elements called attachment,
 *          Each broadcast is currently only supports a single thing. Attachment is the behavior of each broadcast presentation that object. For example: xx recommended URL. the URL is this 'Attachment',
 */
@property (nonatomic,readonly) NSArray *attachments;

/**
 *	@brief	None
 */
@property (nonatomic,readonly) NSString *category;

/**
 *	@brief	Comments count.
 */
@property (nonatomic,readonly) NSInteger commentsCount;

/**
 *	@brief	Published broadcast time.
 */
@property (nonatomic,readonly) NSString *createdAt;

/**
 *	@brief	None
 */
@property (nonatomic,retain) SSDouBanEntityReader *entities;

/**
 *	@brief	None
 */
@property (nonatomic,readonly) BOOL hasPhoto;

/**
 *	@brief	Broadcast id
 */
@property (nonatomic,readonly) NSString *Id;

/**
 *	@brief	None
 */
@property (nonatomic,readonly) BOOL isFollow;

/**
 *	@brief	Like count.
 */
@property (nonatomic,readonly) NSInteger likeCount;

/**
 *	@brief	Whether liked.
 */
@property (nonatomic,readonly) BOOL liked;

/**
 *	@brief	None
 */
@property (nonatomic,readonly) BOOL muted;

/**
 *	@brief	reshared count.
 */
@property (nonatomic,readonly) NSInteger resharedCount;

/**
 *	@brief	app key corresponding application name and application url.
 */
@property (nonatomic,readonly) SSDouBanSourceReader *source;

/**
 *	@brief	a piece of text in quotes web segment display. Content is generally user input.
 */
@property (nonatomic,readonly) NSString *text;

/**
 *	@brief	Title string.
 */
@property (nonatomic,readonly) NSString *title;

/**
 *	@brief	None
 */
@property (nonatomic,readonly) NSString *type;

/**
 *	@brief	Posted Broadcaster.
 */
@property (nonatomic,readonly) SSDouBanUserReader *user;

/**
 *	@brief	Initialize reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	Create Broadcast information reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
+ (SSDouBanStatusReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
