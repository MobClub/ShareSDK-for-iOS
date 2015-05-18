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
 *	@brief	URL读取器
 */
///#end
///#begin en
/**
 *	@brief	URL Reader.
 */
///#end
@interface SSGooglePlusUrlReader : NSObject
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
 *	@brief	The URL value.
 */
///#end
///#begin en
/**
 *	@brief	The URL value.
 */
///#end
@property (nonatomic,readonly) NSString *value;

///#begin zh-cn
/**
 *	@brief	The type of URL. Possible values are:
 *          "home" - URL for home.
 *          "work" - URL for work.
 *          "blog" - URL for blog.
 *          "profile" - URL for profile.
 *          "other" - Other.
 */
///#end
///#begin en
/**
 *	@brief	The type of URL. Possible values are:
 *          "home" - URL for home.
 *          "work" - URL for work.
 *          "blog" - URL for blog.
 *          "profile" - URL for profile.
 *          "other" - Other.
 */
///#end
@property (nonatomic,readonly) NSString *type;

///#begin zh-cn
/**
 *	@brief	If "true", this URL is the person's primary URL.
 */
///#end
///#begin en
/**
 *	@brief	If "true", this URL is the person's primary URL.
 */
///#end
@property (nonatomic,readonly) BOOL primary;

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
 *	@brief	创建URL信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
///#end
///#begin en
/**
 *	@brief	Create a URL reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
///#end
+ (SSGooglePlusUrlReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
