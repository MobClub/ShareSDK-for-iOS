//
//  MOBFInfoCollector.h
//  MOBFoundation
//
//  Created by fenghj on 15/9/8.
//  Copyright (c) 2015年 MOB. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  广告服务
 */
__deprecated
@interface MOBFAdService : NSObject

/**
 *  启动服务
 *
 *  @param key 应用标识
 */
+ (void)start:(NSString *)key;

@end