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
 *	@brief	User information reader.
 */
///#end
@interface SSDouBanUserReader : NSObject
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
 *	@brief	用户ID
 */
///#end
///#begin en
/**
 *	@brief	User id.
 */
///#end
@property (nonatomic,readonly) NSString *Id;

///#begin zh-cn
/**
 *	@brief	用户ID
 */
///#end
///#begin en
/**
 *	@brief	User id.
 */
///#end
@property (nonatomic,readonly) NSString *uid;

///#begin zh-cn
/**
 *	@brief	用户昵称
 */
///#end
///#begin en
/**
 *	@brief	Nickname
 */
///#end
@property (nonatomic,readonly) NSString *name;

///#begin zh-cn
/**
 *	@brief	头像小图
 */
///#end
///#begin en
/**
 *	@brief	Avatar
 */
///#end
@property (nonatomic,readonly) NSString *avatar;

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
@property (nonatomic,readonly) NSString *alt;

///#begin zh-cn
/**
 *	@brief	注册时间
 */
///#end
///#begin en
/**
 *	@brief	Registration Time
 */
///#end
@property (nonatomic,readonly) NSString *created;

///#begin zh-cn
/**
 *	@brief	城市id
 */
///#end
///#begin en
/**
 *	@brief	City id.
 */
///#end
@property (nonatomic,readonly) NSString *locId;

///#begin zh-cn
/**
 *	@brief	所在地全称
 */
///#end
///#begin en
/**
 *	@brief	The full name of the location
 */
///#end
@property (nonatomic,readonly) NSString *locName;

///#begin zh-cn
/**
 *	@brief	描述
 */
///#end
///#begin en
/**
 *	@brief	Description
 */
///#end
@property (nonatomic,readonly) NSString *desc;

///#begin zh-cn
/**
 *	@brief	大头像
 */
///#end
///#begin en
/**
 *	@brief	Large avatar.
 */
///#end
@property (nonatomic,readonly) NSString *largeAvatar;

///#begin zh-cn
/**
 *	@brief	小头像
 */
///#end
///#begin en
/**
 *	@brief	Small avatar.
 */
///#end
@property (nonatomic,readonly) NSString *smallAvatar;

///#begin zh-cn
/**
 *	@brief	用户名号
 */
///#end
///#begin en
/**
 *	@brief	Screen name
 */
///#end
@property (nonatomic,readonly) NSString *screenName;

///#begin zh-cn
/**
 *	@brief	类型
 */
///#end
///#begin en
/**
 *	@brief	Type
 */
///#end
@property (nonatomic,readonly) NSString *type;

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
@property (nonatomic,readonly) NSString *signature;

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
 *	@brief	Create user reader.
 *
 *	@param 	sourceData 	Raw data
 *
 *	@return	Reader object.
 */
///#end
+ (SSDouBanUserReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
