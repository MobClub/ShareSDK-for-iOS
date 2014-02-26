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
 *	@brief	Tag Reader
 */
@interface SSEverNoteTagReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	Tag guid.
 */
@property (nonatomic,readonly) NSString *guid;

/**
 *	@brief	Tag name
 */
@property (nonatomic,readonly) NSString *name;

/**
 *	@brief	Parent guid id.
 */
@property (nonatomic,readonly) NSString *parentGuid;

/**
 *	@brief	Update sequence number.
 */
@property (nonatomic,readonly) NSInteger updateSequenceNum;

/**
 *	@brief	Initialize Reader
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	Create a tag reader.
 *
 *	@param 	sourceData 	Raw data
 *
 *	@return	Reader object.
 */
+ (SSEverNoteTagReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
