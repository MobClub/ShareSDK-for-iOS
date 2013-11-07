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
 *	@brief	物信息
 */
@interface SSDouBanAttachment : NSObject <NSCoding,
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
 *	@brief	子标题
 */
@property (nonatomic,readonly) NSString *caption;

/**
 *	@brief	描述，可以为空，最大长度200字节（100汉字或200字母）
 */
@property (nonatomic,readonly) NSString *description;

/**
 *	@brief	链接，url最大长度1024，需要分析并展示网站域名
 */
@property (nonatomic,readonly) NSString *href;

/**
 *	@brief	富媒体，允许 image, flash, music 单条广播所有[[BR]]图片无最小值限制，
 *  文件最大不超过3M[[BR]]缩略图：最大边150px[[BR]]点击展开后：宽度最大460px，高度不限[[BR]]原图大小无宽高限制
 */
@property (nonatomic,readonly) NSArray *media;

/**
 *	@brief	如果有分类，这里存放对应类别的详细数据，具体的字段由该类别自行定义
 */
@property (nonatomic,readonly) id properties;

/**
 *	@brief	标题，如果传空，会显示‘无标题’， 最大长度100字节（50汉字或100字母）
 */
@property (nonatomic,readonly) NSString *title;

/**
 *	@brief	分类，预留字段
 */
@property (nonatomic,readonly) NSString *type;

/**
 *	@brief	创建物信息
 *
 *	@param 	response 	回复数据
 *
 *	@return	物信息
 */
+ (SSDouBanAttachment *)attachmentWithResponse:(NSDictionary *)response;

@end
