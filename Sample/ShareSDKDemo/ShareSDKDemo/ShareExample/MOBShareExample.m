//
//  MOBShareExample.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/15.
//  Copyright © 2019 mob. All rights reserved.
//

#import "MOBShareExample.h"
#import "MobScreenshotCenter.h"
#import <ShareSDKUI/ShareSDKUI.h>
#import <ShareSDKExtension/SSEShareHelper.h>
#import "MOBShakeView.h"
#import "MOBAboutMobLinkViewController.h"
#import "MOBPolicyManager.h"
#import "SSDKImagePicker.h"
#import "MOBShareCommandAlertView.h"

@implementation MOBShareExample{
    BOOL isAnimate, onShakeShare;
    MOBShakeView *shakeShareView;
}

+ (MOBShareExample *)defaultExample{
    static MOBShareExample *example = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        example = [MOBShareExample new];
    });
    return example;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
       

        shakeShareView = [MOBShakeView new];
        [ShareSDK setUserInterfaceStyle:SSUIUserInterfaceStyleUnspecified];
        
    }
    return self;
}




#pragma mark - 弹框分享 -
- (void)popShareWithView:(UIView *)view{
    
    NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
    NSArray* imageArray = @[[[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"]];
    [shareParams SSDKSetupShareParamsByText:@"分享内容"
                                     images:imageArray
                                        url:[NSURL URLWithString:@"https://www.mob.com"]
                                      title:@"分享标题"
                                       type:SSDKContentTypeImage];
    
    
    SSUIPlatformItem *item_1 = [[SSUIPlatformItem alloc] init];
    item_1.platformName = @"item_1";
    item_1.iconNormal = [UIImage imageNamed:@"COD13.jpg"];
    item_1.iconSimple = [UIImage imageNamed:@"D11.jpg"];
    item_1.platformId = @"123456789";
    [item_1 addTarget:self action:@selector(test_1:)];
    
    NSArray *items = nil;
    //        items = @[
    //                  @(SSDKPlatformTypeQQ),
    //                  @(SSDKPlatformTypeWechat),
    //                  item_1,
    //                  @(SSDKPlatformTypeSinaWeibo),
    //                  @(SSDKPlatformTypeSMS),
    //                  @(SSDKPlatformTypeMail),
    //                  @(SSDKPlatformTypeCopy)
    //                  ];
    
    SSUIShareSheetConfiguration *config = [[SSUIShareSheetConfiguration alloc] init];
//    config.overrideUserInterfaceStyle = SSUIUserInterfaceStyleLight;
//    config.style = SSUIActionSheetStyleSimple;
    //    config.menuBackgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.5];
    [ShareSDK showShareActionSheet:view
                       customItems:items
                       shareParams:shareParams
                sheetConfiguration:config
                    onStateChanged:^(SSDKResponseState state,
                                     SSDKPlatformType platformType,
                                     NSDictionary *userData,
                                     SSDKContentEntity *contentEntity,
                                     NSError *error,
                                     BOOL end)
     {
        [self sharePlatType:platformType userData:userData state:state error:error];
    }];
}

- (void)test_1:(SSUIPlatformItem *)item
{
    NSLog(@"costom item click , id :%@",item.platformId);
}

#pragma mark - 摇一摇分享 -
- (void)shotShare{
    [[MobScreenshotCenter shareInstance] screenCaptureShareWithMode:SSEScreenCaptureUIModeAlert
                                                           duration:3.0
                                                     useClientShare:YES];
}


- (void)shakeShare{
    
    
    
    if(!isAnimate)
    {
        [self showPrompt];
    }
    if(!onShakeShare)
    {
        onShakeShare = YES;
        [SSEShareHelper beginShakeShare:nil
                              onEndSake:nil
                     onWillShareHandler:^(SSEShareHandler shareHandler) {
            //调用截屏分享
            [[MobScreenshotCenter shareInstance] screenCaptureShareWithMode:SSEScreenCaptureUIModeAlert
                                                                   duration:3.0
                                                             useClientShare:YES];
        }
                         onStateChanged:nil];
    }
    
    //    也可以 使用 摇一摇后马上分享
    //    [SSEShareHelper beginShakeShare:nil
    //                          onEndSake:nil
    //                 onWillShareHandler:^(SSEShareHandler shareHandler){
    //        NSLog(@"======开始分享");
    //        //构造分享参数
    //        NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
    //        NSArray* imageArray = @[[UIImage imageNamed:@"shareImg.png"]];
    //        if (imageArray)
    //        {
    //            [shareParams SSDKSetupShareParamsByText:@"摇着摇着就可以分享出去了，使用ShareSDK分享就是便捷方便。 http://www.mob.com/"
    //                                             images:imageArray
    //                                                url:nil
    //                                              title:nil
    //                                               type:SSDKContentTypeImage];
    //            //回调分享
    //            if (shareHandler)
    //            {
    //                shareHandler (SSDKPlatformTypeSinaWeibo, shareParams);
    //            }
    //        }
    //    }
    //                     onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
    //        [self sharePlatType:0 state:state error:error];
    //    }];
}

- (void)showPrompt
{
    isAnimate = YES;
    
    UIWindow *window = [UIApplication currentWindow];
    [window addSubview:shakeShareView];
    shakeShareView.center = window.center;
    [shakeShareView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(window);
    }];
    shakeShareView.alpha = 0;
    [UIView animateWithDuration:0.15 animations:^{
        shakeShareView.alpha = 1;
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:0.15
                              delay:1
                            options:UIViewAnimationOptionTransitionNone
                         animations:^{
            shakeShareView.alpha = 0;
        }
                         completion:^(BOOL finished) {
            [shakeShareView removeFromSuperview];
            isAnimate = NO;
        }];
    }];
    
    
}

#pragma mark - 分享到linkCard -
- (void)sinaLinkCardShare{
//    //图片必须为网络地址图片
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];

    [parameters SSDKSetupSinaWeiboLinkCardShareParamsByText:@"我是Text"
                                                  cardTitle:@"cardTitle"
                                                cardSummary:@"summary"
                                                     images:@"http://download.sdk.mob.com/web/images/2019/06/20/10/1560998253715/635_635_42.62.png"
                                                        url:[NSURL URLWithString:SHARESDKDEMO_URLSTRING]];

    [ShareSDK share:SSDKPlatformTypeSinaWeibo parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
        [self sharePlatType:SSDKPlatformTypeSinaWeibo userData:userData state:state error:error];
    }];
}

