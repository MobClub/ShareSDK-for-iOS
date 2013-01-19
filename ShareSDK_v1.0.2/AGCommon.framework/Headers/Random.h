//
//  Random.h
//  CommonModule
//
//  Created by 冯 鸿杰 on 12-10-18.
//  Copyright (c) 2012年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	随机类
 */
@interface Random : NSObject

/**
 *	@brief	获取随机整型值
 *
 *	@param 	maxValue 	随机最大值
 *
 *	@return	随机整数
 */
- (NSInteger)getIntegerValue:(NSInteger)maxValue;


@end
