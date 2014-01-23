//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>

@class SSFacebookUserReader;

/**
 *	@brief	Post reader
 */
@interface SSFacebookPostReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	Source data
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	ID
 */
@property (nonatomic,readonly) NSString *Id;

/**
 *	@brief	Post id
 */
@property (nonatomic,readonly) NSString *postId;

/**
 *	@brief	Send user reader.
 */
@property (nonatomic,readonly) SSFacebookUserReader *from;

/**
 *	@brief	Message
 */
@property (nonatomic,readonly) NSString *message;

/**
 *	@brief	Updated time
 */
@property (nonatomic,readonly) NSString *updatedTime;

/**
 *	@brief	Create time
 */
@property (nonatomic,readonly) NSString *createdTime;

/**
 *	@brief	Icon
 */
@property (nonatomic,readonly) NSString *icon;

/**
 *	@brief	Link
 */
@property (nonatomic,readonly) NSString *link;

/**
 *	@brief	Name
 */
@property (nonatomic,readonly) NSString *name;

/**
 *	@brief	picture path
 */
@property (nonatomic,readonly) NSString *picture;

/**
 *	@brief	Source
 */
@property (nonatomic,readonly) NSString *source;

/**
 *	@brief	Height
 */
@property (nonatomic,readonly) NSInteger height;

/**
 *	@brief	Width
 */
@property (nonatomic,readonly) NSInteger width;

/**
 *	@brief	Images
 */
@property (nonatomic,readonly) NSArray *images;

/**
 *	@brief	Initialize reader
 *
 *	@param 	sourceData 	Raw data
 *
 *	@return	Reader object
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	Create Post reader
 *
 *	@param 	sourceData 	Raw data
 *
 *	@return	Reader object
 */
+ (SSFacebookPostReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
