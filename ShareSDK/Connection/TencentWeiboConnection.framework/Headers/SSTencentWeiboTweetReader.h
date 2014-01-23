//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "SSTencentWeiboMusicReader.h"
#import "SSTencentWeiboVideoReader.h"


/**
 *	@brief	Tweet Reader.
 */
@interface SSTencentWeiboTweetReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	Raw data.
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	tweet id.
 */
@property (nonatomic,readonly) NSString *Id;

/**
 *	@brief	Posted time.
 */
@property (nonatomic,readonly) CGFloat timestamp;

/**
 *	@brief	City code.
 */
@property (nonatomic,readonly) NSString *cityCode;

/**
 *	@brief	Country code.
 */
@property (nonatomic,readonly) NSString *countryCode;

/**
 *	@brief	Emotion type.
 */
@property (nonatomic,readonly) NSInteger emotiontype;

/**
 *	@brief	Emotion URL.
 */
@property (nonatomic,readonly) NSString *emotionurl;

/**
 *	@brief	Source.
 */
@property (nonatomic,readonly) NSString *from;

/**
 *	@brief	From URL
 */
@property (nonatomic,readonly) NSString *fromurl;

/**
 *	@brief	Geographic information
 */
@property (nonatomic,readonly) NSString *geo;

/**
 *	@brief	image URL list.
 */
@property (nonatomic,readonly) NSArray *image;

/**
 *	@brief	Latitude.
 */
@property (nonatomic,readonly) NSString *latitude;

/**
 *	@brief	Location.
 */
@property (nonatomic,readonly) NSString *location;

/**
 *	@brief	Longitude
 */
@property (nonatomic,readonly) NSString *longitude;

/**
 *	@brief	Music information.
 */
@property (nonatomic,readonly) SSTencentWeiboMusicReader *music;

/**
 *	@brief	original text.
 */
@property (nonatomic,readonly) NSString *origtext;

/**
 *	@brief	Province code.
 */
@property (nonatomic,readonly) NSString *provinceCode;

/**
 *	@brief	Whether their own hair tweet, 0 - no, 1 - Yes
 */
@property (nonatomic,readonly) BOOL isSelf;

/**
 *	@brief	Tweet status, 0 - normal, 1 - system deletes 2 - audit, three - user deletes 4 - root delete
 */
@property (nonatomic,readonly) NSInteger status;

/**
 *	@brief	Content string.
 */
@property (nonatomic,readonly) NSString *text;

/**
 *	@brief	Tweet type, 1 - Original Post 2 - reprint 3 - private letter 4 - Replies 5 - empty back, 6 - mentioned 7 - Review
 */
@property (nonatomic,readonly) NSInteger type;

/**
 *	@brief	Video information.
 */
@property (nonatomic,readonly) SSTencentWeiboVideoReader *video;

/**
 *	@brief	Initialize reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Raw data.
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	Create a tweet reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	tweet reader object.
 */
+ (SSTencentWeiboTweetReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
