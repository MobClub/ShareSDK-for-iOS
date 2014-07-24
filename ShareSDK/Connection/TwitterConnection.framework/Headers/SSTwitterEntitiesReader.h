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

///#begin zh-cn
/**
 *	@brief	实体对象信息读取器
 */
///#end
///#begin en
/**
 *	@brief	Entities Reader.
 */
///#end
@interface SSTwitterEntitiesReader : NSObject
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
 *	@brief	表示＃标签被解析出来的Tweets文本。
 */
///#end
///#begin en
/**
 *	@brief	# Tag is parsed representation of Tweets text.
 */
///#end
@property (nonatomic,readonly) NSArray *hashtags;

///#begin zh-cn
/**
 *	@brief	表示Tweets中上传的媒体元素
 */
///#end
///#begin en
/**
 *	@brief	Media element in Tweets.
 */
///#end
@property (nonatomic,readonly) NSArray *media;

///#begin zh-cn
/**
 *	@brief	表示Tweets中的链接元素
 */
///#end
///#begin en
/**
 *	@brief	URLs element in Tweets.
 */
///#end
@property (nonatomic,readonly) NSArray *urls;

///#begin zh-cn
/**
 *	@brief	表示Tweets中提及的其他用户元素
 */
///#end
///#begin en
/**
 *	@brief	Other users mentioned element in Tweets.
 */
///#end
@property (nonatomic,readonly) NSArray *userMentions;

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
 *	@brief	创建实体对象信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
///#end
///#begin en
/**
 *	@brief	Create an entities reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
///#end
+ (SSTwitterEntitiesReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
