//
//  SSFacebookSecuritySettingReader.h
//  FacebookConnection
//
//  Created by 冯 鸿杰 on 13-10-23.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSFacebookSecureBrowsingReader.h"

/**
 *	@brief	安全设置信息读取器
 */
@interface SSFacebookSecuritySettingReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	安全浏览设置
 */
@property (nonatomic,readonly) SSFacebookSecureBrowsingReader *secureBrowsing;

/**
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	创建安全设置信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSFacebookSecuritySettingReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
