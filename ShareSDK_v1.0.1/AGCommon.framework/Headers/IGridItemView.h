//
//  IGridItemView.h
//  iAround
//
//  Created by hower on 5/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
	表格项接口，所有在ZGGridView中显示的项目都需要实现此接口.
 */
@protocol IGridItemView <NSObject>

@required

/**
	获取数据
	@returns 数据对象
 */
- (id)data;


/**
	设置数据
	@param data 数据对象
 */
- (void)setData:(id)data;

/**
 *	@brief	获取索引
 *
 *	@return	索引值
 */
- (NSInteger)index;


/**
 *	@brief	设置索引
 *
 *	@param 	index 	索引值
 */
- (void)setIndex:(NSInteger)index;



@end
