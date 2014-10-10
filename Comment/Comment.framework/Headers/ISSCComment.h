///#begin zh-cn
//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
///#end
///#begin en
//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
///#end

#import <Foundation/Foundation.h>
#import <ShareSDK/ShareSDK.h>
#import "SSCommentTypeDef.h"

///#begin zh-cn
/**
 *	@brief	评论信息
 */
///#end
///#begin en
/**
 *	@brief	Comment information.
 */
///#end
@protocol ISSCComment <NSObject>

///#begin zh-cn
/**
 *	@brief	获取评论标识
 *
 *	@return	标识
 */
///#end
///#begin en
/**
 *	@brief	Get comment id.
 *
 *	@return	Comment id.
 */
///#end
- (NSString *)Id;

///#begin zh-cn
/**
 *	@brief	获取社交平台类型
 *
 *	@return	平台类型
 */
///#end
///#begin en
/**
 *	@brief	Get platform type.
 *
 *	@return	Platform type.
 */
///#end
- (ShareType)platType;

///#begin zh-cn
/**
 *	@brief	获取评论人性别, 0 男 1 女 2 未知
 *
 *	@return	性别。
 */
///#end
///#begin en
/**
 *	@brief	Get gender, 0 Male 1 Female 2 Unknown
 *
 *	@return	Gender.
 */
///#end
- (NSInteger)gender;

///#begin zh-cn
/**
 *	@brief	获取评论人名称
 *
 *	@return	评论人名称
 */
///#end
///#begin en
/**
 *	@brief	Get user nickname
 *
 *	@return	Nickname.
 */
///#end
- (NSString *)nickname;

///#begin zh-cn
/**
 *	@brief	获取评论人头像
 *
 *	@return	评论人头像
 */
///#end
///#begin en
/**
 *	@brief	Get comment icon.
 *
 *	@return	Comment icon.
 */
///#end
- (NSString *)icon;

///#begin zh-cn
/**
 *	@brief	获取认证类型
 *
 *	@return	认证类型
 */
///#end
///#begin en
/**
 *	@brief	Get verified type.
 *
 *	@return	Verified type.
 */
///#end
- (NSInteger)verifyType;

///#begin zh-cn
/**
 *	@brief	获取称赞数
 *
 *	@return	称赞数
 */
///#end
///#begin en
/**
 *	@brief	Get like count.
 *
 *	@return	Like count.
 */
///#end
- (NSInteger)likeCount;

///#begin zh-cn
/**
 *	@brief	获取省份／国家
 *
 *	@return	省份／国家
 */
///#end
///#begin en
/**
 *	@brief	Get Province / State
 *
 *	@return	Province / State
 */
///#end
- (NSString *)region;

///#begin zh-cn
/**
 *	@brief	获取评论内容
 *
 *	@return	评论内容
 */
///#end
///#begin en
/**
 *	@brief	Get comment content.
 *
 *	@return	Comment content.
 */
///#end
- (NSString *)content;

///#begin zh-cn
/**
 *	@brief	获取评论时间
 *
 *	@return	评论时间
 */
///#end
///#begin en
/**
 *	@brief	Get comment time.
 *
 *	@return	Comment time.
 */
///#end
- (NSTimeInterval)datetime;

///#begin zh-cn
/**
 *	@brief	获取楼层列表
 *
 *	@return	楼层列表
 */
///#end
///#begin en
/**
 *	@brief	Get a floor list.
 *
 *	@return	floor list.
 */
///#end
- (NSArray *)floors;

///#begin zh-cn
/**
 *	@brief	获取是否称赞标识
 *
 *	@return	YES 表示称赞，NO 表示尚未称赞
 */
///#end
///#begin en
/**
 *	@brief	Gets whether liked flag.
 *
 *	@return	YES liked, NO represents yet liked
 */
///#end
- (BOOL)liked;

///#begin zh-cn
/**
 *	@brief	获取评论状态
 *
 *	@return	－2 驳回 －1 垃圾评论 1 审核通过
 */
///#end
///#begin en
/**
 *	@brief	Get comment status.
 *
 *	@return	-2 Dismissed  -1 Spam 1 Audit by
 */
///#end
- (NSInteger)status;

@end
