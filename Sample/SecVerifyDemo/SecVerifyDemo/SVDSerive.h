//
//  SVDSerive.h
//  SecVerifyDemo
//
//  Created by lujh on 2019/6/4.
//  Copyright © 2019 lujh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SVDSerive : NSObject

+ (void)verifyGetPhoneNumberWith:(NSDictionary *)result completion:(void (^) (NSError *error, NSString *phone))handler;

@end

NS_ASSUME_NONNULL_END
