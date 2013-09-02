//
//  SSRenRenLike.h
//  RenRenConnection
//
//  Created by vimfung on 13-7-10.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/SSCDataObject.h>

/**
 *	@brief	喜欢
 */
@interface SSRenRenLike : SSCDataObject

/**
 *	@brief	喜欢的类型
 *  SPORT       运动
 *  MOVIE       电影
 *  CARTOON     动漫
 *  GAME        游戏
 *  MUSIC       音乐
 *  BOOK        书籍
 *  INTEREST	爱好
 */
@property (nonatomic,readonly) NSString *catagory;

/**
 *	@brief	喜欢的东西
 */
@property (nonatomic,readonly) NSString *name;

/**
 *	@brief	创建喜欢信息
 *
 *	@param 	response 	回复数据
 *
 *	@return	喜欢信息
 */
+ (SSRenRenLike *)likeWithResponse:(NSDictionary *)response;

@end
