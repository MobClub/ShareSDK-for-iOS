//
//  POAPinyin.h
//  POA
//
//  Created by haung he on 11-7-18.
//  Copyright 2011年 huanghe. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CMPinyin : NSObject {
    
}

+ (NSString *) convert:(NSString *) hzString;//输入中文，返回拼音。

//  added by setimouse ( setimouse@gmail.com )
+ (NSString *)quickConvert:(NSString *)hzString;
+ (void)clearCache;
//  ------------------

@end
