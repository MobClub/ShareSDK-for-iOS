//
//  SSFacebookPhotoReader.h
//  FacebookConnection
//
//  Created by 冯 鸿杰 on 13-10-23.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	照片信息读取器
 */
@interface SSFacebookPhotoReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	源图路径
 */
@property (nonatomic,readonly) NSString *source;

/**
 *	@brief	高度
 */
@property (nonatomic,readonly) NSInteger height;

/**
 *	@brief	宽度
 */
@property (nonatomic,readonly) NSInteger width;

/**
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	创建文章信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSFacebookPhotoReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
