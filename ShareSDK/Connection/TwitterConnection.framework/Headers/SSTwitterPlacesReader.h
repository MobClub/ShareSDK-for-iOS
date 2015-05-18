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
#import "SSTwitterBoundingBoxReader.h"

///#begin zh-cn
/**
 *	@brief	地方信息读取器
 */
///#end
///#begin en
/**
 *	@brief	Places Reader.
 */
///#end
@interface SSTwitterPlacesReader : NSObject
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
 *	@brief	一个哈希表结构地方信息
 */
///#end
///#begin en
/**
 *	@brief	attributes.
 */
///#end
@property (nonatomic,readonly) id attributes;

///#begin zh-cn
/**
 *	@brief	地方的边界坐标
 */
///#end
///#begin en
/**
 *	@brief	Bounding box.
 */
///#end
@property (nonatomic,readonly) SSTwitterBoundingBoxReader *boundingBox;

///#begin zh-cn
/**
 *	@brief	所在国家
 */
///#end
///#begin en
/**
 *	@brief	Country.
 */
///#end
@property (nonatomic,readonly) NSString *country;

///#begin zh-cn
/**
 *	@brief	所在国家编码
 */
///#end
///#begin en
/**
 *	@brief	Country code.
 */
///#end
@property (nonatomic,readonly) NSString *countryCode;

///#begin zh-cn
/**
 *	@brief	完整的地方名称
 */
///#end
///#begin en
/**
 *	@brief	Full name.
 */
///#end
@property (nonatomic,readonly) NSString *fullName;

///#begin zh-cn
/**
 *	@brief	ID
 */
///#end
///#begin en
/**
 *	@brief	ID
 */
///#end
@property (nonatomic,readonly) NSString *Id;

///#begin zh-cn
/**
 *	@brief	地名
 */
///#end
///#begin en
/**
 *	@brief	Name
 */
///#end
@property (nonatomic,readonly) NSString *name;

///#begin zh-cn
/**
 *	@brief	类型
 */
///#end
///#begin en
/**
 *	@brief	Place type.
 */
///#end
@property (nonatomic,readonly) NSString *placeType;

///#begin zh-cn
/**
 *	@brief	URL
 */
///#end
///#begin en
/**
 *	@brief	URL
 */
///#end
@property (nonatomic,readonly) NSString *url;

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
 *	@brief	创建地点信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
///#end
///#begin en
/**
 *	@brief	Create a places reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
///#end
+ (SSTwitterPlacesReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
