//
//  SSDropboxUserReader.h
//  DropboxConnection
//
//  Created by 冯 鸿杰 on 13-10-30.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSDropboxQuotaInfoReader.h"

/**
 *	@brief	用户信息读取器
 */
@interface SSDropboxUserReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	用户ID
 */
@property (nonatomic,readonly) NSString *uid;

/**
 *	@brief	国家代号
 */
@property (nonatomic,readonly) NSString *country;

/**
 *	@brief	显示名称
 */
@property (nonatomic,readonly) NSString *displayName;

/**
 *	@brief	电子邮件
 */
@property (nonatomic,readonly) NSString *email;


@property (nonatomic,readonly) NSString *referralLink;

@property (nonatomic,readonly) SSDropboxQuotaInfoReader *quotaInfo;

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
+ (SSDropboxUserReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
