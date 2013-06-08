//
//  ISSCOpenAppUser.h
//  ShareSDKCoreService
//
//  Created by 冯 鸿杰 on 13-4-26.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSCTypeDef.h"

/**
 *	@brief	开放应用用户信息
 */
@protocol ISSCUserDescriptor <NSObject>

@required

/**
 *	@brief	获取用户ID
 *
 *	@return	用户ID
 */
- (NSString *)uid;

/**
 *	@brief	获取分享平台类型
 *
 *  @since  ver1.2.4
 *
 *	@return	分享平台类型
 */
- (SSCShareType)type;

/**
 *	@brief	获取于平台相关的用户信息，用户结构可以参考各个平台连接器中定义
 *
 *	@return	用户信息
 */
- (id)localUser;

/**
 *	@brief	获取源用户信息数据，此属性根据不同平台取得的用户信息结构不相同，详细请参考官方API文档描述。
 *
 *	@return	源用户信息数据
 */
- (NSDictionary *)sourceData;

@end
