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
#import "SSFacebookUser.h"

/**
 *	@brief	文章信息
 */
@interface SSFacebookPost : NSObject <NSCoding,
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
 *	@brief	ID
 */
@property (nonatomic,readonly) NSString *Id;

/**
 *	@brief	文章ID
 */
@property (nonatomic,readonly) NSString *postId;

/**
 *	@brief	发送用户
 */
@property (nonatomic,readonly) SSFacebookUser *from;

/**
 *	@brief	消息
 */
@property (nonatomic,readonly) NSString *message;

/**
 *	@brief	更新时间
 */
@property (nonatomic,readonly) NSString *updatedTime;

/**
 *	@brief	创建时间
 */
@property (nonatomic,readonly) NSString *createdTime;

/**
 *	@brief	图标
 */
@property (nonatomic,readonly) NSString *icon;

/**
 *	@brief	链接
 */
@property (nonatomic,readonly) NSString *link;

/**
 *	@brief	照片名称
 */
@property (nonatomic,readonly) NSString *name;

/**
 *	@brief	缩略图路径
 */
@property (nonatomic,readonly) NSString *picture;

/**
 *	@brief	源图路径
 */
@property (nonatomic,readonly) NSString *source;

/**
 *	@brief	高度
 */
@property (nonatomic,readonly) NSInteger height;

/**
 *	@brief	宽度
 */
@property (nonatomic,readonly) NSInteger width;

/**
 *	@brief	图片信息
 */
@property (nonatomic,readonly) NSArray *images;


/**
 *	@brief	创建文章信息
 *
 *	@param 	response 	回复数据
 *
 *	@return	 文章信息
 */
+ (SSFacebookPost *)postWithResponse:(NSDictionary *)response;

@end
