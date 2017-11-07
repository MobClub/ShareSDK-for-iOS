//
//  MOBMessengerViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 17/3/7.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBYouTubeViewController.h"
#import "MOBLoadingViewController.h"
#import <ShareSDK/SSDKVideoUploadCenter.h>

@interface MOBYouTubeViewController ()
{
//    NSString *sessionId;
    
    MOBLoadingViewController *loadingViewController;
    SSDKHttpServiceModel *httpServiceModel;
}

@end

@implementation MOBYouTubeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    platformType = SSDKPlatformTypeYouTube;
    self.title = @"YouTube";
    shareIconArray = @[@"videoIcon",@"videoIcon"];
    shareTypeArray = @[@"视频",@"视频 上传进度"];
    selectorNameArray = @[@"shareVideo",@"shareVideoUploadProgress"];
}

- (NSMutableDictionary *)shareParameters
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //全平台通用设置
    [parameters SSDKSetupShareParamsByText:nil
                                    images:nil
                                       url:[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]
                                     title:nil
                                      type:SSDKContentTypeVideo];
    
    //平台定制
    
    //简单设置
    //    [parameters SSDKSetupYouTubeParamsByVideo:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]
    //                                        title:@"share SDK"
    //                                  description:@"share SDK video updata"
    //                                         tags:@[@"cool",@"cat"]
    //                                privacyStatus:SSDKPrivacyStatusPublic];
    
    
    /*
     //完全自定义
     NSDictionary *dic = @{
     @"snippet" : @{
     @"title" : @"My video title",
     @"description" : @"This is a description of my video",
     @"tags" : @[@"cool", @"video", @"more keywords"],
     @"categoryId" : @(20)
     },
     @"status" : @{
     @"privacyStatus" : @"public",
     @"license" : @"creativeCommon",
     }
     };
     NSData *jsonData = [NSJSONSerialization  dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
     NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
     
     //    @param parts 多个使用逗号隔开 例如 snippet,status  参考 https://developers.google.com/youtube/v3/docs/videos/insert#part
     //    @param jsonString Video resource 的 json数据  参考 https://developers.google.com/youtube/v3/docs/videos
     [parameters SSDKSetupYouTubeParamsByVideo:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]
     parts:@"snippet,status"
     jsonString:json];
     */
    return parameters;
}

- (void)shareVideo
{
    NSMutableDictionary *parameters = [self shareParameters];
    [self shareWithParameters:parameters];
    NSLog(@"开始上传");
}

//3.6.1-3.6.2 版本使用此方法
//#import <YouTubeConnector/ShareSDK+SSPYouTubeConnector.h>
//具有上传进度的上传调用方式
//- (void)shareVideoUploadProgress
//{
//    NSMutableDictionary *parameters = [self shareParameters];
//    sessionId = [ShareSDK share:platformType
//                     parameters:parameters
//               onUploadProgress:^(int64_t totalBytes, int64_t loadedBytes) {
//                   UITableViewCell *cell = [mobTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:1]];
//                   cell.detailTextLabel.text = [NSString stringWithFormat:@"%lld/%lld",loadedBytes,totalBytes];
//               } onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
//                   NSString *titel;
//                   switch (state) {
//                       case SSDKResponseStateSuccess:
//                       {
//                           titel = @"分享成功";
//                           break;
//                       }
//                       case SSDKResponseStateFail:
//                       {
//                           titel = @"分享失败";
//                           NSLog(@"error :%@",error);
//                           break;
//                       }
//                       case SSDKResponseStateCancel:
//                       {
//                           titel = @"分享已取消";
//                           break;
//                       }
//                       default:
//                           break;
//                   }
//                   UITableViewCell *cell = [mobTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:1]];
//                   cell.detailTextLabel.text = @"";
//                   [mobTableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationNone];
//                   UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:titel
//                                                                       message:nil
//                                                                      delegate:nil
//                                                             cancelButtonTitle:@"确定"
//                                                             otherButtonTitles:nil];
//                   [alertView show];
//               }];
//    //取消上传
////    [self performSelector:@selector(stopUpdata) withObject:nil afterDelay:2.5];
//}

//-(void)stopUpdata
//{
//    [ShareSDK stopUploadBySessionId:sessionId];
//}


// 3.6.3+
- (void)shareVideoUploadProgress
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
