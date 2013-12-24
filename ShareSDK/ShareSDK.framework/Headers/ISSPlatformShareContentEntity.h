//
//  ISSPlatformShareContentEntity.h
//  ShareSDK
//
//  Created by vimfung on 13-10-14.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	分享内容实体协议，用于传递给各个平台进行分享的原始数据
 */
@protocol ISSPlatformShareContentEntity <NSObject>

@required

/**
 *	@brief	获取字段值
 *
 *	@param 	name 	字段名称
 *
 *	@return	字段值
 */
- (id)fieldForName:(NSString *)name;

/**
 *	@brief	设置字段值
 *
 *	@param 	field 	字段值
 *	@param 	name 	名称
 */
- (void)setField:(id)field forName:(NSString *)name;

@end
