//
//  SSTwitterMediaReader.h
//  TwitterConnection
//
//  Created by 冯 鸿杰 on 13-10-24.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSTwitterSizesReader.h"

/**
 *	@brief	媒体信息读取器
 */
@interface SSTwitterMediaReader : NSObject
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
 *	@brief	扩展版显示URL，链接到显示页面。
 */
@property (nonatomic,readonly) NSString *expandedUrl;

/**
 *	@brief	媒体ID
 */
@property (nonatomic,readonly) long long Id;

/**
 *	@brief	媒体ID字符串
 */
@property (nonatomic,readonly) NSString *idStr;

/**
 *	@brief	URL在Tweet文本中的起始位置和结束位置索引
 */
@property (nonatomic,readonly) NSArray *indices;

/**
 *	@brief	上传媒体文件的URL
 */
@property (nonatomic,readonly) NSString *mediaUrl;

/**
 *	@brief	基于HTTPS的上传媒体文件URL
 */
@property (nonatomic,readonly) NSString *mediaUrlHttps;

/**
 *	@brief	媒体文件大小
 */
@property (nonatomic,readonly) SSTwitterSizesReader *sizes;

/**
 *	@brief	源Tweet的ID
 */
@property (nonatomic,readonly) long long sourceStatusId;

/**
 *	@brief	源Tweet的ID字符串
 */
@property (nonatomic,readonly) NSString *sourceStatusIdStr;

/**
 *	@brief	类型
 */
@property (nonatomic,readonly) NSString *type;

/**
 *	@brief	媒体链接的URL
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
 *	@brief	创建媒体信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSTwitterMediaReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
