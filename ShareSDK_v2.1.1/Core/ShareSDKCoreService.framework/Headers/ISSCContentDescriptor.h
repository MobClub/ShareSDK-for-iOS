//
//  ISSCOpenAppShareContent.h
//  ShareSDKCoreService
//
//  Created by 冯 鸿杰 on 13-4-26.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	开放应用分享内容
 */
@protocol ISSCContentDescriptor <NSObject>

@required

/**
 *	@brief	获取微博ID
 *
 *	@return	微博ID
 */
- (NSString *)sid;

/**
 *	@brief	获取分享平台类型
 *
 *  @since  ver1.2.4
 *
 *	@return	分享平台类型
 */
- (SSCShareType)type;

/**
 *	@brief	获取源数据
 *
 *	@return 源数据
 */
- (NSDictionary *)sourceData;

@end
