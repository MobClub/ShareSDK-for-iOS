//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import "AGSinaWeiboViewController.h"
#import "AGSinaWeiboListViewController.h"
#import <AGCommon/UIDevice+Common.h>
#import <AGCommon/UIImage+Common.h>
#import <AGCommon/UINavigationBar+Common.h>
#import "IIViewDeckController.h"
#import "AGSinaWeiboFriendsViewController.h"
#import "AGSinaWeiboUserDetailInfoViewController.h"
#import <ShareSDK/ShareSDK.h>
#import <AGCommon/NSString+Common.h>

#define LEFT_PADDING 10.0
#define RIGHT_PADDING 10.0
#define VERTICAL_GAP 10.0

@implementation AGSinaWeiboViewController

- (id)init
{
    self = [super init];
    if (self)
    {
        self.title = NSLocalizedString(@"TEXT_SINA_WEIBO", @"新浪微博");
        
        UIButton *leftBtn = [[[UIButton alloc] init] autorelease];
        [leftBtn setBackgroundImage:[UIImage imageNamed:@"Common/NavigationButtonBG.png" bundleName:BUNDLE_NAME]
                           forState:UIControlStateNormal];
        [leftBtn setImage:[UIImage imageNamed:@"LeftSideViewIcon.png"] forState:UIControlStateNormal];
        leftBtn.frame = CGRectMake(0.0, 0.0, 53.0, 30.0);
        [leftBtn addTarget:self action:@selector(leftButtonClickHandler:) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:leftBtn] autorelease];
        
        if ([UIDevice currentDevice].isPad)
        {
            UILabel *label = [[UILabel alloc] init];
            label.backgroundColor = [UIColor clearColor];
            label.textColor = [UIColor whiteColor];
            label.shadowColor = [UIColor grayColor];
            label.font = [UIFont systemFontOfSize:22];
            self.navigationItem.titleView = label;
            [label release];
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    if ([[UIDevice currentDevice].systemVersion versionStringCompare:@"7.0"] != NSOrderedAscending)
    {
        [self setExtendedLayoutIncludesOpaqueBars:NO];
        [self setEdgesForExtendedLayout:SSRectEdgeBottom | SSRectEdgeLeft | SSRectEdgeRight];
    }
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn1 setTitle:NSLocalizedString(@"TEXT_PERSONAL_HOMEPAGE", @"个人主页") forState:UIControlStateNormal];
    btn1.frame = CGRectMake(LEFT_PADDING, VERTICAL_GAP, self.view.width - LEFT_PADDING - RIGHT_PADDING, 45.0);
    btn1.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:btn1];
    [btn1 addTarget:self action:@selector(getWeiboListClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn2 setTitle:NSLocalizedString(@"TEXT_GET_USER_FOLLOW_LIST", @"获取用户关注列表")  forState:UIControlStateNormal];
    btn2.frame = CGRectMake(LEFT_PADDING, btn1.bottom + VERTICAL_GAP, self.view.width - LEFT_PADDING - RIGHT_PADDING, 45.0);
    btn2.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:btn2];
    [btn2 addTarget:self action:@selector(getFriendsClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn3 setTitle:NSLocalizedString(@"TEXT_GET_USER_FANS_LIST", @"获取用户粉丝列表") forState:UIControlStateNormal];
    btn3.frame = CGRectMake(LEFT_PADDING, btn2.bottom + VERTICAL_GAP, self.view.width - LEFT_PADDING - RIGHT_PADDING, 45.0);
    btn3.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:btn3];
    [btn3 addTarget:self action:@selector(getFollowersClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn4 setTitle:NSLocalizedString(@"TEXT_GET_USER_INFO", @"获取用户资料") forState:UIControlStateNormal];
    btn4.frame = CGRectMake(LEFT_PADDING, btn3.bottom + VERTICAL_GAP, self.view.width - LEFT_PADDING - RIGHT_PADDING, 45.0);
    btn4.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:btn4];
    [btn4 addTarget:self action:@selector(getUserInfoClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn5 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn5 setTitle:NSLocalizedString(@"TEXT_SHARE_BY_CLIENT", @"客户端分享") forState:UIControlStateNormal];
    btn5.frame = CGRectMake(LEFT_PADDING, btn4.bottom + VERTICAL_GAP, self.view.width - LEFT_PADDING - RIGHT_PADDING, 45.0);
    btn5.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:btn5];
    [btn5 addTarget:self action:@selector(clientShareClickHandler:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self layoutView:self.interfaceOrientation];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

-(BOOL)shouldAutorotate
{
            //iOS6 Rotating screen method
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
            //iOS6 Rotating screen method
    return SSInterfaceOrientationMaskAll;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self layoutView:toInterfaceOrientation];
}

