//
//  SVDSerive.m
//  SecVerifyDemo
//
//  Created by lujh on 2019/6/4.
//  Copyright © 2019 lujh. All rights reserved.
//

#import "SVDSerive.h"

#import "AFNetworking.h"

#import <MOBFoundation/MobSDK.h>

@implementation SVDSerive

+ (instancetype)sharedSerive
{
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

+ (void)verifyGetPhoneNumberWith:(NSDictionary *)result completion:(void (^) (NSError *error, NSString *phone))handler{

    if (!result) {
        NSError *error = [NSError errorWithDomain:@"com.svd.error" code:0 userInfo:@{@"description":@"获取完整手机号参数异常"}];
        if (handler) {
            handler(error, nil);
        }
        return;
    }
        
        
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    session.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSError *serializationError = nil;
    NSMutableURLRequest *request = [session.requestSerializer requestWithMethod:@"POST" URLString:[[NSURL URLWithString:SVD_LoginURL relativeToURL:nil] absoluteString] parameters:result error:&serializationError];
    if(!serializationError)
    {
        
        NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
            
            if(!error)
            {
                if ([responseObject isKindOfClass:[NSDictionary class]] && [responseObject[@"status"] intValue] == 200)
                {
                    
                    
                    if (![[NSThread currentThread] isMainThread]) {
                        
                        dispatch_async(dispatch_get_main_queue(), ^{
                            
                            NSLog(@"服务器验证成功");
                            if ([responseObject[@"res"] isKindOfClass:[NSDictionary class]])
                            {
                                handler(nil, responseObject[@"res"][@"phone"]);
                            }
                            else
                            {
                                handler([NSError errorWithDomain:@"com.svd.error" code:0 userInfo:@{@"description":@"数据错误"}], nil);
                            }
                        });
                    }
                    else
                    {
                        
                        NSLog(@"服务器验证成功");
                        if ([responseObject[@"res"] isKindOfClass:[NSDictionary class]])
                        {
                            handler(nil, responseObject[@"res"][@"phone"]);
                        }
                        else
                        {
                            handler([NSError errorWithDomain:@"com.svd.error" code:0 userInfo:@{@"description":@"数据错误"}], nil);
                        }
                    }
                    
                }
                else
                {
                    if (![[NSThread currentThread] isMainThread]) {
                        
                        dispatch_async(dispatch_get_main_queue(), ^{
                            
                            NSLog(@"服务器验证成功");
                            if ([responseObject[@"res"] isKindOfClass:[NSDictionary class]])
                            {
                                handler(nil, responseObject[@"res"][@"phone"]);
                            }
                            else
                            {
                                handler([NSError errorWithDomain:@"com.svd.error" code:0 userInfo:@{@"description":@"数据错误"}], nil);
                            }
                        });
                    }
                    else
                    {
                        
                        NSLog(@"服务器验证成功");
                        if ([responseObject[@"res"] isKindOfClass:[NSDictionary class]])
                        {
                            handler(nil, responseObject[@"res"][@"phone"]);
                        }
                        else
                        {
                            handler([NSError errorWithDomain:@"com.svd.error" code:0 userInfo:@{@"description":@"数据错误"}], nil);
                        }
                    }
                }
                    
            }
            else
            {
                NSError *rstError = error;
                if ([responseObject isKindOfClass:[NSDictionary class]] && responseObject[@"status"])
                {
                    rstError = [NSError errorWithDomain:error.domain code:[responseObject[@"status"] integerValue] userInfo:@{@"description":responseObject[@"error"]}];

                }
                
                if (![[NSThread currentThread] isMainThread]) {
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        
                        if (handler)
                        {
                            handler(rstError, nil);
                        }
                    });
                }
                else
                {
                    if (handler)
                    {
                        handler(rstError, nil);
                    }
                }
            }
            
        }];
        
        [dataTask resume];

    }

    
   
}

@end
