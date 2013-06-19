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
 *	@brief	相册图片
 */
@interface SSQZoneAlbumImage : NSObject <NSCoding,
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
 *	@brief	相册ID
 */
@property (nonatomic,readonly) NSString *albumid;

/**
 *	@brief	大图ID
 */
@property (nonatomic,readonly) NSString *lloc;

/**
 *	@brief	小图ID
 */
@property (nonatomic,readonly) NSString *sloc;

/**
 *	@brief	大图地址
 */
@property (nonatomic,readonly) NSString *largeUrl;

/**
 *	@brief	小图地址
 */
@property (nonatomic,readonly) NSString *smallUrl;

/**
 *	@brief	图片高（单位：像素）
 */
@property (nonatomic,readonly) NSInteger height;

/**
 *	@brief	图片宽（单位：像素）
 */
@property (nonatomic,readonly) NSInteger width;

/**
 *	@brief	创建相册图片信息
 *
 *	@param 	response 	服务器返回数据
 *
 *	@return	用户信息对象
 */
+ (SSQZoneAlbumImage *)albumWithResponse:(NSDictionary *)response;

@end
