//
//  NSMutableDictionary+SSDKShare.h
//  ShareSDK
//
//  Created by 冯 鸿杰 on 15/2/9.
//  Copyright (c) 2015年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSDKTypeDefine.h"
#import "SSDKImage.h"
#import "SSDKData.h"

/**
 *  分享参数构造相关
 */
@interface NSMutableDictionary (SSDKShare)

/**
 *  设置分享标识
 *
 *  @param flags 标识数组，元素为NSString。
 */
- (void)SSDKSetShareFlags:(NSArray *)flags;

/**
 *  使用客户端分享
 */
- (void)SSDKEnableUseClientShare;

/**
 *  设置分享参数
 *
 *  @param text     文本
 *  @param images   图片集合,传入参数可以为单张图片信息，也可以为一个NSArray，数组元素可以为UIImage、NSString（图片路径）、NSURL（图片路径）、SSDKImage。如: @"http://www.mob.com/images/logo_black.png" 或 @[@"http://www.mob.com/images/logo_black.png"]
 *  @param url      网页路径/应用路径
 *  @param title    标题
 *  @param type     分享类型
 */
- (void)SSDKSetupShareParamsByText:(NSString *)text
                            images:(id)images
                               url:(NSURL *)url
                             title:(NSString *)title
                              type:(SSDKContentType)type;

/**
 *  设置新浪微博分享参数
 *
 *  @param text      文本
 *  @param title     标题
 *  @param image     图片对象，可以为UIImage、NSString（图片路径）、NSURL（图片路径）、SSDKImage
 *  @param url       分享链接
 *  @param latitude  纬度
 *  @param longitude 经度
 *  @param objectID  对象ID，标识系统内内容唯一性，应传入系统中分享内容的唯一标识，没有时可以传入nil
 *  @param type      分享类型，仅支持Text、Image、WebPage（客户端分享时）类型
 */
- (void)SSDKSetupSinaWeiboShareParamsByText:(NSString *)text
                                      title:(NSString *)title
                                      image:(id)image
                                        url:(NSURL *)url
                                   latitude:(double)latitude
                                  longitude:(double)longitude
                                   objectID:(NSString *)objectID
                                       type:(SSDKContentType)type;

/**
 *  设置腾讯微博分享参数
 *
 *  @param text      文本
 *  @param images    分享图片列表,传入参数可以为单张图片信息，也可以为一个NSArray，数组元素可以为UIImage、NSString（图片路径）、NSURL（图片路径）、SSDKImage。如: @"http://www.mob.com/images/logo_black.png" 或 @[@"http://www.mob.com/images/logo_black.png"]
 *  @param latitude  纬度
 *  @param longitude 经度
 *  @param type      分享类型, 仅支持Text、Image类型
 */
- (void)SSDKSetupTencentWeiboShareParamsByText:(NSString *)text
                                        images:(id)images
                                      latitude:(double)latitude
                                     longitude:(double)longitude
                                          type:(SSDKContentType)type;

/**
 *  设置微信分享参数
 *
 *  @param text         文本
 *  @param title        标题
 *  @param url          分享链接
 *  @param thumbImage   缩略图，可以为UIImage、NSString（图片路径）、NSURL（图片路径）、SSDKImage
 *  @param image        图片，可以为UIImage、NSString（图片路径）、NSURL（图片路径）、SSDKImage
 *  @param musicFileURL 音乐文件链接地址
 *  @param extInfo      扩展信息
 *  @param fileData     文件数据，可以为NSData、UIImage、NSString、NSURL（文件路径）、SSDKData、SSDKImage
 *  @param emoticonData 表情数据，可以为NSData、UIImage、NSURL（文件路径）、SSDKData、SSDKImage
 *  @param type         分享类型，支持SSDKContentTypeText、SSDKContentTypeImage、SSDKContentTypeWebPage、SSDKContentTypeApp、SSDKContentTypeAudio和SSDKContentTypeVideo
 *  @param platformType 平台子类型，只能传入SSDKPlatformSubTypeWechatSession、SSDKPlatformSubTypeWechatTimeline和SSDKPlatformSubTypeWechatFav其中一个
 *
 *  分享文本时：
 *  设置type为SSDKContentTypeText, 并填入text参数
 *
 *  分享图片时：
 *  设置type为SSDKContentTypeImage, 非gif图片时：填入title和image参数，如果为gif图片则需要填写title和emoticonData参数
 *
 *  分享网页时：
 *  设置type为SSDKContentTypeWebPage, 并设置text、title、url以及thumbImage参数，如果尚未设置thumbImage则会从image参数中读取图片并对图片进行缩放操作。
 *
 *  分享应用时：
 *  设置type为SSDKContentTypeApp，并设置text、title、extInfo（可选）以及fileData（可选）参数。
 *
 *  分享音乐时：
 *  设置type为SSDKContentTypeAudio，并设置text、title、url以及musicFileURL（可选）参数。
 *
 *  分享视频时：
 *  设置type为SSDKContentTypeVideo，并设置text、title、url参数
 */
