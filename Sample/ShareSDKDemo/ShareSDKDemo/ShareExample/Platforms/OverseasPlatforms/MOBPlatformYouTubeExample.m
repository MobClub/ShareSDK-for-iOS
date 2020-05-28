//
//  MOBPlatformYouTubeExample.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/20.
//  Copyright © 2019 mob. All rights reserved.
//  文档地址:https://www.mob.com/wiki/detailed?wiki=ShareSDK_chanpinjianjie&id=14

#import "MOBPlatformYouTubeExample.h"
#import "MOBLoadingViewController.h"
@implementation MOBPlatformYouTubeExample{
    MOBLoadingViewController *loadingViewController;
}
+ (SSDKPlatformType)platformType{
    return SSDKPlatformTypeYouTube;
}

- (void)setup{
    loadingViewController = [[MOBLoadingViewController alloc] initWithNibName:@"MOBLoadingViewController" bundle:nil];
    loadingViewController.view.frame = [SSDKScenePackage mainBounds];
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
    if ([ShareSDK hasAuthorized:SSDKPlatformTypeYouTube]) {
        NSMutableDictionary *parameters = [self shareParameters];
        [self shareWithParameters:parameters];
        NSLog(@"开始上传");
    }else{
        [ShareSDK authorize:SSDKPlatformTypeYouTube settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
            if (state == SSDKResponseStateSuccess) {
                NSMutableDictionary *parameters = [self shareParameters];
                [self shareWithParameters:parameters];
                NSLog(@"开始上传");
            }else{
                [[MOBShareExample defaultExample] sharePlatType:self.platformType state:state error:error];
            }
        }];
    }

   
    
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
//                   NSString *title;
//                   switch (state) {
//                       case SSDKResponseStateSuccess:
//                       {
//                           title = @"分享成功";
//                           break;
//                       }
//                       case SSDKResponseStateFail:
//                       {
//                           title = @"分享失败";
//                           NSLog(@"error :%@",error);
//                           break;
//                       }
//                       case SSDKResponseStateCancel:
//                       {
//                           title = @"分享已取消";
//                           break;
//                       }
//                       default:
//                           break;
//                   }
//                   UITableViewCell *cell = [mobTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:1]];
//                   cell.detailTextLabel.text = @"";
//                   [mobTableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationNone];
//                   UIAlertControllerAlertCreate(title, nil)
//                   .addCancelAction(@"确定", 0)
//                   .showFromViewController(self);
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
                                                 NSLog(@"error :%@",error);
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
                                            
                                             UIAlertControllerAlertCreate(title,nil)
                                             .addCancelAction(@"确定")
                                             .present();
                                         }
                                     }];
}

-(void)showLoading
{
    [[UIApplication currentToNavgationController].view addSubview:loadingViewController.view];
    loadingViewController.view.alpha = 0;
    [UIView animateWithDuration:0.25 animations:^{
        loadingViewController.view.alpha = 1;
    }];
}





@end
