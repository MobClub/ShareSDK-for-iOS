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
 *	@brief	年龄范围信息
 */
@interface SSFacebookAgeRange : NSObject <NSCoding,
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
 *	@brief	范围最小值
 */
@property (nonatomic,readonly) NSInteger min;

/**
 *	@brief	范围最大值
 */
@property (nonatomic,readonly) NSInteger max;

/**
 *	@brief	创建年龄范围信息
 *
 *	@param 	response 	回复数据
 *
 *	@return	年龄范围信息
 */
+ (SSFacebookAgeRange *)ageRangeWithResponse:(NSDictionary *)response;

@end
