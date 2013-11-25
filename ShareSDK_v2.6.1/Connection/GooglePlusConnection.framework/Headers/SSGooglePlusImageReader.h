//
//  SSGooglePlusImageReader.h
//  GooglePlusConnection
//
//  Created by 冯 鸿杰 on 13-10-25.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	图片信息读取器
 */
@interface SSGooglePlusImageReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	URL地址
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
 *	@brief	创建名字信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSGooglePlusImageReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
