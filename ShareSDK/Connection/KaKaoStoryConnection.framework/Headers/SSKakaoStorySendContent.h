//
//  SSKakaoStorySendContent.h
//  KakaoStoryConnection
//
//  Created by chenjd on 15/11/18.
//  Copyright © 2015年 Mob. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SSKakaoStorySendContent : NSObject

/**
 *	@brief	分享类型
 */
@property (nonatomic, strong) NSNumber *mediaType;

/**
 *	@brief	发送内容
 */
@property (nonatomic, copy) NSString *content;

/**
 *  @brief  图片数组
 */
@property (nonatomic, strong) NSArray *images;

/**
 *	@brief	链接路径
 */
@property (nonatomic, copy) NSString *url;

/**
 *	@brief	iphone应用下载地址
 */
@property (nonatomic, copy) NSString *iphoneMarketParams;

/**
 *	@brief	安卓应用下载地址
 */
@property (nonatomic, copy) NSString *androidMarketParams;


@end
