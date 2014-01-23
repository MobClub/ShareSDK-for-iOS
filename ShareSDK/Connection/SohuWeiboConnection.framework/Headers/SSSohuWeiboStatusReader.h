//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "SSSohuWeiboUserReader.h"

/**
 *	@brief	Status Reader.
 */
@interface SSSohuWeiboStatusReader : NSObject
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
@property (nonatomic,readonly) NSString *createAt;

/**
 *	@brief	Status id.
 */
@property (nonatomic,readonly) NSString *Id;

/**
 *	@brief	Content string.
 */
@property (nonatomic,readonly) NSString *text;

/**
 *	@brief	Source
 */
@property (nonatomic,readonly) NSString *source;

/**
 *	@brief	Whether favorited.
 */
@property (nonatomic,readonly) BOOL favorited;

/**
 *	@brief	None
 */
@property (nonatomic,readonly) BOOL truncated;

/**
 *	@brief	in reply to status id.
 */
@property (nonatomic,readonly) NSString *inReplyToStatusId;

/**
 *	@brief	in reply to user id.
 */
@property (nonatomic,readonly) NSString *inReplyToUserId;

/**
 *	@brief	in reply to screen name.
 */
@property (nonatomic,readonly) NSString *inReplyToScreenName;

/**
 *	@brief	in reply to status text.
 */
@property (nonatomic,readonly) NSString *inReplyToStatusText;

/**
 *	@brief	Small picture.
 */
@property (nonatomic,readonly) NSString *smallPic;

/**
 *	@brief	Middle picture.
 */
@property (nonatomic,readonly) NSString *middlePic;

/**
 *	@brief	Original picture.
 */
@property (nonatomic,readonly) NSString *originalPic;

/**
 *	@brief	User information.
 */
@property (nonatomic,readonly) SSSohuWeiboUserReader *userInfo;

/**
 *	@brief	Initialize reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	Create a status reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
+ (SSSohuWeiboStatusReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
