//
//  SSDropboxFileReader.h
//  DropboxConnection
//
//  Created by 冯 鸿杰 on 13-10-30.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	文件信息读取器
 */
@interface SSDropboxFileReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

@property (nonatomic,readonly) long long bytes;

@property (nonatomic,readonly) NSString *clientMtime;

@property (nonatomic,readonly) NSString *icon;

@property (nonatomic,readonly) BOOL isDir;

@property (nonatomic,readonly) NSString *mimeType;

@property (nonatomic,readonly) NSString *modified;

@property (nonatomic,readonly) NSString *path;

@property (nonatomic,readonly) long long rev;

@property (nonatomic,readonly) NSInteger revision;

@property (nonatomic,readonly) NSString *root;

@property (nonatomic,readonly) NSString *size;

@property (nonatomic,readonly) BOOL thumbExists;

/**
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;


/**
 *	@brief	创建读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSDropboxFileReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
