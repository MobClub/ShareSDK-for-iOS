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
 *	@brief	E-mail Reader.
 */
@interface SSGooglePlusEmailReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	Raw data.
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	The email address.
 */
@property (nonatomic,readonly) NSString *value;

/**
 *	@brief	The type of address. Possible values are:
 *          "home" - Home email address.
 *          "work" - Work email address.
 *          "other" - Other.
 */
@property (nonatomic,readonly) NSString *type;

/**
 *	@brief	If "true", indicates this email address is the person's primary one.
 */
@property (nonatomic,readonly) BOOL primary;

/**
 *	@brief	Initialize reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	Create an E-mail reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
+ (SSGooglePlusEmailReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
