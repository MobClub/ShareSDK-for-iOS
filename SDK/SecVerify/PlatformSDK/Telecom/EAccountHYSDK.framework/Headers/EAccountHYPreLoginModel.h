//
//  EAccountHYPreLoginModel.h
//  EAccountOpenPageSDK
//
//  Created by Reticence Lee on 2020/3/23.
//  Copyright © 2020 21CN. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EAccountHYPreLoginModel : NSObject

/**
 资源获取超时时间 默认6.0s（单位为：秒）
 */
@property (nonatomic, assign) NSTimeInterval  timeoutIntervalForResource;

/**
 连接超时时间 默认6.0s（单位为：秒）
 */
@property (nonatomic, assign) NSTimeInterval  connectTimeoutInterval;

/**
 总超时时间 默认8.0s （单位为：秒），应设置比其他超时时间长
*/
@property (nonatomic, assign) NSTimeInterval  totalTimeoutInterval;

#pragma -mark 初始化方法

/**
 初始化方法  请调用该方法进行初始化
 */
- (instancetype)initWithDefaultConfig;

@end

NS_ASSUME_NONNULL_END
