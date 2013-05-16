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
 *	@brief	图片信息
 */
@interface SSDouBanImage : NSObject <NSCoding,
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
 *	@brief	图片URL
 */
@property (nonatomic,readonly) NSString *src;

/**
 *	@brief	图片来源地址
 */
@property (nonatomic,readonly) NSString *href;

/**
 *	@brief	媒体类型
 */
@property (nonatomic,readonly) NSString *type;

/**
 *	@brief	图片尺寸
 */
@property (nonatomic,readonly) NSDictionary *sizes;

/**
 *	@brief	原图片路径
 */
@property (nonatomic,readonly) NSString *originalSrc;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) NSString *secretPid;

/**
 *	@brief	创建图片媒体信息
 *
 *	@param 	response 	回复数据
 *
 *	@return	图片媒体信息
 */
+ (SSDouBanImage *)imageWithResponse:(NSDictionary *)response;

@end
