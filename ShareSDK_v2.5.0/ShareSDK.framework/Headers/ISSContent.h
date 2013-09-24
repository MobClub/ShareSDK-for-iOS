//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShareSDKTypeDef.h"
#import <ShareSDKCoreService/ShareSDKCoreService.h>

/**
 *	@brief	分享内容协议
 */
@protocol ISSContent <NSObject>

/**
 *	@brief	获取元数据
 *
 *	@param 	name 	名称
 *
 *	@return	数据值
 */
- (id)getMetadata:(NSString *)name;

/**
 *	@brief	设置元数据
 *
 *	@param 	name 	名称
 *	@param 	value 	数据值
 */
- (void)setMetadata:(NSString *)name value:(id)value;

/**
 *	@brief	删除元数据
 *
 *	@param 	name 	名称
 */
- (void)removeMetadata:(NSString *)name;

/**
 *	@brief	获取标题(适用平台：QQ空间、人人、微信、QQ)
 *
 *	@return	标题
 */
- (NSString *)title;

/**
 *	@brief	设置标题
 *
 *	@param 	title 	标题
 */
- (void)setTitle:(NSString *)title;

/**
 *	@brief	获取URL(适用平台：QQ空间、人人、Instapaper、微信、QQ)
 *
 *	@return	URL
 */
- (NSString *)url;

/**
 *	@brief	设置URL
 *
 *	@param 	url 	URL
 */
- (void)setUrl:(NSString *)url;

/**
 *	@brief	获取分享内容主体(适用平台：人人)
 *
 *	@return	分享内容主体
 */
- (NSString *)desc;

/**
 *	@brief	设置分享内容主体
 *
 *	@param 	desc 	分享内容主体
 */
- (void)setDesc:(NSString *)desc;

/**
 *	@brief	获取分享类型（适用平台：微信、QQ）
 *
 *	@return	分享类型
 */
- (SSPublishContentMediaType)mediaType;

/**
 *	@brief	设置分享类型
 *
 *	@param 	mediaType 	分享类型
 */
- (void)setMediaType:(SSPublishContentMediaType)mediaType;

/**
 *	@brief	获取分享内容(适用平台：新浪、腾讯、网易、搜狐、豆瓣、人人、开心、有道云笔记、facebook、twitter、邮件、打印、短信、微信、QQ、拷贝)
 *
 *	@return	分享内容
 */
- (NSString *)content;

/**
 *	@brief	设置分享内容
 *
 *	@param 	content 	分享内容
 */
- (void)setContent:(NSString *)content;

/**
 *	@brief	获取默认分享内容，在没有设置content时使用。
 *          (适用平台：新浪、腾讯、网易、搜狐、豆瓣、人人、开心、有道云笔记、facebook、twitter、邮件、打印、短信、微信、QQ、拷贝)
 *
 *	@return	默认分享内容
 */
- (NSString *)defaultContent;

/**
 *	@brief	设置默认分享内容
 *
 *	@param 	defaultContent 	默认分享内容
 */
- (void)setDefaultContent:(NSString *)defaultContent;

/**
 *	@brief	获取分享图片（适用平台：新浪、腾讯、网易、搜狐、豆瓣、人人、开心、facebook、twitter、邮件、打印、微信、QQ）
 *
 *	@return	分享图片
 */
- (id<ISSCAttachment>)image;

/**
 *	@brief	设置分享图片
 *
 *	@param 	image 	分享图片
 */
- (void)setImage:(id<ISSCAttachment>)image;

/**
 *	@brief	获取地理位置
 *
 *	@return	地理位置
 */
- (SSCLocationCoordinate2D *)locationCoordinate;

/**
 *	@brief	设置地理位置
 *
 *	@param 	locationCoordinate 	地理位置
 */
- (void)setLocationCoordinate:(SSCLocationCoordinate2D *)locationCoordinate;


#pragma mark ContentUnti

