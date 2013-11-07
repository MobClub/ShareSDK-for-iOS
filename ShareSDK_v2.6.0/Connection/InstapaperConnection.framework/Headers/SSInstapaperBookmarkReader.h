//
//  SSInstapaperBookmarkReader.h
//  InstapaperConnection
//
//  Created by 冯 鸿杰 on 13-10-28.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	书签信息读取器
 */
@interface SSInstapaperBookmarkReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	书签ID
 */
@property (nonatomic,readonly) long long bookmarkId;

/**
 *	@brief	地址
 */
@property (nonatomic,readonly) NSString *url;

/**
 *	@brief	标题
 */
@property (nonatomic,readonly) NSString *title;

/**
 *	@brief	描述
 */
@property (nonatomic,readonly) NSString *description;

/**
 *	@brief	创建时间
 */
@property (nonatomic,readonly) long long time;

/**
 *	@brief	未知
 */
@property (nonatomic,readonly) BOOL starred;

/**
 *	@brief	私有源路径
 */
@property (nonatomic,readonly) NSString *privateSource;

/**
 *	@brief	未知
 */
@property (nonatomic,readonly) NSString *hash;

/**
 *	@brief	未知
 */
@property (nonatomic,readonly) NSInteger progress;

/**
 *	@brief	未知
 */
@property (nonatomic,readonly) long long progressTimestamp;

/**
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;


/**
 *	@brief	创建书签信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSInstapaperBookmarkReader *)readerWithSourceData:(NSDictionary *)sourceData;


@end
