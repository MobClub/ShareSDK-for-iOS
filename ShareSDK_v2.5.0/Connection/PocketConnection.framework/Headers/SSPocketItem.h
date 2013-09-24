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

/**
 *	@brief	项目对象
 */
@interface SSPocketItem : SSCDataObject


/**
 *	@brief	项目ID
 */
@property (nonatomic,readonly) NSString *itemId;

/**
 *	@brief	原始链接地址
 */
@property (nonatomic,readonly) NSString *normalUrl;


/**
 *	@brief	解决项ID
 */
@property (nonatomic,readonly) NSString *resolvedId;


/**
 *	@brief	解决项URL
 */
@property (nonatomic,readonly) NSString *resolvedUrl;


/**
 *	@brief	解决项URL域名ID
 */
@property (nonatomic,readonly) NSString *domainId;

/**
 *	@brief	原始URL域名ID
 */
@property (nonatomic,readonly) NSString *originDomainId;

/**
 *	@brief	Pocket解析器尝试访问项目的回复状态
 */
@property (nonatomic,readonly) NSInteger responseCode;

/**
 *	@brief	项目的MIME类型
 */
@property (nonatomic,readonly) NSString *mimeType;

/**
 *	@brief	项目的内容长度
 */
@property (nonatomic,readonly) NSInteger contentLength;

/**
 *	@brief	项目的编码
 */
@property (nonatomic,readonly) NSString *encoding;

/**
 *	@brief	解决项目生成时间
 */
@property (nonatomic,readonly) NSString *dateResolved;

/**
 *	@brief	发布时间
 */
@property (nonatomic,readonly) NSString *datePublished;

/**
 *	@brief	解决项URL的标题
 */
@property (nonatomic,readonly) NSString *title;

/**
 *	@brief	解决项URL的摘要
 */
@property (nonatomic,readonly) NSString *excerpt;

/**
 *	@brief	文章字数
 */
@property (nonatomic,readonly) NSInteger wordCount;

/**
 *	@brief	是否包含图片:0 无图片； 1 图文； 2 纯图片
 */
@property (nonatomic,readonly) NSInteger hasImage;

/**
 *	@brief	是否包含视频：0 无视频，1 文章中包含视频；2 纯视频
 */
@property (nonatomic,readonly) NSInteger hasVideo;

/**
 *	@brief	是否为首页，0 不是； 1 是
 */
@property (nonatomic,readonly) NSInteger isIndex;

/**
 *	@brief	是否为文章，0 不是； 1 是
 */
@property (nonatomic,readonly) NSInteger isArticle;

/**
 *	@brief	文章的作者列表
 */
@property (nonatomic,readonly) NSArray *authors;

/**
 *	@brief	图片列表
 */
@property (nonatomic,readonly) NSArray *images;

/**
 *	@brief	视频列表
 */
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
