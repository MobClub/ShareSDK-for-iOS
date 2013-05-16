//
//  HTTPPostedFile.h
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
 *	@brief	HTTP上传文件信息
 */
@interface CMHTTPPostedFile : NSObject
{
@private
    NSString *_fileName;
    NSString *_contentType;
    NSString *_transferEncoding;
    NSData *_fileData;
}

/**
 *	@brief	文件名称
 */
@property (nonatomic,readonly) NSString *fileName;

/**
 *	@brief	内容类型
 */
@property (nonatomic,readonly) NSString *contentType;

/**
 *	@brief	文件数据
 */
@property (nonatomic,readonly) NSData *fileData;

/**
 *	@brief	内容传输编码
 */
@property (nonatomic,readonly) NSString *transferEncoding;


/**
 *	@brief	初始化上传文件
 *
 *  @param  fileName    文件名称
 *	@param 	data 	文件数据
 *  @param  contentType 内容类型
 *
 *	@return	上传文件信息
 */
- (id)initWithFileName:(NSString *)fileName data:(NSData *)data contentType:(NSString *)contentType;

/**
 *	@brief	初始化上传文件
 *
 *  @param  fileName    文件名称
 *	@param 	data 	文件数据
 *  @param  contentType 内容类型
 *  @param  transferEncoding     传输编码
 *
 *	@return	上传文件信息
 */
- (id)initWithFileName:(NSString *)fileName
                  data:(NSData *)data
           contentType:(NSString *)contentType
      transferEncoding:(NSString *)transferEncoding;

/**
 *	@brief	初始化上传文件
 *
 *	@param 	path 	文件路径
 *  @param  contentType 内容类型
 *
 *	@return	上传文件信息
 */
- (id)initWithFilePath:(NSString *)path contentType:(NSString *)contentType;


@end
