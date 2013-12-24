//
//  SSYiXinErrorInfo.h
//  YiXinConnection
//
//  Created by Nogard on 13-11-27.
//  Copyright (c) 2013年 AppGo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AGCommon/CMErrorInfo.h>

@interface SSYiXinErrorInfo : CMErrorInfo

+(SSYiXinErrorInfo *)errorWithCode:(NSInteger)code
                       description:(NSString*)description
                             level:(CMErrorLevel)level;

@end
