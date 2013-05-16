//
//  IQuiltItemView.h
//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ICMQuiltItemViewConstructorDelegate;

/**
 *	@brief	瀑布流子项视图接口
 */
@protocol ICMQuiltItemView <NSObject>

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
- (id<ICMQuiltItemViewConstructorDelegate>) constructorDelegate;

/**
 *	@brief	设置构造器协议对象
 *
 *	@param 	constructorDelegate 	构造器协议对象
 */
- (void)setConstructorDelegate:(id<ICMQuiltItemViewConstructorDelegate>)constructorDelegate;


@end

/**
 *	@brief	瀑布流子项构造器协议,仅提供QuiltView实现
 */
@protocol ICMQuiltItemViewConstructorDelegate <NSObject>

@required

/**
 *	@brief	取得瀑布流子项视图显示区域
 *
 *	@param 	quiltItemView 	瀑布流子项视图
 *	@param 	frame 	显示区域
 */
- (void)quiltItemView:(UIView<ICMQuiltItemView> *)quiltItemView frame:(CGRect)frame;


@end
