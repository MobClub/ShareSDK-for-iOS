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
 *	@brief	Attachment reader.
 */
@interface SSDouBanAttachmentReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	Raw data.
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	Caption string.
 */
@property (nonatomic,readonly) NSString *caption;

/**
 *	@brief	Description，Can be nil, the maximum length of 200 bytes (100 characters or 200 characters)
 */
@property (nonatomic,readonly) NSString *description;

/**
 *	@brief	Links, url maximum length of 1024, you need to analyze and demonstrate Domain Name
 */
@property (nonatomic,readonly) NSString *href;

/**
 *	@brief	Rich media, allowing the image, flash, music single broadcast all Picture no minimum limit,
 *  The maximum file size 3M. Thumbnail: Maximum side 150px. Click to expand post: maximum width 460px, height limitation. Original size without width and height restrictions
 */
@property (nonatomic,readonly) NSArray *media;

/**
 *	@brief	If has classification, corresponding to the categories detail data stored here, the specific field of the class defined by its own.
 */
@property (nonatomic,readonly) id properties;

/**
 *	@brief	Title, if fill nil, will show 'no title', the maximum length of 100 bytes (50 characters or 100 characters)
 */
@property (nonatomic,readonly) NSString *title;

/**
 *	@brief	Classification, reserved field
 */
@property (nonatomic,readonly) NSString *type;

/**
 *	@brief	Initialize reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	Create user reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	User reader object.
 */
+ (SSDouBanAttachmentReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
