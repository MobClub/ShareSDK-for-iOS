//
//  SSGooglePlusCoverPhotoReader.h
//  GooglePlusConnection
//
//  Created by 冯 鸿杰 on 13-10-25.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	封面照片信息读取器
 */
@interface SSGooglePlusCoverPhotoReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	The url to the image.
 */
@property (nonatomic,readonly) NSString *url;

/**
 *	@brief	The height to the image.
 */
@property (nonatomic,readonly) NSInteger height;

/**
 *	@brief	The width to the image.
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
 *	@brief	创建封面图片信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSGooglePlusCoverPhotoReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
