//
//  SSDouBanImageReader.h
//  DouBanConnection
//
//  Created by 冯 鸿杰 on 13-10-22.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	图片信息读取器
 */
@interface SSDouBanImageReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	图片URL
 */
@property (nonatomic,readonly) NSString *src;

/**
 *	@brief	图片来源地址
 */
@property (nonatomic,readonly) NSString *href;

/**
 *	@brief	媒体类型
 */
@property (nonatomic,readonly) NSString *type;

/**
 *	@brief	图片尺寸
 */
@property (nonatomic,readonly) NSDictionary *sizes;

/**
 *	@brief	原图片路径
 */
@property (nonatomic,readonly) NSString *originalSrc;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) NSString *secretPid;

/**
 *	@brief	创建图片信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSDouBanImageReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