/**
 *	@brief	添加微信好友内容单元，制定微信分享时的内容使用此参数，如果参数设置为INHERIT_VALUE则默认使用父级类型相关参数
 *
 *	@param 	type 	分享类型,请参考SSPublishContentMediaType
 *	@param 	content 	分享内容
 *	@param 	title 	标题
 *	@param 	url 	URL地址
 *	@param 	image 	分享图片
 *  @param  musicFileUrl    音乐文件路径
 *  @param  extInfo     扩展信息
 *  @param  fileData    文件数据
 *  @param  emoticonData    表情数据，用于存放Gif和非Gif图片数据
 */
- (void)addWeixinSessionUnitWithType:(NSNumber *)type
                             content:(NSString *)content
                               title:(NSString *)title
                                 url:(NSString *)url
                               image:(id<ISSCAttachment>)image
                        musicFileUrl:(NSString *)musicFileUrl
                             extInfo:(NSString *)extInfo
                            fileData:(NSData *)fileData
                        emoticonData:(NSData *)emoticonData;

/**
 *	@brief	添加微信朋友圈内容单元，制定微信分享时的内容使用此参数，如果参数设置为INHERIT_VALUE则默认使用父级类型相关参数
 *
 *	@param 	type 	分享类型,请参考SSPublishContentMediaType
 *	@param 	content 	分享内容
 *	@param 	title 	标题
 *	@param 	url 	URL地址
 *	@param 	image 	分享图片
 *  @param  musicFileUrl    音乐文件路径
 *  @param  extInfo     扩展信息
 *  @param  fileData    文件数据
 *  @param  emoticonData    表情数据，用于存放Gif和非Gif图片数据
 */
- (void)addWeixinTimelineUnitWithType:(NSNumber *)type
                              content:(NSString *)content
                                title:(NSString *)title
                                  url:(NSString *)url
                                image:(id<ISSCAttachment>)image
                         musicFileUrl:(NSString *)musicFileUrl
                              extInfo:(NSString *)extInfo
                             fileData:(NSData *)fileData
                         emoticonData:(NSData *)emoticonData;

/**
 *	@brief	添加QQ内容单元，制定QQ分享时的内容使用此参数，如果参数设置为INHERIT_VALUE则默认使用父级类型相关参数
 *
 *	@param 	type 	分享类型,请参考SSPublishContentMediaType
 *	@param 	content 	分享内容
 *	@param 	title 	标题
 *	@param 	url 	URL地址
 *	@param 	image 	分享图片
 */
- (void)addQQUnitWithType:(NSNumber *)type
                  content:(NSString *)content
                    title:(NSString *)title
                      url:(NSString *)url
                    image:(id<ISSCAttachment>)image;


/**
 *	@brief	添加短信内容单元，制定短信分享时的内容使用此参数，如果参数设置为INHERIT_VALUE则默认使用父级类型相关参数
 *
 *	@param 	content 	分享内容
 */
- (void)addSMSUnitWithContent:(NSString *)content;

/**
 *	@brief	添加QQ空间内容单元，制定QQ空间分享时的内容使用此参数，如果参数设置为INHERIT_VALUE则默认使用父级类型相关参数
 *
 *	@param 	title 	标题
 *	@param 	url 	链接地址
 *	@param 	site 	分享的来源网站名称，请填写网站申请接入时注册的网站名称。
 *	@param 	fromUrl 	分享的来源网站对应的网站地址url
 *	@param 	comment 	评论内容
 *	@param 	summary 	分享分享内容概述
 *	@param 	image 	分享图片
 *	@param 	type 	内容类型，4表示网页；5表示视频
 *	@param 	playUrl 	视频的swf播放地址，在type为5时必须填写
 *	@param 	nswb 	是否同步到微博，等于1表示不同步，非1表示同步
 */
