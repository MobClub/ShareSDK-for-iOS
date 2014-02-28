//
//  SSPage.h
//  ShareSDKInterface
//
//  Created by 冯 鸿杰 on 13-4-2.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef __SHARESDK_HEADER__
#import "ISSPage.h"
#else
#import "../Headers/ISSPage.h"
#endif

/**
 *	@brief	分页信息对象
 */
@interface SSPage : NSObject <ISSPage>
{
@private
    NSInteger _pageNo;
    NSInteger _pageSize;
    long long _cursor;
}

/**
 *	@brief	页码
 */
@property (nonatomic) NSInteger pageNo;

/**
 *	@brief	分页尺寸
 */
@property (nonatomic) NSInteger pageSize;

/**
 *	@brief	游标
 */
@property (nonatomic) long long cursor;

/**
 *	@brief	初始化分页信息
 *
 *	@param 	pageNo 	页码
 *	@param 	pageSize 	分页尺寸
 *
 *	@return	分页信息
 */
- (id)initWithPageNo:(NSInteger)pageNo pageSize:(NSInteger)pageSize;

/**
 *	@brief	初始化分页信息
 *
 *	@param 	cursor 	游标
 *
 *	@return	分页信息
 */
- (id)initWithCursor:(long long)cursor;


@end
