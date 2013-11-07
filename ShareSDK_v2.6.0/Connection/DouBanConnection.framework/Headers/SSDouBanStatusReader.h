//
//  SSDouBanStatusReader.h
//  DouBanConnection
//
//  Created by 冯 鸿杰 on 13-10-22.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSDouBanEntityReader.h"
#import "SSDouBanSourceReader.h"

@class SSDouBanUserReader;

/**
 *	@brief	广播信息读取器
 */
@interface SSDouBanStatusReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	是否可被回应
 */
@property (nonatomic,readonly) BOOL canReply;

/**
 *	@brief	attachments是一个json array格式的字符串， array里面的元素称为物,
 *          目前每条广播只支持单个物，物是每条广播表述的行为中的那个宾语，例如： xx推荐网址， 网址就是这个‘物’，
 */
@property (nonatomic,readonly) NSArray *attachments;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) NSString *category;

/**
 *	@brief	回应数
 */
@property (nonatomic,readonly) NSInteger commentsCount;

/**
 *	@brief	发广播的时间
 */
@property (nonatomic,readonly) NSString *createdAt;

/**
 *	@brief	暂无
 */
@property (nonatomic,retain) SSDouBanEntityReader *entities;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) BOOL hasPhoto;

/**
 *	@brief	广播id
 */
@property (nonatomic,readonly) NSString *Id;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) BOOL isFollow;

/**
 *	@brief	赞的数量
 */
@property (nonatomic,readonly) NSInteger likeCount;

/**
 *	@brief	是否已经喜欢
 */
@property (nonatomic,readonly) BOOL liked;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) BOOL muted;

/**
 *	@brief	转播数
 */
@property (nonatomic,readonly) NSInteger resharedCount;

/**
 *	@brief	app key对应的应用名和应用url
 */
@property (nonatomic,readonly) SSDouBanSourceReader *source;

/**
 *	@brief	web段在引号内展示的一段文本, 一般为用户输入的内容
 */
@property (nonatomic,readonly) NSString *text;

/**
 *	@brief	广播的title
 */
@property (nonatomic,readonly) NSString *title;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) NSString *type;

/**
 *	@brief	发广播者
 */
@property (nonatomic,readonly) SSDouBanUserReader *user;

/**
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;


/**
 *	@brief	创建用户信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSDouBanStatusReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