- (void)addQQSpaceUnitWithTitle:(NSString *)title
                            url:(NSString *)url
                           site:(NSString *)site
                        fromUrl:(NSString *)fromUrl
                        comment:(NSString *)comment
                        summary:(NSString *)summary
                          image:(id<ISSCAttachment>)image
                           type:(NSNumber *)type
                        playUrl:(NSString *)playUrl
                           nswb:(NSNumber *)nswb;


/**
 *	@brief	添加有道云笔记内容单元。
 *
 *	@param 	content 	内容
 *	@param 	title 	标题
 *	@param 	author 	作者
 *	@param 	source 	来源
 *	@param 	attachments 	附件列表
 */
- (void)addYouDaoNoteUnitWithContent:(NSString *)content
                               title:(NSString *)title
                              author:(NSString *)author
                              source:(NSString *)source
                         attachments:(NSArray *)attachments;

/**
 *	@brief	添加Instapaper分享内容
 *
 *	@param 	url 	URL路径
 *	@param 	title 	标题，无标题时传入nil
 *	@param 	description 	描述，无描述时传入nil
 */
- (void)addInstapaperContentWithUrl:(NSString *)url
                              title:(NSString *)title
                        description:(NSString *)description;

/**
 *	@brief	添加邮件内容单元，制定邮件分享时的内容使用此参数，如果参数设置为INHERIT_VALUE则默认使用父级类型相关参数
 *
 *  @since  ver1.2.4
 *
 *	@param 	subject 	邮件主题
 *	@param 	content 	邮件内容
 *	@param 	isHTML      邮件内容格式：YES：HTML格式。NO：普通文本格式
 *  @param  attachments     附件列表
 *  @param  to      收件人邮箱地址列表
 *  @param  cc      抄送邮箱地址列表
 *  @param  bcc     密送邮箱地址列表
 */
- (void)addMailUnitWithSubject:(NSString *)subject
                       content:(NSString *)content
                        isHTML:(NSNumber *)isHTML
                   attachments:(NSArray *)attachments
                            to:(NSArray *)to
                            cc:(NSArray *)cc
                           bcc:(NSArray *)bcc;

/**
 *	@brief	添加人人网
 *
 *	@param 	name 	标题 注意：最多30个字符
 *	@param 	description 	主体内容 注意：最多200个字符。
 *	@param 	url 	指向的链接
 *	@param 	message 	用户输入的自定义内容。注意：最多200个字符。
 *	@param 	image 	分享图片对象
 *	@param 	captions 	副标题 注意：最多20个字符
 */
- (void)addRenRenUnitWithName:(NSString *)name
                  description:(NSString *)description
                          url:(NSString *)url
                      message:(NSString *)message
                        image:(id<ISSCAttachment>)image
                      caption:(NSString *)captions;

/**
 *	@brief	添加搜狐随身看内容单元
 *
 *	@param 	url 	书签的URL
 */
- (void)addSohuKanUnitWithUrl:(NSString *)url;

/**
 *	@brief	添加Pocket内容单元
 *
 *  @since  ver2.2.0
 *
 *	@param 	url 	链接
 *	@param 	title 	标题，如果链接内容无标题时使用
 *	@param 	tags 	带逗号分隔的标签列表
 *	@param 	tweetId 	推文ID
 */
- (void)addPocketUnitWithUrl:(NSString *)url
                       title:(NSString *)title
                        tags:(NSString *)tags
                     tweetId:(NSString *)tweetId;

/**
 *	@brief	添加印象笔记内容单元
 *
 *	@param 	content 	内容
 *	@param 	title 	标题
 *	@param 	resources 	图片资源列表，元素为ISSAttachment协议对象。如果设置为INHERIT_VALUE则继承父级内容的image。
 */
- (void)addEvernoteUnitWithContent:(NSString *)content
                             title:(NSString *)title
                         resources:(NSArray *)resources;

/**
 *	@brief	添加新浪微博内容单元
 *
 *  @since  ver2.2.0
 *
 *	@param 	content 	内容
 *	@param 	image 	图片
 */
