//
//  MOBAboutLinkCardViewController.m
//  ShareSDKDemo
//
//  Created by wkx on 2019/4/1.
//  Copyright © 2019年 mob. All rights reserved.
//

#import "MOBAboutLinkCardViewController.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKUI/ShareSDKUI.h>

@interface MOBAboutLinkCardViewController ()

@end

@implementation MOBAboutLinkCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self navBarSetup];
}

- (void)navBarSetup
{
    UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 22, 44)];
    [rightBtn setImage:[UIImage imageNamed:@"linkcard_share"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(shareOnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)shareOnClick:(UIButton *)btn
{
    NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
    NSArray* imageArray = @[[[NSBundle mainBundle] pathForResource:@"linkcard_expanded" ofType:@"jpg"]];
    [shareParams SSDKSetupShareParamsByText:@"Linkcard 重磅上线！错过它，就错过了全世界~ "
                                     images:imageArray
                                        url:[NSURL URLWithString:@"https://www.mob.com"]
                                      title:@"ShareSDK&Sina"
                                       type:SSDKContentTypeImage];
    NSArray *items = nil;
    SSUIShareSheetConfiguration *config = [[SSUIShareSheetConfiguration alloc] init];
    
    [ShareSDK showShareActionSheet:nil
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
         
         switch (state) {
                 
             case SSDKResponseStateBegin:
             {
                 //设置UI等操作
                 break;
             }
             case SSDKResponseStateSuccess:
             {
                 //Instagram、Line等平台捕获不到分享成功或失败的状态，最合适的方式就是对这些平台区别对待
                 if (platformType == SSDKPlatformTypeInstagram)
                 {
                     break;
                 }
                 
                 
                 UIAlertControllerAlertCreate(@"分享成功", [NSString stringWithFormat:@"%@",error])
                 .addCancelAction(@"确定", 0)
                 .showFromViewController(self);
                 break;
             }
             case SSDKResponseStateFail:
             {
                 NSLog(@"%@",error);
                 UIAlertControllerAlertCreate(@"分享失败", [NSString stringWithFormat:@"%@",error])
                 .addCancelAction(@"OK", 0)
                 .showFromViewController(self);
                 break;
             }
             case SSDKResponseStateCancel:
             {
                 UIAlertControllerAlertCreate(@"分享已取消", nil)
                 .addCancelAction(@"确定", 0)
                 .showFromViewController(self);
                 break;
             }
             default:
                 break;
         }
     }];
}

- (IBAction)normalOnClick:(id)sender
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:@"分享了一个链接"
                                    images:[UIImage imageNamed:@"COD13.jpg"]
                                       url:[NSURL URLWithString:@"http://www.mob.com"]
                                     title:@"我是title"
                                      type:SSDKContentTypeWebPage];
    
    [self shareWithParameters:parameters];
}

- (IBAction)linkCardOnClick:(id)sender
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupSinaWeiboLinkCardShareParamsByText:@"ShareSDK新功能"
                                                  cardTitle:@"ShareSDK&Sina"
                                                cardSummary:@"ShareSDK现在支持新浪微博Linkcard功能啦！"
                                                     images:@"http://www.mob.com/assets/images/ShareSDK_pic_1-09d293a6.png"
                                                        url:[NSURL URLWithString:@"http://www.mob.com"]];
     [self shareWithParameters:parameters];
}


- (void)shareWithParameters:(NSMutableDictionary *)parameters
{
    if(parameters.count == 0){
       
        UIAlertControllerAlertCreate(@"请先设置分享参数", nil)
        .addCancelAction(@"取消", 0)
        .showFromViewController(self);
        return;
    }
    [ShareSDK share:SSDKPlatformTypeSinaWeibo
         parameters:parameters
     onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
         if(state == SSDKResponseStateUpload){
             return ;
         }
         NSString *title = @"";
         NSString *typeStr = @"";
         UIColor *typeColor = [UIColor grayColor];
         switch (state) {
             case SSDKResponseStateSuccess:
             {
                 NSLog(@"分享成功");
                 title = @"分享成功";
                 typeStr = @"成功";
                 typeColor = [UIColor blueColor];
                 break;
             }
             case SSDKResponseStateFail:
             {
                 NSLog(@"---------------->share error :%@",error);
                 title = @"分享失败";
                 typeStr = [NSString stringWithFormat:@"%@",error];
                 typeColor = [UIColor redColor];
                 break;
             }
             case SSDKResponseStateCancel:
             {
                 title = @"分享已取消";
                 typeStr = @"取消";
                 break;
             }
             default:
                 break;
         }
        
        UIAlertControllerAlertCreate(title, typeStr)
        .addCancelAction(@"确定", 0)
        .showFromViewController(self);
     }];
}

@end
