//
//  IQuiltItemView.h
//  CommonModule
//
//  Created by 冯 鸿杰 on 12-10-15.
//  Copyright (c) 2012年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IQuiltItemViewConstructorDelegate;

/**
 *	@brief	瀑布流子项视图接口
 */
@protocol IQuiltItemView <NSObject>

@required

/**
 *	@brief	根据引用标识初始化
 *
 *	@param 	reuseIdentifier 	复用标识
 *  @param  frame   显示区域
 *
 *	@return	对象
 */
- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier frame:(CGRect)frame;

/**
 *	@brief	获取复用标识
 *
 *	@return	复用标识
 */
- (NSString *)reuseIdentifier;

/**
 *	@brief	排版视图，调用此方法后表示瀑布流子项需要进行排版并计算显示区域，以异步方式向构造器协议对象派发：
 *          - (void)quiltItemView:(UIView<IQuiltItemView> *)quiltItemView frame:(CGRect)frame;
 */
- (void)layout:(CGFloat)itemWidth;


/**
 *	@brief	获取构造器协议对象
 *
 *	@return	构造器协议对象
 */
- (id<IQuiltItemViewConstructorDelegate>) constructorDelegate;

/**
 *	@brief	设置构造器协议对象
 *
 *	@param 	constructorDelegate 	构造器协议对象
 */
- (void)setConstructorDelegate:(id<IQuiltItemViewConstructorDelegate>)constructorDelegate;


@end

/**
 *	@brief	瀑布流子项构造器协议,仅提供QuiltView实现
 */
@protocol IQuiltItemViewConstructorDelegate <NSObject>

@required

/**
 *	@brief	取得瀑布流子项视图显示区域
 *
 *	@param 	quiltItemView 	瀑布流子项视图
 *	@param 	frame 	显示区域
 */
- (void)quiltItemView:(UIView<IQuiltItemView> *)quiltItemView frame:(CGRect)frame;


@end