- (void)SSDKSetupWeChatParamsByText:(NSString *)text
                              title:(NSString *)title
                                url:(NSURL *)url
                         thumbImage:(id)thumbImage
                              image:(id)image
                       musicFileURL:(NSURL *)musicFileURL
                            extInfo:(NSString *)extInfo
                           fileData:(id)fileData
                       emoticonData:(id)emoticonData
                               type:(SSDKContentType)type
                 forPlatformSubType:(SSDKPlatformType)platformSubType;

/**
 *  设置微信分享参数
 *
 *  @param text                 文本
 *  @param title                标题
 *  @param url                  分享链接
 *  @param thumbImage           缩略图，可以为UIImage、NSString（图片路径）、NSURL（图片路径）、SSDKImage
 *  @param image                图片，可以为UIImage、NSString（图片路径）、NSURL（图片路径）、SSDKImage
 *  @param musicFileURL         音乐文件链接地址
 *  @param extInfo              扩展信息
 *  @param fileData             文件数据，可以为NSData、UIImage、NSString、NSURL（文件路径）、SSDKData、SSDKImage
 *  @param emoticonData         表情数据，可以为NSData、UIImage、NSURL（文件路径）、SSDKData、SSDKImage
 *  @param sourceFileExtension  源文件后缀名
 *  @param sourceFileData       源文件数据，可以为NSData、NSString、NSURL（文件路径）、SSDKData
 *  @param type                 分享类型，支持SSDKContentTypeText、SSDKContentTypeImage、SSDKContentTypeWebPage、SSDKContentTypeApp、SSDKContentTypeAudio和SSDKContentTypeVideo
 *  @param platformType 平台子类型，只能传入其中一个
 *
 *  分享文本时：
 *  设置type为SSDKContentTypeText, 并填入text参数
 *
 *  分享图片时：
 *  设置type为SSDKContentTypeImage, 非gif图片时：填入title和image参数，如果为gif图片则需要填写title和emoticonData参数
 *
 *  分享网页时：
 *  设置type为SSDKContentTypeWebPage, 并设置text、title、url以及thumbImage参数，如果尚未设置thumbImage则会从image参数中读取图片并对图片进行缩放操作。
 *
 *  分享应用时：
 *  设置type为SSDKContentTypeApp，并设置text、title、extInfo（可选）以及fileData（可选）参数。
 *
 *  分享音乐时：
 *  设置type为SSDKContentTypeAudio，并设置text、title、url以及musicFileURL（可选）参数。
 *
 *  分享视频时：
 *  设置type为SSDKContentTypeVideo，并设置text、title、url参数
 *
 *  分享文件时：
 *  设置type为SSDKContentTypeFile（例如.mp3、.mp4、.pdf、.docx的分享），设置title、sourceFileExtension、sourceFileData，以及thumbImage参数，如果尚未设置thumbImage则会从image参数中读取图片并对图片进行缩放操作参数
 */
- (void)SSDKSetupWeChatParamsByText:(NSString *)text
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
                               type:(SSDKContentType)type
                 forPlatformSubType:(SSDKPlatformType)platformSubType;

/**
 *  设置Twitter分享参数
 *
 *  @param text      分享内容
 *  @param images    分享图片列表,传入参数可以为单张图片信息，也可以为一个NSArray，数组元素可以为UIImage、NSString（图片路径）、NSURL（图片路径）、SSDKImage。如: @"http://www.mob.com/images/logo_black.png" 或 @[@"http://www.mob.com/images/logo_black.png"]
 *  @param latitude  地理位置，纬度
 *  @param longitude 地理位置，经度
 *  @param type      分享类型，仅支持Text、Image类型
 */
- (void)SSDKSetupTwitterParamsByText:(NSString *)text
                              images:(id)images
                            latitude:(double)latitude
                           longitude:(double)longitude
                                type:(SSDKContentType)type;

/**
 *  设置QQ分享参数
 *
 *  @param text            分享内容
 *  @param title           分享标题
 *  @param url             分享链接
 *  @param thumbImage      缩略图，可以为UIImage、NSString（图片路径）、NSURL（图片路径）、SSDKImage
 *  @param image           图片，可以为UIImage、NSString（图片路径）、NSURL（图片路径）、SSDKImage
 *  @param type            分享类型, 仅支持Text（仅QQFriend）、Image（仅QQFriend）、WebPage、Audio、Video类型
 *  @param platformSubType 平台子类型，只能传入SSDKPlatformSubTypeQZone或者SSDKPlatformSubTypeQQFriend其中一个
 */
