//
//  WeiboSDKHeaders.h
//  WeiboSDKDemo
//
//  Created by Wade Cheng on 4/3/13.
//  Copyright (c) 2013 SINA iOS Team. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "WBHttpRequest.h"

typedef NS_ENUM(NSInteger, WeiboSDKResponseStatusCode)
{
    WeiboSDKResponseStatusCodeSuccess               = 0,//成功
    WeiboSDKResponseStatusCodeUserCancel            = -1,//用户取消发送
    WeiboSDKResponseStatusCodeSentFail              = -2,//发送失败
    WeiboSDKResponseStatusCodeAuthDeny              = -3,//授权失败
    WeiboSDKResponseStatusCodeUserCancelInstall     = -4,//用户取消安装微博客户端
    WeiboSDKResponseStatusCodeShareInSDKFailed      = -8,//分享失败 详情见response UserInfo
    WeiboSDKResponseStatusCodeUnsupport             = -99,//不支持的请求
    WeiboSDKResponseStatusCodeUnknown               = -100,
};

typedef NS_ENUM(NSInteger, WBULCheckStep)
{
    WBULCheckStepNone              = 0, //默认
    WBULCheckStepParams            = 1, //参数检查
    WBULCheckStepSystemVersion     = 2, //当前系统版本检查
    WBULCheckStepWeiboVersion     = 3, //微博客户端版本检查
    WBULCheckStepSDKInnerOperation = 4, //微博SDK内部操作检查
    WBULCheckStepLaunchWeibo       = 5, //App拉起微博检查
    WBULCheckStepBackToCurrentApp  = 6, //由微博返回当前App检查
    WBULCheckStepFinal             = 7 //最终检查,也代表检测结果合法有效
};

@protocol WeiboSDKDelegate;
@protocol WBHttpRequestDelegate;
@class WBBaseRequest;
@class WBBaseResponse;
@class WBMessageObject;
@class WBImageObject;
@class WBBaseMediaObject;
@class WBHttpRequest;
@class PHAsset;
@class WBNewVideoObject;
@class WBSuperGroupObject;

/**
 微博SDK接口类
 */
@interface WeiboSDK : NSObject

/**
 检查用户是否安装了微博客户端程序
 @return 已安装返回YES，未安装返回NO
 */
+ (BOOL)isWeiboAppInstalled;

/**
 检查用户是否可以通过微博客户端进行分享
 @return 可以使用返回YES，不可以使用返回NO
 */
+ (BOOL)isCanShareInWeiboAPP;

/**
 检查用户是否可以使用微博客户端进行SSO授权
 @return 可以使用返回YES，不可以使用返回NO
 */
+ (BOOL)isCanSSOInWeiboApp;

/**
 打开微博客户端程序
 @return 成功打开返回YES，失败返回NO
 */
+ (BOOL)openWeiboApp;


/**
 获取微博客户端程序的itunes安装地址
 @return 微博客户端程序的itunes安装地址
 */
+ (NSString *_Nullable)getWeiboAppInstallUrl;

/**
 getSDKVersion 已弃用
 获取sdk版本号使用 getWeiboSDKVersion
 */
+ (NSString *_Nullable)getSDKVersion;

/**
 新的获取当前微博SDK的版本号
 @return 当前微博SDK的版本号
 */
+ (NSString *_Nullable)getWeiboSDKVersion;

/**
 向微博客户端程序注册第三方应用
 @param appKey 微博开放平台第三方应用appKey
 @param universalLink 开发者Universal Link
 @return 注册成功返回YES，失败返回NO
 */
+ (BOOL)registerApp:(NSString * __nonnull)appKey universalLink:(NSString * __nonnull)universalLink;

/**
 step：检测的步骤
 error：universalLink是否有效，error为nil universalLink有效，不为nil为无效universalLink
 */
+ (void)checkUniversalLink:(void (^_Nullable)(WBULCheckStep step, NSError * _Nullable error))checkBlock;

/**
 处理微博客户端程序通过URL启动第三方应用时传递的数据
 
 需要在 application:openURL:sourceApplication:annotation:或者application:handleOpenURL中调用
 @param url 启动第三方应用的URL
 @param delegate WeiboSDKDelegate对象，用于接收微博触发的消息
 @see WeiboSDKDelegate
 */
