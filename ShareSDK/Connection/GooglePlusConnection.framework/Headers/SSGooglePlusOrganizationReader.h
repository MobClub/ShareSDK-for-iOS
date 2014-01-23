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
 *	@brief	Organization Reader.
 */
@interface SSGooglePlusOrganizationReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	Raw data.
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	The name of the organization.
 */
@property (nonatomic,readonly) NSString *name;

/**
 *	@brief	The department within the organization. Deprecated.
 */
@property (nonatomic,readonly) NSString *department;

/**
 *	@brief	The person's job title or role within the organization.
 */
@property (nonatomic,readonly) NSString *title;

/**
 *	@brief	The type of organization. Possible values are:
 *          "work" - Work.
 *          "school" - School.
 */
@property (nonatomic,readonly) NSString *type;

/**
 *	@brief	The date the person joined this organization.
 */
@property (nonatomic,readonly) NSString *startDate;

/**
 *	@brief	The date the person left this organization.
 */
@property (nonatomic,readonly) NSString *endDate;

/**
 *	@brief	The location of this organization. Deprecated.
 */
@property (nonatomic,readonly) NSString *location;

/**
 *	@brief	A short description of the person's role in this organization. Deprecated.
 */
@property (nonatomic,readonly) NSString *description;

/**
 *	@brief	If "true", indicates this organization is the person's primary one (typically interpreted as current one).
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
 *	@brief	Create an organization reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
+ (SSGooglePlusOrganizationReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
