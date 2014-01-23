//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "SSLinkedInCompanyReader.h"

/**
 *	@brief	Position reader.
 */
@interface SSLinkedInPositionReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	Raw data.
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	Company reader.
 */
@property (nonatomic,readonly) SSLinkedInCompanyReader *company;

/**
 *	@brief	Identifier.
 */
@property (nonatomic,readonly) long long Id;

/**
 *	@brief	Hold a post
 */
@property (nonatomic,readonly) BOOL isCurrent;

/**
 *	@brief	Title.
 */
@property (nonatomic,readonly) NSString *title;

/**
 *	@brief	Initialize reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	Create a position reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Position reader.
 */
+ (SSLinkedInPositionReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
