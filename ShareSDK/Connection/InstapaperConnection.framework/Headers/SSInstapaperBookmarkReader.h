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
 *	@brief	Bookmark Reader
 */
@interface SSInstapaperBookmarkReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	Raw data.
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	Bookmark id.
 */
@property (nonatomic,readonly) long long bookmarkId;

/**
 *	@brief	URL string.
 */
@property (nonatomic,readonly) NSString *url;

/**
 *	@brief	Title string.
 */
@property (nonatomic,readonly) NSString *title;

/**
 *	@brief	Description.
 */
@property (nonatomic,readonly) NSString *description;

/**
 *	@brief	Created time.
 */
@property (nonatomic,readonly) long long time;

/**
 *	@brief	None
 */
@property (nonatomic,readonly) BOOL starred;

/**
 *	@brief	Private source
 */
@property (nonatomic,readonly) NSString *privateSource;

/**
 *	@brief	None
 */
@property (nonatomic,readonly) NSString *hash;

/**
 *	@brief	None
 */
@property (nonatomic,readonly) NSInteger progress;

/**
 *	@brief	None
 */
@property (nonatomic,readonly) long long progressTimestamp;

/**
 *	@brief	Initialize reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	Create a bookmark reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
+ (SSInstapaperBookmarkReader *)readerWithSourceData:(NSDictionary *)sourceData;


@end
