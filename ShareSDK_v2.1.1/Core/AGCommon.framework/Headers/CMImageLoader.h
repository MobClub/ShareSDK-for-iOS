//
//  U6ImageLoader.h
//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMEventDispatcher.h"

/**
 *	@brief	图片加载成功
 */
#define NOTIF_IMAGE_LOAD_COMPLETE @"imageLoadComplete"

/**
 *	@brief	图片加载异常
 */
#define NOTIF_IMAGE_LOAD_ERROR @"imageLoadError"

/**
 *	@brief	图片加载进度
 */
#define NOTIF_IMAGE_LOAD_PROGRESS @"imageLoadProgress"


/**
 *	@brief	图片数据
 */
#define NOTIF_KEY_IMAGE_DATA @"imageData"

/**
 *	@brief	异常
 */
#define NOTIF_KEY_IMAGE_ERROR @"error"

/**
 *	@brief	图片回复
 */
#define NOTIF_KEY_IMAGE_RESPONSE @"response"

/**
 *	@brief	总字节数
 */
#define NOTIF_KEY_TOTAL_BYTES @"totalBytes"

/**
 *	@brief	加载字节数
 */
#define NOTIF_KEY_LOADED_BYTES @"loadedBytes"



/**
 *	@brief	加载器状态
 */
typedef enum
{
	ImageLoaderStateUnset,  /**< 未设置状态 */
    ImageLoaderStateLoading, /**< 加载图片中 */
    ImageLoaderStateReady   /**< 图片加载完毕，准备就绪 */
}CMImageLoaderState;

/**
 *	@brief	图片来源
 */
typedef enum
{
	ImageLoaderSourceTypeCache, /**< 缓存 */
    ImageLoaderSourceTypeUrl, /**< 网络 */
    ImageLoaderSourceTypeFile		/**< 文件 */
}CMImageLoaderSourceType;


/**
	图片裁剪类型
 */
typedef enum
{
	ImageClipTypeNone = 0, /**< 无裁剪 */
	ImageClipTypeTop, /**< 从顶部开始裁剪 */
	ImageClipTypeCenter, /**< 从中间开始裁剪 */
	ImageClipTypeBottom /**< 从底部开始裁剪 */
}CMImageClipType;

/**
 *	@brief	图片加载器，带有图片加载状态，由ImageCacheManager管理分发。
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
 *	@brief	照片数据
 */
@property (nonatomic,retain,readonly) UIImage *content;

/**
 *	@brief	照片状态
 */
@property (nonatomic,readonly) CMImageLoaderState state;

/**
 *	@brief	来源类型
 */
@property (nonatomic,readonly) CMImageLoaderSourceType sourceType;

/**
 *	@brief	标志
 */
@property (nonatomic,retain) NSString *tag;

/**
 *	@brief	初始化图片加载器
 *
 *	@param 	clipSize 	裁剪尺寸
 *	@param 	clipType 	裁剪类型
 *
 *	@return	加载器
 */
- (id)initWithClipSize:(CGSize)clipSize clipType:(CMImageClipType)clipType;

/**
 *	@brief	初始化图片加载器
 *
 *	@param 	cornerRadius 	圆角
 *
 *	@return	加载器
 */
- (id)initWithCornerRadius:(CGFloat)cornerRadius;

/**
 *	@brief	初始化图片加载器
 *
 *	@param 	cornerRadius 	圆角
 *	@param 	size 	实际显示尺寸
 *
 *	@return	加载器
 */
- (id)initWithCornerRadius:(CGFloat)cornerRadius
                      size:(CGSize)size;


/**
 *	@brief	初始化图片加载器
 *
 *	@param 	clipSize 	裁剪尺寸
 *	@param 	clipType 	裁剪类型
 *	@param 	cornerRadius 	圆角
 *
 *	@return	加载器
 */
- (id)initWithClipSize:(CGSize)clipSize
              clipType:(CMImageClipType)clipType
          cornerRadius:(CGFloat)cornerRadius;


/**
 *	@brief	加载网络图片对象
 *
 *	@param 	url 	图片URL
 */
- (void)loadImageByUrl:(NSString *)url;

/**
 *	@brief	加载本地图片对象
 *
 *	@param 	filePath 	图片路径
 */
- (void)loadImageByFilePath:(NSString *)filePath;

/**
 *	@brief	加载缓存图片对象
 *
 *	@param 	image 	图片对象
 */
- (void)loadImageByCache:(UIImage *)image;


@end
