//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>

@protocol ICMQuiltItemViewConstructorDelegate;

/**
 *	@brief	Quilt Item View Protocol.
 */
@protocol ICMQuiltItemView <NSObject>

@required

/**
 *	@brief	Initialize quilt item view.
 *
 *	@param 	reuseIdentifier 	Reuse identifier.
 *  @param  frame   Display rect.
 *
 *	@return	Quilt Item View.
 */
- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier frame:(CGRect)frame;

/**
 *	@brief	Get reuse identifier.
 *
 *	@return	Reuse identifier.
 */
- (NSString *)reuseIdentifier;

/**
 *	@brief	Layout the view，After calling this method indicates the need for a child falls flow layout and calculate the display area. Asynchronously distributed to:
 *          - (void)quiltItemView:(UIView<IQuiltItemView> *)quiltItemView frame:(CGRect)frame of the Construtor Delegate object;
 */
- (void)layout:(CGFloat)itemWidth;

/**
 *	@brief	Get constructor delegate.
 *
 *	@return	Delegate object.
 */
- (id<ICMQuiltItemViewConstructorDelegate>) constructorDelegate;

/**
 *	@brief	Set constructor delegate
 *
 *	@param 	constructorDelegate 	Delegate object.
 */
- (void)setConstructorDelegate:(id<ICMQuiltItemViewConstructorDelegate>)constructorDelegate;


@end

/**
 *	@brief	Quilt Item View Constructor Delegate, Only for Quilt View.
 */
@protocol ICMQuiltItemViewConstructorDelegate <NSObject>

@required

/**
 *	@brief	Get display rectangle of quilt item view.
 *
 *	@param 	quiltItemView 	Quilt item view.
 *	@param 	frame 	Display rectangle
 */
- (void)quiltItemView:(UIView<ICMQuiltItemView> *)quiltItemView frame:(CGRect)frame;


@end
