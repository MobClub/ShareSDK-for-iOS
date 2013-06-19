//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/SSCDataObject.h>

///#begin   en
/**
 *	@brief	Item
 */
///#end
///#begin   zh-cn
/**
 *	@brief	项目对象
 */
///#end
@interface SSPocketItem : SSCDataObject

///#begin   en
/**
 *	@brief	A unique identifier for the added item
 */
///#end
///#begin   zh-cn
/**
 *	@brief	项目ID
 */
///#end
@property (nonatomic,readonly) NSString *itemId;

///#begin   en
/**
 *	@brief	The original url for the added item
 */
///#end
///#begin   zh-cn
/**
 *	@brief	原始链接地址
 */
///#end
@property (nonatomic,readonly) NSString *normalUrl;

///#begin   en
/**
 *	@brief	A unique identifier for the resolved item
 */
///#end
///#begin   zh-cn
/**
 *	@brief	解决项ID
 */
///#end
@property (nonatomic,readonly) NSString *resolvedId;

///#begin   en
/**
 *	@brief	The resolved url for the added item. 
 *          The easiest way to think about the resolved_url - if you add a bit.ly link, 
 *          the resolved_url will be the url of the page the bit.ly link points to
 */
///#end
///#begin   zh-cn
/**
 *	@brief	解决项URL
 */
///#end
@property (nonatomic,readonly) NSString *resolvedUrl;

///#begin   en
/**
 *	@brief	A unique identifier for the domain of the resolved_url
 */
///#end
///#begin   zh-cn
/**
 *	@brief	解决项URL域名ID
 */
///#end
@property (nonatomic,readonly) NSString *domainId;

///#begin   en
/**
 *	@brief	A unique identifier for the domain of the normal_url
 */
///#end
///#begin   zh-cn
/**
 *	@brief	原始URL域名ID
 */
///#end
@property (nonatomic,readonly) NSString *originDomainId;

///#begin   en
/**
 *	@brief	The response code received by the Pocket parser when it tried to access the item
 */
///#end
///#begin   zh-cn
/**
 *	@brief	Pocket解析器尝试访问项目的回复状态
 */
///#end
@property (nonatomic,readonly) NSInteger responseCode;

///#begin   en
/**
 *	@brief	The MIME type returned by the item
 */
///#end
///#begin   zh-cn
/**
 *	@brief	项目的MIME类型
 */
///#end
@property (nonatomic,readonly) NSString *mimeType;

///#begin   en
/**
 *	@brief	The content length of the item
 */
///#end
///#begin   zh-cn
/**
 *	@brief	项目的内容长度
 */
///#end
@property (nonatomic,readonly) NSInteger contentLength;

///#begin   en
/**
 *	@brief	The encoding of the item
 */
///#end
///#begin   zh-cn
/**
 *	@brief	项目的编码
 */
///#end
@property (nonatomic,readonly) NSString *encoding;

///#begin   en
/**
 *	@brief	The date the item was resolved
 */
///#end
///#begin   zh-cn
/**
 *	@brief	解决项目生成时间
 */
///#end
@property (nonatomic,readonly) NSString *dateResolved;

///#begin   en
/**
 *	@brief	The date the item was published (if the parser was able to find one)
 */
///#end
///#begin   zh-cn
/**
 *	@brief	发布时间
 */
///#end
@property (nonatomic,readonly) NSString *datePublished;

///#begin   en
/**
 *	@brief	The title of the resolved_url
 */
///#end
///#begin   zh-cn
/**
 *	@brief	解决项URL的标题
 */
///#end
@property (nonatomic,readonly) NSString *title;

///#begin   en
/**
 *	@brief	The excerpt of the resolved_url
 */
///#end
///#begin   zh-cn
/**
 *	@brief	解决项URL的摘要
 */
///#end
@property (nonatomic,readonly) NSString *excerpt;

///#begin   en
/**
 *	@brief	For an article, the number of words
 */
///#end
///#begin   zh-cn
/**
 *	@brief	文章字数
 */
///#end
@property (nonatomic,readonly) NSInteger wordCount;

///#begin   en
/**
 *	@brief	0: no image; 1: has an image in the body of the article; 2: is an image
 */
///#end
///#begin   zh-cn
/**
 *	@brief	是否包含图片:0 无图片； 1 图文； 2 纯图片
 */
///#end
@property (nonatomic,readonly) NSInteger hasImage;

///#begin   en
/**
 *	@brief	0: no video; 1: has a video in the body of the article; 2: is a video
 */
///#end
///#begin   zh-cn
/**
 *	@brief	是否包含视频：0 无视频，1 文章中包含视频；2 纯视频
 */
///#end
@property (nonatomic,readonly) NSInteger hasVideo;

///#begin   en
/**
 *	@brief	0 or 1; If the parser thinks this item is an index page it will be set to 1
 */
///#end
///#begin   zh-cn
/**
 *	@brief	是否为首页，0 不是； 1 是
 */
///#end
@property (nonatomic,readonly) NSInteger isIndex;

///#begin   en
/**
 *	@brief	0 or 1; If the parser thinks this item is an article it will be set to 1
 */
///#end
///#begin   zh-cn
/**
 *	@brief	是否为文章，0 不是； 1 是
 */
///#end
@property (nonatomic,readonly) NSInteger isArticle;

///#begin   en
/**
 *	@brief	Array of author data (if author(s) were found)
 */
///#end
///#begin   zh-cn
/**
 *	@brief	文章的作者列表
 */
///#end
@property (nonatomic,readonly) NSArray *authors;

///#begin   en
/**
 *	@brief	Array of image data (if image(s) were found)
 */
///#end
///#begin   zh-cn
/**
 *	@brief	图片列表
 */
///#end
@property (nonatomic,readonly) NSArray *images;

///#begin   en
/**
 *	@brief	Array of video data (if video(s) were found)
 */
///#end
///#begin   zh-cn
/**
 *	@brief	视频列表
 */
///#end
@property (nonatomic,readonly) NSArray *videos;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) NSString *extendedItemId;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) NSString *givenUrl;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) NSInteger innerdomainRedirect;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) NSInteger loginRequired;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) NSString *resolvedNormalUrl;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) NSInteger usedFallback;

/**
 *	@brief	创建item
 *
 *	@param 	response 	回复数据
 *
 *	@return	item对象
 */
+ (SSPocketItem *)itemWithResponse:(NSDictionary *)response;


@end
