//
//  SMSDemoHelper.h
//  SMSSDKDemo
//
//  Created by hower on 2020/1/2.
//  Copyright © 2020 youzu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SVDDemoHelper : NSObject

+ (NSString *)currentZone;

+ (NSString *)currentCountryName;


+ (NSString *)errorTextWithError:(NSError *)error;

+ (BOOL)isZhHans;

+ (BOOL)isPhoneXor11Pro;

+ (BOOL)isPhoneX;

@end

NS_ASSUME_NONNULL_END
