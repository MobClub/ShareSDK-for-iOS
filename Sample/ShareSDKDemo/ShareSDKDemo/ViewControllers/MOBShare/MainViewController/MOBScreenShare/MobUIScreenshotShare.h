//
//  MobUIScreenshotShare.h
//  MobScreenShareDome
//
//  Created by youzu on 17/1/23.
//  Copyright © 2017年 mob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDK/ShareSDK.h>

typedef void(^MUSSSelecetedPlatformType) (SSDKPlatformType platformType);


@interface MobUIScreenshotShare : NSObject

@property(nonatomic,strong) UIWindow *window;


+ (MobUIScreenshotShare *)shareInstance;

/**
 显示提示模式UI
 
 @param image 截图图片
 @param rect 窗口坐标及尺寸
 @param duration 窗口显示时间
 @param selecetedPlatformType 所选择的分享平台 回调
 */
- (void)showAlertModeWithImage:(UIImage *)image
                         frame:(CGRect)rect
                      duration:(NSTimeInterval)duration
         selecetedPlatformType:(MUSSSelecetedPlatformType)selecetedPlatformType;

/**
 显示普通全屏模式

 @param image 截图图片
 @param selecetedPlatformType 所选择的分享平台 回调
 */
- (void)showDefaultModeWithImage:(UIImage *)image
           selecetedPlatformType:(MUSSSelecetedPlatformType)selecetedPlatformType;

@end
