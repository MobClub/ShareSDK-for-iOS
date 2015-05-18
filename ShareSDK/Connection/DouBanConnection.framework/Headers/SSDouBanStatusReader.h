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
#import "SSDouBanEntityReader.h"
#import "SSDouBanSourceReader.h"

@class SSDouBanUserReader;

///#begin zh-cn
/**
 *	@brief	广播信息读取器
 */
///#end
///#begin en
/**
 *	@brief	Broadcast reader.
 */
///#end
@interface SSDouBanStatusReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

///#begin zh-cn
/**
 *	@brief	源数据
 */
///#end
///#begin en
/**
 *	@brief	Raw data.
 */
///#end
@property (nonatomic,readonly) NSDictionary *sourceData;

///#begin zh-cn
/**
 *	@brief	是否可被回应
 */
///#end
///#begin en
/**
 *	@brief	Can reply.
 */
///#end
@property (nonatomic,readonly) BOOL canReply;

///#begin zh-cn
/**
 *	@brief	attachments是一个json array格式的字符串， array里面的元素称为物,
 *          目前每条广播只支持单个物，物是每条广播表述的行为中的那个宾语，例如： xx推荐网址， 网址就是这个‘物’，
 */
///#end
///#begin en
/**
 *	@brief	attachments is a json array format string, array elements called attachment,
 *          Each broadcast is currently only supports a single thing. Attachment is the behavior of each broadcast presentation that object. For example: xx recommended URL. the URL is this 'Attachment',
 */
///#end
@property (nonatomic,readonly) NSArray *attachments;

///#begin zh-cn
/**
 *	@brief	暂无
 */
///#end
///#begin en
/**
 *	@brief	None
 */
///#end
@property (nonatomic,readonly) NSString *category;

///#begin zh-cn
/**
 *	@brief	回应数
 */
///#end
///#begin en
/**
 *	@brief	Comments count.
 */
///#end
@property (nonatomic,readonly) NSInteger commentsCount;

///#begin zh-cn
/**
 *	@brief	发广播的时间
 */
///#end
///#begin en
/**
 *	@brief	Published broadcast time.
 */
///#end
@property (nonatomic,readonly) NSString *createdAt;

///#begin zh-cn
/**
 *	@brief	暂无
 */
///#end
///#begin en
/**
 *	@brief	None
 */
///#end
@property (nonatomic,retain) SSDouBanEntityReader *entities;

///#begin zh-cn
/**
 *	@brief	暂无
 */
///#end
///#begin en
/**
 *	@brief	None
 */
///#end
@property (nonatomic,readonly) BOOL hasPhoto;

///#begin zh-cn
/**
 *	@brief	广播id
 */
///#end
///#begin en
/**
 *	@brief	Broadcast id
 */
///#end
@property (nonatomic,readonly) NSString *Id;

///#begin zh-cn
/**
 *	@brief	暂无
 */
///#end
///#begin en
/**
 *	@brief	None
 */
///#end
@property (nonatomic,readonly) BOOL isFollow;

///#begin zh-cn
/**
 *	@brief	赞的数量
 */
///#end
///#begin en
/**
 *	@brief	Like count.
 */
///#end
@property (nonatomic,readonly) NSInteger likeCount;

///#begin zh-cn
/**
 *	@brief	是否已经喜欢
 */
///#end
///#begin en
/**
 *	@brief	Whether liked.
 */
///#end
@property (nonatomic,readonly) BOOL liked;

///#begin zh-cn
/**
 *	@brief	暂无
 */
///#end
///#begin en
/**
 *	@brief	None
 */
///#end
@property (nonatomic,readonly) BOOL muted;

///#begin zh-cn
/**
 *	@brief	转播数
 */
///#end
///#begin en
/**
 *	@brief	reshared count.
 */
///#end
@property (nonatomic,readonly) NSInteger resharedCount;

///#begin zh-cn
/**
 *	@brief	app key对应的应用名和应用url
 */
///#end
///#begin en
/**
 *	@brief	app key corresponding application name and application url.
 */
///#end
@property (nonatomic,readonly) SSDouBanSourceReader *source;

///#begin zh-cn
/**
 *	@brief	web段在引号内展示的一段文本, 一般为用户输入的内容
 */
///#end
///#begin en
/**
 *	@brief	a piece of text in quotes web segment display. Content is generally user input.
 */
///#end
@property (nonatomic,readonly) NSString *text;

///#begin zh-cn
/**
 *	@brief	广播的title
 */
///#end
///#begin en
/**
 *	@brief	Title string.
 */
///#end
@property (nonatomic,readonly) NSString *title;

///#begin zh-cn
/**
 *	@brief	暂无
 */
///#end
///#begin en
/**
 *	@brief	None
 */
///#end
@property (nonatomic,readonly) NSString *type;

///#begin zh-cn
/**
 *	@brief	发广播者
 */
///#end
///#begin en
/**
 *	@brief	Posted Broadcaster.
 */
///#end
@property (nonatomic,readonly) SSDouBanUserReader *user;

///#begin zh-cn
/**
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
///#end
///#begin en
/**
 *	@brief	Initialize reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
///#end
- (id)initWithSourceData:(NSDictionary *)sourceData;

///#begin zh-cn
/**
 *	@brief	创建广播信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
///#end
///#begin en
/**
 *	@brief	Create Broadcast information reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
///#end
+ (SSDouBanStatusReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
