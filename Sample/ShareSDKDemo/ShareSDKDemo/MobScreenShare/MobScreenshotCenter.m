//
//  MobScreenshotCenter.m
//  MobScreenShareDome
//
//  Created by youzu on 17/1/23.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MobScreenshotCenter.h"
#import <ShareSDKExtension/SSEShareHelper.h>
#import "MobUIScreenshotShare.h"
#import <UIKit/UIKit.h>

@implementation MobScreenshotCenter

+ (MobScreenshotCenter *)shareInstance
{
    static MobScreenshotCenter *center = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        center = [[MobScreenshotCenter alloc] init];
    });
    return center;
}

/**
 截图并显示UI
 
 @param mode 现实的UI模式
 @param duration 持续时间 SSEScreenCaptureUIModeAlert 模式生效
 @param useClientShare 是否优先使用客户端进行分享
 */
- (void)screenCaptureShareWithMode:(SSEScreenCaptureUIMode)mode
                           duration:(NSTimeInterval)duration
                     useClientShare:(BOOL)useClientShare{
    if([MobUIScreenshotShare shareInstance].window != nil)
    {
        return;
    }
    [SSEShareHelper screenCaptureShare:^(SSDKImage *sImage, SSEShareHandler shareHandler) {
        if(sImage != nil)
        {
            [sImage getNativeImage:^(UIImage *image) {
                if(image != nil)
                {
                    //设置分享数据
                    NSMutableDictionary *params = [NSMutableDictionary dictionary];
                    [params SSDKSetupShareParamsByText:@"http://www.mob.com"
                                                images:image
                                                   url:nil
                                                 title:nil
                                                  type:SSDKContentTypeImage];
                    //设置 是否优先使用客户端进行分享
                    //            if (useClientShare)
                    //            {
                    //                [params SSDKEnableUseClientShare];
                    //            }
                    if(mode == SSEScreenCaptureUIModeAlert)
                    {
////                        //提示窗大小
                        CGRect rect = CGRectMake(CGRectGetWidth([UIScreen mainScreen].bounds) - 130 , 100, 120, 160);
//                        //显示时间
                        NSTimeInterval showTime = 3.0;
                        [[MobUIScreenshotShare shareInstance] showAlertModeWithImage:image
                                                                               frame:rect
                                                                            duration:showTime
                                                               selecetedPlatformType:^(SSDKPlatformType platformType) {
                                                                   if (shareHandler)
                                                                   {
                                                                       shareHandler(platformType , params);
                                                                   }
                                                               }];
                    }
                    else
                    {
                        [[MobUIScreenshotShare shareInstance] showDefaultModeWithImage:image
                                                                 selecetedPlatformType:^(SSDKPlatformType platformType) {
                                                                     if (shareHandler)
                                                                     {
                                                                         shareHandler(platformType , params);
                                                                     }
                                                                 }];
                    }
                }
            }];
        }
    } onStateChanged:[self _myShareStateChangedHandler]];
}


/**
 处理分享返回事件

 @return SSDKShareStateChangedHandler
 */
- (SSDKShareStateChangedHandler)_myShareStateChangedHandler
{
    return ^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error)
    {
        switch (state) {
            case SSDKResponseStateBegin:
                break;
            case SSDKResponseStateSuccess:
            {
                NSString *msg = @"分享成功";
                UIAlertView *alerView = [[UIAlertView alloc] initWithTitle:@"提示" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alerView show];
                break;
            }
            case SSDKResponseStateFail:
            {
                NSString *msg = [NSString stringWithFormat:@"分享失败 \nuserData = %@\ncontent entity = %@\nerror = %@", userData, contentEntity, error];
                UIAlertView *alerView = [[UIAlertView alloc] initWithTitle:@"提示" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alerView show];
                break;
            }
            case SSDKResponseStateCancel:
            {
                NSString *msg = @"分享取消";
                UIAlertView *alerView = [[UIAlertView alloc] initWithTitle:@"提示" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alerView show];
                break;
            }
            default:
                break;
        }
    };
}

- (void)start
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(_userDidTakeScreenshot:)
                                                 name:UIApplicationUserDidTakeScreenshotNotification
                                               object:nil];
}

- (void)_userDidTakeScreenshot:(NSNotification *)notification
{
    [self screenCaptureShareWithMode:SSEScreenCaptureUIModeAlert
                             duration:3.0
                       useClientShare:YES];
}

- (void)stop
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIApplicationUserDidTakeScreenshotNotification
                                                  object:nil];
}

@end
