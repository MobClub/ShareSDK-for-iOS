//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
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
