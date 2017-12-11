//
//  MOBMessengerViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 17/3/7.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBDropboxViewController.h"
#import "MOBLoadingViewController.h"
#import <ShareSDK/SSDKVideoUploadCenter.h>

@interface MOBDropboxViewController ()
{
    MOBLoadingViewController *loadingViewController;
    SSDKHttpServiceModel *httpServiceModel;
}

@end

@implementation MOBDropboxViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    platformType = SSDKPlatformTypeDropbox;
    self.title = @"Dropbox";
    shareIconArray = @[@"imageIcon",@"videoIcon"];
    shareTypeArray = @[@"图片",@"文件"];
    selectorNameArray = @[@"shareImage",@"shareFile"];
}


- (void)shareImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
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
                                                 temp = 0.95; //上传完后还需要进行发布
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
