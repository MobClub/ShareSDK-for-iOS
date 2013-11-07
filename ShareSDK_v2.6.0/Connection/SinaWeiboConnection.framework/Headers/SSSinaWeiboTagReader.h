//
//  SSSinaWeiboTagReader.h
//  SinaWeiboConnection
//
//  Created by 冯 鸿杰 on 13-10-18.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	标签信息读取器
 */
@interface SSSinaWeiboTagReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	标签ID
 */
@property (nonatomic,readonly) long long Id;

/**
 *	@brief	标签
 */
@property (nonatomic,readonly) NSString *tag;

/**
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;


/**
 *	@brief	创建标签信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSSinaWeiboTagReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
