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
 *	@brief	Entities Reader.
 */
@interface SSTwitterEntitiesReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	Raw data.
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	# Tag is parsed representation of Tweets text.
 */
@property (nonatomic,readonly) NSArray *hashtags;

/**
 *	@brief	Media element in Tweets.
 */
@property (nonatomic,readonly) NSArray *media;

/**
 *	@brief	URLs element in Tweets.
 */
@property (nonatomic,readonly) NSArray *urls;

/**
 *	@brief	Other users mentioned element in Tweets.
 */
@property (nonatomic,readonly) NSArray *userMentions;

/**
 *	@brief	Initialize reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	Create an entities reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
+ (SSTwitterEntitiesReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
