//
//  AliPaySocialViewController.m
//  AGShareSDKDemo
//
//  Created by chenjd on 15/7/30.
//  Copyright (c) 2015年 vimfung. All rights reserved.
//

#import "AliPaySocialViewController.h"
#import "AGAppDelegate.h"
#import <AGCommon/UINavigationBar+Common.h>
#import <AGCommon/UIImage+Common.h>
#import <AGCommon/UIDevice+Common.h>
#import <AGCommon/NSString+Common.h>

#import <ShareSDK/ShareSDK.h>

@interface AliPaySocialViewController ()

@property (nonatomic, assign)BOOL isPro;
@property (nonatomic ,assign)CGFloat PWidth;
@property (nonatomic ,assign)CGFloat LWidth;

@end

@implementation AliPaySocialViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    self.PWidth = [UIScreen mainScreen].bounds.size.width;
    self.LWidth = [UIScreen mainScreen].bounds.size.height;
    UIButton *leftBtn = [[[UIButton alloc] init] autorelease];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"Common/NavigationButtonBG.png" bundleName:BUNDLE_NAME]
                       forState:UIControlStateNormal];
    [leftBtn setImage:[UIImage imageNamed:@"LeftSideViewIcon.png"] forState:UIControlStateNormal];
    leftBtn.frame = CGRectMake(0.0, 0.0, 53.0, 30.0);
    [leftBtn addTarget:self action:@selector(leftButtonClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:leftBtn] autorelease];

    if ([UIDevice currentDevice].isPad || [[UIDevice currentDevice].systemVersion versionStringCompare:@"7.0"] != NSOrderedAscending)
    {
        UILabel *label = [[UILabel alloc] init];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor whiteColor];
        label.shadowColor = [UIColor grayColor];
        label.font = [UIFont systemFontOfSize:22];
        self.navigationItem.titleView = label;
        [label release];
    }
    self.title = NSLocalizedString(@"TEXT_ALIPAY", @"支付宝好友");
   
}

- (void)setTitle:(NSString *)title
{
    [super setTitle:title];
    
    ((UILabel *)self.navigationItem.titleView).text = title;
    [self.navigationItem.titleView sizeToFit];
}
- (void)leftButtonClickHandler:(id)sender
{
    [self.viewDeckController toggleLeftViewAnimated:YES];
}

-(void)setButtons
{
 
    CGFloat screenW ;
    
    if (self.isPro) {
        screenW = self.PWidth;
    }else{
        screenW = self.LWidth;
    }
    
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 64, screenW, 60)];
    [view setBackgroundColor:[UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1.0]];
    [self.view addSubview:view];
    
    UIImageView* imageView = [[UIImageView alloc]initWithFrame:CGRectMake(screenW/2 - 30, 0 , 60, 60)];
    UIImage* img = [UIImage imageNamed:@"Icon_7/sns_icon_50.png" bundleName:BUNDLE_NAME];
    [imageView setImage:img];
    [view addSubview:imageView];
    [imageView release];
    [view release];
    UIButton * shareBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    shareBtn.frame = CGRectMake(0, 164, screenW, 40);
    [shareBtn setBackgroundColor:[UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1.0]];
    [shareBtn setTitle:NSLocalizedString(@"TEXT_ALIPAY_SHARE_TEXT", @"支付宝好友分享文字") forState:UIControlStateNormal];
    [shareBtn addTarget:self action:@selector(shareText:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:shareBtn];
    
    shareBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    shareBtn.frame = CGRectMake(0, 214, screenW, 40);
    [shareBtn setBackgroundColor:[UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1.0]];
    [shareBtn setTitle:NSLocalizedString(@"TEXT_ALIPAY_SHARE_IMAGE", @"支付宝好友分享图片") forState:UIControlStateNormal];
    [shareBtn addTarget:self action:@selector(shareImg:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:shareBtn];
    
    shareBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    shareBtn.frame = CGRectMake(0, 264, screenW, 40);
    [shareBtn setBackgroundColor:[UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1.0]];
    [shareBtn setTitle:NSLocalizedString(@"TEXT_ALIPAY_SHARE_WEBPAGE", @"支付宝好友分享链接") forState:UIControlStateNormal];
    [shareBtn addTarget:self action:@selector(shareWebpage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:shareBtn];
   
}
#pragma mark - Private

- (void)layoutPortrait
{
    self.isPro = YES;
    UIButton *btn = (UIButton *)self.navigationItem.leftBarButtonItem.customView;
    btn.frame = CGRectMake(btn.left, btn.top, 55.0, 32.0);
    [btn setBackgroundImage:[UIImage imageNamed:@"Common/NavigationButtonBG.png"
                                     bundleName:BUNDLE_NAME]
                   forState:UIControlStateNormal];
    
    if ([UIDevice currentDevice].isPad)
    {
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"iPadNavigationBarBG.png"]];
    }
    else
    {
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"iPhoneNavigationBarBG.png"]];
    }
    [self.view removeAllSubviews];
    [self setButtons];
}

