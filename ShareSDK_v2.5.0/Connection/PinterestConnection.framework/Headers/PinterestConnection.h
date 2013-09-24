//
//  PinterestConnection.h
//  PinterestConnection
//
//  Created by 冯 鸿杰 on 13-8-29.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ISSPinterestApp.h"

/**
 *	@brief	Pinterest连接器
 */
@interface PinterestConnection : NSObject

/**
 *	@brief	注册微信应用
 *
 *  @param  account 帐号
 *	@param 	clientId 	应用ID
 *  @param  pinterestCls   微信API类型
 *
 *	@return	应用对象
 */
+ (id<ISSPinterestApp>)registerApp:(id<ISSCAccount>)account
                          clientId:(NSString *)clientId
                      pinterestCls:(Class)pinterestCls;


@end
