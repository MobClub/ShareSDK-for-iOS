//
//  SSGooglePlusPlaceLivedReader.h
//  GooglePlusConnection
//
//  Created by 冯 鸿杰 on 13-10-25.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	居住地信息读取器
 */
@interface SSGooglePlusPlaceLivedReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	A place where this person has lived. For example: "Seattle, WA", "Near Toronto".
 */
@property (nonatomic,readonly) NSString *value;

/**
 *	@brief	If "true", this place of residence is this person's primary residence.
 */
@property (nonatomic,readonly) BOOL primary;

/**
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	创建组织信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSGooglePlusPlaceLivedReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