+ (BOOL)handleOpenURL:(NSURL *_Nullable)url delegate:(id<WeiboSDKDelegate>_Nullable)delegate;


/*! @brief 处理微博通过Universal Link启动App时传递的数据
 *
 * 需要在 application:continueUserActivity:restorationHandler:中调用。
 * @param userActivity 微博启动第三方应用时系统API传递过来的userActivity
 * @param delegate  WXApiDelegate对象，用来接收微博触发的消息。
 * @return 成功返回YES，失败返回NO。
 */
+ (BOOL)handleOpenUniversalLink:(NSUserActivity *_Nullable)userActivity delegate:(nullable id<WeiboSDKDelegate>)delegate;

/**
 发送请求给微博客户端程序，并切换到微博
 
 请求发送给微博客户端程序之后，微博客户端程序会进行相关的处理，处理完成之后一定会调用 [WeiboSDKDelegate didReceiveWeiboResponse:] 方法将处理结果返回给第三方应用
 
 @param request 具体的发送请求
 
 @see [WeiboSDKDelegate didReceiveWeiboResponse:]
 @see WBBaseResponse
 @param completion 调用结果回调block
 */
+ (void)sendRequest:(WBBaseRequest *_Nullable)request completion:(void (^ __nullable)(BOOL success))completion;

/**
 收到微博客户端程序的请求后，发送对应的应答给微博客户端端程序，并切换到微博
 
 第三方应用收到微博的请求后，异步处理该请求，完成后必须调用该函数将应答返回给微博
 
 @param response 具体的应答内容
 @see WBBaseRequest
 @param completion 调用结果回调block
 */
+ (void)sendResponse:(WBBaseResponse *_Nullable)response  completion:(void (^ __nullable)(BOOL success))completion;

/**
 设置WeiboSDK的调试模式
 
 当开启调试模式时，WeiboSDK会在控制台输出详细的日志信息，开发者可以据此调试自己的程序。默认为 NO
 @param enabled 开启或关闭WeiboSDK的调试模式
 */
+ (void)enableDebugMode:(BOOL)enabled;

/**
 设置WeiboSDK是否获取idfa 默认获取
 */
+ (void)banGetIdfa:(BOOL)isBan;

/**
 取消授权，登出接口
 调用此接口后，token将失效
 @param token 第三方应用之前申请的Token
 @param delegate WBHttpRequestDelegate对象，用于接收微博SDK对于发起的接口请求的请求的响应
 @param tag 用户自定义TAG,将通过回调WBHttpRequest实例的tag属性返回
 
 */
+ (void)logOutWithToken:(NSString *_Nonnull)token delegate:(id<WBHttpRequestDelegate>_Nullable)delegate withTag:(NSString*_Nullable)tag;

/**
 呼起微博客户端或打开微博H5页面，SDK自动检测是否安装微博客户端，当调用SDK相关方法时：
 
 有的话呼起微博客户端定位到对应界面；
 没有的话打开 webView 加载相应的微博H5页面；
 @param uid 用户id
 @param mid 微博id
 @param aid 文章id
*/

//连接到指定用户的微博个人主页，连接后可进行加关注等互动
+ (void)linkToUser:(NSString *_Nullable)uid;

//连接到指定的单条微博详情页，连接后可对这条微博进行转、评、赞等互动
+ (void)linkToSingleBlog:(NSString *_Nullable)uid blogID:(NSString *_Nullable)mid;

//连接到指定的微博头条文章页
+ (void)linkToArticle:(NSString *_Nullable)aid;

//分享到微博
+ (void)shareToWeibo:(NSString *_Nullable)content;

//评论指定的微博
+ (void)commentToWeibo:(NSString *_Nullable)mid;

//连接到微博搜索内容流
+ (void)linkToSearch:(NSString *_Nullable)keyword;

//连接到我的微博消息流
+ (void)linkToTimeLine;

//连接到我的微博个人主页
+ (void)linkToProfile;

@end

/**
 接收并处理来至微博客户端程序的事件消息
 */
@protocol WeiboSDKDelegate <NSObject>

/**
 收到一个来自微博客户端程序的请求
 
 收到微博的请求后，第三方应用应该按照请求类型进行处理，处理完后必须通过 [WeiboSDK sendResponse:] 将结果回传给微博
 @param request 具体的请求对象
 */
