//
//  SSTwitterEntitiesReader.h
//  TwitterConnection
//
//  Created by 冯 鸿杰 on 13-10-24.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	实体对象信息读取器
 */
@interface SSTwitterEntitiesReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	表示＃标签被解析出来的Tweets文本。
 */
@property (nonatomic,readonly) NSArray *hashtags;

/**
 *	@brief	表示Tweets中上传的媒体元素
 */
@property (nonatomic,readonly) NSArray *media;

/**
 *	@brief	表示Tweets中的链接元素
 */
@property (nonatomic,readonly) NSArray *urls;

/**
 *	@brief	表示Tweets中提及的其他用户元素
 */
@property (nonatomic,readonly) NSArray *userMentions;

/**
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;


/**
 *	@brief	创建实体对象信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSTwitterEntitiesReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
