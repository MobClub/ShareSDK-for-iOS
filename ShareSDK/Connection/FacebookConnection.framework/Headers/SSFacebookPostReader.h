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

@class SSFacebookUserReader;

///#begin zh-cn
/**
 *	@brief	文章信息读取器
 */
///#end
///#begin en
/**
 *	@brief	Post reader
 */
///#end
@interface SSFacebookPostReader : NSObject
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
 *	@brief	Source data
 */
///#end
@property (nonatomic,readonly) NSDictionary *sourceData;

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
 *	@brief	文章ID
 */
///#end
///#begin en
/**
 *	@brief	Post id
 */
///#end
@property (nonatomic,readonly) NSString *postId;

///#begin zh-cn
/**
 *	@brief	发送用户
 */
///#end
///#begin en
/**
 *	@brief	Send user reader.
 */
///#end
@property (nonatomic,readonly) SSFacebookUserReader *from;

///#begin zh-cn
/**
 *	@brief	消息
 */
///#end
///#begin en
/**
 *	@brief	Message
 */
///#end
@property (nonatomic,readonly) NSString *message;

///#begin zh-cn
/**
 *	@brief	更新时间
 */
///#end
///#begin en
/**
 *	@brief	Updated time
 */
///#end
@property (nonatomic,readonly) NSString *updatedTime;

///#begin zh-cn
/**
 *	@brief	创建时间
 */
///#end
///#begin en
/**
 *	@brief	Create time
 */
///#end
@property (nonatomic,readonly) NSString *createdTime;

///#begin zh-cn
/**
 *	@brief	图标
 */
///#end
///#begin en
/**
 *	@brief	Icon
 */
///#end
@property (nonatomic,readonly) NSString *icon;

///#begin zh-cn
/**
 *	@brief	链接
 */
///#end
///#begin en
/**
 *	@brief	Link
 */
///#end
@property (nonatomic,readonly) NSString *link;

///#begin zh-cn
/**
 *	@brief	照片名称
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
 *	@brief	缩略图路径
 */
///#end
///#begin en
/**
 *	@brief	picture path
 */
///#end
@property (nonatomic,readonly) NSString *picture;

///#begin zh-cn
/**
 *	@brief	源图路径
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
 *	@brief	高度
 */
///#end
///#begin en
/**
 *	@brief	Height
 */
///#end
@property (nonatomic,readonly) NSInteger height;

///#begin zh-cn
/**
 *	@brief	宽度
 */
///#end
///#begin en
/**
 *	@brief	Width
 */
///#end
@property (nonatomic,readonly) NSInteger width;

///#begin zh-cn
/**
 *	@brief	图片信息
 */
///#end
///#begin en
/**
 *	@brief	Images
 */
///#end
@property (nonatomic,readonly) NSArray *images;

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
 *	@brief	Initialize reader
 *
 *	@param 	sourceData 	Raw data
 *
 *	@return	Reader object
 */
///#end
- (id)initWithSourceData:(NSDictionary *)sourceData;

///#begin zh-cn
/**
 *	@brief	创建文章信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
///#end
///#begin en
/**
 *	@brief	Create Post reader
 *
 *	@param 	sourceData 	Raw data
 *
 *	@return	Reader object
 */
///#end
+ (SSFacebookPostReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
