//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "SSTwitterSizesReader.h"

/**
 *	@brief	Media Reader.
 */
@interface SSTwitterMediaReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	Raw data.
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	Display URL.
 */
@property (nonatomic,readonly) NSString *displayUrl;

/**
 *	@brief	Extended of the display URL, link to display the page.
 */
@property (nonatomic,readonly) NSString *expandedUrl;

/**
 *	@brief	id
 */
@property (nonatomic,readonly) long long Id;

/**
 *	@brief	id string.
 */
@property (nonatomic,readonly) NSString *idStr;

/**
 *	@brief	URL start position and end position of the text index Tweet
 */
@property (nonatomic,readonly) NSArray *indices;

/**
 *	@brief	Media URL.
 */
@property (nonatomic,readonly) NSString *mediaUrl;

/**
 *	@brief	Media URL HTTPs.
 */
@property (nonatomic,readonly) NSString *mediaUrlHttps;

/**
 *	@brief	Sizes.
 */
@property (nonatomic,readonly) SSTwitterSizesReader *sizes;

/**
 *	@brief	source status id.
 */
@property (nonatomic,readonly) long long sourceStatusId;

/**
 *	@brief	source status id string.
 */
@property (nonatomic,readonly) NSString *sourceStatusIdStr;

/**
 *	@brief	Type.
 */
@property (nonatomic,readonly) NSString *type;

/**
 *	@brief	media link URL.
 */
@property (nonatomic,readonly) NSString *url;

/**
 *	@brief	Initialize reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	Create a media reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return Reader object.
 */
+ (SSTwitterMediaReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
