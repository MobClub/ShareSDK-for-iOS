//
//  ISSAuthView.h
//  ShareSDKInterface
//
//  Created by 冯 鸿杰 on 13/3/31.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	授权视图协议
 */
@protocol ISSAuthView <NSObject>

/**
 *	@brief	关闭授权视图
 *
 *  @param  closeHandler    关闭视图事件处理
 */
- (void)close:(void (^)(id<ISSAuthView> authView))closeHandler;


@end
