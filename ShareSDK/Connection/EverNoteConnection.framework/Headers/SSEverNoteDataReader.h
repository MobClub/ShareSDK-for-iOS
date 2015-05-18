//
//  SSEverNoteDataReader.h
//  EverNoteConnection
//
//  Created by vimfung on 13-5-11.
//  Copyright (c) 2013年 vimfung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ISSEverNoteDataOutput.h"

/**
 *	@brief	数据读取器
 */
@interface SSEverNoteDataReader : NSObject <ISSEverNoteDataOutput>
{
@private
    NSData *_data;
    NSInteger _offset;
}

/**
 *	@brief	初始化数据读取器
 *
 *	@param 	data 	数据
 *
 *	@return	读取器对象
 */
- (id)initWithData:(NSData *)data;




@end
