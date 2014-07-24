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
 *	@brief	教育信息
 */
///#end
///#begin en
/**
 *	@brief	Education Reader.
 */
///#end
@interface SSTencentWeiboEduReader : NSObject
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
 *	@brief	院系id
 */
///#end
///#begin en
/**
 *	@brief	Department id.
 */
///#end
@property (nonatomic,readonly) NSInteger departmentid;

///#begin zh-cn
/**
 *	@brief	教育信息记录id
 */
///#end
///#begin en
/**
 *	@brief	Education id.
 */
///#end
@property (nonatomic,readonly) NSInteger Id;

///#begin zh-cn
/**
 *	@brief	学历级别
 */
///#end
///#begin en
/**
 *	@brief	level.
 */
///#end
@property (nonatomic,readonly) NSInteger level;

///#begin zh-cn
/**
 *	@brief	学校id
 */
///#end
///#begin en
/**
 *	@brief	School id.
 */
///#end
@property (nonatomic,readonly) NSInteger schoolid;

///#begin zh-cn
/**
 *	@brief	入学年
 */
///#end
///#begin en
/**
 *	@brief	Year.
 */
///#end
@property (nonatomic,readonly) NSInteger year;

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
 *	@brief	创建教育信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
///#end
///#begin en
/**
 *	@brief	Create an education Reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
///#end
+ (SSTencentWeiboEduReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
