//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "SSSinaWeiboUserInfoReader.h"
#import "SSSinaWeiboStatusInfoReader.h"

/**
 *	@brief	Comment Reader.
 */
@interface SSSinaWeiboCommentReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	Raw data.
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	Created time.
 */
@property (nonatomic,readonly) NSString *createdAt;

/**
 *	@brief	Comment id.
 */
@property (nonatomic,readonly) long long Id;

/**
 *	@brief	Comment text.
 */
@property (nonatomic,readonly) NSString *text;

/**
 *	@brief	Comment source
 */
@property (nonatomic,readonly) NSString *source;

/**
 *	@brief	Review of user information
 */
@property (nonatomic,readonly) SSSinaWeiboUserInfoReader *user;

/**
 *	@brief	Comment mid.
 */
@property (nonatomic,readonly) NSString *mid;

/**
 *	@brief	Comment id string
 */
@property (nonatomic,readonly) NSString *idStr;

/**
 *	@brief	Comments stuatus information
 */
@property (nonatomic,readonly) SSSinaWeiboStatusInfoReader *status;

/**
 *	@brief	Review source comments, return to this field when the comments are a reply to another comment
 */
@property (nonatomic,readonly) SSSinaWeiboCommentReader *replyComment;

/**
 *	@brief	Initialize reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	Create a comment reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return Reader object.
 */
+ (SSSinaWeiboCommentReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
