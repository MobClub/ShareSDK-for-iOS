// Copyright (c) 2014-present, Facebook, Inc. All rights reserved.
//
// You are hereby granted a non-exclusive, worldwide, royalty-free license to use,
// copy, modify, and distribute this software in source code or binary form for use
// in connection with the web services and APIs provided by Facebook.
//
// As with any software that integrates with the Facebook platform, your use of
// this software is subject to the Facebook Developer Principles and Policies
// [http://developers.facebook.com/policy/]. This copyright notice shall be
// included in all copies or substantial portions of the software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
// FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
// IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import <Foundation/Foundation.h>

#import "FBSDKSessionProviding.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^FBSDKURLSessionTaskBlock)(NSData*  _Nullable responseData,
                                         NSURLResponse*  _Nullable response,
                                         NSError* _Nullable error)
NS_SWIFT_NAME(UrlSessionTaskBlock);

NS_SWIFT_NAME(UrlSessionTask)
@interface FBSDKURLSessionTask : NSObject

@property (nonatomic, strong) id<FBSDKSessionDataTask> task;
@property (atomic, readonly) NSURLSessionTaskState state;
@property (nonatomic, strong, readonly) NSDate *requestStartDate;
@property (nullable, nonatomic, copy) FBSDKURLSessionTaskBlock handler;
@property (nonatomic, assign) uint64_t requestStartTime;
@property (nonatomic, assign) NSUInteger loggerSerialNumber;

+ (instancetype)new NS_UNAVAILABLE;

- (instancetype)init NS_UNAVAILABLE;

- (nullable instancetype)initWithRequest:(NSURLRequest *)request
                             fromSession:(id<FBSDKSessionProviding>)session
                       completionHandler:(nullable FBSDKURLSessionTaskBlock)handler;

- (void)start;
- (void)cancel;

@end

NS_ASSUME_NONNULL_END
