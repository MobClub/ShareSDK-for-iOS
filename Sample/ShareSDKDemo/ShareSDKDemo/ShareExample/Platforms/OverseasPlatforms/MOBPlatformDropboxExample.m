//
//  MOBPlatformDropboxExample.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/20.
//  Copyright © 2019 mob. All rights reserved.
//  文档地址:https://www.mob.com/wiki/detailed?wiki=ShareSDK_chanpinjianjie&id=14

#import "MOBPlatformDropboxExample.h"
#import "MOBLoadingViewController.h"

@implementation MOBPlatformDropboxExample
{
    MOBLoadingViewController *loadingViewController;
    //    SSDKHttpServiceModel *httpServiceModel;
}
+ (SSDKPlatformType)platformType{
    return SSDKPlatformTypeDropbox;
}


- (void)shareImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:SHARESDKDEMO_IMAGE_LOCALPATH
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    //平台定制
    //    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"];
    //    [parameters SSDKSetupDropboxParamsByAttachment:[NSURL fileURLWithPath:filePath]];
    [self shareWithParameters:parameters];
}

- (void)shareFile
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"];
    [parameters SSDKSetupDropboxParamsByAttachment:[NSURL fileURLWithPath:filePath]];
    //平台定制
    //    parameters = [self shareParameters];
    __weak __typeof__ (self) weakSelf = self;
    loadingViewController.session = [ShareSDK share:self.platformType
                                         parameters:parameters
                                     onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
                                         NSString *title = @"";
                                         switch (state) {
                                             case SSDKResponseStateUpload:
                                             {
                                                 SSDKUploadState state = [userData[@"progressInfo"][@"state"] integerValue];
                                                 
                                                 switch (state)
                                                 {
                                                     case SSDKUploadStateBegin:
                                                     [weakSelf showLoading];
                                                     break;
                                                     
                                                     case SSDKUploadStateUploading:
                                                     {
                                                         unsigned long long totalBytes = [userData[@"progressInfo"][@"totalBytes"] unsignedLongLongValue];
                                                         unsigned long long loadedBytes = [userData[@"progressInfo"][@"loadedBytes"] unsignedLongLongValue];
                                                         
                                                         CGFloat temp =  loadedBytes*1.0/totalBytes;
                                                         
                                                         if(temp > loadingViewController.progressView.progress )
                                                         {
                                                             [loadingViewController.progressView setProgress:temp animated:YES];
                                                         }
                                                     }
                                                     break;
                                                     
                                                     case SSDKUploadStateFinish:
                                                     {
                                                         [loadingViewController.progressView setProgress:1 animated:YES];
                                                         [loadingViewController hidden];
                                                     }
                                                     break;
                                                     
                                                     default:
                                                     break;
                                                 }
                                                 break;
                                             }
                                             case SSDKResponseStateSuccess:
                                             {
                                                 title = @"分享成功";
                                                 break;
                                             }
                                             case SSDKResponseStateFail:
                                             {
                                                 title = @"分享失败";
                                                 break;
                                             }
                                             case SSDKResponseStateCancel:
                                             {
                                                 title = @"分享已取消";
                                                 break;
                                             }
                                             default:
                                             break;
                                         }
                                         if(state != SSDKResponseStateUpload)
                                         {
                                             [loadingViewController hidden];
                                            
                                             UIAlertControllerAlertCreate(title, nil)
                                             .addCancelAction(@"确定")
                                             .show();
                                         }
                                     }];
}

-(void)showLoading
{
    [UIApplication.currentToNavgationController.view addSubview:loadingViewController.view];
    loadingViewController.view.alpha = 0;
    [UIView animateWithDuration:0.25 animations:^{
        loadingViewController.view.alpha = 1;
    }];
}


@end
