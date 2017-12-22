//
//  MobScreenshotCenter.h
//  MobScreenShareDome
//
//  Created by youzu on 17/1/23.
//  Copyright © 2017年 mob. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSUInteger, SSEScreenCaptureUIMode){
    //全屏幕主要界面
    SSEScreenCaptureUIModeDefault  = 0,
    //提示界面
    SSEScreenCaptureUIModeAlert    = 1
};

/**
 监听截屏时间 iOS7及以上支持
 */
@interface MobScreenshotCenter : NSObject

+ (MobScreenshotCenter *)shareInstance;

/**
 启动截屏监听
 */
- (void)start;

/**
 停止截屏监听
 */
- (void)stop;

/**
 截图并显示UI
 
 @param mode 现实的UI模式
 @param duration 持续时间 SSEScreenCaptureUIModeAlert 模式生效
 @param useClientShare 是否优先使用客户端进行分享
 */
- (void)screenCaptureShareWithMode:(SSEScreenCaptureUIMode)mode
                          duration:(NSTimeInterval)duration
                    useClientShare:(BOOL)useClientShare;
@end
