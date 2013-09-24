//
//  RennService.h
//  RennSDK
//
//  Created by Li Chengliang on 13-4-8.
//  Copyright (c) 2013年 Li Chengliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RennHttpRequest.h"
#import "RennParam.h"

@class RennService;

@protocol RennServiveDelegate <NSObject>

@optional

- (void)rennService:(RennService *)service requestSuccessWithResponse:(id)response;

- (void)rennService:(RennService *)service requestFailWithError:(NSError*)error;

@end

@interface RennService : NSObject <RennHttpRequestDelegate>

@property (nonatomic, retain) RennHttpRequest *request;
@property (nonatomic, retain) NSString *type;
@property (nonatomic, readonly) id <RennServiveDelegate> delegate;

- (id)initWithDelegate:(id<RennServiveDelegate>)delegate;

- (void)clearDelegateAndCancel;

- (void)sendAsynRequest:(RennParam *)param;

@end
