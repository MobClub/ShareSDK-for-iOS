//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "SSDropboxQuotaInfoReader.h"

/**
 *	@brief	User information reader.
 */
@interface SSDropboxUserReader : NSObject
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
@property (nonatomic,readonly) NSString *uid;

/**
 *	@brief	Country code.
 */
@property (nonatomic,readonly) NSString *country;

/**
 *	@brief	Display name.
 */
@property (nonatomic,readonly) NSString *displayName;

/**
 *	@brief	E-mail address.
 */
@property (nonatomic,readonly) NSString *email;


@property (nonatomic,readonly) NSString *referralLink;

@property (nonatomic,readonly) SSDropboxQuotaInfoReader *quotaInfo;

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
 *	@return	Reader object.
 */
+ (SSDropboxUserReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