#pragma mark - Private

- (void)getWeiboListClickHandler:(id)sender
{
    AGSinaWeiboListViewController *sinaWeiboListVC = [[[AGSinaWeiboListViewController alloc] init] autorelease];
    UINavigationController *navController = [[[UINavigationController alloc] initWithRootViewController:sinaWeiboListVC] autorelease];
    [self presentModalViewController:navController animated:YES];
}

- (void)getFriendsClickHandler:(id)sender
{
    AGSinaWeiboFriendsViewController *vc = [[[AGSinaWeiboFriendsViewController alloc] initWithType:AGSinaWeiboFriendsTypeFriend
                                                                                          userName:@"ShareSDK"
                                                                                 imageCacheManager:nil]
                                            autorelease];
    UINavigationController *navController = [[[UINavigationController alloc] initWithRootViewController:vc] autorelease];
    [self presentModalViewController:navController animated:YES];
}

- (void)getFollowersClickHandler:(id)sender
{
    AGSinaWeiboFriendsViewController *vc = [[[AGSinaWeiboFriendsViewController alloc] initWithType:AGSinaWeiboFriendsTypeFollower
                                                                                          userName:@"ShareSDK"
                                                                                 imageCacheManager:nil]
                                            autorelease];
    UINavigationController *navController = [[[UINavigationController alloc] initWithRootViewController:vc] autorelease];
    [self presentModalViewController:navController animated:YES];
}

- (void)getUserInfoClickHandler:(id)sender
{
    AGSinaWeiboUserDetailInfoViewController *vc = [[[AGSinaWeiboUserDetailInfoViewController alloc] initWithUserName:@"ShareSDK"] autorelease];
    UINavigationController *navController = [[[UINavigationController alloc] initWithRootViewController:vc] autorelease];
    [self presentModalViewController:navController animated:YES];
}

- (void)clientShareClickHandler:(id)sender
{
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:IMAGE_NAME ofType:IMAGE_EXT];
    
            //Create a share content.
    id<ISSContent> publishContent = [ShareSDK content:CONTENT
                                       defaultContent:@""
                                                image:[ShareSDK imageWithPath:imagePath]
                                                title:@"ShareSDK"
                                                  url:@"http://www.sharesdk.cn"
                                          description:NSLocalizedString(@"TEXT_TEST_MSG", @"这是一条测试信息")
                                            mediaType:SSPublishContentMediaTypeNews];
    
    [ShareSDK clientShareContent:publishContent
                            type:ShareTypeSinaWeibo
                   statusBarTips:YES
                          result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                              
                              if (state == SSPublishContentStateSuccess)
                              {
                                  NSLog(NSLocalizedString(@"TEXT_SHARE_SUC", @"分享成功!"));
                              }
                              else if (state == SSPublishContentStateFail)
                              {
                                  NSLog(NSLocalizedString(@"TEXT_SHARE_FAI", @"分享失败!"), [error errorCode], [error errorDescription]);
                              }
                          }];
}

- (void)leftButtonClickHandler:(id)sender
{
    [self.viewDeckController toggleLeftViewAnimated:YES];
}

- (void)layoutPortrait
{
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
}

- (void)layoutLandscape
{
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
            [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"iPhoneLandscapeNavigationBarBG-568h.png"]];
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

@end
