//
//  U6ImagePool.h
//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import "CMImageLoader.h"

/**
 *	@brief 图片缓存管理器，主要负责图片缓存管理
 */
@interface CMImageCacheManager : NSObject
{
	//加载图片队列，尚未从网络获取本地加载完毕的图片将会进入此队列。
	NSMutableArray *_loaderQueue;
	//缓存路径
	NSString *_cachePath;
}

/**
 *	@brief	获取图片
 *
 *	@param 	url 	图片路径，可以为本地或者网路路径
 *
 *	@return	图片加载器
 */
- (CMImageLoader *)getImage:(NSString *)url;

/**
 *	@brief	获取图片
 *
 *	@param 	url 	图片路径，可以为本地或者网络路径
 *	@param 	size 	裁剪区域
 *	@param 	clipType 	图片裁剪类型
 *
 *	@return	图片加载器
 */
- (CMImageLoader *)getImage:(NSString *)url
                     size:(CGSize)size
                 clipType:(CMImageClipType)clipType;

/**
 *	@brief	获取图片
 *
 *	@param 	url 	图片路径，可以为本地或者网络路径
 *	@param 	cornerRadius 	圆角
 *
 *	@return	图片加载器
 */
- (CMImageLoader *)getImage:(NSString *)url
             cornerRadius:(CGFloat)cornerRadius;

/**
 *	@brief	获取图片
 *
 *	@param 	url 	图片路径，可以未本地或者网络路径
 *	@param 	cornerRadius 	圆角值，此值对应实际显示尺寸的圆角值
 *	@param 	size 	实际显示尺寸
 *
 *	@return	图片加载器
 */
- (CMImageLoader *)getImage:(NSString *)url
             cornerRadius:(CGFloat)cornerRadius
                     size:(CGSize)size;


/**
 *	@brief	获取图片
 *
 *	@param 	url 	图片路径，可以为本地或者网络路径
 *	@param 	cornerRadius 	圆角
 *	@param 	size 	裁减区域
 *	@param 	clipType 	图片裁剪类型
 *
 *	@return	图片加载器
 */
- (CMImageLoader *)getImage:(NSString *)url
             cornerRadius:(CGFloat)cornerRadius
                     size:(CGSize)size
                 clipType:(CMImageClipType)clipType;


/**
 *	@brief	判断图片缓存是否存在,使用getImage:得到的图片用此方法
 *
 *	@param 	url 	图片路径
 *
 *	@return	YES表示存在，NO表示不存在
 */
- (BOOL)existsImageCache:(NSString *)url;

/**
 *	@brief	判断图片缓存是否存在,使用getImage:size:clipType:得到的图片用此方法
 *
 *	@param 	url 	图片路径
 *	@param 	size 	裁剪区域
 *	@param 	clipType 	图片裁剪类型
 *
 *	@return	YES表示存在，NO表示不存在
 */
- (BOOL)existsImageCache:(NSString *)url
                    size:(CGSize)size
                clipType:(CMImageClipType)clipType;

/**
 *	@brief	判断图片缓存是否存在,使用getImage:cornerRadius:得到的图片用此方法
 *
 *	@param 	url 	图片路径
 *	@param 	cornerRadius 	圆角
 *
 *	@return	YES表示存在，NO表示不存在
 */
- (BOOL)existsImageCache:(NSString *)url
            cornerRadius:(CGFloat)cornerRadius;

/**
 *	@brief	判断图片缓存是否存在,使用getImage:cornerRadius:size:clipType:得到的图片用此方法
 *
 *	@param 	url 	图片路径
 *	@param 	size 	裁剪尺寸
 *	@param 	clipType 	裁剪类型
 *	@param 	cornerRadius 	圆角
 *
 *	@return	YES：存在，NO：不存在
 */
- (BOOL)existsImageCache:(NSString *)url
                    size:(CGSize)size
                clipType:(CMImageClipType)clipType
            cornerRadius:(CGFloat)cornerRadius;



@end