- (void)SSDKSetupQQParamsByText:(NSString *)text
                          title:(NSString *)title
                            url:(NSURL *)url
                     thumbImage:(id)thumbImage
                          image:(id)image
                           type:(SSDKContentType)type
             forPlatformSubType:(SSDKPlatformType)platformSubType;

/**
 *  设置QQ分享参数
 *
 *  @param text            分享内容
 *  @param title           分享标题
 *  @param url             分享链接(如果分享类型为音频/视频时,应该传入音频/视频的网络URL地址)
                           [特别说明:分享视频到QZone时,视频为网络视频,请传入视频网络URL地址;视频为本地视频的,请传入来源于手机系统相册的相关的Asset URL地址]
 *  @param audioFlashURL   分享音频时缩略图播放源,仅平台子类型为SSDKPlatformSubTypeQQFriend,且分享类型为Audio时生效
 *  @param videoFlashURL   分享视频时缩略图播放源,仅平台子类型为SSDKPlatformSubTypeQQFriend,且分享类型为Video时生效
 *  @param thumbImage      缩略图，可以为UIImage、NSString（图片路径）、NSURL（图片路径）、SSDKImage
 *  @param images          图片集合,传入参数可以为单张图片信息，也可以为一个NSArray，数组元素可以为UIImage、NSString（图片路径）、NSURL（图片路径）、SSDKImage
                           QQ会采用首张图片，QZone则支持图片数组
 *  @param type            分享类型, 仅支持Text、Image、WebPage、Audio、Video类型
 *  @param platformSubType 平台子类型，只能传入SSDKPlatformSubTypeQZone或者SSDKPlatformSubTypeQQFriend其中一个
 */
- (void)SSDKSetupQQParamsByText:(NSString *)text
                          title:(NSString *)title
                            url:(NSURL *)url
                  audioFlashURL:(NSURL *)audioFlashURL
                  videoFlashURL:(NSURL *)videoFlashURL
                     thumbImage:(id)thumbImage
                         images:(id)images
                           type:(SSDKContentType)type
             forPlatformSubType:(SSDKPlatformType)platformSubType;



/**
 *  设置Facebook分享参数
 *
 *  @param text  分享内容
 *  @param image 图片，可以为UIImage、NSString（图片路径）、NSURL（图片路径）、SSDKImage
 *  @param type  分享类型，仅支持Text、Image类型
 */
- (void)SSDKSetupFacebookParamsByText:(NSString *)text
                                image:(id)image
                                 type:(SSDKContentType)type;

/**
 *  设置Facebook分享参数 非客户端分享是使用
 *
 *  @param text             分享内容
                            分享类型为Text类型时,作为文字主体内容
                            分享类型为WebPage类型时,作为连接描述
 
 *  @param image            图片，可以为UIImage、NSString（图片路径）、NSURL（图片路径）、SSDKImage
                            分享类型为Image类型时,若使用客户端分享,可传入 单张/多张 的 本地/网络 图片;如果不使用客户端分享,仅支持单张的本地/网络图片
 *【Facebook通过客户端分享图片,可不需依赖任何权限;否则需要申请publish_actions权限】*
                            分享类型为WebPage类型时,无论是否使用客户端,仅支持单张的网络图片
 
 *  @param url              链接
                            分享类型为WebPage类型时,为链接地址
                            [如果分享的连接是AppStore/GooglePlay/Facebook个人/公共主页,所对应的图片,标题,描述等参数可能不会生效,而实际生效的是FB通过爬虫网络根据连接搜刮而来的信息]
                            分享类型为Video类型时,需传入视频地址且但必须是相册地址
 
 *  @param title            链接标题
                            分享类型为WebPage类型时,为链接标题
 
 *  @param urlName          连接名称
                            分享类型为WebPage类型时,为链接名称,仅在非客户端分享时生效
 
 *  @param attachementUrl   附件链接(附加的媒体文件（SWF 或 MP3）的网址。如果是 SWF，还必须指定image以提供视频的缩略图)
                            分享类型为WebPage类型时,为链,仅在非客户端分享时生效
 
 *  @param type             分享类型
                            当使用客户端分享时,支持Image、WebPage,Video类型
                            当不适用客户端分享是,支持Text、Image、WebPage类型
 */
- (void)SSDKSetupFacebookParamsByText:(NSString *)text
                                image:(id)image
                                  url:(NSURL *)url
                             urlTitle:(NSString *)title
                              urlName:(NSString *)urlName
                       attachementUrl:(NSURL *)attachementUrl
                                 type:(SSDKContentType)type;


