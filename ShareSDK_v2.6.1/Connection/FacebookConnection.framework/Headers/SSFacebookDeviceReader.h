//
//  SSFacebookDeviceReader.h
//  FacebookConnection
//
//  Created by 冯 鸿杰 on 13-10-23.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	设备信息读取器
 */
@interface SSFacebookDeviceReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	操作系统
 */
@property (nonatomic,readonly) NSString *os;

/**
 *	@brief	设备型号
 */
@property (nonatomic,readonly) NSString *hardware;

/**
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;


/**
 *	@brief	创建设备信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSFacebookDeviceReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
