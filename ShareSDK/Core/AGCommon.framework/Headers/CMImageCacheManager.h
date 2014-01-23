//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import "CMImageLoader.h"

/**
 *	@brief Image Cache Manager，Primarily responsible for the image cache management
 */
@interface CMImageCacheManager : NSObject
{
	//加载图片队列，尚未从网络获取本地加载完毕的图片将会进入此队列。
	NSMutableArray *_loaderQueue;
	//缓存路径
	NSString *_cachePath;
}

/**
 *	@brief	Get image object.
 *
 *	@param 	url 	Image URL string，Can be local or network path
 *
 *	@return	Image Loader object.
 */
- (CMImageLoader *)getImage:(NSString *)url;

/**
 *	@brief	Get image object.
 *
 *	@param 	url 	Image URL string，Can be local or network path
 *	@param 	size 	Clip size.
 *	@param 	clipType 	Clip type.
 *
 *	@return	Image Loader object.
 */
- (CMImageLoader *)getImage:(NSString *)url
                     size:(CGSize)size
                 clipType:(CMImageClipType)clipType;

/**
 *	@brief	Get image object.
 *
 *	@param 	url 	Image URL string，Can be local or network path
 *	@param 	cornerRadius 	Corner radius.
 *
 *	@return	Image Loader object.
 */
- (CMImageLoader *)getImage:(NSString *)url
             cornerRadius:(CGFloat)cornerRadius;

/**
 *	@brief	Get image object.
 *
 *	@param 	url 	URL string.Can be local or network path
 *	@param 	cornerRadius 	Corner radius
 *	@param 	size 	The actual display size
 *
 *	@return	Image Loader object.
 */
- (CMImageLoader *)getImage:(NSString *)url
             cornerRadius:(CGFloat)cornerRadius
                     size:(CGSize)size;

/**
 *	@brief	Get image object.
 *
 *	@param 	url 	Image URL string.
 *	@param 	cornerRadius 	Corner radius.
 *	@param 	size 	Clip size.
 *	@param 	clipType 	Clip type.
 *
 *	@return	Image Loader object.
 */
- (CMImageLoader *)getImage:(NSString *)url
             cornerRadius:(CGFloat)cornerRadius
                     size:(CGSize)size
                 clipType:(CMImageClipType)clipType;

/**
 *	@brief	Image cache to determine whether there is,call getImage: this method to get image.
 *
 *	@param 	url 	URL string.
 *
 *	@return	YES exists，NO not exists.
 */
- (BOOL)existsImageCache:(NSString *)url;

/**
 *	@brief	Image cache to determine whether there is,call getImage:size:clipType: this method to get image.
 *
 *	@param 	url 	Image URL string.
 *	@param 	size 	Clip size.
 *	@param 	clipType 	Clip type.
 *
 *	@return	YES exists，NO not exists.
 */
- (BOOL)existsImageCache:(NSString *)url
                    size:(CGSize)size
                clipType:(CMImageClipType)clipType;

/**
 *	@brief	Image cache to determine whether there is,call getImage:cornerRadius: this method to get image.
 *
 *	@param 	url 	URL string.
 *	@param 	cornerRadius 	corner radius.
 *
 *	@return	YES exists，NO not exists.
 */
- (BOOL)existsImageCache:(NSString *)url
            cornerRadius:(CGFloat)cornerRadius;

/**
 *	@brief	Image cache to determine whether there is,call getImage:cornerRadius:size:clipType: this method to get image.
 *
 *	@param 	url 	URL string.
 *	@param 	size 	Clip size.
 *	@param 	clipType 	Clip type.
 *	@param 	cornerRadius 	Corner radius.
 *
 *	@return	YES：exists，NO：not exists.
 */
- (BOOL)existsImageCache:(NSString *)url
                    size:(CGSize)size
                clipType:(CMImageClipType)clipType
            cornerRadius:(CGFloat)cornerRadius;



@end