#pragma mark - 口令分享
- (void)commandShareWithModelView:(UIView *)modelView{
    NSDictionary *parameters = @{@"command":@"commandText",@"detail":@"国家卫健委：昨日新增确诊病例5例,其中本土2例在北京,其中本土2例在北京",@"account":@"小明"};
    
    [ShareSDK getCommandText:parameters withComplete:^(NSString * _Nullable text, NSError * _Nullable error, void (^ _Nullable complete)(NSString * _Nullable)) {
        NSString *command = [NSString stringWithFormat:@"【复制本段内容%@打开👉页面关键字👈去粘贴给好友】",text];
        if(!error){
            complete(command);
            
            MOBShareCommandAlertView *alertView = [[MOBShareCommandAlertView alloc]initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - 270) * 0.5, 125 + (self.isPhoneX ? 24 : 0), 270, 154)];
            [alertView showWithCommand:command modelView:modelView];
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                UIAlertControllerAlertCreate(@"分享失败", [NSString stringWithFormat:@"%@",error])
                .addCancelAction(@"确定")
                .showAnimated(YES)
                .present();
                
            });
        }
    }];

}

- (BOOL)isPhoneX{
    BOOL iPhoneX = NO;
    if (UIDevice.currentDevice.userInterfaceIdiom != UIUserInterfaceIdiomPhone) {
        return iPhoneX;
    }
    if (@available(iOS 11.0, *)) {
        UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
        if (mainWindow.safeAreaInsets.bottom > 0.0) {
            iPhoneX = YES;
        }
    }
    return iPhoneX;
}




- (void)authResponseStatus:(SSDKResponseState)state error:(NSError *)error{
    NSString *title = @"";
    NSString *message = @"";
    switch (state) {
        case SSDKResponseStateSuccess:
        {
            title = @"授权成功";
            break;
        }
        case SSDKResponseStateFail:
        {
            title = @"授权失败";
            message = [NSString stringWithFormat:@"%@", error];
            break;
        }
            break;
        case SSDKResponseStateCancel:
        {
            title = @"授权取消";
            break;
        }
        default:
            break;
    }
    UIAlertControllerAlertCreate(title, message)
    .addCancelAction(@"确认")
    .bindRecordWindow(@"key")
    .showAnimated(YES)
    .present();
}



- (void)sharePlatType:(SSDKPlatformType)type userData:(NSDictionary *)userData state:(SSDKResponseState)state error:(NSError *)error{
    
    NSString *title = @"";
    NSString *typeStr = @"";
    switch (state) {
        case SSDKResponseStateSuccess:
        {
            
            NSLog(@"分享成功");
            title = @"分享成功";
            typeStr = @"成功";
            break;
        }
        case SSDKResponseStateFail:
        {
            NSLog(@"---------------->share error :%@",error);
            title = @"分享失败";
            typeStr = [NSString stringWithFormat:@"%@",error];
            if (type == SSDKPlatformTypeGooglePlus)
            {
                typeStr = [NSString stringWithFormat:@"%@\n详情见google官方公告：%@",typeStr,@"https://support.google.com/plus/answer/9195133?hl=zh-Hans&authuser=0"];
                
            }
            break;
        }
        case SSDKResponseStateCancel:
        {
            title = @"分享已取消";
            
                id a = userData[SSDKShareUserDataHandleOpenObjectKey];
                if (a == nil) {
                    typeStr = @"ShareSDK 返回";
                }else{
                    typeStr = @"分享平台取消";
                }
            break;
        }
            case SSDKResponseStateUpload:
        {
            NSLog(@"上传中");
        }
            return;
        default:
            break;
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertControllerAlertCreate(title, typeStr)
        .addCancelAction(@"确定")
        .showAnimated(YES)
        .present();
        
    });
}


#pragma mark - 闭环分享 -

- (void)shareLink{
    MOBAboutMobLinkViewController *vc = [MOBAboutMobLinkViewController new];
    vc.showType(SSDKControllerShowTypeNavigationVC).push();
}


@end
