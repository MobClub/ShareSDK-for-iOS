//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSTwitterSizes.h"

/**
 *	@brief	媒体信息
 */
@interface SSTwitterMedia : NSObject <NSCoding>
{
@private
    NSMutableDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,retain) NSDictionary *sourceData;

/**
 *	@brief	客户端显示URL
 */
@property (nonatomic,readonly) NSString *displayUrl;

/**
 *	@brief	扩展版显示URL，链接到显示页面。
 */
@property (nonatomic,readonly) NSString *expandedUrl;

/**
 *	@brief	媒体ID
 */
@property (nonatomic,readonly) long long Id;

/**
 *	@brief	媒体ID字符串
 */
@property (nonatomic,readonly) NSString *idStr;

/**
 *	@brief	URL在Tweet文本中的起始位置和结束位置索引
 */
@property (nonatomic,readonly) NSArray *indices;

/**
 *	@brief	上传媒体文件的URL
 */
@property (nonatomic,readonly) NSString *mediaUrl;

/**
 *	@brief	基于HTTPS的上传媒体文件URL
 */
@property (nonatomic,readonly) NSString *mediaUrlHttps;

/**
 *	@brief	媒体文件大小
 */
@property (nonatomic,readonly) SSTwitterSizes *sizes;

/**
 *	@brief	源Tweet的ID
 */
@property (nonatomic,readonly) long long sourceStatusId;

/**
 *	@brief	源Tweet的ID字符串
 */
@property (nonatomic,readonly) NSString *sourceStatusIdStr;

/**
 *	@brief	类型
 */
@property (nonatomic,readonly) NSString *type;

/**
 *	@brief	媒体链接的URL
 */
@property (nonatomic,readonly) NSString *url;

/**
 *	@brief	创建媒体信息
 *
 *	@param 	response 	回复数据
 *
 *	@return	媒体信息
 */
+ (SSTwitterMedia *)mediaWithResponse:(NSDictionary *)response;

@end
