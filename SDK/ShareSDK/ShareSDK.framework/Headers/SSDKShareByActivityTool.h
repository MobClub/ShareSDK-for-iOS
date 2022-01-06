//
//  SSDKShareByActivityTool.h
//  ShareSDK
//
//  Created by cl on 2021/8/25.
//  Copyright © 2021 掌淘科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SSDKShareSession;
@class SSDKActivityViewController;
@class SSDKImage;
@class SSDKContentEntity;
@class SSDKApplication;

@interface SSDKShareByActivityTool : NSObject

+ (instancetype)defaultManager;

- (void)shareByActivityWithSession:(SSDKShareSession *)shareSession whiteList:(NSArray *)whiteList imagePath:(NSArray *)imagePath;
@end
