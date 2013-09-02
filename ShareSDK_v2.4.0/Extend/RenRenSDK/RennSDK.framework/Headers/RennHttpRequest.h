//
//  RennHttpRequest.h
//  RennSDK
//
//  Created by Li Chengliang on 13-4-8.
//  Copyright (c) 2013年 Li Chengliang. All rights reserved.
//

#import <Foundation/Foundation.h>

#define API_SERVER      @"api.renren.com"
#define API_PORT        @"80"

@class RennHttpRequest;

@protocol RennHttpRequestDelegate <NSObject>

- (void)request:(RennHttpRequest *)request responseWithData:(NSData *)data;

- (void)request:(RennHttpRequest *)request failWithError:(NSError *)error;

@end

@interface RennHttpRequest : NSObject

@property (retain, nonatomic) id <RennHttpRequestDelegate> delegate;

@property (assign, nonatomic) NSTimeInterval timeoutInterval;

@property (retain, nonatomic) NSString *httpMethod;
@property (retain, nonatomic) NSURL *URL;
@property (retain, nonatomic) NSDictionary *param;
@property (retain, nonatomic) NSDictionary *data;
@property (retain, nonatomic) NSString *ua;

- (id)initWithURL:(NSURL *)newURL param:(NSDictionary *)param;

- (id)initWithPath:(NSString *)path param:(NSDictionary *)param;

- (void)startAsynchronous;

- (void)clearDelegateAndCancel;

@end
