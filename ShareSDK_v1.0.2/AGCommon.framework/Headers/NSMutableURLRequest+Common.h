//
//  NSMutableURLRequest+Common.h
//  CommonModule
//
//  Created by hower on 12/11/12.
//  Copyright (c) 2012 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableURLRequest (Common)

/**
 *	@brief	设置提交形式为multipart
 *
 *	@return	boundary字符串
 */
- (NSString *)multipartPost;

@end
