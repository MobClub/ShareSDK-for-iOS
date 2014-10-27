//
//  SSCEventLogInfo.h
//  ShareSDKCoreService
//
//  Created by 冯 鸿杰 on 13-4-25.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import "SSCLogInfo.h"

/**
 *	@brief	事件日志信息
 */
@interface SSCEventLogInfo : SSCLogInfo
{
@private
    NSString *_eventId;
    NSString *_eventTarget;
    NSString *_eventParams;
}

/**
 *	@brief	初始化事件日志信息
 *
 *	@param 	eventId 	事件ID
 *	@param 	eventTarget 	事件目标
 *	@param 	eventParams 	事件参数
 *  @param  account 帐号
 *
 *	@return	事件日志
 */
- (id)initWithEventId:(NSString *)eventId
          eventTarget:(NSString *)eventTarget
          eventParams:(NSString *)eventParams
              account:(id<ISSCAccount>)account;

/**
 *	@brief	创建事件日志信息
 *
 *	@param 	eventId 	事件ID
 *	@param 	eventTarget 	事件目标
 *	@param 	eventParams 	事件参数
 *	@param 	account 	帐号
 *
 *	@return	事件日志
 */
+ (id)eventLogWithEventId:(NSString *)eventId
              eventTarget:(NSString *)eventTarget
              eventParams:(NSString *)eventParams
                  account:(id<ISSCAccount>)account;


@end
