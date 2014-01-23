//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "SSGooglePlusCoverInfoReader.h"
#import "SSGooglePlusCoverPhotoReader.h"

/**
 *	@brief  Cover Reader.
 */
@interface SSGooglePlusCoverReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	Raw data.
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	The layout of the cover art. Possible values are:
 *          "banner" - One large image banner.
 */
@property (nonatomic,readonly) NSString *layout;

/**
 *	@brief	Extra information about the cover photo.
 */
@property (nonatomic,readonly) SSGooglePlusCoverInfoReader *coverInfo;

/**
 *	@brief	The person's primary cover image.
 */
@property (nonatomic,readonly) SSGooglePlusCoverPhotoReader *coverPhoto;

/**
 *	@brief	Initialize reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	Create a cover reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
+ (SSGooglePlusCoverReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
