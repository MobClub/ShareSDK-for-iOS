//
//  SSYouDaoNoteResourceReader.h
//  YouDaoNoteConnection
//
//  Created by 冯 鸿杰 on 13-10-29.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	资源信息读取器
 */
@interface SSYouDaoNoteResourceReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	附件URL
 */
@property (nonatomic,readonly) NSString *url;

/**
 *	@brief	图标URL
 */
@property (nonatomic,readonly) NSString *src;

/**
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	创建读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSYouDaoNoteResourceReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
