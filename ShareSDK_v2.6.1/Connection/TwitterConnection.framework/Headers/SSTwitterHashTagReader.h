//
//  SSTwitterHashTagReader.h
//  TwitterConnection
//
//  Created by 冯 鸿杰 on 13-10-24.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	Hashtag信息读取器
 */
@interface SSTwitterHashTagReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	表示Hashtag在Tweet文本中的偏移位置,起始和结束位置索引
 */
@property (nonatomic,readonly) NSArray *indices;

/**
 *	@brief	Hashtag文本
 */
@property (nonatomic,readonly) NSString *text;

/**
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	创建Hashtag信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSTwitterHashTagReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
