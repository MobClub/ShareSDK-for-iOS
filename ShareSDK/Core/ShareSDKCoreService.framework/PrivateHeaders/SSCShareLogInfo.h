//
//  SSCShareLogInfo.h
//  ShareSDKCoreService
//
//  Created by 冯 鸿杰 on 13-4-25.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import "SSCLogInfo.h"

#ifdef __SHARESDK_CORE_SERVICE_HEADER__
#import "SSCTypeDef.h"
#import "ISSCContentDescriptor.h"
#import "ISSCUserDescriptor.h"
#else
#import "../Headers/SSCTypeDef.h"
#import "../Headers/ISSCContentDescriptor.h"
#import "../Headers/ISSCUserDescriptor.h"
#endif

/**
 *	@brief	分享日志信息
 */
@interface SSCShareLogInfo : SSCLogInfo
{
@private
    SSCShareType _shareType;
    id<ISSCUserDescriptor> _user;
    NSString *_contentId;
    NSDictionary *_content;
    NSString *_target;
}

/**
 *	@brief	初始化分享日志信息（带授权功能的平台调用）
 *
 *  @param  type    平台类型
 *	@param 	user 	分享用户
 *  @param  contentId   内容Id
 *	@param 	content 	分享内容
 *	@param 	target 	目标
 *  @param  account 帐号
 *
 *	@return	分享日志
 */
- (id)initWithType:(SSCShareType)type
              user:(id<ISSCUserDescriptor>)user
         contentId:(NSString *)contentId
           content:(NSDictionary *)content
            target:(NSString *)target
           account:(id<ISSCAccount>)account;

/**
 *	@brief	初始化分享日志信息（不带授权功能的平台调用）
 *
 *	@param 	type 	平台类型
 *  @param  contentId   内容ID
 *	@param 	content 	分享内容
 *	@param 	target 	目标
 *	@param 	account 	帐号
 *
 *	@return	分享日志
 */
- (id)initWithType:(SSCShareType)type
         contentId:(NSString *)contentId
           content:(NSDictionary *)content
            target:(NSString *)target
           account:(id<ISSCAccount>)account;


/**
 *	@brief	创建分享日志信息
 *
 *  @param  type    分享平台
 *	@param 	user 	分享用户
 *  @param  contentId   内容Id
 *	@param 	content 	分享内容
 *	@param 	target 	目标
 *	@param 	account 	帐号
 *
 *	@return	日志信息
 */
+ (id)shareLogWithType:(SSCShareType)type
                  user:(id<ISSCUserDescriptor>)user
             contentId:(NSString *)contentId
               content:(NSDictionary *)content
                target:(NSString *)target
               account:(id<ISSCAccount>)account;

/**
 *	@brief	创建分享日志信息
 *
 *	@param 	type 	平台类型
 *	@param 	contentId 	内容ID
 *	@param 	content 	分享内容
 *	@param 	target 	目标
 *	@param 	account 	帐号
 *
 *	@return	日志信息
 */
+ (id)shareLogWithType:(SSCShareType)type
             contentId:(NSString *)contentId
               content:(NSDictionary *)content
                target:(NSString *)target
               account:(id<ISSCAccount>)account;



@end
