//
//  SSLinkedInShareReader.h
//  LinkedInConnection
//
//  Created by vimfung on 13-10-26.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	分享信息读取器
 */
@interface SSLinkedInShareReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	分享标识
 */
@property (nonatomic,readonly) NSString *updateKey;

/**
 *	@brief	分享路径
 */
@property (nonatomic,readonly) NSString *updateUrl;

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
+ (SSLinkedInShareReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
