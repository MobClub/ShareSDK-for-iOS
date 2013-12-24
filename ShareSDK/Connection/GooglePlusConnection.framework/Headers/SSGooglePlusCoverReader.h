//
//  SSGooglePlusCoverReader.h
//  GooglePlusConnection
//
//  Created by 冯 鸿杰 on 13-10-25.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSGooglePlusCoverInfoReader.h"
#import "SSGooglePlusCoverPhotoReader.h"

/**
 *	@brief  封面读取器
 */
@interface SSGooglePlusCoverReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	The layout of the cover art. Possible values are:
 *          "banner" - One large image banner.
 */
@property (nonatomic,readonly) NSString *layout;

/**
 *	@brief	Extra information about the cover photo.
 */
@property (nonatomic,readonly) SSGooglePlusCoverInfoReader *coverInfo;

/**
 *	@brief	The person's primary cover image.
 */
@property (nonatomic,readonly) SSGooglePlusCoverPhotoReader *coverPhoto;

/**
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	创建封面读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSGooglePlusCoverReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