- (void)addSinaWeiboUnitWithContent:(NSString *)content
                              image:(id<ISSCAttachment>)image;

/**
 *	@brief	添加新浪微博内容单元
 *
 *  @since  ver2.4.1
 *
 *	@param 	content 	内容
 *	@param 	image 	图片
 *  @param  locationCoordinate 	地理位置
 */
- (void)addSinaWeiboUnitWithContent:(NSString *)content
                              image:(id<ISSCAttachment>)image
                          locationCoordinate:(SSCLocationCoordinate2D *)locationCoordinate;

/**
 *	@brief	添加腾讯微博内容单元
 *
 *  @since  ver2.2.0
 *
 *	@param 	content 	内容
 *	@param 	image 	图片
 */
- (void)addTencentWeiboUnitWithContent:(NSString *)content
                                 image:(id<ISSCAttachment>)image;

/**
 *	@brief	添加腾讯微博内容单元
 *
 *  @since  ver2.4.1
 *
 *	@param 	aContent 	内容
 *	@param 	aImage 	图片
 *	@param 	locationCoordinate 	地理位置
 */
- (void)addTencentWeiboUnitWithContent:(NSString *)content
                                 image:(id<ISSCAttachment>)image
                    locationCoordinate:(SSCLocationCoordinate2D *)locationCoordinate;


/**
 *	@brief	添加搜狐微博内容单元
 *
 *  @since  ver2.2.0
 *
 *	@param 	content 	内容
 *	@param 	image 	图片
 */
- (void)addSohuWeiboUnitWithContent:(NSString *)content
                              image:(id<ISSCAttachment>)image;

/**
 *	@brief	添加网易微博内容单元
 *
 *  @since  ver2.2.0
 *
 *	@param 	content 	内容
 *	@param 	image 	图片
 */
- (void)add163WeiboUnitWithContent:(NSString *)content
                             image:(id<ISSCAttachment>)image;

/**
 *	@brief	添加拷贝内容单元
 *
 *  @since  ver2.2.0
 *
 *	@param 	content 	内容
 *	@param 	image 	图片
 */
- (void)addCopyUnitWithContent:(NSString *)content
                         image:(id<ISSCAttachment>)image;

/**
 *	@brief	添加打印内容单元
 *
 *  @since  ver2.2.0
 *
 *	@param 	content 	内容
 *	@param 	image 	图片
 */
- (void)addAirPrintWithContent:(NSString *)content
                         image:(id<ISSCAttachment>)image;

/**
 *	@brief	添加豆瓣内容单元
 *
 *  @since  ver2.2.0
 *
 *	@param 	content 	内容
 *	@param 	image 	图片
 */
- (void)addDouBanWithContent:(NSString *)content
                       image:(id<ISSCAttachment>)image;

/**
 *	@brief	添加Facebook内容单元
 *
 *  @since  ver2.2.0
 *
 *	@param 	content 	内容
 *	@param 	image 	图片
 */
- (void)addFacebookWithContent:(NSString *)content
                         image:(id<ISSCAttachment>)image;

/**
 *	@brief	添加Twitter内容单元
 *
 *  @since  ver2.2.0
 *
 *	@param 	content 	内容
 *	@param 	image 	图片
 */
- (void)addTwitterWithContent:(NSString *)content
                        image:(id<ISSCAttachment>)image;

/**
 *	@brief	添加Twitter内容单元
 *
 *  @since  ver2.4.1
 *
 *	@param 	content 	内容
 *	@param 	image 	图片
 *	@param 	locationCoordinate 	地理位置
 */
- (void)addTwitterWithContent:(NSString *)content
                        image:(id<ISSCAttachment>)image
           locationCoordinate:(SSCLocationCoordinate2D *)locationCoordinate;


/**
 *	@brief	添加开心网内容单元
 *
 *  @since  ver2.2.0
 *
 *	@param 	content 	内容
 *	@param 	image 	图片
 */