/**
 *  设置短信分享参数
 *
 *  @param text        文本
 *  @param title       标题
 *  @param images      分享图片列表,传入参数可以为单张图片信息，也可以为一个NSArray，数组元素可以为UIImage、NSString（图片路径）、NSURL（图片路径）、SSDKImage。如: @"http://www.mob.com/images/logo_black.png" 或 @[@"http://www.mob.com/images/logo_black.png"]
 *  @param attachments 附件列表, 可以为单个附件也可以为一个数组，元素可以为NSData、UIImage、NSString、NSURL（文件路径）、SSDKData、SSDKImage，注：只允许指定本地资源
 *  @param recipients  接收人信息，如：@[@"400-685-2216"]
 *  @param type        分享类型，仅支持Text、Image类型
 */
- (void)SSDKSetupSMSParamsByText:(NSString *)text
                           title:(NSString *)title
                          images:(id)images
                     attachments:(id)attachments
                      recipients:(NSArray *)recipients
                            type:(SSDKContentType)type;

/**
 *  设置邮件分享参数
 *
 *  @param text          文本
 *  @param title         标题
 *  @param images        分享图片列表,传入参数可以为单张图片信息，也可以为一个NSArray，数组元素可以为UIImage、NSString（图片路径）、NSURL（图片路径）、SSDKImage。如: @"http://www.mob.com/images/logo_black.png" 或 @[@"http://www.mob.com/images/logo_black.png"]
 *  @param attachments   附件列表, 可以为单个附件也可以为一个数组，元素可以为NSData、UIImage、NSString、NSURL（文件路径）、SSDKData、SSDKImage，注：只允许指定本地资源
 *  @param recipients    接收人信息，如：@["tester@163.com"]
 *  @param ccRecipients  抄送人信息，如：@["tester2@163.com"]
 *  @param bccRecipients 密送人信息，如：@["tester3@163.com"]
 *  @param type          分享类型，仅支持Text、Image类型
 */
- (void)SSDKSetupMailParamsByText:(NSString *)text
                            title:(NSString *)title
                           images:(id)images
                      attachments:(id)attachments
                       recipients:(NSArray *)recipients
                     ccRecipients:(NSArray *)ccRecipients
                    bccRecipients:(NSArray *)bccRecipients
                             type:(SSDKContentType)type;

/**
 *  设置拷贝参数
 *
 *  @param text   文本，仅在type为Text时有效
 *  @param images 分享图片列表,传入参数可以为单张图片信息，也可以为一个NSArray，数组元素可以为UIImage、NSString（图片路径）、NSURL（图片路径）、SSDKImage。如: @"http://www.mob.com/images/logo_black.png" 或 @[@"http://www.mob.com/images/logo_black.png"]
 *  @param url    链接，仅在type为WebPage时有效
 *  @param type   分享类型，仅支持Text、Image、WebPage类型
 */
- (void)SSDKSetupCopyParamsByText:(NSString *)text
                           images:(id)images
                              url:(NSURL *)url
                             type:(SSDKContentType)type;

/**
 *  设置豆瓣分享参数
 *
 *  @param text  文本
 *  @param image 分享图片，当type为Image时，可以为UIImage、NSString（图片路径）、NSURL（图片路径）、SSDKImage。当type为WebPage时，只能为网络图片，可以传入NSString（图片路径）、NSURL（图片路径）。
 *  @param title 网页标题，仅在type为WebPage时有效。
 *  @param url   网页链接，仅在type为WebPage时有效。
 *  @param urlDesc 网页描述，仅在type为WebPage时有效。
 *  @param type  分享类型，仅支持Text、Image、WebPage类型
 */
- (void)SSDKSetupDouBanParamsByText:(NSString *)text
                              image:(id)image
                              title:(NSString *)title
                                url:(NSURL *)url
                            urlDesc:(NSString *)urlDesc
                               type:(SSDKContentType)type;

/**
 *  设置人人网分享参数
 *
 *  @param text    文本
 *  @param image   分享图片，可以为UIImage、NSString（图片路径）、NSURL（图片路径）、SSDKImage，仅在type为Image时有效。
 *  @param url     网页链接，仅在type为WebPage时有效。
 *  @param albumId 相册ID，指定分享的图片要放入哪个相册，默认为nil，仅在type为Image时有效。
 *  @param type    分享类型，仅支持Image、WebPage类型
 */
- (void)SSDKSetupRenRenParamsByText:(NSString *)text
                              image:(id)image
                                url:(NSURL *)url
                            albumId:(NSString *)albumId
                               type:(SSDKContentType)type;

/**
 *  设置开心网分享参数
 *
 *  @param text  文本
 *  @param image 分享图片，可以为UIImage、NSString（图片路径）、NSURL（图片路径）、SSDKImage，仅在type为Image时有效。
 *  @param type  分享类型，仅支持Text、Image类型
 */
- (void)SSDKSetupKaiXinParamsByText:(NSString *)text
                              image:(id)image
                               type:(SSDKContentType)type;

