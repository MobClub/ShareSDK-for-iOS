//
//  SSCCommentMenuItem.h
//  Comment
//
//  Created by 冯 鸿杰 on 13-11-18.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	评论菜单项
 */
@interface SSCCommentMenuItem : NSObject

/**
 *	@brief	标题
 */
@property (nonatomic,copy) NSString *title;

/**
 *	@brief	排序
 */
@property (nonatomic,copy) NSComparator order;

@end
