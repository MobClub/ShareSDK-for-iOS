//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>

/**
 *	@brief	附件协议
 */
@protocol ISSCAttachment <NSObject>

/**
 *	@brief	获取文件路径
 *
 *	@return	文件路径
 */
- (NSString *)path;

/**
 *	@brief	获取远程文件路径
 *
 *	@return	URL地址
 */
- (NSString *)url;

/**
 *	@brief	获取附件数据
 *
 *	@return	附件数据
 */
- (NSData *)data;

/**
 *	@brief	获取附件名称
 *
 *	@return	附件名称
 */
- (NSString *)fileName;

/**
 *	@brief	获取附件类型
 *
 *	@return	附件类型
 */
- (NSString *)mimeType;

/**
 *	@brief	判断是否为远程文件
 *
 *	@return	YES 表示为远程文件，NO 表示为本地文件
 */
- (BOOL)isRemoteFile;

/**
 *	@brief	加载附件信息
 *
 *  @param  completeHandler     加载完成事件处理
 *  @param  faultHandler        加载失败事件处理
 */
- (void)load:(void(^)())completeHandler
faultHandler:(void(^)(NSError *error))faultHandler;


@end