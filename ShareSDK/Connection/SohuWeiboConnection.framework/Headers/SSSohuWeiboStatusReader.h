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
#import "SSSohuWeiboUserReader.h"

///#begin zh-cn
/**
 *	@brief	微博信息读取器
 */
///#end
///#begin en
/**
 *	@brief	Status Reader.
 */
///#end
@interface SSSohuWeiboStatusReader : NSObject
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
 *	@brief	创建时间
 */
///#end
///#begin en
/**
 *	@brief	Created time.
 */
///#end
@property (nonatomic,readonly) NSString *createAt;

///#begin zh-cn
/**
 *	@brief	微博id
 */
///#end
///#begin en
/**
 *	@brief	Status id.
 */
///#end
@property (nonatomic,readonly) NSString *Id;

///#begin zh-cn
/**
 *	@brief	内容
 */
///#end
///#begin en
/**
 *	@brief	Content string.
 */
///#end
@property (nonatomic,readonly) NSString *text;

///#begin zh-cn
/**
 *	@brief	来源
 */
///#end
///#begin en
/**
 *	@brief	Source
 */
///#end
@property (nonatomic,readonly) NSString *source;

///#begin zh-cn
/**
 *	@brief	是否收藏
 */
///#end
///#begin en
/**
 *	@brief	Whether favorited.
 */
///#end
@property (nonatomic,readonly) BOOL favorited;

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
@property (nonatomic,readonly) BOOL truncated;

///#begin zh-cn
/**
 *	@brief	转发微博id
 */
///#end
///#begin en
/**
 *	@brief	in reply to status id.
 */
///#end
@property (nonatomic,readonly) NSString *inReplyToStatusId;

///#begin zh-cn
/**
 *	@brief	转发微博作者id
 */
///#end
///#begin en
/**
 *	@brief	in reply to user id.
 */
///#end
@property (nonatomic,readonly) NSString *inReplyToUserId;

///#begin zh-cn
/**
 *	@brief	转发微博作者昵称
 */
///#end
///#begin en
/**
 *	@brief	in reply to screen name.
 */
///#end
@property (nonatomic,readonly) NSString *inReplyToScreenName;

///#begin zh-cn
/**
 *	@brief	转发微博内容
 */
///#end
///#begin en
/**
 *	@brief	in reply to status text.
 */
///#end
@property (nonatomic,readonly) NSString *inReplyToStatusText;

///#begin zh-cn
/**
 *	@brief	小图
 */
///#end
///#begin en
/**
 *	@brief	Small picture.
 */
///#end
@property (nonatomic,readonly) NSString *smallPic;

///#begin zh-cn
/**
 *	@brief	中图
 */
///#end
///#begin en
/**
 *	@brief	Middle picture.
 */
///#end
@property (nonatomic,readonly) NSString *middlePic;

///#begin zh-cn
/**
 *	@brief	原图
 */
///#end
///#begin en
/**
 *	@brief	Original picture.
 */
///#end
@property (nonatomic,readonly) NSString *originalPic;

///#begin zh-cn
/**
 *	@brief	用户信息
 */
///#end
///#begin en
/**
 *	@brief	User information.
 */
///#end
@property (nonatomic,readonly) SSSohuWeiboUserReader *userInfo;

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
 *	@brief	创建用户信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
///#end
///#begin en
/**
 *	@brief	Create a status reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
///#end
+ (SSSohuWeiboStatusReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