/**
 *  设置Pocket分享参数
 *
 *  @param url     分享链接
 *  @param title   标题
 *  @param tags    标签，可以为NSString或者NSArray。为NSString时，标签名称要以逗号分隔；为NSArray时，元素为NSString。
 *  @param tweetId 关联的推文ID
 */
- (void)SSDKSetupPocketParamsByUrl:(NSURL *)url
                             title:(NSString *)title
                              tags:(id)tags
                           tweetId:(NSString *)tweetId;

/**
 *  设置GooglePlus分享参数
 *
 *  @param text     文本
 *  @param url      分享链接，仅在type为WebPage时有效
 *  @param type     分享类型，仅支持Text、WebPage类型
 */
- (void)SSDKSetupGooglePlusParamsByText:(NSString *)text
                                    url:(NSURL *)url
                                   type:(SSDKContentType)type;

/**
 *  设置Instagram分享参数
 *
 *  @param image     分享图片，可以为UIImage、NSString（图片路径）、NSURL（图片路径）、SSDKImage，仅在type为Image时有效。
 *  @param point     分享菜单的显示位置，仅用于iPad版
 */
- (void)SSDKSetupInstagramByImage:(id)image
                 menuDisplayPoint:(CGPoint)point;

/**
 *  设置LinkedIn分享参数
 *
 *  @param text       分享文本
 *  @param image      分享图片，只能够是网络图片，传入类型可以为NSString（图片路径）， NSURL（图片路径）。
 *  @param url        分享链接
 *  @param title      标题
 *  @param urlDesc    链接的相关描述
 *  @param visibility 可见性，可以传入anyone或者connections-only，默认为anyone
 *  @param type       分享类型,仅支持Text和WebPage
 */
- (void)SSDKSetupLinkedInParamsByText:(NSString *)text
                                image:(id)image
                                  url:(NSURL *)url
                                title:(NSString *)title
                              urlDesc:(NSString *)urlDesc
                           visibility:(NSString *)visibility
                                 type:(SSDKContentType)type;

/**
 *  设置Tumblr分享参数
 *
 *  @param text  分享文本
 *  @param image 分享图片，只能够是网络图片，传入类型可以为NSString（图片路径）， NSURL（图片路径）。
 *  @param url   分享链接
 *  @param title 标题
 *  @param blogName 博客名称，如果为nil，则默认分享到默认博客中。
 *  @param type  分享类型，仅支持Text和Image
 */
- (void)SSDKSetupTumblrParamsByText:(NSString *)text
                              image:(id)image
                                url:(NSURL *)url
                              title:(NSString *)title
                           blogName:(NSString *)blogName
                               type:(SSDKContentType)type;

/**
 *  设置Flickr分享参数
 *
 *  @param text        图片描述
 *  @param image       分享图片，可以为UIImage、NSString（图片路径）、NSURL（图片路径）、SSDKImage。
 *  @param title       图片标题
 *  @param tags        图片标签列表
 *  @param isPublic    指定是否公开图片，NO 私有 YES 公开。
 *  @param isFriend    指定好友是否可以查看图片，NO 不允许，YES 允许
 *  @param isFamily    指定家人是否可以查看图片，NO 不允许，YES 允许
 *  @param safetyLevel 安全级别。1 安全 2 辅导级 3 限制级。
 *  @param contentType 1 照片、2 屏幕截图、3 其他。
 *  @param hidden      1 照片、2 屏幕截图、3 其他。
 */
- (void)SSDKSetupFlickrParamsByText:(NSString *)text
                              image:(id)image
                              title:(NSString *)title
                               tags:(NSArray *)tags
                           isPublic:(BOOL)isPublic
                           isFriend:(BOOL)isFriend
                           isFamily:(BOOL)isFamily
                        safetyLevel:(NSInteger)safetyLevel
                        contentType:(NSInteger)contentType
                             hidden:(NSInteger)hidden;

/**
 *  设置WhatsApp分享参数
 *
 *  @param text  分享文本
 *  @param image 分享图片，可以为UIImage、NSString（图片路径）、NSURL（图片路径）、SSDKImage。
 *  @param audio 分享音频, 可以为NSData、NSString、NSURL（文件路径）、SSDKData、注：只允许指定本地资源
 *  @param video 分享视频, 可以为NSData、NSString、NSURL（文件路径）、SSDKData、注：只允许指定本地资源
 *  @param point 分享菜单的显示位置，仅用于iPad版
 *  @param type  分享类型，仅支持Text、Image、Audio、Video
 */
- (void)SSDKSetupWhatsAppParamsByText:(NSString *)text
                                image:(id)image
                                audio:(id)audio
                                video:(id)video
                     menuDisplayPoint:(CGPoint)point
                                 type:(SSDKContentType)type;

