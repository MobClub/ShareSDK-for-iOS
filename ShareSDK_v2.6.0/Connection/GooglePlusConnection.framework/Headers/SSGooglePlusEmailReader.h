//
//  SSGooglePlusEmailReader.h
//  GooglePlusConnection
//
//  Created by 冯 鸿杰 on 13-10-25.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	邮件信息读取器
 */
@interface SSGooglePlusEmailReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	The email address.
 */
@property (nonatomic,readonly) NSString *value;

/**
 *	@brief	The type of address. Possible values are:
 *          "home" - Home email address.
 *          "work" - Work email address.
 *          "other" - Other.
 */
@property (nonatomic,readonly) NSString *type;

/**
 *	@brief	If "true", indicates this email address is the person's primary one.
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
 *	@brief	创建邮件信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSGooglePlusEmailReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
