//
//  MOBMessengerViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 17/3/7.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBFacebookViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "MOBLoadingViewController.h"
#import <ShareSDK/SSDKVideoUploadCenter.h>

@interface MOBFacebookViewController ()
{
    NSString *sessionId;
    
    MOBLoadingViewController *loadingViewController;
    SSDKHttpServiceModel *httpServiceModel;
}

@end

@implementation MOBFacebookViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    platformType = SSDKPlatformTypeFacebook;
    self.title = @"Facebook";
    shareIconArray = @[@"textIcon",@"textAndImageIcon",@"webURLIcon",@"mutImageIcon",@"webURLIcon",@"videoURLIcon",@"videoIcon",@"webURLIcon"];
    shareTypeArray = @[@"文字 应用内",@"图片+文字 应用内",@"链接 应用内",@"多图 APP",@"链接 APP",@"相册视频 APP",@"视频 应用内",@"应用邀请 应用内"];
    selectorNameArray = @[@"shareText",@"shareImage",@"shareLink",@"shareImages",@"shareLinkToAPP",@"shareAssetVideo",@"shareVideoByAPI",@"shareApp"];
}

/**
 分享文字
 */
-(void)shareText
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                    images:nil
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeText];
    //平台定制
//    [parameters SSDKSetupFacebookParamsByText:@"Share SDK"
//                                        image:nil
//                                          url:nil
//                                     urlTitle:nil
//                                      urlName:nil
//                               attachementUrl:nil
//                                         type:SSDKContentTypeText];
    [self shareWithParameters:parameters];
}

/**
 分享图片
 */
- (void)shareImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:nil
                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    //平台定制
//    [parameters SSDKSetupFacebookParamsByText:@"Share SDK"
//                                        image:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
//                                          url:nil
//                                     urlTitle:nil
//                                      urlName:nil
//                               attachementUrl:nil
//                                         type:SSDKContentTypeImage];
    [self shareWithParameters:parameters];
}

- (void)shareLink
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    //图片必须为网络图片
    [parameters SSDKSetupShareParamsByText:@"Share SDK Link Desc"
                                    images:@"http://ww4.sinaimg.cn/bmiddle/005Q8xv4gw1evlkov50xuj30go0a6mz3.jpg"
                                       url:[NSURL URLWithString:@"https://www.mob.com"]
                                     title:@"Share SDK"
                                      type:SSDKContentTypeWebPage];
    //平台定制
        [parameters SSDKSetupFacebookParamsByText:@"Share SDK Link Desc"
                                            image:@"http://ww4.sinaimg.cn/bmiddle/005Q8xv4gw1evlkov50xuj30go0a6mz3.jpg"
                                              url:[NSURL URLWithString:@"https://www.mob.com"]
                                         urlTitle:@"Share SDK"
                                          urlName:nil
                                   attachementUrl:nil
                                             type:SSDKContentTypeWebPage];
    
    [self shareWithParameters:parameters];
}

- (void)shareLinkToAPP
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //图片必须为网络图片
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:@"Share SDK Link Desc"
                                    images:@"http://ww4.sinaimg.cn/bmiddle/005Q8xv4gw1evlkov50xuj30go0a6mz3.jpg"
                                       url:[NSURL URLWithString:@"https://www.mob.com"]
                                     title:@"Share SDK"
                                      type:SSDKContentTypeWebPage];
    //平台定制
//    [parameters SSDKSetupFacebookParamsByText:@"Share SDK Link Desc"
//                                        image:@"http://weixintest.ihk.cn/ihkwx_upload/heji/material/img/20160414/1460616012469.jpg"
//                                          url:[NSURL URLWithString:@"http://www.mob.com"]
//                                     urlTitle:@"Share SDK"
//                                      urlName:nil
//                               attachementUrl:nil
//                                         type:SSDKContentTypeWebPage];
    [parameters SSDKEnableUseClientShare];
    
    [self shareWithParameters:parameters];
}

- (void)shareImages
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"];
    NSString *path2 = [[NSBundle mainBundle] pathForResource:@"D11" ofType:@"jpg"];
    NSString *path3 = [[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"];
    NSString *path4 = [[NSBundle mainBundle] pathForResource:@"shareImg" ofType:@"png"];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:nil
                                    images:@[path1,path2,path3,path4]
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    //平台定制
//    [parameters SSDKSetupFacebookParamsByText:nil
//                                        image:@[path1,path2,path3,path4]
//                                          url:nil
//                                     urlTitle:nil
//                                      urlName:nil
//                               attachementUrl:nil
//                                         type:SSDKContentTypeImage];
    
    [parameters SSDKEnableUseClientShare];
    
    [self shareWithParameters:parameters];
}

- (void)shareAssetVideo
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"];
    NSURL *url = [NSURL URLWithString:path];
    ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
    __weak __typeof__ (self) weakSelf = self;
    [assetsLibrary writeVideoAtPathToSavedPhotosAlbum:url completionBlock:^(NSURL *assetURL, NSError *error) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:nil
                                        images:nil
                                           url:assetURL
                                         title:nil
                                          type:SSDKContentTypeVideo];
        //平台定制
//         [parameters SSDKSetupFacebookParamsByText:nil
//                                             image:nil
//                                               url:assetURL
//                                          urlTitle:nil
//                                           urlName:nil
//                                    attachementUrl:nil
//                                              type:SSDKContentTypeVideo];
        
        [weakSelf shareWithParameters:parameters];
    }];
}

- (void)shareVideoByAPI
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
    //         [parameters SSDKSetupFacebookParamsByText:nil
    //                                             image:nil
    //                                               url:assetURL
    //                                          urlTitle:nil
    //                                           urlName:nil
    //                                    attachementUrl:nil
    //                                              type:SSDKContentTypeVideo];
    
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
                                         NSLog(@"%ld %ld",(long)totalBytes, (long)loadedBytes);
                                         NSLog(@"%f",loadedBytes*1.0/totalBytes);
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

- (void)shareApp
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params SSDKSetupFacebookParamsByText:nil
                                    image:@"http://www.mob.com/public/images/logo_black.png"
                                      url:[NSURL URLWithString:@"https://fb.me/1492137904189216"]
                                 urlTitle:nil
                                  urlName:nil
                           attachementUrl:nil
                                     type:SSDKContentTypeApp];
//    [parameters SSDKEnableUseClientShare];
    
    [self shareWithParameters:params];
}
@end
