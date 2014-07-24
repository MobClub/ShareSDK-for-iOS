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
 *	@brief	用户信息读取器
 */
///#end
///#begin en
/**
 *	@brief	User Reader.
 */
///#end
@interface SSSohuUserReader : NSObject
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
 *	@brief	用户展示页的URL
 */
///#end
///#begin en
/**
 *	@brief	User homepage URL.
 */
///#end
@property (nonatomic,readonly) NSString *homeUrl;

///#begin zh-cn
/**
 *	@brief	用户头像小图的URL
 */
///#end
///#begin en
/**
 *	@brief	Small image URL of avatar.
 */
///#end
@property (nonatomic,readonly) NSString *icon;

///#begin zh-cn
/**
 *	@brief	昵称
 */
///#end
///#begin en
/**
 *	@brief	Nickname.
 */
///#end
@property (nonatomic,readonly) NSString *nick;

///#begin zh-cn
/**
 *	@brief	搜狐用户ID
 */
///#end
///#begin en
/**
 *	@brief	Open id.
 */
///#end
@property (nonatomic,readonly) NSString *openId;

///#begin zh-cn
/**
 *	@brief	用户名字
 */
///#end
///#begin en
/**
 *	@brief	Name.
 */
///#end
@property (nonatomic,readonly) NSString *name;

///#begin zh-cn
/**
 *	@brief	用户头像大图的URL
 */
///#end
///#begin en
/**
 *	@brief	Large image URL of avatar
 */
///#end
@property (nonatomic,readonly) NSString *image;

///#begin zh-cn
/**
 *	@brief	出生年份
 */
///#end
///#begin en
/**
 *	@brief	Birthday year.
 */
///#end
@property (nonatomic) NSInteger birthdayYear;

///#begin zh-cn
/**
 *	@brief	出生月份
 */
///#end
///#begin en
/**
 *	@brief	Birthday month.
 */
///#end
@property (nonatomic) NSInteger birthdayMonth;

///#begin zh-cn
/**
 *	@brief	出生日期
 */
///#end
///#begin en
/**
 *	@brief	Birthday day.
 */
///#end
@property (nonatomic) NSInteger birthdayDay;

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
 *	@brief	Create a user reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
///#end
+ (SSSohuUserReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
