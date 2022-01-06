//
//  EAccountHYCTEConfig.h
//  EAccountOpenPageSDK
//
//  Created by lvzhzh on 2020/3/18.
//  Copyright © 2020 21CN. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EAccountHYCTEConfig : NSObject

@property (nonatomic, copy) NSString *timestampDomain;
@property (nonatomic, copy) NSString *preLoginDomain;
@property (nonatomic, copy) NSString *uploadLogDomain;

- (instancetype)initWithDefaultConfig;

@end

NS_ASSUME_NONNULL_END

