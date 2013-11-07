//
//  SSSohuBookmarkReader.h
//  SohuConnection
//
//  Created by 冯 鸿杰 on 13-10-29.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	书签信息读取器
 */
@interface SSSohuBookmarkReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	书签id，对单个用户此id具有唯一性
 */
@property (nonatomic,readonly) NSString *Id;

/**
 *	@brief	书签来源url
 */
@property (nonatomic,readonly) NSString *url;

/**
 *	@brief	书签标题
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
 *	@brief	创建读取器j
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSSohuBookmarkReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
