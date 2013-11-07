//
//  SSYouDaoNoteNoteReader.h
//  YouDaoNoteConnection
//
//  Created by 冯 鸿杰 on 13-10-29.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	笔记信息读取器
 */
@interface SSYouDaoNoteNoteReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

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
+ (SSYouDaoNoteNoteReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
