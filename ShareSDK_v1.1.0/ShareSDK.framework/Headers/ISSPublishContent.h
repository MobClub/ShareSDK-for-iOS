//
//  ISSPublishContent.h
//  AppgoFramework
//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:1955211608
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSPublishContentMediaType.h"
#import "SSInheritValue.h"

#define INHERIT_VALUE [SSInheritValue inherit]

/**
 *	@brief	分享内容协议
 */
@protocol ISSPublishContent <NSObject>

/**
 *	@brief	获取分享内容
 *
 *	@return	分享内容
 */
- (NSString *)content;

/**
 *	@brief	获取默认分享内容
 *
 *	@return	分享内容
 */
- (NSString *)defaultContent;

/**
 *	@brief	获取分享图片
 *
 *	@return	分享图片
 */
- (UIImage *)image;

/**
 *	@brief	获取分享图片质量,图片质量指定在分享时上传图片的质量，取值范围在0~1之间，默认0.8
 *
 *	@return	图片质量
 */
- (CGFloat)imageQuality;

/**
 *	@brief	获取分享标题，仅用于微信和QQ平台，当发送News、Music、Video和App时有效
 *
 *	@return	分享标题
 */
- (NSString *)title;

/**
 *	@brief	获取分享链接，仅用于微信和QQ平台，当发送News、Music、Video和App时有效
 *
 *	@return	分享链接
 */
- (NSString *)url;

/**
 *	@brief	获取分享类型，仅用于微信和QQ平台，
 *
 *	@return	分享类型
 */
- (SSPublishContentMediaType)mediaType;

/**
 *	@brief	获取音乐文件链接，仅用于微信平台,当发送Music时有效
 *
 *	@return	音乐文件链接
 */
- (NSString *)musicFileUrl;

/**
 *	@brief	获取扩展信息，仅用于微信平台,当发送App时有效
 *
 *	@return	扩展信息
 */
- (NSString *)extInfo;

/**
 *	@brief	获取文件数据，仅用于微信平台,当发送App时有效
 *
 *	@return	文件数据
 */
- (NSData *)fileData;


/**
 *	@brief	添加微信好友内容单元，制定微信分享时的内容使用此参数，如果参数设置为INHERIT_VALUE则默认使用父级类型相关参数
 *
 *  @since  ver1.1.0
 *
 *	@param 	type 	分享类型,请参考SSPublishContentMediaType
 *	@param 	content 	分享内容
 *	@param 	title 	标题
 *	@param 	url 	URL地址
 *	@param 	image 	分享图片
 *	@param 	imageQuality 	分享图片质量，取值范围：0～1
 *  @param  musicFileUrl    音乐文件路径
 *  @param  extInfo     扩展信息
 *  @param  fileData    文件数据
 */
- (void)addWeixinSessionUnitWithType:(NSNumber *)type
                             content:(NSString *)content
                               title:(NSString *)title
                                 url:(NSString *)url
                               image:(UIImage *)image
                        imageQuality:(NSNumber *)imageQuality
                        musicFileUrl:(NSString *)musicFileUrl
                             extInfo:(NSString *)extInfo
                            fileData:(NSData *)fileData;

/**
 *	@brief	添加微信朋友圈内容单元，制定微信分享时的内容使用此参数，如果参数设置为INHERIT_VALUE则默认使用父级类型相关参数
 *
 *  @since  ver1.1.0
 *
 *	@param 	type 	分享类型,请参考SSPublishContentMediaType
 *	@param 	content 	分享内容
 *	@param 	title 	标题
 *	@param 	url 	URL地址
 *	@param 	image 	分享图片
 *	@param 	imageQuality 	分享图片质量，取值范围：0～1
 *  @param  musicFileUrl    音乐文件路径
 *  @param  extInfo     扩展信息
 *  @param  fileData    文件数据
 */
- (void)addWeixinTimelineUnitWithType:(NSNumber *)type
                              content:(NSString *)content
                                title:(NSString *)title
                                  url:(NSString *)url
                                image:(UIImage *)image
                         imageQuality:(NSNumber *)imageQuality
                         musicFileUrl:(NSString *)musicFileUrl
                              extInfo:(NSString *)extInfo
                             fileData:(NSData *)fileData;

/**
 *	@brief	添加QQ内容单元，制定QQ分享时的内容使用此参数，如果参数设置为INHERIT_VALUE则默认使用父级类型相关参数
 *
 *  @since  ver1.1.0
 *
 *	@param 	type 	分享类型,请参考SSPublishContentMediaType
 *	@param 	content 	分享内容
 *	@param 	title 	标题
 *	@param 	url 	URL地址
 *	@param 	image 	分享图片
 *	@param 	imageQuality 	分享图片质量，取值范围：0～1
 */
- (void)addQQUnitWithType:(NSNumber *)type
                  content:(NSString *)content
                    title:(NSString *)title
                      url:(NSString *)url
                    image:(UIImage *)image
             imageQuality:(NSNumber *)imageQuality;


/**
 *	@brief	添加短信内容单元，制定短信分享时的内容使用此参数，如果参数设置为INHERIT_VALUE则默认使用父级类型相关参数
 *
 *  @since  ver1.1.0
 *
 *	@param 	content 	分享内容
 */
- (void)addSMSUnitWithContent:(NSString *)content;

/**
 *	@brief	添加邮件内容单元，制定邮件分享时的内容使用此参数，如果参数设置为INHERIT_VALUE则默认使用父级类型相关参数
 *
 *	@param 	subject 	邮件主题
 *	@param 	content 	邮件内容
 *	@param 	isHTML 	邮件内容格式：YES：HTML格式。NO：普通文本格式
 *  @param  attachments 附件列表
 */
- (void)addMailUnitWithSubject:(NSString *)subject
                       content:(NSString *)content
                        isHTML:(NSNumber *)isHTML
                   attachments:(NSArray *)attachments;



@end
