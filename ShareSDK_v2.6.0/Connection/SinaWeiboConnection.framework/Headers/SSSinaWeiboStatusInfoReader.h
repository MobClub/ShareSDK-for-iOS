//
//  SSSinaWeiboStatusInfoReader.h
//  SinaWeiboConnection
//
//  Created by 冯 鸿杰 on 13-10-18.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSSinaWeiboGeoReader.h"
#import "SSSinaWeiboVisibleReader.h"

@class SSSinaWeiboUserInfoReader;

/**
 *	@brief	微博信息读取器
 */
@interface SSSinaWeiboStatusInfoReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	微博创建时间
 */
@property (nonatomic,readonly) NSString *createdAt;

/**
 *	@brief	字符串型的微博ID
 */
@property (nonatomic,readonly) NSString *idstr;

/**
 *	@brief	微博ID
 */
@property (nonatomic,readonly) long long Id;

/**
 *	@brief	微博MID
 */
@property (nonatomic,readonly) long long mid;

/**
 *	@brief	微博信息内容
 */
@property (nonatomic,readonly) NSString *text;

/**
 *	@brief	微博来源
 */
@property (nonatomic,readonly) NSString *source;

/**
 *	@brief	是否已收藏，true：是，false：否
 */
@property (nonatomic,readonly) BOOL favorited;

/**
 *	@brief	是否被截断，true：是，false：否
 */
@property (nonatomic,readonly) BOOL truncated;

/**
 *	@brief	回复ID
 */
@property (nonatomic,readonly) NSString *inReplyToStatusId;

/**
 *	@brief	回复人UID
 */
@property (nonatomic,readonly) NSString *inReplyToUserId;

/**
 *	@brief	回复人昵称
 */
@property (nonatomic,readonly) NSString *inReplyToScreenName;

/**
 *	@brief	缩略图片地址，没有时不返回此字段
 */
@property (nonatomic,readonly) NSString *thumbnailPic;

/**
 *	@brief	中等尺寸图片地址，没有时不返回此字段
 */
@property (nonatomic,readonly) NSString *bmiddlePic;

/**
 *	@brief	原始图片地址，没有时不返回此字段
 */
@property (nonatomic,readonly) NSString *originalPic;

/**
 *	@brief	地理信息字段
 */
@property (nonatomic,readonly) SSSinaWeiboGeoReader *geo;

/**
 *	@brief	微博作者的用户信息字段
 */
@property (nonatomic,readonly) SSSinaWeiboUserInfoReader *user;

/**
 *	@brief	转发数
 */
@property (nonatomic,readonly) NSInteger repostsCount;

/**
 *	@brief	评论数
 */
@property (nonatomic,readonly) NSInteger commentsCount;

/**
 *	@brief	暂未支持
 */
@property (nonatomic,readonly) NSInteger attitudesCount;

/**
 *	@brief	暂未支持
 */
@property (nonatomic,readonly) NSInteger mlevel;

/**
 *	@brief	微博的可见性及指定可见分组信息
 */
@property (nonatomic,readonly) SSSinaWeiboVisibleReader *visible;

/**
 *	@brief	被转发微博信息
 */
@property (nonatomic,readonly) SSSinaWeiboStatusInfoReader *retweetedStatus;

/**
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;


/**
 *	@brief	创建微博信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSSinaWeiboStatusInfoReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
