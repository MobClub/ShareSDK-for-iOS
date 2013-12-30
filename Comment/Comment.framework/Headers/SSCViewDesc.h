//
//  SSCViewDesc.h
//  Comment
//
//  Created by 冯 鸿杰 on 13-12-5.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSCommentTypeDef.h"

/**
 *	@brief	视图描述
 */
@interface SSCViewDesc : NSObject

/**
 *	@brief	导航栏背景图
 */
@property (nonatomic,retain) UIImage *navigationBarBackgroundImage;

/**
 *	@brief	导航栏背景颜色
 */
@property (nonatomic,retain) UIColor *navigationBarBackgroundColor;

/**
 *	@brief	评论列表视图将要显示事件
 */
@property (nonatomic,copy) SSCViewWillDiplayEvent commentListViewWillDisplayHandler;

/**
 *	@brief	帐号视图将要显示事件
 */
@property (nonatomic,copy) SSCViewWillDiplayEvent accountViewWillDisplayHandler;

/**
 *	@brief	评论视图将要显示事件
 */
@property (nonatomic,copy) SSCViewWillDiplayEvent commentViewWillDisplayHandler;

@end
