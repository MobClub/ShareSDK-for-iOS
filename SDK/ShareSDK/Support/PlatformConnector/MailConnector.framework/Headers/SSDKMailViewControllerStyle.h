//
//  SSDKMailViewControllerStyle.h
//  ShareSDK
//
//  Created by 刘靖煌 on 15/12/24.
//  Copyright © 2015年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SSDKMailViewControllerStyle : NSObject

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
