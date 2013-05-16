//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>

/**
 *	@brief	书签信息
 */
@interface SSInstapaperBookmark : NSObject <NSCoding,
                                            ISSCDataObject>
{
@private
    NSMutableDictionary *_sourceData;
}

/**
 *	@brief	书签ID
 */
@property (nonatomic,readonly) long long bookmarkId;

/**
 *	@brief	地址
 */
@property (nonatomic,readonly) NSString *url;

/**
 *	@brief	标题
 */
@property (nonatomic,readonly) NSString *title;

/**
 *	@brief	描述
 */
@property (nonatomic,readonly) NSString *description;

/**
 *	@brief	创建时间
 */
@property (nonatomic,readonly) long long time;

/**
 *	@brief	未知
 */
@property (nonatomic,readonly) BOOL starred;

/**
 *	@brief	私有源路径
 */
@property (nonatomic,readonly) NSString *privateSource;

/**
 *	@brief	未知
 */
@property (nonatomic,readonly) NSString *hash;

/**
 *	@brief	未知
 */
@property (nonatomic,readonly) NSInteger progress;

/**
 *	@brief	未知
 */
@property (nonatomic,readonly) long long progressTimestamp;

/**
 *	@brief	源数据
 */
@property (nonatomic,retain) NSDictionary *sourceData;

/**
 *	@brief	创建书签信息
 *
 *	@param 	response 	回复数据
 *
 *	@return	书签信息
 */
+ (SSInstapaperBookmark *)bookmarkWithResponse:(NSDictionary *)response;

@end
