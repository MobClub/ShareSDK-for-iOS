
#import <UIKit/UIKit.h>

///#begin zh-cn
/**
 *	@brief	图片类目
 */
///#end
///#begin en
/**
 *	@brief	UIImage category.
 */
///#end
@interface UIImage (Common)


///#begin zh-cn
/**
 *	@brief	由视图创建图片
 *
 *	@param 	view 	视图对象
 *
 *	@return	图片对象
 */
///#end
///#begin en
/**
 *	@brief	Create a image by view.
 *
 *	@param 	view 	View object.
 *
 *	@return	Image object.
 */
///#end
+ (UIImage *)imageWithView:(UIView *)view;

///#begin zh-cn
/**
 *	@brief	获取图片对象
 *
 *	@param 	name 	图片名称
 *	@param 	bundleName 	Bundle名称
 *
 *	@return	图片对象
 */
///#end
///#begin en
/**
 *	@brief	Get image object.
 *
 *	@param 	name 	Image name.
 *	@param 	bundleName 	Bundle name.
 *
 *	@return	Image object.
 */
///#end
+ (UIImage *)imageNamed:(NSString *)name bundleName:(NSString *)bundleName;

///#begin zh-cn
/**
 *	@brief	等比缩放照片
 *
 *	@param 	size 	缩放的图片尺寸。如果该尺寸不是按照等比设置，则函数按照宽度或高度最大比例进行等比缩放。
 *
 *	@return	等比缩放后的图片对象
 */
///#end
///#begin en
/**
 *	@brief	Scale image.
 *
 *	@param 	size 	Zoom image size. If the size is not in accordance with the geometric setting, the function according to the width or height of the largest proportion of geometric scaling.
 *
 *	@return	The scaled image object
 */
///#end
- (UIImage *)scaleImageWithSize:(CGSize)size;

///#begin zh-cn
/**
 *	@brief	创建圆角图片
 *
 *	@param 	size 	圆角图像的图片尺寸
 *	@param 	ovalWidth 	圆角宽度
 *	@param 	ovalHeight 	圆角高度
 *
 *	@return	圆角图片对象引用
 */
///#end
///#begin en
/**
 *	@brief	Create a rounded rect image.
 *
 *	@param 	size 	Image size.
 *	@param 	ovalWidth 	oval width.
 *	@param 	ovalHeight 	oval height.
 *
 *	@return	Image object.
 */
///#end
- (UIImage *)createRoundedRectWithsize:(CGSize)size
                             ovalWidth:(CGFloat)ovalWidth
                            ovalHeight:(CGFloat)ovalHeight;

///#begin zh-cn
/**
 *	@brief	裁剪图片
 *
 *	@param 	rect 	裁剪范围
 *
 *	@return	裁剪后的图片对象
 */
///#end
///#begin en
/**
 *	@brief	Crop Image.
 *
 *	@param 	rect 	Clip rect.
 *
 *	@return	Cropped image object
 */
///#end
- (UIImage *)clipImageWithRect:(CGRect)rect;

///#begin zh-cn
/**
 *	@brief	获取灰度化图片
 *
 *	@return	灰度化图片
 */
///#end
///#begin en
/**
 *	@brief	Get grayscale image.
 *
 *	@return	Grayscale image.
 */
///#end
- (UIImage *)grayImage;


@end
