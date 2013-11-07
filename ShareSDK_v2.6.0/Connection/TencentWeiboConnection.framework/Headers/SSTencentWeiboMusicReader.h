//
//  SSTencentWeiboMusicReader.h
//  TencentWeiboConnection
//
//  Created by vimfung on 13-10-20.
//  Copyright (c) 2013年 vimfung. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	音乐信息
 */
@interface SSTencentWeiboMusicReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	演唱者
 */
@property (nonatomic,readonly) NSString *author;

/**
 *	@brief	音频地址
 */
@property (nonatomic,readonly) NSString *url;

/**
 *	@brief	音频名字，歌名
 */
@property (nonatomic,readonly) NSString *title;

/**
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	创建音乐信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSTencentWeiboMusicReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
