//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>

/**
 *	@brief	Attachment protocol.
 */
@protocol ISSCAttachment <NSObject>

/**
 *	@brief	Get file path.
 *
 *	@return	Path.
 */
- (NSString *)path;

/**
 *	@brief	Get URL address.
 *
 *	@return	URL address.
 */
- (NSString *)url;

/**
 *	@brief	Get attachment data.
 *
 *	@return	Attachment data.
 */
- (NSData *)data;

/**
 *	@brief	Get file name.
 *
 *	@return	File name.
 */
- (NSString *)fileName;

/**
 *	@brief	Get MIME type.
 *
 *	@return	MIME type.
 */
- (NSString *)mimeType;

/**
 *	@brief	Is remote file flag.
 *
 *	@return	YES means of remote files, NO is a local file
 */
- (BOOL)isRemoteFile;

/**
 *	@brief	Load attachment data.
 *
 *  @param  completeHandler     Completed handler.
 *  @param  faultHandler        Fault handler.
 */
- (void)load:(void(^)())completeHandler
faultHandler:(void(^)(NSError *error))faultHandler;


@end