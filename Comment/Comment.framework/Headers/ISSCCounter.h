//
//  ISSCCounter.h
//  Comment
//
//  Created by 冯 鸿杰 on 13-11-27.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	主题信息
 */
@protocol ISSCTopic <NSObject>

/**
 *	@brief	获取主题标识
 *
 *	@return 主题标识
 */
- (NSString *)Id;

/**
 *	@brief	主题是否被称赞标识
 *
 *	@return	YES 表示称赞，NO 表示尚未称赞
 */
- (BOOL)liked;

/**
 *	@brief	获取评论数量
 *
 *	@return	评论数量
 */
- (NSInteger)commentCount;

/**
 *	@brief	获取分享数量
 *
 *	@return	分享数量
 */
- (NSInteger)shareCount;

/**
 *	@brief	获取称赞数量
 *
 *	@return	称赞数量
 */
- (NSInteger)likeCount;

@end
