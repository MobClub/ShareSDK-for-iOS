//
//  SSTwitterURLReader.h
//  TwitterConnection
//
//  Created by 冯 鸿杰 on 13-10-24.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	URL信息读取器
 */
@interface SSTwitterURLReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	客户端显示URL
 */
@property (nonatomic,readonly) NSString *displayUrl;

/**
 *	@brief	扩展版的显示URL
 */
@property (nonatomic,readonly) NSString *expandedUrl;

/**
 *	@brief	URL在Tweet文本中起始位置和结束位置索引
 */
@property (nonatomic,readonly) NSArray *indices;

/**
 *	@brief	链接地址
 */
@property (nonatomic,readonly) NSString *url;

/**
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	创建URL信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSTwitterURLReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
