//
//  MOBMessengerViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 17/3/7.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBTwitterViewController.h"
#import "MOBLoadingViewController.h"
#import <ShareSDK/SSDKVideoUploadCenter.h>

@interface MOBTwitterViewController ()
{
    MOBLoadingViewController *loadingViewController;
    SSDKHttpServiceModel *httpServiceModel;
}
@end

@implementation MOBTwitterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    platformType = SSDKPlatformTypeTwitter;
    self.title = @"Twitter";
    shareIconArray = @[@"textIcon",@"textAndImageIcon",@"videoIcon",@"videoIcon"];
    shareTypeArray = @[@"文字",@"文字+图片",@"文字+视频",@"文字+视频 进度"];
    selectorNameArray = @[@"shareText",@"shareImage",@"shareVideo",@"shareVideoProgress"];
}

/**
 授权
 */
- (void)authAct
{
    [super authAct];
}

/**
 分享文字
 */
-(void)shareText
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:[NSString stringWithFormat:@"Share SDK %0.0f",[[NSDate date] timeIntervalSince1970]]
                                    images:nil
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeText];
    //平台定制
//    [parameters SSDKSetupTwitterParamsByText:@"Share SDK"
//                                      images:nil
//                                    latitude:0
//                                   longitude:0
//                                        type:SSDKContentTypeText];
    [self shareWithParameters:parameters];
}

/**
 分享图片
 */
- (void)shareImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //图片最多4张 GIF只能1张
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"];
    NSString *path2 = [[NSBundle mainBundle] pathForResource:@"D11" ofType:@"jpg"];
    NSString *path3 = [[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"];
//    NSString *path4 = [[NSBundle mainBundle] pathForResource:@"res6" ofType:@"gif"];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                    images:@[path1,path2,path3]
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    //平台定制
//        [parameters SSDKSetupTwitterParamsByText:@"Share SDK"
//                                          images:path4
//                                        latitude:0
//                                       longitude:0
//                                            type:SSDKContentTypeImage];
    [self shareWithParameters:parameters];
}

- (void)shareVideo
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                    images:nil
                                       url:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]
                                     title:nil
                                      type:SSDKContentTypeVideo];
    //平台定制
//    [parameters SSDKSetupTwitterParamsByText:@"Share SDK"
//                                       video:[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]
//                                    latitude:0
//                                   longitude:0
//                                         tag:@"Twitter_0001"];
    
    [self shareWithParameters:parameters];
}

- (void)shareVideoProgress
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"];
    [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                    images:nil
                                       url:[NSURL fileURLWithPath:filePath]
                                     title:nil
                                      type:SSDKContentTypeVideo];
    //平台定制
    //    [parameters SSDKSetupTwitterParamsByText:@"Share SDK"
    //                                       video:[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]
    //                                    latitude:0
    //                                   longitude:0
    //                                         tag:@"Twitter_0001"];
    __weak __typeof__ (self) weakSelf = self;
    [ShareSDK share:platformType
         parameters:parameters
     onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
         NSString *titel = @"";
         switch (state) {
             case SSDKResponseStateBeginUPLoad:
             {
                 httpServiceModel = [[SSDKVideoUploadCenter shareInstance]
                                     uploadProgressWithPlatformType:platformType
                                     fileURL:[NSURL URLWithString:filePath]
                                     tag:nil
                                     progressEvent:^(int64_t totalBytes, int64_t loadedBytes) {
                                         if(loadingViewController != nil)
                                         {
                                             CGFloat temp =  loadedBytes*1.0/totalBytes;
                                             if(temp > 0.95)
                                             {
                                                 temp = 0.95; //上传完后还需要进行文字+视频的发布
                                             }
                                             if(temp > loadingViewController.progressView.progress )
                                             {
                                                 [loadingViewController.progressView setProgress:temp animated:YES];
                                             }
                                         }
                                     }];
                 [weakSelf showLoading];
                 break;
             }
             case SSDKResponseStateSuccess:
             {
                 titel = @"分享成功";
                 break;
             }
             case SSDKResponseStateFail:
             {
                 titel = @"分享失败";
                 NSLog(@"error :%@",error);
                 break;
             }
             case SSDKResponseStateCancel:
             {
                 titel = @"分享已取消";
                 break;
             }
             default:
                 break;
         }
         if(state != SSDKResponseStateBeginUPLoad)
         {
             if(state == SSDKResponseStateSuccess || state == SSDKResponseStateFail)
             {
                 [loadingViewController.progressView setProgress:1 animated:YES];
                 [loadingViewController closeAct:nil];
             }
             [mobTableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationNone];
             UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:titel
                                                                 message:nil
                                                                delegate:nil
                                                       cancelButtonTitle:@"确定"
                                                       otherButtonTitles:nil];
             [alertView show];
         }
     }];
}

-(void)showLoading
{
    if(loadingViewController == nil)
    {
        loadingViewController = [[MOBLoadingViewController alloc] initWithNibName:@"MOBLoadingViewController" bundle:nil];
        loadingViewController.view.frame = [UIScreen mainScreen].bounds;
    }
    loadingViewController.httpServiceModel = httpServiceModel;
    [self.navigationController.view addSubview:loadingViewController.view];
    loadingViewController.view.alpha = 0;
    [UIView animateWithDuration:0.25 animations:^{
        loadingViewController.view.alpha = 1;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
