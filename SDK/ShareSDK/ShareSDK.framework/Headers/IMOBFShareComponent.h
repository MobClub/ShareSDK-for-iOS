//
//  IMOBFShareComponent.h
//  MOBFoundation
//
//  Created by 冯鸿杰 on 17/2/14.
//  Copyright © 2017年 MOB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MOBFoundation/IMOBFServiceComponent.h>

@protocol IMOBFSocialUser;
@protocol IMOBFContentEntity;

/**
 分享组件
 */
@protocol IMOBFShareComponent <IMOBFServiceComponent>


/**
 *  分享平台授权
 *
 *  @param platformType       平台类型
 *   @param settings    授权设置,目前只接受SSDKAuthSettingKeyScopes属性设置，如新浪微博关注官方微博：@{SSDKAuthSettingKeyScopes : @[@"follow_app_official_microblog"]}，类似“follow_app_official_microblog”这些字段是各个社交平台提供的。
 *  @param stateChangedHandler 授权状态变更回调处理
 */
+ (void)authorize:(NSInteger)platformType
         settings:(NSDictionary *)settings
   onStateChanged:(void (^) (NSInteger state, id<IMOBFSocialUser> user, NSError *error))stateChangedHandler;

/**
 *  获取授权用户信息
 *
 *  @param platformType       平台类型
 *  @param stateChangedHandler 状态变更回调处理
 */
+ (void)getUserInfo:(NSInteger)platformType
     onStateChanged:(void (^) (NSInteger state, id<IMOBFSocialUser> user, NSError *error))stateChangedHandler;

/**
 *  取消分享平台授权
 *
 *  @param platformType  平台类型
 */
+ (void)cancelAuthorize:(NSInteger)platformType;

/**
 *  判断分享平台是否授权
 *
 *  @param platformTypem 平台类型
 *  @return YES 表示已授权，NO 表示尚未授权
 */
+ (BOOL)hasAuthorized:(NSInteger)platformTypem;

/**
 *  分享内容
 *
 *  @param platformType             平台类型
 *  @param parameters               分享参数
 *  @param stateChangedHandler       状态变更回调处理
 */
+ (void)share:(NSInteger)platformType
   parameters:(NSMutableDictionary *)parameters
onStateChanged:(void (^)(NSInteger state, NSDictionary *userData, id<IMOBFContentEntity> contentEntity,  NSError *error))stateChangedHandler;

@optional

#pragma mark - share 参数设置

/**
   设置分享参数
 
   @param text     文本
   @param images   图片集合,传入参数可以为单张图片信息，也可以为一个NSArray，数组元素可以为UIImage、NSString（图片路径）、NSURL（图片路径）、SSDKImage。如: @"http://www.mob.com/images/logo_black.png" 或 @[@"http://www.mob.com/images/logo_black.png"]
   @param url      网页路径/应用路径
   @param title    标题
   @param type     分享类型
   @param dataDictionary 数据存储字典 如果传入nil将新建
 */
+ (NSMutableDictionary *)SSDKSetupShareParamsByText:(NSString *)text
                                            images:(id)images
                                               url:(NSURL *)url
                                             title:(NSString *)title
                                              type:(NSInteger)type
                                     dataDictionary:(NSMutableDictionary *)dataDictionary;


/*
   设置新浪微博分享参数
 
   @param text      文本
   @param title     标题
   @param image     图片对象，可以为UIImage、NSString（图片路径）、NSURL（图片路径）、SSDKImage
   @param url       分享链接
   @param latitude  纬度
   @param longitude 经度
   @param objectID  对象ID，标识系统内内容唯一性，应传入系统中分享内容的唯一标识，没有时可以传入nil
   @param type      分享类型，仅支持Text、Image、WebPage 类型
 设置 SSDKEnableSinaWeiboAPIShare 使用API进行分享 但text中需要附 安全域 安全域在新浪微博开放平台设置
   @param dataDictionary 数据存储字典 如果传入nil将新建
 */
+ (NSMutableDictionary *)SSDKSetupSinaWeiboShareParamsByText:(NSString *)text
                                                      title:(NSString *)title
                                                      image:(id)image
                                                        url:(NSURL *)url
                                                   latitude:(double)latitude
                                                  longitude:(double)longitude
                                                   objectID:(NSString *)objectID
                                                       type:(NSInteger)type
                                              dataDictionary:(NSMutableDictionary *)dataDictionary;