- (void)didReceiveWeiboRequest:(WBBaseRequest *_Nullable)request;

/**
 收到一个来自微博客户端程序的响应
 
 收到微博的响应后，第三方应用可以通过响应类型、响应的数据和 WBBaseResponse.userInfo 中的数据完成自己的功能
 @param response 具体的响应对象
 */
- (void)didReceiveWeiboResponse:(WBBaseResponse *_Nullable)response;

@end


#pragma mark - DataTransferObject and Base Request/Response

/**
 微博客户端程序和第三方应用之间传输数据信息的基类
 */
@interface WBDataTransferObject : NSObject

/**
 自定义信息字典，用于数据传输过程中存储相关的上下文环境数据
 
 第三方应用给微博客户端程序发送 request 时，可以在 userInfo 中存储请求相关的信息。
 
 @warning userInfo中的数据必须是实现了 `NSCoding` 协议的对象，必须保证能序列化和反序列化
 @warning 序列化后的数据不能大于10M
 */
@property (nonatomic, strong) NSDictionary * _Nullable userInfo;


/**
 发送该数据对象的SDK版本号
 
 如果数据对象是自己生成的，则sdkVersion为当前SDK的版本号；如果是接收到的数据对象，则sdkVersion为数据发送方SDK版本号
 */
@property (strong, nonatomic, readonly) NSString * _Nullable sdkVersion;


/**
 当用户没有安装微博客户端程序时是否提示用户打开微博安装页面
 
 如果设置为YES，当用户未安装微博时会弹出Alert询问用户是否要打开微博App的安装页面。默认为YES
 */
@property (nonatomic, assign) BOOL shouldOpenWeiboAppInstallPageIfNotInstalled;


@end


/**
 微博SDK所有请求类的基类
 */
@interface WBBaseRequest : WBDataTransferObject

/**
 返回一个 WBBaseRequest 对象
 
 @return 返回一个*自动释放的*WBBaseRequest对象
 */
+ (id _Nonnull )request;

@end


/**
 微博SDK所有响应类的基类
 */
@interface WBBaseResponse : WBDataTransferObject

/**
 对应的 request 中的自定义信息字典
 
 如果当前 response 是由微博客户端响应给第三方应用的，则 requestUserInfo 中会包含原 request.userInfo 中的所有数据
 
 @see WBBaseRequest.userInfo
 */
@property (strong, nonatomic, readonly) NSDictionary * _Nullable requestUserInfo;

/**
 响应状态码
 
 第三方应用可以通过statusCode判断请求的处理结果
 */
@property (nonatomic, assign) WeiboSDKResponseStatusCode statusCode;

/**
 返回一个 WBBaseResponse 对象
 
 @return 返回一个*自动释放的*WBBaseResponse对象
 */
+ (id _Nonnull )response;

@end

#pragma mark - Authorize Request/Response

/**
 第三方应用向微博客户端请求认证的消息结构
 
 第三方应用向微博客户端申请认证时，需要调用 [WeiboSDK sendRequest:] 函数， 向微博客户端发送一个 WBAuthorizeRequest 的消息结构。
 微博客户端处理完后会向第三方应用发送一个结构为 WBAuthorizeResponse 的处理结果。
 */
@interface WBAuthorizeRequest : WBBaseRequest

/**
 微博开放平台第三方应用授权回调页地址，默认为`http://`
 
 参考 http://open.weibo.com/wiki/%E6%8E%88%E6%9D%83%E6%9C%BA%E5%88%B6%E8%AF%B4%E6%98%8E#.E5.AE.A2.E6.88.B7.E7.AB.AF.E9.BB.98.E8.AE.A4.E5.9B.9E.E8.B0.83.E9.A1.B5
 
 @warning 必须保证和在微博开放平台应用管理界面配置的“授权回调页”地址一致，如未进行配置则默认为`http://`
 @warning 不能为空，长度小于1K
 */
@property (nonatomic, strong) NSString * _Nullable redirectURI;

/**
 微博开放平台第三方应用scope，多个scrope用逗号分隔
 
 参考 http://open.weibo.com/wiki/%E6%8E%88%E6%9D%83%E6%9C%BA%E5%88%B6%E8%AF%B4%E6%98%8E#scope
 
 @warning 长度小于1K
 */
