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
 *	@brief	HTTP Posted File.
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
 *	@brief	File name.
 */
@property (nonatomic,readonly) NSString *fileName;

/**
 *	@brief	Content type.
 */
@property (nonatomic,readonly) NSString *contentType;

/**
 *	@brief	File data.
 */
@property (nonatomic,readonly) NSData *fileData;

/**
 *	@brief	Transfer encoding.
 */
@property (nonatomic,readonly) NSString *transferEncoding;

/**
 *	@brief	Initialize posted file.
 *
 *  @param  fileName    File name.
 *	@param 	data 	File data.
 *  @param  contentType Content type.
 *
 *	@return	Posted file object.
 */
- (id)initWithFileName:(NSString *)fileName data:(NSData *)data contentType:(NSString *)contentType;

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
- (id)initWithFileName:(NSString *)fileName
                  data:(NSData *)data
           contentType:(NSString *)contentType
      transferEncoding:(NSString *)transferEncoding;

/**
 *	@brief	Initialize posted file.
 *
 *	@param 	path 	File path.
 *  @param  contentType Content type.
 *
 *	@return	Posted file object.
 */
- (id)initWithFilePath:(NSString *)path contentType:(NSString *)contentType;


@end
