//
//  MOBAboutMobLinkViewController.m
//  ShareSDKDemo
//
//  Created by wkx on 2019/6/20.
//  Copyright © 2019年 mob. All rights reserved.
//

#import "MOBAboutMobLinkViewController.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKExtension/UIViewController+SSERestoreScene.h>

@interface MOBAboutMobLinkViewController ()

@property(nonatomic, strong) SSERestoreScene *scene;

@end

@implementation MOBAboutMobLinkViewController

- (instancetype) initWithShareSDKScene:(SSERestoreScene *)scene
{
    if (self = [super init])
    {
        self.scene = scene;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"闭环分享";
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
    btn.userInteractionEnabled = NO;
    NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
    NSArray* imageArray = @[[[NSBundle mainBundle] pathForResource:@"moblink_ext" ofType:@"jpg"]];
    [shareParams SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                     images:imageArray
                                        url:[NSURL URLWithString:@"http://m.93lj.com/sharelink?mobid=ziqMNf"]
                                      title:@"ShareSDK助你一键实现闭环分享"
                                       type:SSDKContentTypeWebPage];
    
    [ShareSDK share:SSDKPlatformSubTypeWechatTimeline parameters:shareParams onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
        btn.userInteractionEnabled = YES;
         switch (state) {
                 
             case SSDKResponseStateBegin:
             {
                 break;
             }
             case SSDKResponseStateSuccess:
             {
                 UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享成功"
                                                                     message:nil
                                                                    delegate:nil
                                                           cancelButtonTitle:@"确定"
                                                           otherButtonTitles:nil];
                 [alertView show];
                 break;
             }
             case SSDKResponseStateFail:
             {
                 NSLog(@"%@",error);
                 UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享失败"
                                                                 message:[NSString stringWithFormat:@"%@",error]
                                                                delegate:nil
                                                       cancelButtonTitle:@"OK"
                                                       otherButtonTitles:nil, nil];
                 [alert show];
                 break;
             }
             case SSDKResponseStateCancel:
             {
                 UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享已取消"
                                                                     message:nil
                                                                    delegate:nil
                                                           cancelButtonTitle:@"确定"
                                                           otherButtonTitles:nil];
                 [alertView show];
                 break;
             }
             default:
                 break;
         }
     }];
}

@end
