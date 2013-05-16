//
//  ICMHTableViewItem.h
//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	水平排版表格列表项
 */
@protocol ICMHTableViewItem <NSObject>

@required

/**
 *	@brief	获取复用标识
 *
 *	@return	复用标识
 */
- (NSString *)reuseIdentifier;

/**
 *	@brief	获取位置索引
 *
 *	@return	位置索引
 */
- (NSIndexPath *)indexPath;

/**
 *	@brief	设置位置索引
 *
 *	@param 	indexPath 	位置索引
 */
- (void)setIndexPath:(NSIndexPath *)indexPath;


/**
 *	@brief	根据引用标识初始化
 *
 *	@param 	reuseIdentifier 	复用标识
 *
 *	@return	对象
 */
- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier;



@end
