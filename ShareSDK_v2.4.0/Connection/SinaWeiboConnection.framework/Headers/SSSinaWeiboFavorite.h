//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/ISSCDataObject.h>

@class SSSinaWeiboStatus;

/**
 *	@brief	新浪微博收藏信息
 */
@interface SSSinaWeiboFavorite : NSObject <NSCoding,
                                           ISSCDataObject>
{
@private
    NSMutableDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,retain) NSDictionary *sourceData;

/**
 *	@brief	收藏时间
 */
@property (nonatomic,readonly) NSString *favoritedTime;

/**
 *	@brief	微博信息
 */
@property (nonatomic,readonly) SSSinaWeiboStatus *status;

/**
 *	@brief	标签列表
 */
@property (nonatomic,readonly) NSArray *tags;

/**
 *	@brief	创建收藏信息
 *
 *	@param 	response 	回复数据
 *
 *	@return	收藏信息
 */
+ (SSSinaWeiboFavorite *)favoriteWithResponse:(NSDictionary *)response;

@end
