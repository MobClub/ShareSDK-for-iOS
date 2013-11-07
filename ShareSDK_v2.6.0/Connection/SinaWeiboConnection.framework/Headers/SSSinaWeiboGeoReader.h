//
//  SSSinaWeiboGeoReader.h
//  SinaWeiboConnection
//
//  Created by 冯 鸿杰 on 13-10-18.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	新浪地理位置信息读取器
 */
@interface SSSinaWeiboGeoReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	类型：Point
 */
@property (nonatomic,readonly) NSString *type;

/**
 *	@brief	纬度
 */
@property (nonatomic,readonly) CGFloat latitude;

/**
 *	@brief	经度
 */
@property (nonatomic,readonly) CGFloat longitude;

/**
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;


/**
 *	@brief	创建地理位置信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSSinaWeiboGeoReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
