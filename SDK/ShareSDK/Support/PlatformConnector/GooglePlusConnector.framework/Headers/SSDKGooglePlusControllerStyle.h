//
//  SSDKGooglePlusControllerStyle.h
//  ShareSDK
//
//  Created by chenjd on 16/4/25.
//  Copyright © 2016年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SSDKGooglePlusControllerStyle : NSObject

/**
 *  风格共享实例
 *
 *  @return 风格类实例
 */
+ (instancetype)sharedInstance;

/**
 *  支持的方向
 */
@property (nonatomic, assign) UIInterfaceOrientationMask supportedInterfaceOrientation;

@end
