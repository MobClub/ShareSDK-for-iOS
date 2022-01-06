//
//  SCSnapKitFeatureOptions.h
//  SCSDKLoginKit
//
//  Created by Duncan Riefler on 9/24/20.
//  Copyright © 2020 Snap, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SCSnapKitFeatureOptions : NSObject

@property (nonatomic) BOOL profileLinkEnabled;

- (instancetype)init;

@end

NS_ASSUME_NONNULL_END
