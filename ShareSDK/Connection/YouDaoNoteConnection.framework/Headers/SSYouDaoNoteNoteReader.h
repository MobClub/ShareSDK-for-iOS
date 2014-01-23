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
 *	@brief	Note Reader.
 */
@interface SSYouDaoNoteNoteReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	Raw data.
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	Note path.
 */
@property (nonatomic,readonly) NSString *path;

/**
 *	@brief	Title.
 */
@property (nonatomic,readonly) NSString *title;

/**
 *	@brief	Author.
 */
@property (nonatomic,readonly) NSString *author;

/**
 *	@brief	source URL.
 */
@property (nonatomic,readonly) NSString *source;

/**
 *	@brief	Note size，Including text and attachments
 */
@property (nonatomic,readonly) NSInteger size;

/**
 *	@brief	Created time，unit: seconds.
 */
@property (nonatomic,readonly) NSTimeInterval createTime;

/**
 *	@brief	Last modified time. unit: seconds.
 */
@property (nonatomic,readonly) NSTimeInterval modifyTime;

/**
 *	@brief	Content string.
 */
@property (nonatomic,readonly) NSString *content;

/**
 *	@brief	Initialize reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	Create a note reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
+ (SSYouDaoNoteNoteReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