/*
   设置微信分享参数
 
   @param text                 文本
   @param title                标题
   @param url                  分享链接
   @param thumbImage           缩略图，可以为UIImage、NSString（图片路径）、NSURL（图片路径）、SSDKImage
   @param image                图片，可以为UIImage、NSString（图片路径）、NSURL（图片路径）、SSDKImage
   @param musicFileURL         音乐文件链接地址
   @param extInfo              扩展信息
   @param fileData             文件数据，可以为NSData、UIImage、NSString、NSURL（文件路径）、SSDKData、SSDKImage
   @param emoticonData         表情数据，可以为NSData、UIImage、NSURL（文件路径）、SSDKData、SSDKImage
   @param fileExtension  源文件后缀名
   @param sourceFileData       源文件数据，可以为NSData、NSString、NSURL（文件路径）、SSDKData
   @param type                 分享类型，支持SSDKContentTypeText、SSDKContentTypeImage、SSDKContentTypeWebPage、SSDKContentTypeApp、SSDKContentTypeAudio和SSDKContentTypeVideo
   @param platformSubType 平台子类型，只能传入其中一个
   @param dataDictionary 数据存储字典 如果传入nil将新建
 
   分享文本时：
   设置type为SSDKContentTypeText, 并填入text参数
 
   分享图片时：
   设置type为SSDKContentTypeImage, 非gif图片时：填入title和image参数，如果为gif图片则需要填写title和emoticonData参数
 
   分享网页时：
   设置type为SSDKContentTypeWebPage, 并设置text、title、url以及thumbImage参数，如果尚未设置thumbImage则会从image参数中读取图片并对图片进行缩放操作。
 
   分享应用时：
   设置type为SSDKContentTypeApp，并设置text、title、extInfo（可选）以及fileData（可选）参数。
 
   分享音乐时：
   设置type为SSDKContentTypeAudio，并设置text、title、url以及musicFileURL（可选）参数。
 
   分享视频时：
   设置type为SSDKContentTypeVideo，并设置text、title、url参数
 
   分享文件时：
   设置type为SSDKContentTypeFile（例如.mp3、.mp4、.pdf、.docx的分享），设置title、sourceFileExtension、sourceFileData，以及thumbImage参数，如果尚未设置thumbImage则会从image参数中读取图片并对图片进行缩放操作参数
 
 */
+ (NSMutableDictionary *)SSDKSetupWeChatParamsByText:(NSString *)text
                                              title:(NSString *)title
                                                url:(NSURL *)url
                                         thumbImage:(id)thumbImage
                                              image:(id)image
                                       musicFileURL:(NSURL *)musicFileURL
                                            extInfo:(NSString *)extInfo
                                           fileData:(id)fileData
                                       emoticonData:(id)emoticonData
                                sourceFileExtension:(NSString *)fileExtension
                                     sourceFileData:(id)sourceFileData
                                               type:(NSInteger)type
                                 forPlatformSubType:(NSInteger)platformSubType
                                      dataDictionary:(NSMutableDictionary *)dataDictionary;


/*
   设置QQ分享参数
 
   @param text            分享内容
   @param title           分享标题
   @param url             分享链接(如果分享类型为音频/视频时,应该传入音频/视频的网络URL地址)
 [特别说明:分享视频到QZone时,视频为网络视频,请传入视频网络URL地址;视频为本地视频的,请传入来源于手机系统相册的相关的Asset URL地址]
   @param audioFlashURL   分享音频时缩略图播放源,仅平台子类型为SSDKPlatformSubTypeQQFriend,且分享类型为Audio时生效
   @param videoFlashURL   分享视频时缩略图播放源,仅平台子类型为SSDKPlatformSubTypeQQFriend,且分享类型为Video时生效
   @param thumbImage      缩略图，可以为UIImage、NSString（图片路径）、NSURL（图片路径）、SSDKImage
   @param images          图片集合,传入参数可以为单张图片信息，也可以为一个NSArray，数组元素可以为UIImage、NSString（图片路径）、NSURL（图片路径）、SSDKImage
 QQ会采用首张图片，QZone则支持图片数组
   @param type            分享类型, 仅支持Text、Image、WebPage、Audio、Video类型
   @param platformSubType 平台子类型，只能传入SSDKPlatformSubTypeQZone或者SSDKPlatformSubTypeQQFriend其中一个
   @param dataDictionary 数据存储字典 如果传入nil将新建
 */
+ (NSMutableDictionary *)SSDKSetupQQParamsByText:(NSString *)text
                                          title:(NSString *)title
                                            url:(NSURL *)url
                                  audioFlashURL:(NSURL *)audioFlashURL
                                  videoFlashURL:(NSURL *)videoFlashURL
                                     thumbImage:(id)thumbImage
                                         images:(id)images
                                           type:(NSInteger)type
                             forPlatformSubType:(NSInteger)platformSubType
                                  dataDictionary:(NSMutableDictionary *)dataDictionary;

