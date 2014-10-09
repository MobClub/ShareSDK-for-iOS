///#begin zh-cn
//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
///#end
///#begin en
//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
///#end

#import <Foundation/Foundation.h>

///#begin zh-cn
/**
 *	@brief	HTTP上传文件信息
 */
///#end
///#begin en
/**
 *	@brief	HTTP Posted File.
 */
///#end
@interface CMHTTPPostedFile : NSObject
{
@private
    NSString *_fileName;
    NSString *_contentType;
    NSString *_transferEncoding;
    NSData *_fileData;
}

///#begin zh-cn
/**
 *	@brief	文件名称
 */
///#end
///#begin en
/**
 *	@brief	File name.
 */
///#end
@property (nonatomic,readonly) NSString *fileName;

///#begin zh-cn
/**
 *	@brief	内容类型
 */
///#end
///#begin en
/**
 *	@brief	Content type.
 */
///#end
@property (nonatomic,readonly) NSString *contentType;

///#begin zh-cn
/**
 *	@brief	文件数据
 */
///#end
///#begin en
/**
 *	@brief	File data.
 */
///#end
@property (nonatomic,readonly) NSData *fileData;

///#begin zh-cn
/**
 *	@brief	内容传输编码
 */
///#end
///#begin en
/**
 *	@brief	Transfer encoding.
 */
///#end
@property (nonatomic,readonly) NSString *transferEncoding;

///#begin zh-cn
/**
 *	@brief	初始化上传文件
 *
 *  @param  fileName    文件名称
 *	@param 	data 	文件数据
 *  @param  contentType 内容类型
 *
 *	@return	上传文件信息
 */
///#end
///#begin en
/**
 *	@brief	Initialize posted file.
 *
 *  @param  fileName    File name.
 *	@param 	data 	File data.
 *  @param  contentType Content type.
 *
 *	@return	Posted file object.
 */
///#end
- (id)initWithFileName:(NSString *)fileName data:(NSData *)data contentType:(NSString *)contentType;

///#begin zh-cn
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
///#end
///#begin en
/**
 *	@brief	Initialize posted file.
 *
 *  @param  fileName    File name.
 *	@param 	data 	File data.
 *  @param  contentType     Content type.
 *  @param  transferEncoding     Transfer encoding.
 *
 *	@return	Posted file object.
 */
///#end
- (id)initWithFileName:(NSString *)fileName
                  data:(NSData *)data
           contentType:(NSString *)contentType
      transferEncoding:(NSString *)transferEncoding;

///#begin zh-cn
/**
 *	@brief	初始化上传文件
 *
 *	@param 	path 	文件路径
 *  @param  contentType 内容类型
 *
 *	@return	上传文件信息
 */
///#end
///#begin en
/**
 *	@brief	Initialize posted file.
 *
 *	@param 	path 	File path.
 *  @param  contentType Content type.
 *
 *	@return	Posted file object.
 */
///#end
- (id)initWithFilePath:(NSString *)path contentType:(NSString *)contentType;


@end