@property (nonatomic, strong) NSString * _Nullable scope;

/**
 当用户没有安装微博客户端或微博客户端过低无法支持SSO的时候是否弹出SDK自带的Webview进行授权
 
 如果设置为YES，当用户没有安装微博客户端或微博客户端过低无法支持SSO的时候会自动弹出SDK自带的Webview进行授权。

 如果设置为NO，会根据 shouldOpenWeiboAppInstallPageIfNotInstalled 属性判断是否弹出安装/更新微博的对话框
 
 默认为YES
 */
@property (nonatomic, assign) BOOL shouldShowWebViewForAuthIfCannotSSO;

@end


/**
 微博客户端处理完第三方应用的认证申请后向第三方应用回送的处理结果
 
 WBAuthorizeResponse 结构中仅包含常用的 userID 、accessToken 和 expirationDate 信息，其他的认证信息（比如部分应用可以获取的 refresh_token 信息）会统一存放到 userInfo 中
 */
@interface WBAuthorizeResponse : WBBaseResponse

/**
 用户ID
 */
@property (nonatomic, strong) NSString * _Nullable userID;

/**
 认证口令
 */
@property (nonatomic, strong) NSString * _Nullable accessToken;

/**
 认证过期时间
 */
@property (nonatomic, strong) NSDate * _Nullable expirationDate;

/**
 当认证口令过期时用于换取认证口令的更新口令
 */
@property (nonatomic, strong) NSString * _Nullable refreshToken;

@end

#pragma mark - ProvideMessageForWeibo Request/Response

/**
 微博客户端向第三方程序请求提供内容的消息结构
 */
@interface WBProvideMessageForWeiboRequest : WBBaseRequest

@end

/**
 微博客户端向第三方应用请求提供内容，第三方应用向微博客户端返回的消息结构
 */
@interface WBProvideMessageForWeiboResponse : WBBaseResponse

/**
 提供给微博客户端的消息
 */
@property (nonatomic, strong) WBMessageObject * _Nonnull message;

/**
 返回一个 WBProvideMessageForWeiboResponse 对象
 @param message 需要回送给微博客户端程序的消息对象
 @return 返回一个*自动释放的*WBProvideMessageForWeiboResponse对象
 */
+ (id _Nullable )responseWithMessage:(WBMessageObject *_Nullable)message;

@end

#pragma mark - SendMessageToWeibo Request/Response

/**
 第三方应用发送消息至微博客户端程序的消息结构体
 */
@interface WBSendMessageToWeiboRequest : WBBaseRequest

/**
 发送给微博客户端的消息
 */
@property (nonatomic, strong) WBMessageObject * _Nonnull message;

/**
 返回一个 WBSendMessageToWeiboRequest 对象
 此方法生成对象被[WeiboSDK sendRequest:]会唤起微博客户端的发布器进行分享，如果未安装微博客户端或客户端版本太低
 会根据 shouldOpenWeiboAppInstallPageIfNotInstalled 属性判断是否弹出安装/更新微博的对话框
 @param message 需要发送给微博客户端的消息对象
 @return 返回一个*自动释放的*WBSendMessageToWeiboRequest对象
 */
+ (id _Nullable )requestWithMessage:(WBMessageObject *_Nullable)message;

/**
 返回一个 WBSendMessageToWeiboRequest 对象
 
 当用户安装了可以支持微博客户端內分享的微博客户端时,会自动唤起微博并分享
 当用户没有安装微博客户端或微博客户端过低无法支持通过客户端內分享的时候会自动唤起SDK內微博发布器
 
 @param message 需要发送给微博的消息对象
 @param authRequest 授权相关信息,与access_token二者至少有一个不为空,当access_token为空并且需要弹出SDK內发布器时会通过此信息先进行授权后再分享
 @param access_token 第三方应用之前申请的Token,当此值不为空并且无法通过客户端分享的时候,会使用此token进行分享。
 @return 返回一个*自动释放的*WBSendMessageToWeiboRequest对象
 */
+ (id _Nullable )requestWithMessage:(WBMessageObject *_Nullable)message
                authInfo:(WBAuthorizeRequest *_Nullable)authRequest
            access_token:(NSString *_Nullable)access_token;

@end