/**
 *  设置有道云笔记分享参数
 *
 *  @param text   分享文本
 *  @param images 分享图片列表,传入参数可以为单张图片信息，也可以为一个NSArray，数组元素可以为UIImage、NSString（图片路径）、NSURL（图片路径）、SSDKImage，
 *                  
 *  @param title  标题
 *  @param source 来源
 *  @param author 作者
 *  @param notebook 笔记本
 */
- (void)SSDKSetupYouDaoNoteParamsByText:(NSString *)text
                                 images:(id)images
                                  title:(NSString *)title
                                 source:(NSString *)source
                                 author:(NSString *)author
                               notebook:(NSString *)notebook;

/**
 *  设置Line分享参数
 *
 *  @param text  分享文本
 *  @param image 分享图片，可以为UIImage、NSString（图片路径）、NSURL（图片路径）、SSDKImage。
 *  @param type  分享类型，仅支持Text、Image
 */
- (void)SSDKSetupLineParamsByText:(NSString *)text
                            image:(id)image
                             type:(SSDKContentType)type;

/**
 *  设置印象笔记分享参数，注：中国版和国际版都是调用此接口进行分享参数设置。
 *
 *  @param text     分享文本
 *  @param images   分享图片列表,传入参数可以为单张图片信息，也可以为一个NSArray，数组元素可以为UIImage、NSString（图片路径）、NSURL（图片路径）、SSDKImage，如: @"http://www.mob.com/images/logo_black.png" 或 @[@"http://www.mob.com/images/logo_black.png"]
 *  @param title    标题
 *  @param notebook 笔记本GUID
 *  @param tags     标签GUID列表
 *  @param platformType 分享平台类型，仅支持输入SSDKPlatformTypeYinXiang和SSDKPlatformTypeEvernote
 */
- (void)SSDKSetupEvernoteParamsByText:(NSString *)text
                               images:(id)images
                                title:(NSString *)title
                             notebook:(NSString *)notebook
                                 tags:(NSArray *)tags
                         platformType:(SSDKPlatformType)platformType;

/**
 *  设置支付宝好友分享参数
 *
 *  @param text  分享文本
 *  @param image 分享图片，可以为UIImage、NSString（图片路径）、NSURL（图片路径）、SSDKImage。
 *  @param title 标题
 *  @param url   分享链接
 *  @param type  分享类型，仅支持Text、Image、WebPage
 */
- (void)SSDKSetupAliPaySocialParamsByText:(NSString *)text
                                    image:(id)image
                                    title:(NSString *)title
                                      url:(NSURL *)url
                                     type:(SSDKContentType)type __deprecated_msg("use [SSDKSetupAliPaySocialParamsByText:image:title:url:type:platformType:] method instead");

/**
 *  设置支付宝分享参数
 *
 *  @param text  分享文本
 *  @param image 分享图片，可以为UIImage、NSString（图片路径）、NSURL（图片路径）、SSDKImage。
 *  @param title 标题
 *  @param url   分享链接
 *  @param type  分享类型，仅支持Text、Image、WebPage
 *  @param platformType 分享平台类型，仅支持输入SSDKPlatformTypeAliPaySocial和SSDKPlatformTypeAliPaySocialTimeline
 *  分享类型，平台支持情况如下：
 *  SSDKPlatformTypeAliPaySocial(支付宝好友):支持Text、Image、WebPage
 *  SSDKPlatformTypeAliPaySocialTimeline(支付宝朋友圈):支持Image、WebPage
 *
 */
- (void)SSDKSetupAliPaySocialParamsByText:(NSString *)text
                                    image:(id)image
                                    title:(NSString *)title
                                      url:(NSURL *)url
                                     type:(SSDKContentType)type
                             platformType:(SSDKPlatformType)platformType;

/**
 *  设置Pinterest分享参数
 *
 *  @param image      分享图片，可以为UIImage、NSString（图片路径）、NSURL（图片路径）、SSDKImage。
 *  @param desc       图片描述
 *  @param url        链接地址
 *  @param boardName  Board名称
 */
- (void)SSDKSetupPinterestParamsByImage:(id)image
                                   desc:(NSString *)desc
                                    url:(NSURL *)url
                              boardName:(NSString *)boardName;

