//
//  SSDropboxQuotaInfoReader.h
//  DropboxConnection
//
//  Created by 冯 鸿杰 on 13-10-30.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SSDropboxQuotaInfoReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

@property (nonatomic,readonly) NSInteger normal;

@property (nonatomic,readonly) NSInteger quota;

@property (nonatomic,readonly) BOOL shared;

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
+ (SSDropboxQuotaInfoReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
