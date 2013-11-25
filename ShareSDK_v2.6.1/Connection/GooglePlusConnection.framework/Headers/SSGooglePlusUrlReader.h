//
//  SSGooglePlusUrlReader.h
//  GooglePlusConnection
//
//  Created by 冯 鸿杰 on 13-10-25.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	URL读取器
 */
@interface SSGooglePlusUrlReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	The URL value.
 */
@property (nonatomic,readonly) NSString *value;

/**
 *	@brief	The type of URL. Possible values are:
 *          "home" - URL for home.
 *          "work" - URL for work.
 *          "blog" - URL for blog.
 *          "profile" - URL for profile.
 *          "other" - Other.
 */
@property (nonatomic,readonly) NSString *type;

/**
 *	@brief	If "true", this URL is the person's primary URL.
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
 *	@brief	创建URL信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSGooglePlusUrlReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
