//
//  SSTencentWeiboVideoReader.h
//  TencentWeiboConnection
//
//  Created by vimfung on 13-10-20.
//  Copyright (c) 2013年 vimfung. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	视频信息
 */
@interface SSTencentWeiboVideoReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	缩略图
 */
@property (nonatomic,readonly) NSString *picurl;

/**
 *	@brief	播放器地址
 */
@property (nonatomic,readonly) NSString *player;

/**
 *	@brief	视频原地址
 */
@property (nonatomic,readonly) NSString *realurl;

/**
 *	@brief	视频的短url
 */
@property (nonatomic,readonly) NSString *shorturl;

/**
 *	@brief	视频标题
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
+ (SSTencentWeiboVideoReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