/**
 WBSendMessageToWeiboResponse
 */
@interface WBSendMessageToWeiboResponse : WBBaseResponse

/**
 可能在分享过程中用户进行了授权操作，当此值不为空时，为用户相应授权信息
 */
@property (nonatomic,strong) WBAuthorizeResponse * _Nullable authResponse;
@end

#pragma mark - ShareMessageToContact Request/Response
/**
 第三方应用分享链接到私信
 */
@interface WBShareMessageToContactRequest : WBBaseRequest

/**
 分享链接的消息
 */
@property (nonatomic, strong) WBMessageObject * _Nonnull message;

/**
 返回一个 WBShareMessageToContactRequest 对象
 此方法生成对象被[WeiboSDK sendRequest:]会唤起微博客户端的发布器进行分享
 @param message 需要发送给微博客户端的消息对象
 @return 返回一个*自动释放的*WBSendMessageToWeiboRequest对象
 */
+ (void)requestWithMessage:(WBMessageObject *_Nullable)message;
@end

/**
 WBSendMessageToWeiboResponse
 */
@interface WBShareMessageToContactResponse : WBBaseResponse

/**
 可能在分享过程中用户进行了授权操作，当此值不为空时，为用户相应授权信息
 */
@property (nonatomic,strong) WBAuthorizeResponse * _Nullable authResponse;
@end

#pragma mark - MessageObject / ImageObject

/**
 微博客户端程序和第三方应用之间传递的消息结构
 
 一个消息结构由三部分组成：文字、图片和多媒体数据。三部分内容中至少有一项不为空，图片和多媒体数据不能共存。(新版的多图和视频属于图片数据，并且图片和视频也不能共存)
 */
@interface WBMessageObject : NSObject

/**
 消息的文本内容
 
 @warning 长度小于2000个汉字
 */
@property (nonatomic, strong) NSString * _Nullable text;

/**
 消息的图片内容
 
 @see WBImageObject
 */
@property (nonatomic, strong) WBImageObject * _Nullable imageObject;

/**
 消息的多媒体内容
 
 @see WBBaseMediaObject
 */
@property (nonatomic, strong) WBBaseMediaObject * _Nullable mediaObject;

/**
 消息的视频内容
 
 @see WBVideoObject
 */
@property (nonatomic, strong) WBNewVideoObject * _Nullable videoObject;

/**
  消息的超话内容
  
  @see WBSuperGroupObject
*/
@property (nonatomic, strong)WBSuperGroupObject * _Nullable superTopicObject;

 /**
 
 返回一个 WBMessageObject 对象
 
 @return 返回一个*自动释放的*WBMessageObject对象
 */
+ (id _Nonnull )message;

@end

/**
 图片视频分享时错误枚举
 */

typedef NS_ENUM(NSInteger, WBSDKMediaTransferErrorCode)
{
    WBSDKMediaTransferAlbumPermissionError              = 0,//相册权限
    WBSDKMediaTransferAlbumWriteError               = 1,//相册写入错误
    WBSDKMediaTransferAlbumAssetTypeError               = 2,//资源类型错误
};

/**
 图片视频分享协议
 */
@protocol WBMediaTransferProtocol <NSObject>

/**
 数据准备成功回调
 */
-(void)wbsdk_TransferDidReceiveObject:(id _Nullable )object;

/**
 数据准备失败回调
 */
-(void)wbsdk_TransferDidFailWithErrorCode:(WBSDKMediaTransferErrorCode)errorCode andError:(NSError*_Nullable)error;

@end

/**
 消息中包含的图片数据对象
 */
@interface WBImageObject : NSObject

/**
 图片真实数据内容，图片数据与图片数组finalAssetArray只能存在一项，图片数据不能为空并且大小不能超过10M,
 网页分享使用图片数据
 
 @warning 大小不能超过10M
 */
@property (nonatomic, strong) NSData * _Nullable imageData;

/**
 是否分享到story
 */
@property (nonatomic) BOOL isShareToStory DEPRECATED_MSG_ATTRIBUTE("shareToStory is deprecated");

/**
 返回一个 WBImageObject 对象
 
 @return 返回一个*自动释放的*WBImageObject对象
 */
+ (id _Nullable )object;

