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
 *	@brief	Image information reader.
 */
@interface SSDouBanImageReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	Raw data.
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	Image URL
 */
@property (nonatomic,readonly) NSString *src;

/**
 *	@brief	Image source Address
 */
@property (nonatomic,readonly) NSString *href;

/**
 *	@brief	Media type.
 */
@property (nonatomic,readonly) NSString *type;

/**
 *	@brief	Image sizes.
 */
@property (nonatomic,readonly) NSDictionary *sizes;

/**
 *	@brief	Original image path.
 */
@property (nonatomic,readonly) NSString *originalSrc;

/**
 *	@brief	None
 */
@property (nonatomic,readonly) NSString *secretPid;

/**
 *	@brief	Create Image reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
+ (SSDouBanImageReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
