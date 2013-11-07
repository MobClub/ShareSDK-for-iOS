//
//  SSSinaWeiboCommentReader.h
//  SinaWeiboConnection
//
//  Created by 冯 鸿杰 on 13-10-18.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSSinaWeiboUserInfoReader.h"
#import "SSSinaWeiboStatusInfoReader.h"

/**
 *	@brief	评论信息读取器
 */
@interface SSSinaWeiboCommentReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	评论创建时间
 */
@property (nonatomic,readonly) NSString *createdAt;

/**
 *	@brief	评论的ID
 */
@property (nonatomic,readonly) long long Id;

/**
 *	@brief	评论的内容
 */
@property (nonatomic,readonly) NSString *text;

/**
 *	@brief	评论的来源
 */
@property (nonatomic,readonly) NSString *source;

/**
 *	@brief	评论作者的用户信息
 */
@property (nonatomic,readonly) SSSinaWeiboUserInfoReader *user;

/**
 *	@brief	评论的MID
 */
@property (nonatomic,readonly) NSString *mid;

/**
 *	@brief	字符串型的评论ID
 */
@property (nonatomic,readonly) NSString *idStr;

/**
 *	@brief	评论的微博信息
 */
@property (nonatomic,readonly) SSSinaWeiboStatusInfoReader *status;

/**
 *	@brief	评论来源评论，当本评论属于对另一评论的回复时返回此字段
 */
@property (nonatomic,readonly) SSSinaWeiboCommentReader *replyComment;

/**
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;


/**
 *	@brief	创建评论信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSSinaWeiboCommentReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
