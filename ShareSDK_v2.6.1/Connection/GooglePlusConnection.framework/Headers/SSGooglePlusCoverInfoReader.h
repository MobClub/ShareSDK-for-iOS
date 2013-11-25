//
//  SSGooglePlusCoverInfoReader.h
//  GooglePlusConnection
//
//  Created by 冯 鸿杰 on 13-10-25.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	封面信息读取器
 */
@interface SSGooglePlusCoverInfoReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	The difference between the top position of the image cover and the actual displayed cover image. Only valid for BANNER layout.
 */
@property (nonatomic,readonly) NSInteger topImageOffset;

/**
 *	@brief	The difference between the left position of the image cover and the actual displayed cover image. Only valid for BANNER layout.
 */
@property (nonatomic,readonly) NSInteger leftImageOffset;

/**
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	创建封面信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSGooglePlusCoverInfoReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
