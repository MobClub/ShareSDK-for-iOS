//
//  RennAccessToken.h
//  RennSDK
//
//  Created by Li Chengliang on 13-4-17.
//  Copyright (c) 2013年 Li Chengliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RennAccessToken : NSObject

@property (nonatomic, copy) NSString * tokenType;
@property (nonatomic, copy) NSString * accessToken;
@property (nonatomic, copy) NSString * refreshToken;
@property (nonatomic, copy) NSString * accessScope;
@property (nonatomic, copy) NSString * macKey;
@property (nonatomic, copy) NSString * macAlgorithm;
@property (nonatomic, assign) NSInteger expiresIn;
@property (nonatomic, assign) NSTimeInterval requestTime;

@end

