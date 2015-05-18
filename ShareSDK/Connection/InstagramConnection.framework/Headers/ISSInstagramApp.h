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
#import "SSInstagramUser.h"
#import "SSInstagramErrorInfo.h"
#import "SSInstagramCredential.h"
#import <ShareSDK/ShareSDKPlugin.h>

///#begin zh-cn
/**
 *	@brief	Instagram请求方式
 */
///#end
///#begin en
/**
 *	@brief	Instagram request method.
 */
///#end
typedef enum
{
	SSInstagramRequestMethodGet = 0, /**< GET方式 */
	SSInstagramRequestMethodPost = 1, /**< POST方式 */
	SSInstagramRequestMethodMultipartPost = 2 /**< Multipart POST方式，用于上传文件的api接口 */
}
SSInstagramRequestMethod;

///#begin zh-cn
/**
 *	@brief	Instagram应用协议
 */
///#end
///#begin en
/**
 *	@brief	Instagram App Protocol.
 */
///#end
@protocol ISSInstagramApp <ISSPlatformApp>

///#begin zh-cn
/**
 *	@brief	设置iPad版本菜单容器
 *
 *  @since  ver2.9.0
 *
 *	@param 	container 	容器对象，可以为UIView及其子类，或者
 */
///#end
///#begin en
/**
 *	@brief	Set menu container for iPad device.
 *
 *  @since  ver2.9.0
 *
 *	@param 	container 	Menu container.
 */
///#end
- (void)setIPadMenuContainer:(UIView *)container;

///#begin zh-cn
/**
 *	@brief	获取iPad版本菜单容器
 *
 *  @since  ver2.9.0
 *
 *	@return	菜单容器
 */
///#end
///#begin en
/**
 *	@brief	Get menu container for iPad device
 *
 *  @since  ver2.9.0
 *
 *	@return	Menu container.
 */
///#end
- (UIView *)iPadMenuContainer;

///#begin zh-cn
/**
 *	@brief	设置iPad设备下弹出菜单容器的显示区域
 *
 *  @since  ver2.9.0
 *
 *	@param 	rect    菜单容器显示区域
 */
///#end
///#begin en
/**
 *	@brief	Set pop-up menu container frame for iPad device.
 *
 *  @since  ver2.9.0
 *
 *	@param 	rect    menu container frame
 */
///#end
- (void)setIPadMenuContainerFrame:(CGRect)frame;

///#begin zh-cn
/**
 *	@brief	获取iPad设备下弹出菜单容器的显示区域
 *
 *  @since  ver2.9.0
 *
 *	@return	菜单容器显示区域
 */
///#end
///#begin en
/**
 *	@brief	Get pop-up menu container frame for iPad device.
 *
 *  @since  ver2.9.0
 *
 *	@return	menu container frame
 */
///#end
- (CGRect)iPadMenuContainerFrame;


///#begin zh-cn
/**
 *	@brief	获取应用Key
 *
 *	@return	应用Key
 */
///#end
///#begin en
/**
 *	@brief	Get client id.
 *
 *	@return	Client id string.
 */
///#end
- (NSString *)clientId;

///#begin zh-cn
/**
 *	@brief	获取应用密钥
 *
 *	@return	应用密钥
 */
///#end
///#begin en
/**
 *	@brief	Get client secret.
 *
 *	@return	Client secret string.
 */
///#end
- (NSString *)clientSecret;

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
 *	@return	Redirect uri string.
 */
///#end
- (NSString *)redirectUri;

///#begin zh-cn
/**
 *	@brief	调用开放平台API
 *
 *	@param 	path 	路径
 *	@param 	params 	请求参数
 *  @param  user    授权用户,如果传入nil则表示默认的授权用户
 *  @param  result  返回回调
 *  @param  fault   失败回调
 */
///#end
///#begin en
/**
 *	@brief	Call api
 *
 *	@param 	path 	API path string.
 *	@param 	params 	Request parameters.
 *  @param  user    Authorized users, it means that if the incoming nil default authorized users
 *  @param  result  Result handler.
 *  @param  fault   Fault handler.
 */
///#end
- (void)api:(NSString *)path
     method:(SSInstagramRequestMethod)method
     params:(id<ISSCParameters>)params
       user:(id<ISSPlatformUser>)user
     result:(void(^)(id responder))result
      fault:(void(^)(CMErrorInfo *error))fault;

///#begin zh-cn
/**
 *	@brief 打开Instagram的拍照功能
 *
 *  @return YES 表示
 */
///#end
///#begin en
/**
 *	@brief Open call Instagram camera.
 *
 *  @return YES open success. otherwise open failure.
 */
///#end
- (BOOL)openInstagramWithCamera;

///#begin zh-cn
/**
 *	@brief	分享内容
 *
 *	@param 	image 	图片
 *	@param 	title 	标题
 *  @param  containerController     容器控制器
 *  @param  result  返回回调
 */
///#end
///#begin en
/**
 *	@brief	Share content.
 *
 *	@param 	image 	Image attachment object.
 *	@param 	title 	Title string.
 *  @param  containerController     Container controller.
 *  @param  result  Result handler.
 */
///#end
- (void)shareWithImage:(id<ISSCAttachment>)image
                 title:(NSString *)title
   containerController:(UIViewController *)containerController
                result:(SSShareResultEvent)result;

///#begin zh-cn
/**
 *	@brief	分享内容
 *
 *  @since  ver2.9.0
 *
 *	@param 	image 	图片
 *	@param 	title 	标题
 *  @param  container     菜单容器
 *  @param  containerFrame  菜单容器显示范围
 *  @param  result  返回回调
 */
///#end
///#begin en
/**
 *	@brief	Share content.
 *
 *  @since  ver2.9.0
 *
 *	@param 	image 	Image attachment object.
 *	@param 	title 	Title string.
 *  @param  container     Menu container.
 *  @param  containerFrame  Menu container frame.
 *  @param  result  Result handler.
 */
///#end
- (void)shareWithImage:(id<ISSCAttachment>)image
                 title:(NSString *)title
             container:(UIView *)container
        containerFrame:(CGRect)containerFrame
                result:(SSShareResultEvent)result;


@end
