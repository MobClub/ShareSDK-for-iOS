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
 *	@brief	笔记信息读取器
 */
///#end
///#begin en
/**
 *	@brief	Note Reader.
 */
///#end
@interface SSYouDaoNoteNoteReader : NSObject
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
 *	@brief	笔记路径
 */
///#end
///#begin en
/**
 *	@brief	Note path.
 */
///#end
@property (nonatomic,readonly) NSString *path;

///#begin zh-cn
/**
 *	@brief	笔记标题
 */
///#end
///#begin en
/**
 *	@brief	Title.
 */
///#end
@property (nonatomic,readonly) NSString *title;

///#begin zh-cn
/**
 *	@brief	笔记作者
 */
///#end
///#begin en
/**
 *	@brief	Author.
 */
///#end
@property (nonatomic,readonly) NSString *author;

///#begin zh-cn
/**
 *	@brief	笔记来源URL
 */
///#end
///#begin en
/**
 *	@brief	source URL.
 */
///#end
@property (nonatomic,readonly) NSString *source;

///#begin zh-cn
/**
 *	@brief	笔记大小，包括笔记正文及附件
 */
///#end
///#begin en
/**
 *	@brief	Note size，Including text and attachments
 */
///#end
@property (nonatomic,readonly) NSInteger size;

///#begin zh-cn
/**
 *	@brief	笔记的创建时间，单位秒
 */
///#end
///#begin en
/**
 *	@brief	Created time，unit: seconds.
 */
///#end
@property (nonatomic,readonly) NSTimeInterval createTime;

///#begin zh-cn
/**
 *	@brief	笔记的最后修改时间，单位秒
 */
///#end
///#begin en
/**
 *	@brief	Last modified time. unit: seconds.
 */
///#end
@property (nonatomic,readonly) NSTimeInterval modifyTime;

///#begin zh-cn
/**
 *	@brief	笔记正文
 */
///#end
///#begin en
/**
 *	@brief	Content string.
 */
///#end
@property (nonatomic,readonly) NSString *content;

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
 *	@brief	创建读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
///#end
///#begin en
/**
 *	@brief	Create a note reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
///#end
+ (SSYouDaoNoteNoteReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
