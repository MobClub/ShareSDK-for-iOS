//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "SSTwitterBoundingBoxReader.h"

/**
 *	@brief	Places Reader.
 */
@interface SSTwitterPlacesReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	Raw data.
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	attributes.
 */
@property (nonatomic,readonly) id attributes;

/**
 *	@brief	Bounding box.
 */
@property (nonatomic,readonly) SSTwitterBoundingBoxReader *boundingBox;

/**
 *	@brief	Country.
 */
@property (nonatomic,readonly) NSString *country;

/**
 *	@brief	Country code.
 */
@property (nonatomic,readonly) NSString *countryCode;

/**
 *	@brief	Full name.
 */
@property (nonatomic,readonly) NSString *fullName;

/**
 *	@brief	ID
 */
@property (nonatomic,readonly) NSString *Id;

/**
 *	@brief	Name
 */
@property (nonatomic,readonly) NSString *name;

/**
 *	@brief	Place type.
 */
@property (nonatomic,readonly) NSString *placeType;

/**
 *	@brief	URL
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
 *	@brief	Create a places reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
+ (SSTwitterPlacesReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
