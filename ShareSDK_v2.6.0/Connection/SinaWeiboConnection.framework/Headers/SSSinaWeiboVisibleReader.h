//
//  SSSinaWeiboVisibleReader.h
//  SinaWeiboConnection
//
//  Created by 冯 鸿杰 on 13-10-18.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	可见性信息读取器
 */
@interface SSSinaWeiboVisibleReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	类型
 */
@property (nonatomic,readonly) NSInteger type;

/**
 *	@brief	分组ID
 */
@property (nonatomic,readonly) NSString *listid;

/**
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;


/**
 *	@brief	创建可见性信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSSinaWeiboVisibleReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
