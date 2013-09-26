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
 *	@brief	笔记信息
 */
@interface SSYouDaoNoteNote : NSObject <NSCoding,
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
 *	@brief	笔记路径
 */
@property (nonatomic,readonly) NSString *path;

/**
 *	@brief	笔记标题
 */
@property (nonatomic,readonly) NSString *title;

/**
 *	@brief	笔记作者
 */
@property (nonatomic,readonly) NSString *author;

/**
 *	@brief	笔记来源URL
 */
@property (nonatomic,readonly) NSString *source;

/**
 *	@brief	笔记大小，包括笔记正文及附件
 */
@property (nonatomic,readonly) NSInteger size;

/**
 *	@brief	笔记的创建时间，单位秒
 */
@property (nonatomic,readonly) NSTimeInterval createTime;

/**
 *	@brief	笔记的最后修改时间，单位秒
 */
@property (nonatomic,readonly) NSTimeInterval modifyTime;

/**
 *	@brief	笔记正文
 */
@property (nonatomic,readonly) NSString *content;

/**
 *	@brief	创建笔记信息
 *
 *	@param 	response 	回复数据
 *
 *	@return	笔记信息
 */
+ (SSYouDaoNoteNote *)noteWithResponse:(NSDictionary *)response;

@end
