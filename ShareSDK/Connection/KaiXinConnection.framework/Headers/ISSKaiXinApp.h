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
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
///#end

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import "SSKaiXinUser.h"
#import "SSKaiXinErrorInfo.h"
#import "SSKaiXinRecord.h"
#import <ShareSDK/ShareSDKPlugin.h>

///#begin zh-cn
/**
 *	@brief	请求方式
 */
///#end
///#begin en
/**
 *	@brief	Request method
 */
///#end
typedef enum
{
	SSKaiXinRequestMethodGet = 0, /**< GET方式 */
	SSKaiXinRequestMethodPost = 1, /**< POST方式 */
	SSKaiXinRequestMethodMultipartPost = 2 /**< Multipart POST方式，用于上传文件的api接口 */
}
SSKaiXinRequestMethod;

///#begin zh-cn
/**
 *	@brief	开心网应用协议
 */
///#end
///#begin en
/**
 *	@brief	KaiXin App Protocol.
 */
///#end
@protocol ISSKaiXinApp <ISSPlatformApp>

///#begin zh-cn
/**
 *	@brief	获取应用Key
 *
 *	@return	应用Key
 */
///#end
///#begin en
/**
 *	@brief	Get app key.
 *
 *	@return	App key.
 */
///#end
- (NSString *)apiKey;

///#begin zh-cn
/**
 *	@brief	获取应用密钥
 *
 *	@return	应用密钥
 */
///#end
///#begin en
/**
 *	@brief	Get secret key.
 *
 *	@return	Secret key.
 */
///#end
- (NSString *)secretKey;

///#begin zh-cn
/**
 *	@brief	获取应用回调地址
 *
 *	@return	应用回调地址
 */
///#end
///#begin en
/**
 *	@brief	Get redirect uri.
 *
 *	@return	Redirect uri.
 */
///#end
- (NSString *)redirectUri;

///#begin zh-cn
/**
 *	@brief	调用开放平台API
 *
 *	@param 	path 	路径
 *  @param  method  请求方式
 *	@param 	params 	请求参数
 *  @param  user    授权用户,如果传入nil则表示默认的授权用户
 *  @param  result  返回回调
 *  @param  fault   失败回调
 */
///#end
///#begin en
/**
 *	@brief	Call API.
 *
 *	@param 	path 	API path.
 *  @param  method  Request method.
 *	@param 	params 	Request parameters.
 *  @param  user    Authorized users, it means that if the incoming nil default authorized users
 *  @param  result  Result handler.
 *  @param  fault   Fault handler.
 */
///#end
- (void)api:(NSString *)path
     method:(SSKaiXinRequestMethod)method
     params:(id<ISSCParameters>)params
       user:(id<ISSPlatformUser>)user
     result:(void(^)(id responder))result
      fault:(void(^)(CMErrorInfo *error))fault;

///#begin zh-cn
/**
 *	@brief	发布一条记录(可以带一张图片)
 *
 *	@param 	content 	内容
 *	@param 	pic 	图片
 *  @param  result  回调方法
 */
///#end
///#begin en
/**
 *	@brief	add record(Can take a picture)
 *
 *	@param 	content 	Content string.
 *	@param 	pic 	Pictrue attachment.
 *  @param  result  Result handler.
 */
///#end
- (void)addRecordWithContent:(NSString *)content
                         pic:(id<ISSCAttachment>)pic
                      result:(SSShareResultEvent)result;

///#begin zh-cn
/**
 *	@brief	获取我的记录列表
 *
 *	@param 	start 	展示起始条数，默认为0
 *	@param 	num 	展示条数，默认为20
 *	@param 	category 	分类条件，0/1/2/3/4/5/6/7
 *                      全部/原创/转发/签名/公开/仅好友可见/仅自己可见/好友的好友可见
 *  @param  result  回调方法
 */
///#end
///#begin en
/**
 *	@brief	Get my records.
 *
 *	@param 	start 	Get the number of start, Default is 0
 *	@param 	num 	Get count，Default is 20
 *	@param 	category 	Category，0/1/2/3/4/5/6/7
 *                      All / Original / forward / signature / public / only friends can see / visible only own / friends of friends visible
 *  @param  result  Result handler.
 */
///#end
- (void)getMyRecordsWithStart:(NSInteger)start
                          num:(NSInteger)num
                     category:(NSInteger)category
                       result:(void(^)(BOOL result, NSArray *records, id paging,  CMErrorInfo *error))result;


@end
