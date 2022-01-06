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

- (void)setup {
    SSDKWEAK
    [self addListItemWithImage:MOBApplicationShareIcon name:@"系统分享-单图" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareImageBySystem];
    }];
    [self addListItemWithImage:MOBApplicationShareIcon name:@"系统分享-文件(视频/其他格式文件）" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareFileBySystem];
    }];
}

- (void)shareImageBySystem
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    //系统分享单图功能，支持本地图片和网络图片，不支持多图，如果传多个图片，会分享第一个图片资源
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]]
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    [self shareByActivityWithParameters:parameters];
}

- (void)shareFileBySystem
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    //系统分享视频/其他格式文件功能，只支持本地资源
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:nil
                                       url:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]
                                     title:nil
                                      type:SSDKContentTypeFile];
    [self shareByActivityWithParameters:parameters];
}

- (void)shareImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"];
    [parameters SSDKSetupDropboxParamsByAttachment:[NSURL fileURLWithPath:filePath]];
    
    [self shareWithParameters:parameters];
}

- (void)shareFile
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"];

    //无SDK分享方式
    [parameters SSDKSetupDropboxParamsByAttachment:[NSURL fileURLWithPath:filePath]];
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
                                             .present();
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
