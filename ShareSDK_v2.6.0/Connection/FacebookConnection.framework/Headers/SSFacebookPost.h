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
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	文章信息
 */
@interface SSFacebookPost : NSObject <ISSPlatformShareInfo,
                                      NSCoding,
                                      ISSCDataObject>
{
@private
    NSDictionary *_sourceData;
    NSString *_sid;
    NSString *_text;
    NSArray *_urls;
    NSArray *_imgs;
    NSDictionary *_extInfo;
}

/**
 *	@brief	分享ID
 */
@property (nonatomic,copy) NSString *sid;

/**
 *	@brief	分享内容
 */
@property (nonatomic,copy) NSString *text;

/**
 *	@brief	分享的链接列表
 */
@property (nonatomic,retain) NSArray *urls;

/**
 *	@brief	分享的图片列表
 */
@property (nonatomic,retain) NSArray *imgs;

/**
 *	@brief	扩展信息
 */
@property (nonatomic,retain) NSDictionary *extInfo;

/**
 *	@brief	原始数据
 */
@property (nonatomic,retain) NSDictionary *sourceData;


/**
 *	@brief	创建文章信息
 *
 *	@param 	response 	回复数据
 *
 *	@return	 文章信息
 */
+ (SSFacebookPost *)postWithResponse:(NSDictionary *)response;

@end
