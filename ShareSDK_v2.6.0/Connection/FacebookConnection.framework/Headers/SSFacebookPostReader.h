//
//  SSFacebookPostReader.h
//  FacebookConnection
//
//  Created by 冯 鸿杰 on 13-10-23.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SSFacebookUserReader;

/**
 *	@brief	文章信息读取器
 */
@interface SSFacebookPostReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	ID
 */
@property (nonatomic,readonly) NSString *Id;

/**
 *	@brief	文章ID
 */
@property (nonatomic,readonly) NSString *postId;

/**
 *	@brief	发送用户
 */
@property (nonatomic,readonly) SSFacebookUserReader *from;

/**
 *	@brief	消息
 */
@property (nonatomic,readonly) NSString *message;

/**
 *	@brief	更新时间
 */
@property (nonatomic,readonly) NSString *updatedTime;

/**
 *	@brief	创建时间
 */
@property (nonatomic,readonly) NSString *createdTime;

/**
 *	@brief	图标
 */
@property (nonatomic,readonly) NSString *icon;

/**
 *	@brief	链接
 */
@property (nonatomic,readonly) NSString *link;

/**
 *	@brief	照片名称
 */
@property (nonatomic,readonly) NSString *name;

/**
 *	@brief	缩略图路径
 */
@property (nonatomic,readonly) NSString *picture;

/**
 *	@brief	源图路径
 */
@property (nonatomic,readonly) NSString *source;

/**
 *	@brief	高度
 */
@property (nonatomic,readonly) NSInteger height;

/**
 *	@brief	宽度
 */
@property (nonatomic,readonly) NSInteger width;

/**
 *	@brief	图片信息
 */
@property (nonatomic,readonly) NSArray *images;

/**
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	创建文章信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSFacebookPostReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
