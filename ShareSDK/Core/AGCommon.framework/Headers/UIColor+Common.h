
#import <UIKit/UIKit.h>

///#begin zh-cn
/**
 *	@brief	颜色类目
 */
///#end
///#begin en
/**
 *	@brief	UIColor Category.
 */
///#end
@interface UIColor (Common)


///#begin zh-cn
/**
 *	@brief	获取颜色对象
 *
 *	@param 	rgb 	RGB颜色值
 *
 *	@return	颜色对象
 */
///#end
///#begin en
/**
 *	@brief	Get color object.
 *
 *	@param 	rgb 	RGB color value.
 *
 *	@return	Color object.
 */
///#end
+ (UIColor *)colorWithRGB:(NSUInteger)rgb;

///#begin zh-cn
/**
 *	@brief	获取颜色对象
 *
 *	@param 	argb 	ARGB颜色值
 *
 *	@return	颜色对象
 */
///#end
///#begin en
/**
 *	@brief	Get color object.
 *
 *	@param 	argb 	ARGB color value.
 *
 *	@return	Color object.
 */
///#end
+ (UIColor *)colorWithARGB:(NSUInteger)argb;

///#begin zh-cn
/**
 *	@brief	获取颜色对象
 *
 *	@param 	string 	颜色描述字符串，带“＃”开头
 *
 *	@return	颜色对象
 */
///#end
///#begin en
/**
 *	@brief	Get color object
 *
 *	@param 	string 	Color description string beginning with "#"
 *
 *	@return	Color object.
 */
///#end
+ (UIColor *)cmColorWithString:(NSString *)string;



@end
