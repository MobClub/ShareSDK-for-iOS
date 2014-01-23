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
 *	@brief	User Mention Reader.
 */
@interface SSTwitterUserMentionReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	Raw data.
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	User id.
 */
@property (nonatomic,readonly) long long Id;

/**
 *	@brief	User id string.
 */
@property (nonatomic,readonly) NSString *idStr;

/**
 *	@brief	Mention user information the start position and end position of the index
 */
@property (nonatomic,readonly) NSArray *indices;

/**
 *	@brief	User name.
 */
@property (nonatomic,readonly) NSString *name;

/**
 *	@brief	Screen name.
 */
@property (nonatomic,readonly) NSString *screenName;

/**
 *	@brief	Initialize reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	Create a user mention reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
+ (SSTwitterUserMentionReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