- (void)layoutLandscape
{
    self.isPro = NO;
    if (![UIDevice currentDevice].isPad)
    {
        //iPhone
        UIButton *btn = (UIButton *)self.navigationItem.leftBarButtonItem.customView;
        btn.frame = CGRectMake(btn.left, btn.top, 48.0, 24.0);
        [btn setBackgroundImage:[UIImage imageNamed:@"Common_Landscape/NavigationButtonBG.png"
                                         bundleName:BUNDLE_NAME]
                       forState:UIControlStateNormal];
        
        if ([[UIDevice currentDevice] isPhone5])
        {
            [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"iPhoneLandscapeNavigationBarBG-568h.png"
                                                                                 bundleName:BUNDLE_NAME]];
        }
        else
        {
            [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"iPhoneLandscapeNavigationBarBG.png"]];
        }
    }
    else
    {
        UIButton *btn = (UIButton *)self.navigationItem.leftBarButtonItem.customView;
        btn.frame = CGRectMake(btn.left, btn.top, 55.0, 32.0);
        [btn setBackgroundImage:[UIImage imageNamed:@"Common/NavigationButtonBG.png"
                                         bundleName:BUNDLE_NAME]
                       forState:UIControlStateNormal];
        
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"iPadLandscapeNavigationBarBG.png"]];
    }
    
    [self.view removeAllSubviews];
    [self setButtons];
}

- (void)layoutView:(UIInterfaceOrientation)orientation
{
    if (UIInterfaceOrientationIsLandscape(orientation))
    {
        [self layoutLandscape];
    }
    else
    {
        [self layoutPortrait];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.view.backgroundColor = [UIColor whiteColor];
    [self layoutView:self.interfaceOrientation];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

-(BOOL)shouldAutorotate
{
    //iOS6下旋屏方法
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    //iOS6下旋屏方法
    return SSInterfaceOrientationMaskAll;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self layoutView:toInterfaceOrientation];
}

-(void)shareText:(id)sender
{
    
    id<ISSContent> content = [ShareSDK content:@"支付宝文字分享||AliPay Text Share " defaultContent:nil image:nil title:@"title" url:@"http://mob.com" description:nil mediaType:SSPublishContentMediaTypeText];
    
    [ShareSDK shareContent:content
                      type:ShareTypeAliPaySocial
               authOptions:nil
              shareOptions:nil
             statusBarTips:YES
                    result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end)
    {
        if (state == SSResponseStateSuccess)
        {
            NSLog(NSLocalizedString(@"TEXT_ShARE_SUC", @"分享成功"));
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                                message:NSLocalizedString(@"TEXT_ShARE_SUC", @"分享成功")
                                                               delegate:nil
                                                      cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                      otherButtonTitles:nil];
            [alertView show];
            [alertView release];
        }
        else if (state == SSResponseStateFail)
        {
            NSLog(NSLocalizedString(@"TEXT_ShARE_FAI", @"分享失败,错误码:%d,错误描述:%@"), [error errorCode], [error errorDescription]);
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                                message:[NSString stringWithFormat:NSLocalizedString(@"TEXT_ShARE_FAI", @"分享失败,错误码:%d,错误描述:%@"), [error errorCode], [error errorDescription]]
                                                               delegate:nil
                                                      cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                      otherButtonTitles:nil];
            [alertView show];
            [alertView release];
        }

    }];
    
    
}

