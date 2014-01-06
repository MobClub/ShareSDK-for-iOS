//
//  SSEverNoteNoteReader.h
//  EverNoteConnection
//
//  Created by 冯 鸿杰 on 13-10-24.
//  Copyright (c) 2013年 vimfung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSEverNoteNoteAttributesReader.h"

/**
 *	@brief	笔记信息读取器
 */
@interface SSEverNoteNoteReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	笔记的唯一标识
 */
@property (nonatomic,readonly) NSString *guid;

/**
 *	@brief	标题,不能前后带空格
 */
@property (nonatomic,readonly) NSString *title;

/**
 *	@brief	笔记内容
 */
@property (nonatomic,readonly) NSString *content;

/**
 *	@brief	笔记内容经过MD5的签名值
 */
@property (nonatomic,readonly) NSData *contentHash;

/**
 *	@brief	内容长度
 */
@property (nonatomic,readonly) NSInteger contentLength;

/**
 *	@brief	创建时间
 */
@property (nonatomic,readonly) long long created;

/**
 *	@brief	最后修改时间
 */
@property (nonatomic,readonly) long long updated;

/**
 *	@brief	删除时间
 */
@property (nonatomic,readonly) long long deleted;

/**
 *	@brief	笔记是否有效标识
 */
@property (nonatomic,readonly) BOOL active;

/**
 *	@brief	修改文章的事务标识
 */
@property (nonatomic,readonly) NSInteger updateSequenceNum;

/**
 *	@brief	笔记本的唯一标识
 */
@property (nonatomic,readonly) NSString *notebookGuid;

/**
 *	@brief	此笔记的标签的唯一标识列表
 */
@property (nonatomic,readonly) NSArray *tagGuids;

/**
 *	@brief	嵌入笔记中的资源列表
 */
@property (nonatomic,readonly) NSArray *resources;

/**
 *	@brief	笔记属性列表
 */
@property (nonatomic,readonly) SSEverNoteNoteAttributesReader *attributes;

/**
 *	@brief	标签名称列表
 */
@property (nonatomic,readonly) NSArray *tagNames;

/**
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	创建笔记信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSEverNoteNoteReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
