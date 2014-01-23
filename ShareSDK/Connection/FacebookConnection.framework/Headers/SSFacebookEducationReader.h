//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "SSFacebookSchoolReader.h"
#import "SSFacebookYearReader.h"
#import "SSFacebookDegreeReader.h"

/**
 *	@brief	Education Reader.
 */
@interface SSFacebookEducationReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	Raw data.
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	School reader.
 */
@property (nonatomic,readonly) SSFacebookSchoolReader *school;

/**
 *	@brief	Year reader.
 */
@property (nonatomic,readonly) SSFacebookYearReader *year;

/**
 *	@brief	Degree reader.
 */
@property (nonatomic,readonly) SSFacebookDegreeReader *degree;

/**
 *	@brief	Type
 */
@property (nonatomic,readonly) NSString *type;

/**
 *	@brief	Initialize reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	Create education reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
+ (SSFacebookEducationReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