/**
   设置Facebook分享参数
 
   @param text             分享内容
 分享类型为Text类型时,作为文字主体内容
 分享类型为WebPage类型时,作为连接描述
 
   @param image            图片，可以为UIImage、NSString（图片路径）、NSURL（图片路径）、SSDKImage
 分享类型为Image类型时,若使用客户端分享,可传入 单张/多张 的 本地/网络 图片;如果不使用客户端分享,仅支持单张的本地/网络图片
 *【Facebook通过客户端分享图片,可不需依赖任何权限;否则需要申请publish_actions权限】*
 分享类型为WebPage类型时,无论是否使用客户端,仅支持单张的网络图片
 
   @param url              链接
 分享类型为WebPage类型时,为链接地址
 [如果分享的连接是AppStore/GooglePlay/Facebook个人/公共主页,所对应的图片,标题,描述等参数可能不会生效,而实际生效的是FB通过爬虫网络根据连接搜刮而来的信息]
 分享类型为Video类型时,需传入视频地址且但必须是相册地址
 
   @param title            链接标题
 分享类型为WebPage类型时,为链接标题
 
   @param urlName          连接名称
 分享类型为WebPage类型时,为链接名称,仅在非客户端分享时生效
 
   @param attachementUrl   附件链接(附加的媒体文件（SWF 或 MP3）的网址。如果是 SWF，还必须指定image以提供视频的缩略图)
 分享类型为WebPage类型时,为链,仅在非客户端分享时生效
 
   @param type             分享类型
 当使用客户端分享时,支持Image、WebPage,Video类型
 当不适用客户端分享是,支持Text、Image、WebPage类型
  @param dataDictionary 数据存储字典 如果传入nil将新建
 */
- (NSMutableDictionary *)SSDKSetupFacebookParamsByText:(NSString *)text
                                                image:(id)image
                                                  url:(NSURL *)url
                                             urlTitle:(NSString *)title
                                              urlName:(NSString *)urlName
                                       attachementUrl:(NSURL *)attachementUrl
                                                 type:(NSInteger)type
                                       dataDictionary:(NSMutableDictionary *)dataDictionary;


#pragma mark - ShareUI
/**
 *  显示分享菜单
 *
 *  @param view                     要显示菜单的视图, iPad版中此参数作为弹出菜单的参照视图
 *  @param items                    菜单项，如果传入nil，则显示已集成的平台列表
 *  @param shareParams              分享内容参数
 *  @param shareStateChangedHandler 分享状态变更事件
 *
 *  @return 分享菜单控制器 SSUIShareActionSheetController
 */
+ (id)showShareActionSheet:(UIView *)view
                   items:(NSArray *)items
             shareParams:(NSMutableDictionary *)shareParams
     onShareStateChanged:(void (^) (NSInteger state,
                                    NSInteger platformType,
                                    NSDictionary *userData,
                                    id<IMOBFContentEntity> contentEntity,
                                    NSError *error,
                                    BOOL end))shareStateChangedHandler;

/**
 *  显示内容编辑视图
 *
 *  @param platformType             分享的平台类型
 *  @param otherPlatformTypes       除分享平台外，还可以分享的平台类型。
 *  @param shareParams              分享内容参数
 *  @param shareStateChangedHandler 分享状态变更事件
 *
 *  @return 内容编辑视图控制器 SSUIShareContentEditorViewController
 */
+ (id)showShareEditor:(NSInteger)platformType
   otherPlatformTypes:(NSArray *)otherPlatformTypes
          shareParams:(NSMutableDictionary *)shareParams
  onShareStateChanged:(void (^) (NSInteger state,
                                 NSInteger platformType,
                                 NSDictionary *userData,
                                 id<IMOBFContentEntity> contentEntity,
                                 NSError *error,
                                 BOOL end))shareStateChangedHandler;

/**
 *  根据配置文件显示分享菜单
 *
 *  @param view                     要显示菜单的视图, iPad版中此参数作为弹出菜单的参照视图
 *  @param items                    菜单项，如果传入nil，则显示已集成的平台列表
 *  @param contentName              ShareContent.xml内<Content>标签name属性的值
 *  @param customFields             自定义字段
 *  @param shareStateChangedHandler 分享状态变更事件
 *
 *  @return 分享菜单控制器 SSUIShareActionSheetController
 */
+ (id)showShareActionSheet:(UIView *)view
                   items:(NSArray *)items
             contentName:(NSString *)contentName
            customFields:(NSDictionary *)customFields
     onShareStateChanged:(void (^) (NSInteger state,
                                    NSInteger platformType,
                                    NSDictionary *userData,
                                    id<IMOBFContentEntity> contentEntity,
                                    NSError *error,
                                    BOOL end))shareStateChangedHandler;

/**
 *  根据配置文件显示内容编辑视图
 *
 *  @param platformType             分享的平台类型
 *  @param otherPlatformTypes       除分享平台外，还可以分享的平台类型。
 *  @param contentName              ShareContent.xml内<Content>标签name属性的值
 *  @param customFields             自定义字段
 *  @param shareStateChangedHandler 分享状态变更事件
 *
 *  @return 内容编辑视图控制器 SSUIShareContentEditorViewController
 */
+ (id)showShareEditor:(NSInteger)platformType
   otherPlatformTypes:(NSArray *)otherPlatformTypes
          contentName:(NSString *)contentName
         customFields:(NSDictionary *)customFields
  onShareStateChanged:(void (^) (NSInteger state,
                                 NSInteger platformType,
                                 NSDictionary *userData,
                                 id<IMOBFContentEntity> contentEntity,
                                 NSError *error,
                                 BOOL end))shareStateChangedHandler;

/**
 *  设置支持的页面方向
 */
+ (void)setSupportedInterfaceOrientation:(UIInterfaceOrientationMask)toInterfaceOrientation;

@end