/**
 *  设置KaKao分享参数
 *
 *  @param text                 分享文本
 *  @param images               分享图片列表,传入参数可以为单张图片信息，也可以为一个NSArray，数组元素可以为UIImage、NSString（图片路径）、NSURL（图片路径）、SSDKImage，如: @"http://www.mob.com/images/logo_black.png" 或 @[@"http://www.mob.com/images/logo_black.png"]
 *  @param title                分享链接标题，用于SSDKPlatformSubTypeKaKaoTalk分享
 *  @param url                  分享链接
 *  @param permission           查看权限：F 表示好友可以查看，A 表示任何人可以查看，M 表示私有，默认为A
 *  @param enableShare          是否允许分享，当查看权限为好友查看时，该选项有效，可以设置内容是否允许再分享。
 *  @PARAM imageSize            图片尺寸，，用于SSDKPlatformSubTypeKaKaoTalk分享时指定图片尺寸
 *  @param appButtonTitle       应用按钮标题,用于SSDKPlatformSubTypeKaKaoTalk分享App类型时设置
 *  @param androidExecParam     启动安卓版应用时传入参数，如果没有可以为nil，如:@{@"key" : @"value", @"key2" : @"value2"}。
 *  @param andoridMarkParam     安卓版应用的下载地址，如果没有可以为nil
 *  @param iphoneExecParams     启动iPhone应用时传入参数，如果没有可以为nil，如:@{@"key" : @"value", @"key2" : @"value2"}。
 *  @param iphoneMarkParam      iPhone应用的下载地址，如果没有可以nil
 *  @param ipadExecParams       iPad应用时传入参数，如果没有可以为nil，如:@{@"key" : @"value", @"key2" : @"value2"}。此参数仅用于Kakao Talk平台。
 *  @param ipadMarkParam        iPad应用的下载地址，如果没有可以为nil，此参数仅用于Kakao Talk平台。
 *  @param type                 分享类型，仅支持Text、Image、WebPage、App
 *  @param platformSubType      子平台类型，只能传入SSDKPlatformSubTypeKaKaoTalk或者SSDKPlatformSubTypeKaKaoStory
 *
 *  分享类型，平台支持情况如下：
 *              Kakao Talk                  Kakao Story
 *
 *  Text        仅支持客户端分享                应用内分享和客户端分享
 *  Image       仅支持网络图片的客户端分享        仅支持应用内分享
 *  WebPage     仅支持客户端分享                仅支持应用内分享
 *  App         仅支持客户端分享                不支持
 */
- (void)SSDKSetupKaKaoParamsByText:(NSString *)text
                            images:(id)images
                             title:(NSString *)title
                               url:(NSURL *)url
                        permission:(NSString *)permission
                       enableShare:(BOOL)enableShare
                         imageSize:(CGSize)imageSize
                    appButtonTitle:(NSString *)appButtonTitle
                  androidExecParam:(NSDictionary *)androidExecParam
                  androidMarkParam:(NSString *)androidMarkParam
                  iphoneExecParams:(NSDictionary *)iphoneExecParams
                   iphoneMarkParam:(NSString *)iphoneMarkParam
                    ipadExecParams:(NSDictionary *)ipadExecParams
                     ipadMarkParam:(NSString *)ipadMarkParam
                              type:(SSDKContentType)type
                forPlatformSubType:(SSDKPlatformType)platformSubType;

/**
 *  设置Dropbox分享参数
 *
 *  @param attachment 分享附件。附可以为NSData、UIImage、NSString、NSURL（文件路径）、SSDKData、SSDKImage，注：只允许指定本地资源
 */
- (void)SSDKSetupDropboxParamsByAttachment:(id)attachment;

/**
 *  设置VKontakte分享参数
 *
 *  @param text        分享文本
 *  @param images      分享图片列表,传入参数可以为单张图片信息，也可以为一个NSArray，数组元素可以为UIImage、NSString（图片路径）、NSURL（图片路径）、SSDKImage。如: @"http://www.mob.com/images/logo_black.png" 或 @[@"http://www.mob.com/images/logo_black.png"]
 *  @param url         分享的链接
 *  @param groupId     圈子标识，默认为nil，分享到share圈子
 *  @param friendsOnly 是否为好友可见，默认为NO，表示所有人可以看到。
 *  @param latitude    纬度
 *  @param longitude   经度
 *  @param type        分享类型，仅支持Text、Image、WebPage
 */
- (void)SSDKSetupVKontakteParamsByText:(NSString *)text
                                images:(id)images
                                   url:(NSURL *)url
                               groupId:(NSString *)groupId
                           friendsOnly:(BOOL)friendsOnly
                              latitude:(double)latitude
                             longitude:(double)longitude
                                  type:(SSDKContentType)type;

/**
 *  设置明道分享参数
 *
 *  @param text  分享文本
 *  @param image 分享图片，可以为UIImage、NSString（图片路径）、NSURL（图片路径）、SSDKImage。分享WebPage时需要指定为网络图片
 *  @param url   分享链接，仅在WebPage时有效。
 *  @param title   标题，仅在WebPage时有效
 *  @param type  分享类型，仅支持Text、Image、WebPage
 */
- (void)SSDKSetupMingDaoParamsByText:(NSString *)text
                               image:(id)image
                                 url:(NSURL *)url
                               title:(NSString *)title
                                type:(SSDKContentType)type;

