//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.mob.com
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import "AGGetCredentialViewController.h"
#import <AGCommon/UIDevice+Common.h>
#import <AGCommon/UIImage+Common.h>
#import <AGCommon/UINavigationBar+Common.h>
#import "IIViewDeckController.h"
#import <ShareSDK/ShareSDK.h>
#import <AGCommon/NSString+Common.h>

#define LEFT_PADDING 10.0
#define RIGHT_PADDING 10.0
#define HORIZONTAL_GAP 10.0
#define VERTICAL_GAP 10.0

@implementation AGGetCredentialViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
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
        
        self.title = NSLocalizedString(@"TEXT_GET_AUTH_INFO", @"获取授权信息");
    }
    return self;
}

- (void)setTitle:(NSString *)title
{
    [super setTitle:title];
    ((UILabel *)self.navigationItem.titleView).text = title;
    [self.navigationItem.titleView sizeToFit];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([[UIDevice currentDevice].systemVersion versionStringCompare:@"7.0"] != NSOrderedAscending)
    {
        [self setExtendedLayoutIncludesOpaqueBars:NO];
        [self setEdgesForExtendedLayout:SSRectEdgeBottom | SSRectEdgeLeft | SSRectEdgeRight];
    }
	
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat top = VERTICAL_GAP;
    CGFloat buttonW = (self.view.width - LEFT_PADDING - RIGHT_PADDING - HORIZONTAL_GAP) / 2;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.width, self.view.height)];
    scrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;
    [button setTitle:NSLocalizedString(@"TEXT_SINA_WEIBO", @"新浪微博") forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING, top, buttonW, 45.0);
    [button addTarget:self action:@selector(showSinaWeiboCredClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;
    [button setTitle:NSLocalizedString(@"TEXT_TENCENT_WEIBO", @"腾讯微博") forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING + buttonW + HORIZONTAL_GAP, top, buttonW, 45.0);
    [button addTarget:self action:@selector(showTencentWeiboCredClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
//    top += button.height + VERTICAL_GAP;
//    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;
//    [button setTitle:NSLocalizedString(@"TEXT_SOHO_WEIBO", @"搜狐微博") forState:UIControlStateNormal];
//    button.frame = CGRectMake(LEFT_PADDING, top, buttonW, 45.0);
//    [button addTarget:self action:@selector(showSohuWeiboCredClickHandler:) forControlEvents:UIControlEventTouchUpInside];
//    [scrollView addSubview:button];
    
//    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;
//    [button setTitle:NSLocalizedString(@"TEXT_NETEASE_WEIBO", @"网易微博") forState:UIControlStateNormal];
//    button.frame = CGRectMake(LEFT_PADDING + buttonW + HORIZONTAL_GAP, top, buttonW, 45.0);
//    [button addTarget:self action:@selector(show163WeiboCredClickHandler:) forControlEvents:UIControlEventTouchUpInside];
//    [scrollView addSubview:button];
    
    top += button.height + VERTICAL_GAP;
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;
    [button setTitle:NSLocalizedString(@"TEXT_DOUBAN", @"豆瓣社区") forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING, top, buttonW, 45.0);
    [button addTarget:self action:@selector(showDoubanCredClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;
    [button setTitle:NSLocalizedString(@"TEXT_QZONE", @"QQ空间") forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING + buttonW + HORIZONTAL_GAP, top, buttonW, 45.0);
    [button addTarget:self action:@selector(showQZoneCredClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    top += button.height + VERTICAL_GAP;
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;
    [button setTitle:NSLocalizedString(@"TEXT_RENREN", @"人人网") forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING, top, buttonW, 45.0);
    [button addTarget:self action:@selector(showRenrenCredClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;
    [button setTitle:NSLocalizedString(@"TEXT_KAIXIN", @"开心网") forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING + buttonW + HORIZONTAL_GAP, top, buttonW, 45.0);
    [button addTarget:self action:@selector(showKaixinCredClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    top += button.height + VERTICAL_GAP;
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;
    [button setTitle:@"Instapaper" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING, top, buttonW, 45.0);
    [button addTarget:self action:@selector(showInstapaperCredClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;
    [button setTitle:NSLocalizedString(@"TEXT_YOUDAO_NOTE", @"有道云笔记") forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING + buttonW + HORIZONTAL_GAP, top, buttonW, 45.0);
    [button addTarget:self action:@selector(showYoudaoNoteCredClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    top += button.height + VERTICAL_GAP;
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;
    [button setTitle:@"Facebook" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING, top, buttonW, 45.0);
    [button addTarget:self action:@selector(showFacebookCredClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;
    [button setTitle:@"Twitter" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING + buttonW + HORIZONTAL_GAP, top, buttonW, 45.0);
    [button addTarget:self action:@selector(showTwitterCredClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    top += button.height + VERTICAL_GAP;
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;
    [button setTitle:NSLocalizedString(@"TEXT_SOHU_KAN", @"搜狐随身看") forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING, top, buttonW, 45.0);
    [button addTarget:self action:@selector(showSohuKanCredClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;
    [button setTitle:@"Google+" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING + buttonW + HORIZONTAL_GAP, top, buttonW, 45.0);
    [button addTarget:self action:@selector(showGooglePlusCredClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    top += button.height + VERTICAL_GAP;
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;
    [button setTitle:@"LinkedIn" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING, top, buttonW, 45.0);
    [button addTarget:self action:@selector(showLinkedInCredClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;
    [button setTitle:@"WeChat" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING + buttonW + HORIZONTAL_GAP, top, buttonW, 45.0);
    [button addTarget:self action:@selector(showWeChatCredClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    scrollView.contentSize = CGSizeMake(self.view.width, top += button.height + VERTICAL_GAP);
    [self.view addSubview:scrollView];
    [scrollView release];
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

- (void)showCredentialWithType:(ShareType)type
{
    id<ISSPlatformCredential> credential = [ShareSDK getCredentialWithType:type];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                        message:[NSString stringWithFormat:
                                                                 @"uid = %@\ntoken = %@\nsecret = %@\n expired = %@\nextInfo = %@",
                                                                 [credential uid],
                                                                 [credential token],
                                                                 [credential secret],
                                                                 [credential expired],
                                                                 [credential extInfo]]
                                                       delegate:nil
                                              cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了") 
                                              otherButtonTitles:nil];
    [alertView show];
    [alertView release];
}

#pragma mark - 获取授权信息

- (void)showSinaWeiboCredClickHandler:(id)sender
{
    [self showCredentialWithType:ShareTypeSinaWeibo];
}

- (void)showTencentWeiboCredClickHandler:(id)sender
{
    [self showCredentialWithType:ShareTypeTencentWeibo];
}

//- (void)showSohuWeiboCredClickHandler:(id)sender
//{
//    [self showCredentialWithType:ShareTypeSohuWeibo];
//}
//
//- (void)show163WeiboCredClickHandler:(id)sender
//{
//    [self showCredentialWithType:ShareType163Weibo];
//}

- (void)showDoubanCredClickHandler:(id)sender
{
    [self showCredentialWithType:ShareTypeDouBan];
}

- (void)showQZoneCredClickHandler:(id)sender
{
    [self showCredentialWithType:ShareTypeQQSpace];
}

- (void)showRenrenCredClickHandler:(id)sender
{
    [self showCredentialWithType:ShareTypeRenren];
}

- (void)showKaixinCredClickHandler:(id)sender
{
    [self showCredentialWithType:ShareTypeKaixin];
}

- (void)showInstapaperCredClickHandler:(id)sender
{
    [self showCredentialWithType:ShareTypeInstapaper];
}

- (void)showYoudaoNoteCredClickHandler:(id)sender
{
    [self showCredentialWithType:ShareTypeYouDaoNote];
}

- (void)showFacebookCredClickHandler:(id)sender
{
    [self showCredentialWithType:ShareTypeFacebook];
}

- (void)showTwitterCredClickHandler:(id)sender
{
    [self showCredentialWithType:ShareTypeTwitter];
}

- (void)showSohuKanCredClickHandler:(id)sender
{
    [self showCredentialWithType:ShareTypeSohuKan];
}

- (void)showGooglePlusCredClickHandler:(id)sender
{
    [self showCredentialWithType:ShareTypeGooglePlus];
}

- (void)showLinkedInCredClickHandler:(id)sender
{
    [self showCredentialWithType:ShareTypeLinkedIn];
}

- (void)showWeChatCredClickHandler:(id)sender
{
    [self showCredentialWithType:ShareTypeWeixiSession];
}

@end
