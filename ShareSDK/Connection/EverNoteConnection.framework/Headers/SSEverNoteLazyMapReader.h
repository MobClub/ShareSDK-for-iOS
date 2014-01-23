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
 *	@brief	Lazy Map Reader.
 */
@interface SSEverNoteLazyMapReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	Raw data.
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	The set of keys for the map. This field is ignored by the server when set.
 */
@property (nonatomic,readonly) NSSet *keysOnly;

/**
 *	@brief	The complete map, including all keys and values.
 */
@property (nonatomic,readonly) NSDictionary *fullMap;

/**
 *	@brief	Initialize reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	Create a lazy map reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
+ (SSEverNoteLazyMapReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
