//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "CMEventDispatcher.h"

/**
 *	@brief	Image load complete notification.
 */
#define NOTIF_IMAGE_LOAD_COMPLETE @"imageLoadComplete"

/**
 *	@brief	Image load error notification.
 */
#define NOTIF_IMAGE_LOAD_ERROR @"imageLoadError"

/**
 *	@brief	Image load progress notification.
 */
#define NOTIF_IMAGE_LOAD_PROGRESS @"imageLoadProgress"

/**
 *	@brief	Image data key.
 */
#define NOTIF_KEY_IMAGE_DATA @"imageData"

/**
 *	@brief	Error key.
 */
#define NOTIF_KEY_IMAGE_ERROR @"error"

/**
 *	@brief	Image response key.
 */
#define NOTIF_KEY_IMAGE_RESPONSE @"response"

/**
 *	@brief	Total bytes key.
 */
#define NOTIF_KEY_TOTAL_BYTES @"totalBytes"

/**
 *	@brief	Loaded bytes key.
 */
#define NOTIF_KEY_LOADED_BYTES @"loadedBytes"

/**
 *	@brief	Image loader state.
 */
typedef enum
{
	ImageLoaderStateUnset,  /**< 未设置状态 */
    ImageLoaderStateLoading, /**< 加载图片中 */
    ImageLoaderStateReady   /**< 图片加载完毕，准备就绪 */
}CMImageLoaderState;

/**
 *	@brief	Image source type.
 */
typedef enum
{
	ImageLoaderSourceTypeCache, /**< 缓存 */
    ImageLoaderSourceTypeUrl, /**< 网络 */
    ImageLoaderSourceTypeFile		/**< 文件 */
}CMImageLoaderSourceType;

/**
 *	@brief	Image clip type.
 */
typedef enum
{
	ImageClipTypeNone = 0, /**< 无裁剪 */
	ImageClipTypeTop, /**< 从顶部开始裁剪 */
	ImageClipTypeCenter, /**< 从中间开始裁剪 */
	ImageClipTypeBottom /**< 从底部开始裁剪 */
}CMImageClipType;

/**
 *	@brief	Image Loader，With pictures loaded state, the ImageCacheManager manage distribution.
 */
@interface CMImageLoader : CMEventDispatcher
{
@private
	UIImage *_content;
	CMImageLoaderState _state;
	CMImageLoaderSourceType _sourceType;
	NSString *_tag;
	
	NSURLConnection *_conn;
	//接收数据对象
	NSMutableData *_receiveData;
	//请求回复
	NSURLResponse *_response;
	
    NSInteger _iDealType;           //处理类型：0 不处理，1 裁剪，2 圆角 3 裁剪圆角 4 显示区域圆角
	CGSize _clipSize;
	CMImageClipType _imageClipType;
    CGFloat _fCornerRadius;          //圆角半径，用于指定图片的圆角值，仅在_iDealType为2时有效
    
    NSInteger _imageContentLength;  //图片大小(单位：字节)
    
}

/**
 *	@brief	Image object.
 */
@property (nonatomic,retain,readonly) UIImage *content;

/**
 *	@brief	Loader state.
 */
@property (nonatomic,readonly) CMImageLoaderState state;

/**
 *	@brief	Source type.
 */
@property (nonatomic,readonly) CMImageLoaderSourceType sourceType;

/**
 *	@brief	Tag
 */
@property (nonatomic,retain) NSString *tag;

/**
 *	@brief	Initialize Image Loader.
 *
 *	@param 	clipSize 	Clip size.
 *	@param 	clipType 	Clip type.
 *
 *	@return	Image Loader.
 */
- (id)initWithClipSize:(CGSize)clipSize clipType:(CMImageClipType)clipType;

/**
 *	@brief	Initialize Image Loader.
 *
 *	@param 	cornerRadius 	Corner radius.
 *
 *	@return	Image Loader object.
 */
- (id)initWithCornerRadius:(CGFloat)cornerRadius;

///#end
- (id)initWithCornerRadius:(CGFloat)cornerRadius
                      size:(CGSize)size;

///#begin zh-cn
/**
 *	@brief	初始化图片加载器
 *
 *	@param 	clipSize 	裁剪尺寸
 *	@param 	clipType 	裁剪类型
 *	@param 	cornerRadius 	圆角
 *
 *	@return	加载器
 */
/**
 *	@brief	Initialize Image Loader.
 *
 *	@param 	clipSize 	Clip size.
 *	@param 	clipType 	Clip type.
 *	@param 	cornerRadius 	Corner radius.
 *
 *	@return	Image Loader object.
 */
- (id)initWithClipSize:(CGSize)clipSize
              clipType:(CMImageClipType)clipType
          cornerRadius:(CGFloat)cornerRadius;

/**
 *	@brief	Load image by URL
 *
 *	@param 	url 	Image URL string.
 */
- (void)loadImageByUrl:(NSString *)url;

/**
 *	@brief	Load image by file path
 *
 *	@param 	filePath 	Image file path.
 */
- (void)loadImageByFilePath:(NSString *)filePath;

/**
 *	@brief	Load image by cache
 *
 *	@param 	image 	Image object.
 */
- (void)loadImageByCache:(UIImage *)image;


@end
