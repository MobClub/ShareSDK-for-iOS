//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "SSFacebookEmployerReader.h"
#import "SSFacebookPositionReader.h"

/**
 *	@brief	Work Reader.
 */
@interface SSFacebookWorkReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	Raw data.
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	Employer.
 */
@property (nonatomic,readonly) SSFacebookEmployerReader *employer;

/**
 *	@brief	Location.
 */
@property (nonatomic,readonly) NSString *location;

/**
 *	@brief	Position.
 */
@property (nonatomic,readonly) SSFacebookPositionReader *position;

/**
 *	@brief	Start date.
 */
@property (nonatomic,readonly) NSString *startDate;

/**
 *	@brief	End date.
 */
@property (nonatomic,readonly) NSString *endDate;

/**
 *	@brief	Initialize reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	Create a work reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
+ (SSFacebookWorkReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