- (void)addKaiXinUnitWithContent:(NSString *)content
                           image:(id<ISSCAttachment>)image;

/**
 *	@brief	添加LinkedIn内容单元
 *
 *  @since  ver2.4.0
 *
 *	@param 	comment 	对分享内容的评论
 *	@param 	title 	标题
 *	@param 	description 	内容描述
 *	@param 	url 	内容链接地址
 *	@param 	image   内容相关图片（只允许分享网络图片）
 *	@param 	visibility  可见，默认为anyone
 */
- (void)addLinkedInUnitWithComment:(NSString *)comment
                             title:(NSString *)title
                       description:(NSString *)description
                               url:(NSString *)url
                             image:(id<ISSCAttachment>)image
                        visibility:(NSString *)visibility;

/**
 *	@brief	添加Google+内容单元
 *
 *  @since  ver2.4.0
 *
 *	@param 	text 	分享内容
 *	@param 	url 	链接
 *	@param 	deepLinkId 	深链接ID
 *	@param 	title 	深链接标题
 *	@param 	description 	深链接描述
 *	@param 	thumbnail   缩略图
 */
- (void)addGooglePlusUnitWithText:(NSString *)text
                              url:(NSString *)url
                       deepLinkId:(NSString *)deepLinkId
                            title:(NSString *)title
                      description:(NSString *)description
                        thumbnail:(id<ISSCAttachment>)thumbnail;

/**
 *	@brief	添加Pinterest内容单元
 *
 *  @since  ver2.4.1
 *
 *	@param 	image 	图片
 *	@param 	url 	链接
 *	@param 	description 	描述
 */
- (void)addPinterestUnitWithImage:(id<ISSCAttachment>)image
                              url:(NSString *)url
                      description:(NSString *)description;

/**
 *	@brief	添加Flickr内容单元
 *
 *	@param 	photo 	图片对象
 *	@param 	title 	标题
 *	@param 	description 	相片描述。可能包含某受限的 HTML。
 *	@param 	tags 	適用於相片的以空格分隔的標籤清單。
 *	@param 	isPublic 	設定為 0 表示否，1 表示是。指定誰可以檢視相片。
 *	@param 	isFriend 	設定為 0 表示否，1 表示是。指定誰可以檢視相片。
 *	@param 	isFamily 	設定為 0 表示否，1 表示是。指定誰可以檢視相片。
 *	@param 	safetyLevel 	設置 1 為「安全級」、2 為「輔導級」、3 為「限制級」。
 *	@param 	contentType 	設置 1 為「相片」、2 為「螢幕截圖」、3 為「其他」。
 *	@param 	hidden 	設置 1 為「相片」、2 為「螢幕截圖」、3 為「其他」。
 */
- (void)addFlickrUnitWithPhoto:(id<ISSCAttachment>)photo
                         title:(NSString *)title
                   description:(NSString *)description
                          tags:(NSString *)tags
                      isPublic:(NSNumber *)isPublic
                      isFriend:(NSNumber *)isFriend
                      isFamily:(NSNumber *)isFamily
                   safetyLevel:(NSNumber *)safetyLevel
                   contentType:(NSNumber *)contentType
                        hidden:(NSNumber *)hidden;

/**
 *	@brief	添加Tumblr内容单元
 *
 *	@param 	text 	内容，可以带有HTML标签
 *	@param 	title 	标题
 *	@param 	image 	图片
 *	@param 	url 	点击后跳转的链接
 *	@param 	blogName 	博客名称，为nil时表示发去主博客
 */
- (void)addTumblrUnitWithText:(NSString *)text
                        title:(NSString *)title
                        image:(id<ISSCAttachment>)image
                          url:(NSString *)url
                     blogName:(NSString *)blogName;

/**
 *	@brief	添加Dropbox内容单元
 *
 *	@param 	file 	文件
 */
- (void)addDropboxUnitWithFile:(id<ISSCAttachment>)file;


@end
