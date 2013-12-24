//
//  SSSinaWeiboFavoriteReader.h
//  SinaWeiboConnection
//
//  Created by 冯 鸿杰 on 13-10-18.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSSinaWeiboStatusInfoReader.h"

/**
 *	@brief	新浪微博收藏信息读取器
 */
@interface SSSinaWeiboFavoriteReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	收藏时间
 */
@property (nonatomic,readonly) NSString *favoritedTime;

/**
 *	@brief	微博信息
 */
@property (nonatomic,readonly) SSSinaWeiboStatusInfoReader *status;

/**
 *	@brief	标签列表
 */
@property (nonatomic,readonly) NSArray *tags;

/**
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;


/**
 *	@brief	创建收藏信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSSinaWeiboFavoriteReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
