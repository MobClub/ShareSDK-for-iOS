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
 *	@brief	物信息读取器
 */
///#end
///#begin en
/**
 *	@brief	Attachment reader.
 */
///#end
@interface SSDouBanAttachmentReader : NSObject
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
 *	@brief	子标题
 */
///#end
///#begin en
/**
 *	@brief	Caption string.
 */
///#end
@property (nonatomic,readonly) NSString *caption;

///#begin zh-cn
/**
 *	@brief	描述，可以为空，最大长度200字节（100汉字或200字母）
 */
///#end
///#begin en
/**
 *	@brief	Description，Can be nil, the maximum length of 200 bytes (100 characters or 200 characters)
 */
///#end
@property (nonatomic,readonly) NSString *description;

///#begin zh-cn
/**
 *	@brief	链接，url最大长度1024，需要分析并展示网站域名
 */
///#end
///#begin en
/**
 *	@brief	Links, url maximum length of 1024, you need to analyze and demonstrate Domain Name
 */
///#end
@property (nonatomic,readonly) NSString *href;

///#begin zh-cn
/**
 *	@brief	富媒体，允许 image, flash, music 单条广播所有图片无最小值限制，
 *  文件最大不超过3M。缩略图：最大边150px。点击展开后：宽度最大460px，高度不限。原图大小无宽高限制
 */
///#end
///#begin en
/**
 *	@brief	Rich media, allowing the image, flash, music single broadcast all Picture no minimum limit,
 *  The maximum file size 3M. Thumbnail: Maximum side 150px. Click to expand post: maximum width 460px, height limitation. Original size without width and height restrictions
 */
///#end
@property (nonatomic,readonly) NSArray *media;

///#begin zh-cn
/**
 *	@brief	如果有分类，这里存放对应类别的详细数据，具体的字段由该类别自行定义
 */
///#end
///#begin en
/**
 *	@brief	If has classification, corresponding to the categories detail data stored here, the specific field of the class defined by its own.
 */
///#end
@property (nonatomic,readonly) id properties;

///#begin zh-cn
/**
 *	@brief	标题，如果传空，会显示‘无标题’， 最大长度100字节（50汉字或100字母）
 */
///#end
///#begin en
/**
 *	@brief	Title, if fill nil, will show 'no title', the maximum length of 100 bytes (50 characters or 100 characters)
 */
///#end
@property (nonatomic,readonly) NSString *title;

///#begin zh-cn
/**
 *	@brief	分类，预留字段
 */
///#end
///#begin en
/**
 *	@brief	Classification, reserved field
 */
///#end
@property (nonatomic,readonly) NSString *type;

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
 *	@param 	sourceData 	Raw data.
 *
 *	@return	User reader object.
 */
///#end
+ (SSDouBanAttachmentReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