-(void)shareImg:(id)sender
{
    id<ISSContent> content = [ShareSDK content:@"支付宝链接图片||AliPay Image Share "
                                defaultContent:nil
                                         image: [ShareSDK imageWithUrl:@"http://img.taopic.com/uploads/allimg/130501/240451-13050106450911.jpg"]
                                         title:@"这是标题|This is title"
                                           url:@"http://mob.com"
                                   description:nil mediaType:SSPublishContentMediaTypeImage];
    
    
    [ShareSDK shareContent:content
                      type:ShareTypeAliPaySocial
               authOptions:nil
              shareOptions:nil
             statusBarTips:YES
                    result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                        
                        
                        if (state == SSResponseStateSuccess)
                        {
                            NSLog(NSLocalizedString(@"TEXT_ShARE_SUC", @"分享成功"));
                            
                            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                                                message:NSLocalizedString(@"TEXT_ShARE_SUC", @"分享成功")
                                                                               delegate:nil
                                                                      cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                                      otherButtonTitles:nil];
                            [alertView show];
                            [alertView release];
                        }
                        else if (state == SSResponseStateFail)
                        {
                            NSLog(NSLocalizedString(@"TEXT_ShARE_FAI", @"分享失败,错误码:%d,错误描述:%@"), [error errorCode], [error errorDescription]);
                            
                            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                                                message:[NSString stringWithFormat:NSLocalizedString(@"TEXT_ShARE_FAI", @"分享失败,错误码:%d,错误描述:%@"), [error errorCode], [error errorDescription]]
                                                                               delegate:nil
                                                                      cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                                      otherButtonTitles:nil];
                            [alertView show];
                            [alertView release];
                        }
                        
                    }];

}

-(void)shareWebpage:(id)sender
{

    NSString* path = [[NSBundle mainBundle]pathForResource:@"res1thumb" ofType:@"png"];
    
    id<ISSContent> content = [ShareSDK content:@"支付宝链接分享||AliPay Webpage Share "
                                defaultContent:nil
                                         image: [ShareSDK imageWithPath:path]
                                         title:@"这是标题|This is title"
                                           url:@"http://mob.com"
                                   description:nil mediaType:SSPublishContentMediaTypeNews];
    
    [ShareSDK shareContent:content
                      type:ShareTypeAliPaySocial
               authOptions:nil
              shareOptions:nil
             statusBarTips:YES
                    result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
        
        
        if (state == SSResponseStateSuccess)
        {
            NSLog(NSLocalizedString(@"TEXT_ShARE_SUC", @"分享成功"));
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                                message:NSLocalizedString(@"TEXT_ShARE_SUC", @"分享成功")
                                                               delegate:nil
                                                      cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                      otherButtonTitles:nil];
            [alertView show];
            [alertView release];
        }
        else if (state == SSResponseStateFail)
        {
            NSLog(NSLocalizedString(@"TEXT_ShARE_FAI", @"分享失败,错误码:%d,错误描述:%@"), [error errorCode], [error errorDescription]);
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                                message:[NSString stringWithFormat:NSLocalizedString(@"TEXT_ShARE_FAI", @"分享失败,错误码:%d,错误描述:%@"), [error errorCode], [error errorDescription]]
                                                               delegate:nil
                                                      cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                      otherButtonTitles:nil];
            [alertView show];
            [alertView release];
        }
        
    }];

}

@end
