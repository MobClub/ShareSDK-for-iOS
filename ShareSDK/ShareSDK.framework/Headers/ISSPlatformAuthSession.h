//
//  ISSPlatformAuthSession.h
//  ShareSDK
//
//  Created by 冯 鸿杰 on 13-10-17.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ISSPlatformCredential.h"

/**
 *	@brief	授权返回事件
 */
typedef void(^SSAuthResultEvent) (SSResponseState state, id<ISSPlatformCredential> credential, CMErrorInfo *error);


/**
 *	@brief	平台授权会话协议
 */
@protocol ISSPlatformAuthSession <NSObject>

@required

/**
 *	@brief	分享类型
 *
 *	@return	分享类型
 */
- (ShareType)type;

/**
 *	@brief	开始授权
 *
 *  @param  allowCallback   是否允许回调到服务器，默认为YES，对于无服务器端应用或者不需要回调授权数据到服务器的应用可以设置为NO。
 *  @param  ssoLogin    SSO授权登录表示，YES 表示优先使用SSO进行授权，否则直接使用Web授权
 *  @param  scopes  权限列表
 *	@param 	result 	返回事件
 */
- (void)startWithAllowCallback:(BOOL)allowCallback
                      ssoLogin:(BOOL)ssoLogin
                        scopes:(NSArray *)scopes
                        result:(SSAuthResultEvent)result;

/**
 *	@brief	取消授权
 */
- (void)cancel;

/**
 *	@brief	获取授权视图,如果返回nil则表示使用SSO方式进行登录。(注：请调用start方法后使用此属性，否则将恒定返回nil。)
 *
 *	@return	授权视图
 */
- (UIView *)view;

/**
 *	@brief	SSO登录标识,目前仅新浪微博、Facebook支持SSO.(注：请调用start方法后使用此属性，否则将恒定返回NO)
 *
 *	@return	YES 表示SSO登录， NO 表示Web登录
 */
- (BOOL)isSSOLogin;


@end
