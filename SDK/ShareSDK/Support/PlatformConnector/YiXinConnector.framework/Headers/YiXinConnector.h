//
//  YiXinConnector.h
//  ShareSDKConnector
//
//  Created by 冯鸿杰 on 16/9/29.
//  Copyright © 2016年 mob. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  易信连接器
 */
@interface YiXinConnector : NSObject

/**
 *  链接易信以供ShareSDK可以正常使用易信的相关功能（包括授权、分享）
 *
 *  @param yxApiClass 易信SDK中的类型，应先导入YXApi.h，再将[YXApi class]传入到参数中。
 */
+ (void)connect:(Class)yxApiClass;

@end