/**
 返回一个 UIImage 对象
 
 @return 返回一个*自动释放的*UIImage对象
 */
- (UIImage *_Nullable)image;


/**
 多图分享委托
 */
@property(nonatomic,weak)id<WBMediaTransferProtocol> _Nullable delegate;

/**
 图片对象添加图片数组  图片数据一共不能超过30MB
 */
- (void)addImages:(NSArray<UIImage *>*_Nullable)imageArray;

/**
 添加分享livePhoto图片 大小不能超过40MB  支持 ios9.1以上系统
 */

- (void)setLivePhotoAsset:(PHAsset *_Nonnull)livePhotoAsset  completion:(void (^ __nullable)(NSString * _Nullable error))completion;

/**
 分享livePhoto格式图片， image不能超过10MB， video不能超过30MB_Nonnull
 */
- (void)setLivePhotoImageUrl:(NSURL *_Nonnull)imageUrl livePhotoVideoUrl:(NSURL *_Nonnull)videoUrl;

/**
 多图最终传递对象
 */
-(NSArray*_Nullable)finalAssetArray;

@end

@interface WBNewVideoObject : NSObject

/**
 返回一个 WBNewVideoObject 对象
 
 @return 返回一个*自动释放的*WBNewVideoObject对象
 */
+ (id _Nullable )object;

/**
 是否分享到story
 */
@property (nonatomic) BOOL isShareToStory DEPRECATED_MSG_ATTRIBUTE("shareToStory is deprecated");

/**
 多图分享委托
 */
@property(nonatomic,weak)id<WBMediaTransferProtocol> _Nullable delegate;

/**
 视频对象添加视频  视频数据不能超过50MB
 */
-(void)addVideo:(NSURL*_Nonnull)videoUrl;

/**
 视频最终传递对象
 */
-(NSString*_Nullable)finalAsset;

@end


/**
 消息中包含的图片数据对象
 */
@interface WBSuperGroupObject : NSObject
@property (nonatomic, strong) NSString * _Nonnull superGroup;//超话名称,长度不能超过150
@property (nonatomic, strong) NSString * _Nullable section;//版块名
@property (nonatomic, strong) NSDictionary * _Nullable extData;//自定义参数
/**
 返回一个 WBSuperGroupObject 对象
 
 @return 返回一个*自动释放的*WBSuperGroupObject对象
 */
+ (id _Nonnull )object;
@end


#pragma mark - Message Media Objects

/**
 分享多媒体已经弃用 请不要用相关api
 消息中包含的多媒体数据对象基类,该类后期会被废弃,在发布器不再显示为linkcard样式,只显示为普通网络连接
 */
@interface WBBaseMediaObject : NSObject

/**
 对象唯一ID，用于唯一标识一个多媒体内容
 
 当第三方应用分享多媒体内容到微博时，应该将此参数设置为被分享的内容在自己的系统中的唯一标识
 @warning 不能为空，长度小于255
 */
@property (nonatomic, strong) NSString * _Nullable objectID;

/**
 多媒体内容标题
 @warning 不能为空且长度小于1k
 */
@property (nonatomic, strong) NSString * _Nullable title;

/**
 多媒体内容描述
 @warning 长度小于1k
 */
@property (nonatomic, strong) NSString * _Nullable description;

/**
 多媒体内容缩略图
 @warning 大小小于32k
 */
@property (nonatomic, strong) NSData * _Nullable thumbnailData;

/**
 点击多媒体内容之后呼起第三方应用特定页面的scheme
 @warning 长度小于255
 */
@property (nonatomic, strong) NSString * _Nullable scheme;

/**
 返回一个 WBBaseMediaObject 对象
 
 @return 返回一个*自动释放的*WBBaseMediaObject对象
 */
+ (id _Nullable )object DEPRECATED_MSG_ATTRIBUTE("WBBaseMediaObject is deprecated");

@end

#pragma mark - Message WebPage Objects

/**
 分享多媒体已经弃用 请不要用相关api
 消息中包含的网页数据对象
 */
@interface WBWebpageObject : WBBaseMediaObject

/**
 网页的url地址
 
 @warning 不能为空且长度不能超过255
 */
@property (nonatomic, strong) NSString * _Nullable webpageUrl DEPRECATED_MSG_ATTRIBUTE("webpageUrl is deprecated");

@end


