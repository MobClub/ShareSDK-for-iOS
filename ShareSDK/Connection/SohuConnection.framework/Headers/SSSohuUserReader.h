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
 *	@brief	User Reader.
 */
@interface SSSohuUserReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	Raw data.
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	User homepage URL.
 */
@property (nonatomic,readonly) NSString *homeUrl;

/**
 *	@brief	Small image URL of avatar.
 */
@property (nonatomic,readonly) NSString *icon;

/**
 *	@brief	Nickname.
 */
@property (nonatomic,readonly) NSString *nick;

/**
 *	@brief	Open id.
 */
@property (nonatomic,readonly) NSString *openId;

/**
 *	@brief	Name.
 */
@property (nonatomic,readonly) NSString *name;

/**
 *	@brief	Large image URL of avatar
 */
@property (nonatomic,readonly) NSString *image;

/**
 *	@brief	Birthday year.
 */
@property (nonatomic) NSInteger birthdayYear;

/**
 *	@brief	Birthday month.
 */
@property (nonatomic) NSInteger birthdayMonth;

/**
 *	@brief	Birthday day.
 */
@property (nonatomic) NSInteger birthdayDay;

/**
 *	@brief	Initialize reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	Create a user reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
+ (SSSohuUserReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
