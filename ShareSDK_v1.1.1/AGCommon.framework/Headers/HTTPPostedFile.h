//
//  HTTPPostedFile.h
//  CommonModule
//
//  Created by 冯 鸿杰 on 12-11-27.
//  Copyright (c) 2012年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	HTTP上传文件信息
 */
@interface HTTPPostedFile : NSObject
{
@private
    NSString *_fileName;
    NSString *_contentType;
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
 *	@param 	path 	文件路径
 *  @param  contentType 内容类型
 *
 *	@return	上传文件信息
 */
- (id)initWithFilePath:(NSString *)path contentType:(NSString *)contentType;


@end
