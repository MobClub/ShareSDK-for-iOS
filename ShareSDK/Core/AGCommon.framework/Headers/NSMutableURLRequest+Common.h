
#import <Foundation/Foundation.h>

@interface NSMutableURLRequest (Common)

///#begin zh-cn
/**
 *	@brief	设置提交形式为multipart
 *
 *	@return	boundary字符串
 */
///#end
///#begin en
/**
 *	@brief	Set multipart form submission
 *
 *	@return	Boundary string.
 */
///#end
- (NSString *)multipartPost;

@end
