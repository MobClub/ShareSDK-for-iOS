//
//  SSDKVideoUploadCenter.h
//  ShareSDK
//
//  Created by youzu on 17/2/28.
//  Copyright © 2017年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MOBFoundation/MOBFoundation.h>
#import "SSDKTypeDefine.h"

@interface SSDKVideoUploadCenter : NSObject

+ (SSDKVideoUploadCenter *)shareInstance;

- (void)uploadProgressWithPlatformType:(SSDKPlatformType)platformType
                               fileURL:(NSURL *)url
                                   tag:(NSString *)tag
                         progressEvent:(MOBFHttpUploadProgressEvent)progressEvent;

@property (nonatomic,strong) NSMutableArray *httpServiceArray;

@end
