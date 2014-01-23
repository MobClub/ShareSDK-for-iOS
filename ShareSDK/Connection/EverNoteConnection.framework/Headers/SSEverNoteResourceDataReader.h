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
 *	@brief	Resource data reader.
 */
@interface SSEverNoteResourceDataReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	Raw data.
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	This field carries a one-way hash of the contents of the data body, in binary form. The hash function is MD5
 */
@property (nonatomic,readonly) NSData *bodyHash;

/**
 *	@brief	The length, in bytes, of the data body.
 */
@property (nonatomic,readonly) NSInteger size;

/**
 *	@brief	This field is set to contain the binary contents of the data whenever the resource is being transferred.
 *          If only metadata is being exchanged, this field will be empty.
 *          For example, a client could notify the service about the change to an attribute for
 *          a resource without transmitting the binary resource contents.
 */
@property (nonatomic,readonly) NSData *body;

/**
 *	@brief	Initialize reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	Create a resource data reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
+ (SSEverNoteResourceDataReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
