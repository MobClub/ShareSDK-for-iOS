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
@interface SSYouDaoNoteUserReader : NSObject
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
@property (nonatomic,readonly) NSString *uid;

///#begin zh-cn
/**
 *	@brief	用户注册时间，单位毫秒
 */
///#end
///#begin en
/**
 *	@brief	User registration time, in milliseconds
 */
///#end
@property (nonatomic,readonly) CGFloat registerTime;

///#begin zh-cn
/**
 *	@brief	用户已经使用了的空间大小，单位字节
 */
///#end
///#begin en
/**
 *	@brief	Used size，in byte.
 */
///#end
@property (nonatomic,readonly) long usedSize;

///#begin zh-cn
/**
 *	@brief	用户总的空间大小，单位字节
 */
///#end
///#begin en
/**
 *	@brief	Total size, in byte.
 */
///#end
@property (nonatomic,readonly) long totalSize;

///#begin zh-cn
/**
 *	@brief	用户最后登录时间，单位毫秒
 */
///#end
///#begin en
/**
 *	@brief	Last login time，in milliseconds
 */
///#end
@property (nonatomic,readonly) CGFloat lastLoginTime;

///#begin zh-cn
/**
 *	@brief	用户最后修改时间，单位毫秒
 */
///#end
///#begin en
/**
 *	@brief	Last modified time，in milliseconds
 */
///#end
@property (nonatomic,readonly) CGFloat lastModifyTime;

///#begin zh-cn
/**
 *	@brief	该应用的默认笔记本
 */
///#end
///#begin en
/**
 *	@brief	Default notebook.
 */
///#end
@property (nonatomic,readonly) NSString *defaultNotebook;

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
@property (nonatomic,readonly) NSString *user;

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
+ (SSYouDaoNoteUserReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