/**
 *  设置Instapaper分享参数
 *
 *  @param url                 分享链接，如果isPrivateFromSource为YES并且content不为空时将忽略此参数
 *  @param title               分享标题
 *  @param desc                分享的链接描述
 *  @param content             内容
 *  @param isPrivateFromSource 是否为私有源
 *  @param folderId            文件夹ID
 *  @param resolveFinalUrl     解决最终URL问题标识，默认开启，用于解决跳转页面问题，设置为NO则表示不进行跳转
 */
- (void)SSDKSetupInstapaperParamsByUrl:(NSURL *)url
                                 title:(NSString *)title
                                  desc:(NSString *)desc
                               content:(NSString *)content
                   isPrivateFromSource:(BOOL)isPrivateFromSource
                              folderId:(NSInteger)folderId
                       resolveFinalUrl:(BOOL)resolveFinalUrl;

/**
 *  设置微信分享参数
 *
 *  @param text         文本
 *  @param title        标题
 *  @param url          分享链接
 *  @param thumbImage   缩略图，可以为UIImage、NSString（图片路径）、NSURL（图片路径）、SSDKImage
 *  @param image        图片，可以为UIImage、NSString（图片路径）、NSURL（图片路径）、SSDKImage
 *  @param musicFileURL 音乐文件链接地址
 *  @param extInfo      扩展信息
 *  @param fileData     文件数据，可以为NSData、UIImage、NSString、NSURL（文件路径）、SSDKData、SSDKImage
 *  @param comment      评论信息,在应用内分享朋友圈时该字段有效
 *  @param userId       发送給指定用户的唯一标识，在应用内分享好友时需要指定。注：如果双方为非好友关系发送消息即使提示成功，对方也无法接受。
 *  @param type         分享类型，支持SSDKContentTypeText、SSDKContentTypeImage、SSDKContentTypeWebPage、SSDKContentTypeApp、SSDKContentTypeAudio和SSDKContentTypeVideo
 *  @param platformType 平台子类型，只能传入SSDKPlatformTypeYiXinSession、SSDKPlatformTypeYiXinTimeline和SSDKPlatformTypeYiXinFav其中一个
 *
 *  分享文本时：
 *  设置type为SSDKContentTypeText, 并填入text参数
 *
 *  分享图片时：
 *  设置type为SSDKContentTypeImage, 非gif图片时：填入title和image参数
 *
 *  分享网页时：
 *  设置type为SSDKContentTypeWebPage, 并设置text、title、url以及thumbImage参数，如果尚未设置thumbImage则会从image参数中读取图片并对图片进行缩放操作。
 *
 *  分享应用时：
 *  设置type为SSDKContentTypeApp，并设置text、title、extInfo（可选）以及fileData（可选）参数。
 *
 *  分享音乐时：
 *  设置type为SSDKContentTypeAudio，并设置text、title、url以及musicFileURL（可选）参数。
 *
 *  分享视频时：
 *  设置type为SSDKContentTypeVideo，并设置text、title、url参数
 */
- (void)SSDKSetupYiXinParamsByText:(NSString *)text
                             title:(NSString *)title
                               url:(NSURL *)url
                        thumbImage:(id)thumbImage
                             image:(id)image
                      musicFileURL:(NSURL *)musicFileURL
                           extInfo:(NSString *)extInfo
                          fileData:(id)fileData
                           comment:(NSString *)comment
                          toUserId:(NSString *)userId
                              type:(SSDKContentType)type
                forPlatformSubType:(SSDKPlatformType)platformSubType;

/**
 *  设置Facebook Messenger分享参数
 *
 *  @param image 分享图片，可以为UIImage、NSString（图片路径）、NSURL（图片路径）、SSDKImage。
 *  @param image 分享gif图，可以为NSData、NSString、NSURL（文件路径）、SSDKData。
 *  @param audio 分享音频, 可以为NSData、NSString、NSURL（文件路径）、SSDKData。
 *  @param video 分享视频, 可以为NSData、NSString、NSURL（文件路径）、SSDKData。
 *  @param type  分享类型，仅支持Image、Audio、Video
 */
- (void)SSDKSetupFacebookMessengerParamsByImage:(id)image
                                            gif:(id)gif
                                          audio:(id)audio
                                          video:(id)video
                                           type:(SSDKContentType)type;

/**
 *  设置Ding Talk分享参数
 *
 *  @param text  文本内容
 *  @param image 图片
 *  @param title 标题
 *  @param url   链接
 *  @param type  分享类型，仅支持Text、Image、Webpage、Audio
 */
- (void)SSDKSetupDingTalkParamsByText:(NSString *)text
                                image:(id)image
                                title:(NSString *)title
                                  url:(NSURL *)url
                                 type:(SSDKContentType)type;

@end
