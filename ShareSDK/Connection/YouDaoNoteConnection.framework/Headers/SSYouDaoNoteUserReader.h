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
@interface SSYouDaoNoteUserReader : NSObject
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
 *	@brief	User registration time, in milliseconds
 */
@property (nonatomic,readonly) CGFloat registerTime;

/**
 *	@brief	Used size，in byte.
 */
@property (nonatomic,readonly) long usedSize;

/**
 *	@brief	Total size, in byte.
 */
@property (nonatomic,readonly) long totalSize;

/**
 *	@brief	Last login time，in milliseconds
 */
@property (nonatomic,readonly) CGFloat lastLoginTime;

/**
 *	@brief	Last modified time，in milliseconds
 */
@property (nonatomic,readonly) CGFloat lastModifyTime;

/**
 *	@brief	Default notebook.
 */
@property (nonatomic,readonly) NSString *defaultNotebook;

/**
 *	@brief	User id.
 */
@property (nonatomic,readonly) NSString *user;

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
+ (SSYouDaoNoteUserReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
