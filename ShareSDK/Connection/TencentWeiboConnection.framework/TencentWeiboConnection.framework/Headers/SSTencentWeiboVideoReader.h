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
 *	@brief	视频信息
 */
///#end
///#begin en
/**
 *	@brief	Video Reader.
 */
///#end
@interface SSTencentWeiboVideoReader : NSObject
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
 *	@brief	缩略图
 */
///#end
///#begin en
/**
 *	@brief	Thumbnail.
 */
///#end
@property (nonatomic,readonly) NSString *picurl;

///#begin zh-cn
/**
 *	@brief	播放器地址
 */
///#end
///#begin en
/**
 *	@brief	Player address.
 */
///#end
@property (nonatomic,readonly) NSString *player;

///#begin zh-cn
/**
 *	@brief	视频原地址
 */
///#end
///#begin en
/**
 *	@brief	Real URL string.
 */
///#end
@property (nonatomic,readonly) NSString *realurl;

///#begin zh-cn
/**
 *	@brief	视频的短url
 */
///#end
///#begin en
/**
 *	@brief	Short URL string.
 */
///#end
@property (nonatomic,readonly) NSString *shorturl;

///#begin zh-cn
/**
 *	@brief	视频标题
 */
///#end
///#begin en
/**
 *	@brief	Title string.
 */
///#end
@property (nonatomic,readonly) NSString *title;

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
 *	@param 	sourceData 	Faw data
 *
 *	@return	Reader object.
 */
///#end
- (id)initWithSourceData:(NSDictionary *)sourceData;

///#begin zh-cn
/**
 *	@brief	创建视频信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
///#end
///#begin en
/**
 *	@brief	Create a video reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
///#end
+ (SSTencentWeiboVideoReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
