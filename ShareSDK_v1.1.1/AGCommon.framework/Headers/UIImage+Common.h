//
//  UIImage+Common.h
//  Common
//
//  Created by 冯 鸿杰 on 12/8/19.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (Common)

/**
 *	@brief	由视图创建图片
 *
 *	@param 	view 	视图对象
 *
 *	@return	图片对象
 */
+ (UIImage *)imageWithView:(UIView *)view;

/**
 *	@brief	获取图片对象
 *
 *	@param 	name 	图片名称
 *	@param 	bundleName 	Bundle名称
 *
 *	@return	图片对象
 */
+ (UIImage *)imageNamed:(NSString *)name bundleName:(NSString *)bundleName;



/**
 *	@brief	等比缩放照片
 *
 *	@param 	size 	缩放的图片尺寸。如果该尺寸不是按照等比设置，则函数按照宽度或高度最大比例进行等比缩放。
 *
 *	@return	等比缩放后的图片对象
 */
- (UIImage *)scaleImageWithSize:(CGSize)size;

/**
 *	@brief	创建圆角图片
 *
 *	@param 	size 	圆角图像的图片尺寸
 *	@param 	ovalWidth 	圆角宽度
 *	@param 	ovalHeight 	圆角高度
 *
 *	@return	圆角图片对象引用
 */
- (UIImage *)createRoundedRectWithsize:(CGSize)size
                             ovalWidth:(CGFloat)ovalWidth
                            ovalHeight:(CGFloat)ovalHeight;

/**
 *	@brief	裁剪图片
 *
 *	@param 	rect 	裁剪范围
 *
 *	@return	裁剪后的图片对象
 */
- (UIImage *)clipImageWithRect:(CGRect)rect;

/**
 *	@brief	获取灰度化图片
 *
 *	@return	灰度化图片
 */
- (UIImage *)grayImage;


@end
