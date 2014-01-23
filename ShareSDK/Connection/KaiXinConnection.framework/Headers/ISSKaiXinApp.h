//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import "SSKaiXinUser.h"
#import "SSKaiXinErrorInfo.h"
#import "SSKaiXinRecord.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	Request method
 */
typedef enum
{
	SSKaiXinRequestMethodGet = 0, /**< GET方式 */
	SSKaiXinRequestMethodPost = 1, /**< POST方式 */
	SSKaiXinRequestMethodMultipartPost = 2 /**< Multipart POST方式，用于上传文件的api接口 */
}
SSKaiXinRequestMethod;

/**
 *	@brief	KaiXin App Protocol.
 */
@protocol ISSKaiXinApp <ISSPlatformApp>

/**
 *	@brief	Get app key.
 *
 *	@return	App key.
 */
- (NSString *)apiKey;

/**
 *	@brief	Get secret key.
 *
 *	@return	Secret key.
 */
- (NSString *)secretKey;

/**
 *	@brief	Get redirect uri.
 *
 *	@return	Redirect uri.
 */
- (NSString *)redirectUri;

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
- (void)api:(NSString *)path
     method:(SSKaiXinRequestMethod)method
     params:(id<ISSCParameters>)params
       user:(id<ISSPlatformUser>)user
     result:(void(^)(id responder))result
      fault:(void(^)(CMErrorInfo *error))fault;

/**
 *	@brief	add record(Can take a picture)
 *
 *	@param 	content 	Content string.
 *	@param 	pic 	Pictrue attachment.
 *  @param  result  Result handler.
 */
- (void)addRecordWithContent:(NSString *)content
                         pic:(id<ISSCAttachment>)pic
                      result:(SSShareResultEvent)result;

/**
 *	@brief	Get my records.
 *
 *	@param 	start 	Get the number of start, Default is 0
 *	@param 	num 	Get count，Default is 20
 *	@param 	category 	Category，0/1/2/3/4/5/6/7
 *                      All / Original / forward / signature / public / only friends can see / visible only own / friends of friends visible
 *  @param  result  Result handler.
 */
- (void)getMyRecordsWithStart:(NSInteger)start
                          num:(NSInteger)num
                     category:(NSInteger)category
                       result:(void(^)(BOOL result, NSArray *records, id paging,  CMErrorInfo *error))result;


@end
