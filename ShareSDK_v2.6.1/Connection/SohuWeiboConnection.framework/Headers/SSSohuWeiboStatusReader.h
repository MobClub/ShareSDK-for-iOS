//
//  SSSohuWeiboStatusReader.h
//  SohuWeiboConnection
//
//  Created by 冯 鸿杰 on 13-10-21.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSSohuWeiboUserReader.h"

/**
 *	@brief	微博信息读取器
 */
@interface SSSohuWeiboStatusReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	创建时间
 */
@property (nonatomic,readonly) NSString *createAt;

/**
 *	@brief	微博id
 */
@property (nonatomic,readonly) NSString *Id;

/**
 *	@brief	内容
 */
@property (nonatomic,readonly) NSString *text;

/**
 *	@brief	来源
 */
@property (nonatomic,readonly) NSString *source;

/**
 *	@brief	是否收藏
 */
@property (nonatomic,readonly) BOOL favorited;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) BOOL truncated;

/**
 *	@brief	转发微博id
 */
@property (nonatomic,readonly) NSString *inReplyToStatusId;

/**
 *	@brief	转发微博作者id
 */
@property (nonatomic,readonly) NSString *inReplyToUserId;

/**
 *	@brief	转发微博作者昵称
 */
@property (nonatomic,readonly) NSString *inReplyToScreenName;

/**
 *	@brief	转发微博内容
 */
@property (nonatomic,readonly) NSString *inReplyToStatusText;

/**
 *	@brief	小图
 */
@property (nonatomic,readonly) NSString *smallPic;

/**
 *	@brief	中图
 */
@property (nonatomic,readonly) NSString *middlePic;

/**
 *	@brief	原图
 */
@property (nonatomic,readonly) NSString *originalPic;

/**
 *	@brief	用户信息
 */
@property (nonatomic,readonly) SSSohuWeiboUserReader *userInfo;

/**
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;


/**
 *	@brief	创建用户信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSSohuWeiboStatusReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
