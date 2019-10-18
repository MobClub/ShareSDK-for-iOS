//
//  NSObject+MOB.h
//  ShareSDKDemo
//
//  Created by maxl on 2019/9/18.
//  Copyright © 2019 mob. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^mob_deallocTask)(id object);

@interface NSObject (MOB)
/**
 添加销毁任务,此方法不支持异步
 */
- (void)mob_addDellocTask:(mob_deallocTask)task;

@end

NS_ASSUME_NONNULL_END
