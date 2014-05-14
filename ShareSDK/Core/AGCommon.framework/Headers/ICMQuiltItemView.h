///#begin zh-cn
//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
///#end
///#begin en
//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
///#end


#import <Foundation/Foundation.h>

@protocol ICMQuiltItemViewConstructorDelegate;

///#begin zh-cn
/**
 *	@brief	瀑布流子项视图接口
 */
///#end
///#begin en
/**
 *	@brief	Quilt Item View Protocol.
 */
///#end
@protocol ICMQuiltItemView <NSObject>

@required

///#begin zh-cn
/**
 *	@brief	根据引用标识初始化
 *
 *	@param 	reuseIdentifier 	复用标识
 *  @param  frame   显示区域
 *
 *	@return	对象
 */
///#end
///#begin en
/**
 *	@brief	Initialize quilt item view.
 *
 *	@param 	reuseIdentifier 	Reuse identifier.
 *  @param  frame   Display rect.
 *
 *	@return	Quilt Item View.
 */
///#end
- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier frame:(CGRect)frame;

///#begin zh-cn
/**
 *	@brief	获取复用标识
 *
 *	@return	复用标识
 */
///#end
///#begin en
/**
 *	@brief	Get reuse identifier.
 *
 *	@return	Reuse identifier.
 */
///#end
- (NSString *)reuseIdentifier;

///#begin zh-cn
/**
 *	@brief	排版视图，调用此方法后表示瀑布流子项需要进行排版并计算显示区域，以异步方式向构造器协议对象派发：
 *          - (void)quiltItemView:(UIView<IQuiltItemView> *)quiltItemView frame:(CGRect)frame;
 */
///#end
///#begin en
/**
 *	@brief	Layout the view，After calling this method indicates the need for a child falls flow layout and calculate the display area. Asynchronously distributed to:
 *          - (void)quiltItemView:(UIView<IQuiltItemView> *)quiltItemView frame:(CGRect)frame of the Construtor Delegate object;
 */
///#end
- (void)layout:(CGFloat)itemWidth;

///#begin zh-cn
/**
 *	@brief	获取构造器协议对象
 *
 *	@return	构造器协议对象
 */
///#end
///#begin en
/**
 *	@brief	Get constructor delegate.
 *
 *	@return	Delegate object.
 */
///#end
- (id<ICMQuiltItemViewConstructorDelegate>) constructorDelegate;

///#begin zh-cn
/**
 *	@brief	设置构造器协议对象
 *
 *	@param 	constructorDelegate 	构造器协议对象
 */
///#end
///#begin en
/**
 *	@brief	Set constructor delegate
 *
 *	@param 	constructorDelegate 	Delegate object.
 */
///#end
- (void)setConstructorDelegate:(id<ICMQuiltItemViewConstructorDelegate>)constructorDelegate;


@end

///#begin zh-cn
/**
 *	@brief	瀑布流子项构造器协议,仅提供QuiltView实现
 */
///#end
///#begin en
/**
 *	@brief	Quilt Item View Constructor Delegate, Only for Quilt View.
 */
///#end
@protocol ICMQuiltItemViewConstructorDelegate <NSObject>

@required

///#begin zh-cn
/**
 *	@brief	取得瀑布流子项视图显示区域
 *
 *	@param 	quiltItemView 	瀑布流子项视图
 *	@param 	frame 	显示区域
 */
///#end
///#begin en
/**
 *	@brief	Get display rectangle of quilt item view.
 *
 *	@param 	quiltItemView 	Quilt item view.
 *	@param 	frame 	Display rectangle
 */
///#end
- (void)quiltItemView:(UIView<ICMQuiltItemView> *)quiltItemView frame:(CGRect)frame;


@end
