//
//  SSDouBanAttachmentReader.h
//  DouBanConnection
//
//  Created by 冯 鸿杰 on 13-10-22.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	物信息读取器
 */
@interface SSDouBanAttachmentReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	子标题
 */
@property (nonatomic,readonly) NSString *caption;

/**
 *	@brief	描述，可以为空，最大长度200字节（100汉字或200字母）
 */
@property (nonatomic,readonly) NSString *description;

/**
 *	@brief	链接，url最大长度1024，需要分析并展示网站域名
 */
@property (nonatomic,readonly) NSString *href;

/**
 *	@brief	富媒体，允许 image, flash, music 单条广播所有[[BR]]图片无最小值限制，
 *  文件最大不超过3M[[BR]]缩略图：最大边150px[[BR]]点击展开后：宽度最大460px，高度不限[[BR]]原图大小无宽高限制
 */
@property (nonatomic,readonly) NSArray *media;

/**
 *	@brief	如果有分类，这里存放对应类别的详细数据，具体的字段由该类别自行定义
 */
@property (nonatomic,readonly) id properties;

/**
 *	@brief	标题，如果传空，会显示‘无标题’， 最大长度100字节（50汉字或100字母）
 */
@property (nonatomic,readonly) NSString *title;

/**
 *	@brief	分类，预留字段
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
 *	@brief	创建用户信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSDouBanAttachmentReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
