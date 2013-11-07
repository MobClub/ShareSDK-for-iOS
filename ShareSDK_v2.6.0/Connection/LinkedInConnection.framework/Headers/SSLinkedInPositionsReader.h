//
//  SSLinkedInPositionsReader.h
//  LinkedInConnection
//
//  Created by vimfung on 13-10-26.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	职位列表读取器
 */
@interface SSLinkedInPositionsReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	总数量
 */
@property (nonatomic,readonly) NSInteger _total;

/**
 *	@brief	列表数据
 */
@property (nonatomic,readonly) NSArray *values;

/**
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;


/**
 *	@brief	创建职位列表信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSLinkedInPositionsReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
