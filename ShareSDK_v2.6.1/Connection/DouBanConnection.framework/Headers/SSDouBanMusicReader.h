//
//  SSDouBanMusicReader.h
//  DouBanConnection
//
//  Created by 冯 鸿杰 on 13-10-22.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	音乐媒体读取器
 */
@interface SSDouBanMusicReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	音乐路径
 */
@property (nonatomic,readonly) NSString *src;

/**
 *	@brief	标题
 */
@property (nonatomic,readonly) NSString *title;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) NSString *artist;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) NSString *album;

/**
 *	@brief	类型
 */
@property (nonatomic,readonly) NSString *type;

/**
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	创建音乐信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSDouBanMusicReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
