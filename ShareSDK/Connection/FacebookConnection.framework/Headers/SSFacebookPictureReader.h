//
//  SSFacebookPictureReader.h
//  FacebookConnection
//
//  Created by 冯 鸿杰 on 13-10-23.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	图片信息读取器
 */
@interface SSFacebookPictureReader : NSObject
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
@property (nonatomic,readonly) NSString *url;

/**
 *	@brief	默认图片标识，如果为YES，表示用户尚未上传过个人图片
 */
@property (nonatomic,readonly) BOOL isSilhouette;

/**
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	创建图片信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSFacebookPictureReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
