//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import "SSKaiXinUser.h"
#import "SSKaiXinErrorInfo.h"
#import "SSKaiXinRecord.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	新浪微博请求方式
 */
typedef enum
{
	SSKaiXinRequestMethodGet = 0, /**< GET方式 */
	SSKaiXinRequestMethodPost = 1, /**< POST方式 */
	SSKaiXinRequestMethodMultipartPost = 2 /**< Multipart POST方式，用于上传文件的api接口 */
}
SSKaiXinRequestMethod;

/**
 *	@brief	开心网应用协议
 */
@protocol ISSKaiXinApp <ISSPlatformApp>

/**
 *	@brief	获取应用Key
 *
 *	@return	应用Key
 */
- (NSString *)apiKey;

/**
 *	@brief	获取应用密钥
 *
 *	@return	应用密钥
 */
- (NSString *)secretKey;

/**
 *	@brief	获取应用回调地址
 *
 *	@return	应用回调地址
 */
- (NSString *)redirectUri;

/**
 *	@brief	调用开放平台API
 *
 *	@param 	path 	路径
 *	@param 	params 	请求参数
 *  @param  user    授权用户,如果传入nil则表示默认的授权用户
 *  @param  result  返回回调
 *  @param  fault   失败回调
 */
- (void)api:(NSString *)path
     method:(SSKaiXinRequestMethod)method
     params:(id<ISSCParameters>)params
       user:(id<ISSPlatformUser>)user
     result:(void(^)(id responder))result
      fault:(void(^)(CMErrorInfo *error))fault;

/**
 *	@brief	发布一条记录(可以带一张图片)
 *
 *	@param 	content 	内容
 *	@param 	pic 	图片
 *  @param  result  回调方法
 */
- (void)addRecordWithContent:(NSString *)content
                         pic:(id<ISSCAttachment>)pic
                      result:(SSShareResultEvent)result;

/**
 *	@brief	获取我的记录列表
 *
 *	@param 	start 	展示起始条数，默认为0
 *	@param 	num 	展示条数，默认为20
 *	@param 	category 	分类条件，0/1/2/3/4/5/6/7
 *                      全部/原创/转发/签名/公开/仅好友可见/仅自己可见/好友的好友可见
 *  @param  result  回调方法
 */
- (void)getMyRecordsWithStart:(NSInteger)start
                          num:(NSInteger)num
                     category:(NSInteger)category
                       result:(void(^)(BOOL result, NSArray *records, id paging,  CMErrorInfo *error))result;


@end
