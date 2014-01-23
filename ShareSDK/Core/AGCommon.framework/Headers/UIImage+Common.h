//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <UIKit/UIKit.h>

/**
 *	@brief	UIImage category.
 */
@interface UIImage (Common)


/**
 *	@brief	Create a image by view.
 *
 *	@param 	view 	View object.
 *
 *	@return	Image object.
 */
+ (UIImage *)imageWithView:(UIView *)view;

/**
 *	@brief	Get image object.
 *
 *	@param 	name 	Image name.
 *	@param 	bundleName 	Bundle name.
 *
 *	@return	Image object.
 */
+ (UIImage *)imageNamed:(NSString *)name bundleName:(NSString *)bundleName;

/**
 *	@brief	Scale image.
 *
 *	@param 	size 	Zoom image size. If the size is not in accordance with the geometric setting, the function according to the width or height of the largest proportion of geometric scaling.
 *
 *	@return	The scaled image object
 */
- (UIImage *)scaleImageWithSize:(CGSize)size;

/**
 *	@brief	Create a rounded rect image.
 *
 *	@param 	size 	Image size.
 *	@param 	ovalWidth 	oval width.
 *	@param 	ovalHeight 	oval height.
 *
 *	@return	Image object.
 */
- (UIImage *)createRoundedRectWithsize:(CGSize)size
                             ovalWidth:(CGFloat)ovalWidth
                            ovalHeight:(CGFloat)ovalHeight;

/**
 *	@brief	Crop Image.
 *
 *	@param 	rect 	Clip rect.
 *
 *	@return	Cropped image object
 */
- (UIImage *)clipImageWithRect:(CGRect)rect;

/**
 *	@brief	Get grayscale image.
 *
 *	@return	Grayscale image.
 */
- (UIImage *)grayImage;


@end
