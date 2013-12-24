//
//  SSYouDaoNoteUserReader.h
//  YouDaoNoteConnection
//
//  Created by vimfung on 13-10-28.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	用户信息读取器
 */
@interface SSYouDaoNoteUserReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	用户ID
 */
@property (nonatomic,readonly) NSString *uid;

/**
 *	@brief	用户注册时间，单位毫秒
 */
@property (nonatomic,readonly) CGFloat registerTime;

/**
 *	@brief	用户已经使用了的空间大小，单位字节
 */
@property (nonatomic,readonly) long usedSize;

/**
 *	@brief	用户总的空间大小，单位字节
 */
@property (nonatomic,readonly) long totalSize;

/**
 *	@brief	用户最后登录时间，单位毫秒
 */
@property (nonatomic,readonly) CGFloat lastLoginTime;

/**
 *	@brief	用户最后修改时间，单位毫秒
 */
@property (nonatomic,readonly) CGFloat lastModifyTime;

/**
 *	@brief	该应用的默认笔记本
 */
@property (nonatomic,readonly) NSString *defaultNotebook;

/**
 *	@brief	用户ID
 */
@property (nonatomic,readonly) NSString *user;

/**
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	创建用户信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSYouDaoNoteUserReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
