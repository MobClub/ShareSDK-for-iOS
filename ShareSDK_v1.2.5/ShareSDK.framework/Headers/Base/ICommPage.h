//
//  ICommPage.h
//  AppgoFramework
//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:1955211608
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IPage.h"

/**
 *	@brief	公共分页（提供新浪微博、腾讯微博、Facebook的分页对象）
 */
@protocol ICommPage <IPage>


/**
 *	@brief	获取页码
 *
 *	@return	页码
 */
- (NSInteger)pageNo;

/**
 *	@brief	获取分页尺寸
 *
 *	@return	分页尺寸
 */
- (NSInteger)pageSize;


@end
