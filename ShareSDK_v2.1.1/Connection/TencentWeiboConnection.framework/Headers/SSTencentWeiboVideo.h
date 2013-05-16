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
 *	@brief	视频信息
 */
@interface SSTencentWeiboVideo : NSObject <NSCoding,
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
 *	@brief	缩略图
 */
@property (nonatomic,readonly) NSString *picurl;

/**
 *	@brief	播放器地址
 */
@property (nonatomic,readonly) NSString *player;

/**
 *	@brief	视频原地址
 */
@property (nonatomic,readonly) NSString *realurl;

/**
 *	@brief	视频的短url
 */
@property (nonatomic,readonly) NSString *shorturl;

/**
 *	@brief	视频标题
 */
@property (nonatomic,readonly) NSString *title;

/**
 *	@brief	创建视频信息
 *
 *	@param 	response 	回复数据
 *
 *	@return	视频信息
 */
+ (SSTencentWeiboVideo *)videoWithResponse:(NSDictionary *)response;

@end
