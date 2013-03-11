//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:1955211608
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import "AGApiViewController.h"
#import "AGUserInfoViewController.h"
#import <AGCommon/UINavigationBar+Common.h>
#import <AGCommon/UIImage+Common.h>
#import "ShareSDKDemoMoreViewController.h"
#import "AGInputUserNameViewController.h"
#import <AGCommon/UIColor+Common.h>
#import <AGCommon/UIDevice+Common.h>
#import "IIViewDeckController.h"

#define TABLE_CELL_ID @"tableCell"

#define ACTION_SHEET_GET_USER_INFO 200
#define ACTION_SHEET_FOLLOW_USER 201
#define ACTION_SHEET_GET_OTHER_USER_INFO 202
#define ACTION_SHEET_GET_ACCESS_TOKEN 203
#define ACTION_SHEET_PRINT_COPY 306

#define LEFT_PADDING 10.0
#define RIGHT_PADDING 10.0
#define HORIZONTAL_GAP 10.0
#define VERTICAL_GAP 10.0

@interface AGApiViewController (Private)

- (void)showUserInfoWithType:(ShareType)type;

@end

@implementation AGApiViewController

- (id)init
{
    self = [super init];
    if (self)
    {
        // Custom initialization
        UIButton *leftBtn = [[[UIButton alloc] init] autorelease];
        [leftBtn setBackgroundImage:[UIImage imageNamed:@"PublishEx/NavigationButtonBG.png" bundleName:BUNDLE_NAME]
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
        
        _ssoEnable = YES;
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
    
    self.view.backgroundColor = [UIColor colorWithRGB:0xe1e0de];
    
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat top = VERTICAL_GAP;
    CGFloat buttonW = (self.view.width - LEFT_PADDING - RIGHT_PADDING - HORIZONTAL_GAP) / 2;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.width, self.view.height)];
    scrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;
    [button setTitle:@"分享全部" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING, top, self.view.width - LEFT_PADDING - RIGHT_PADDING, 45.0);
    [button addTarget:self action:@selector(shareAllButtonClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    top += button.height + VERTICAL_GAP;
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;
    [button setTitle:@"分享全部(简单)" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING, top, self.view.width - LEFT_PADDING - RIGHT_PADDING, 45.0);
    [button addTarget:self action:@selector(simpleShareAllButtonClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    top += button.height + VERTICAL_GAP;
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;
    [button setTitle:@"分享全部(无界面)" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING, top, self.view.width - LEFT_PADDING - RIGHT_PADDING, 45.0);
    [button addTarget:self action:@selector(noneUIShareAllButtonClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    top += button.height + VERTICAL_GAP;
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;
    [button setTitle:@"设置AccessToken" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING, top, buttonW, 45.0);
    [button addTarget:self action:@selector(setAccessTokenClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;
    [button setTitle:@"分享GIF图片" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING + buttonW + HORIZONTAL_GAP, top, buttonW, 45.0);
    [button addTarget:self action:@selector(shareGifPicClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    top += button.height + VERTICAL_GAP;
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;
    [button setTitle:@"自定义分享菜单" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING, top, buttonW, 45.0);
    [button addTarget:self action:@selector(customShareMenuClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;
    [button setTitle:@"自定义分享菜单项" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING + buttonW + HORIZONTAL_GAP, top, buttonW, 45.0);
    [button addTarget:self action:@selector(customShareMenuItemClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    top += button.height + VERTICAL_GAP;
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;
    [button setTitle:@"关注官方微博" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING, top, buttonW, 45.0);
    [button addTarget:self action:@selector(followOfficerWeiboClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;
    [button setTitle:@"获取用户资料" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING + buttonW + HORIZONTAL_GAP, top, buttonW, 45.0);
    [button addTarget:self action:@selector(getUserInfoClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    top += button.height + VERTICAL_GAP;
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;
    [button setTitle:@"关注微信" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING, top, buttonW, 45.0);
    [button addTarget:self action:@selector(followWeixinClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;
    [button setTitle:@"获取其他用户信息" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING + buttonW + HORIZONTAL_GAP, top, buttonW, 45.0);
    [button addTarget:self action:@selector(getOtherUserInfoClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    top += button.height + VERTICAL_GAP;
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;
    [button setTitle:@"分享到新浪微博" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING, top, buttonW, 45.0);
    [button addTarget:self action:@selector(shareToSinaWeiboClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;
    [button setTitle:@"分享到腾讯微博" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING + buttonW + HORIZONTAL_GAP, top, buttonW, 45.0);
    [button addTarget:self action:@selector(shareToTencentWeiboClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    top += button.height + VERTICAL_GAP;
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;
    [button setTitle:@"分享到QQ空间" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING, top, buttonW, 45.0);
    [button addTarget:self action:@selector(shareToQQSpaceClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;
    [button setTitle:@"分享到Facebook" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING + buttonW + HORIZONTAL_GAP, top, buttonW, 45.0);
    [button addTarget:self action:@selector(shareToFacebookClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    top += button.height + VERTICAL_GAP;
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;
    [button setTitle:@"分享到Twitter" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING, top, buttonW, 45.0);
    [button addTarget:self action:@selector(shareToTwitterClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;
    [button setTitle:@"分享到网易微博" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING + buttonW + HORIZONTAL_GAP, top, buttonW, 45.0);
    [button addTarget:self action:@selector(shareTo163WeiboClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    top += button.height + VERTICAL_GAP;
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;
    [button setTitle:@"分享到搜狐微博" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING, top, buttonW, 45.0);
    [button addTarget:self action:@selector(shareToSohuWeiboClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;
    [button setTitle:@"分享到人人网" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING + buttonW + HORIZONTAL_GAP, top, buttonW, 45.0);
    [button addTarget:self action:@selector(shareToRenRenClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    top += button.height + VERTICAL_GAP;
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;
    [button setTitle:@"分享到开心网" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING, top, buttonW, 45.0);
    [button addTarget:self action:@selector(shareToKaiXinClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;
    [button setTitle:@"分享到豆瓣我说" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING + buttonW + HORIZONTAL_GAP, top, buttonW, 45.0);
    [button addTarget:self action:@selector(shareToDouBanClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    top += button.height + VERTICAL_GAP;
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;
    [button setTitle:@"分享到Instapaper" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING, top, buttonW, 45.0);
    [button addTarget:self action:@selector(shareToInstapaperClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;
    [button setTitle:@"短信分享" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING + buttonW + HORIZONTAL_GAP, top, buttonW, 45.0);
    [button addTarget:self action:@selector(shareBySMSClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    top += button.height + VERTICAL_GAP;
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;
    [button setTitle:@"邮件分享" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING, top, buttonW, 45.0);
    [button addTarget:self action:@selector(shareByMailClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;
    [button setTitle:@"打印、拷贝" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING + buttonW + HORIZONTAL_GAP, top, buttonW, 45.0);
    [button addTarget:self action:@selector(shareByPrintOrCopyClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    top += button.height + VERTICAL_GAP;
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;
    [button setTitle:@"分享到有道云笔记" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING, top, buttonW, 45.0);
    [button addTarget:self action:@selector(shareToYouDaoClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;
    [button setTitle:@"获取AccessToken" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING + buttonW + HORIZONTAL_GAP, top, buttonW, 45.0);
    [button addTarget:self action:@selector(getAccessTokenClickHandler:) forControlEvents:UIControlEventTouchUpInside];
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
    return UIInterfaceOrientationMaskAll;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self layoutView:toInterfaceOrientation];
}

- (void)showUserInfoWithType:(ShareType)type
{
    AGUserInfoViewController *vc = [[AGUserInfoViewController alloc] initWithType:type];
    UINavigationController *nvc = [[[UINavigationController alloc] initWithRootViewController:vc] autorelease];
    [self presentModalViewController:nvc animated:YES];
    [vc release];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TABLE_CELL_ID];
    if (cell == nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TABLE_CELL_ID] autorelease];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    switch (indexPath.row)
    {
        case 0:
            cell.textLabel.text = @"获取用户信息";
            break;
        case 1:
            cell.textLabel.text = @"关注";
            break;
        default:
            break;
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case 0:
        {
            UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                                     delegate:self
                                                            cancelButtonTitle:@"取消"
                                                       destructiveButtonTitle:nil
                                                            otherButtonTitles:@"新浪微博",@"腾讯微博",@"搜狐微博",@"网易微博",@"豆瓣社区",@"QQ空间",@"人人网",@"开心网", nil];
            actionSheet.tag = ACTION_SHEET_GET_USER_INFO;
            [actionSheet showInView:self.view];
            [actionSheet release];
            break;
        }
        case 1:
        {
            UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                                     delegate:self
                                                            cancelButtonTitle:@"取消"
                                                       destructiveButtonTitle:nil
                                                            otherButtonTitles:@"新浪微博",@"腾讯微博",nil];
            actionSheet.tag = ACTION_SHEET_FOLLOW_USER;
            [actionSheet showInView:self.view];
            [actionSheet release];
            break;
        }
        default:
            break;
    }
}

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    switch (actionSheet.tag)
    {
        case ACTION_SHEET_GET_USER_INFO:
        {
            ShareType type = 0;
            switch (buttonIndex)
            {
                case 0:
                    type = ShareTypeSinaWeibo;
                    break;
                case 1:
                    type = ShareTypeTencentWeibo;
                    break;
                case 2:
                    type = ShareTypeSohuWeibo;
                    break;
                case 3:
                    type = ShareType163Weibo;
                    break;
                case 4:
                    type = ShareTypeDouBan;
                    break;
                case 5:
                    type = ShareTypeQQSpace;
                    break;
                case 6:
                    type = ShareTypeRenren;
                    break;
                case 7:
                    type = ShareTypeKaixin;
                    break;
                case 8:
                    type = ShareTypeInstapaper;
                    break;
                case 9:
                    type = ShareTypeYouDaoNote;
                    break;
                case 10:
                    type = ShareTypeFacebook;
                    break;
                case 11:
                    type = ShareTypeTwitter;
                    break;
                default:
                    break;
            }
            
            if (type != 0)
            {
                [self showUserInfoWithType:type];
            }
            
            break;
        }
        case ACTION_SHEET_FOLLOW_USER:
        {
            switch (buttonIndex)
            {
                case 0:
                {
                    _followType = ShareTypeSinaWeibo;
                    break;
                }
                case 1:
                {
                    _followType = ShareTypeTencentWeibo;
                    break;
                }
                default:
                    _followType = 0;
                    break;
            }
            
            if (_followType != 0)
            {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"关注"
                                                                    message:@"您要关注ShareSDK吗?"
                                                                   delegate:self
                                                          cancelButtonTitle:@"取消"
                                                          otherButtonTitles:@"关注", nil];
                [alertView show];
                [alertView release];
            }
            
            break;
        }
        case ACTION_SHEET_PRINT_COPY:
        {
            switch (buttonIndex)
            {
                case 0:
                    //打印
                    [self airPrintShareContent];
                    break;
                case 1:
                    //拷贝
                    [self copyShareContent];
                    break;
                default:
                    break;
            }
            break;
        }
        case ACTION_SHEET_GET_ACCESS_TOKEN:
        {
            ShareType type = 0;
            switch (buttonIndex)
            {
                case 0:
                    type = ShareTypeSinaWeibo;
                    break;
                case 1:
                    type = ShareTypeTencentWeibo;
                    break;
                case 2:
                    type = ShareTypeSohuWeibo;
                    break;
                case 3:
                    type = ShareType163Weibo;
                    break;
                case 4:
                    type = ShareTypeDouBan;
                    break;
                case 5:
                    type = ShareTypeQQSpace;
                    break;
                case 6:
                    type = ShareTypeRenren;
                    break;
                case 7:
                    type = ShareTypeKaixin;
                    break;
                case 8:
                    type = ShareTypeInstapaper;
                    break;
                case 9:
                    type = ShareTypeYouDaoNote;
                    break;
                case 10:
                    type = ShareTypeFacebook;
                    break;
                case 11:
                    type = ShareTypeTwitter;
                    break;
                default:
                    break;
            }
            
            if (type != 0)
            {
                id<IClientToken> token = [ShareSDK getClientTokenWithType:type];
                if ([token conformsToProtocol:@protocol(IOAuth2ClientToken)])
                {
                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                                        message:[NSString stringWithFormat:
                                                                                 @"AccessToken = %@",
                                                                                 [(id<IOAuth2ClientToken>)token accessToken]]
                                                                       delegate:nil
                                                              cancelButtonTitle:@"知道了"
                                                              otherButtonTitles:nil];
                    [alertView show];
                    [alertView release];
                }
                else if ([token conformsToProtocol:@protocol(IOAuthClientToken)])
                {
                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                                        message:[NSString stringWithFormat:
                                                                                 @"OAuthToken = %@\nOAuthSecret = %@",
                                                                                 [(id<IOAuthClientToken>)token oauthToken],
                                                                                 [(id<IOAuthClientToken>)token oauthSecret]]
                                                                       delegate:nil
                                                              cancelButtonTitle:@"知道了"
                                                              otherButtonTitles:nil];
                    [alertView show];
                    [alertView release];
                }
                else
                {
                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                                        message:@"此平台尚未授权!"
                                                                       delegate:nil
                                                              cancelButtonTitle:@"知道了"
                                                              otherButtonTitles:nil];
                    [alertView show];
                    [alertView release];
                }
            }
            break;
        }
        default:
            break;
    }
}

#pragma mark - ButtonHandler

/**
 *	@brief	分享全部
 *
 *	@param 	sender 	事件对象
 */
- (void)shareAllButtonClickHandler:(UIButton *)sender
{
    id<ISSPublishContent> publishContent = [ShareSDK publishContent:CONTENT
                                                     defaultContent:@""
                                                              image:[UIImage imageNamed:IMAGE_NAME]
                                                       imageQuality:0.8
                                                          mediaType:SSPublishContentMediaTypeNews
                                                              title:@"ShareSDK"
                                                                url:@"http://www.sharesdk.cn"
                                                       musicFileUrl:nil
                                                            extInfo:nil
                                                           fileData:nil];
    //定制人人网分享
    [publishContent addRenRenUnitWithName:@"Hello 人人网"
                              description:@"这是一条测试信息"
                                      url:INHERIT_VALUE
                                  message:INHERIT_VALUE
                              imageObject:INHERIT_VALUE
                                  caption:nil];
    
    //定制QQ空间分享
    [publishContent addQQSpaceUnitWithTitle:INHERIT_VALUE
                                        url:INHERIT_VALUE
                                    comment:INHERIT_VALUE
                                    summary:@"Hello QQ空间"
                                imageObject:INHERIT_VALUE
                                       type:INHERIT_VALUE
                                    playUrl:INHERIT_VALUE
                                  syncWeibo:INHERIT_VALUE];
    
    //定制微信好友内容
    [publishContent addWeixinSessionUnitWithType:INHERIT_VALUE
                                         content:@"Hello 微信好友!"
                                           title:INHERIT_VALUE
                                             url:INHERIT_VALUE
                                           image:INHERIT_VALUE
                                    imageQuality:INHERIT_VALUE
                                    musicFileUrl:INHERIT_VALUE
                                         extInfo:INHERIT_VALUE
                                        fileData:INHERIT_VALUE];
    
    //定制微信朋友圈内容
    [publishContent addWeixinTimelineUnitWithType:[NSNumber numberWithInteger:SSPublishContentMediaTypeMusic]
                                          content:@"Hello 微信朋友圈!"
                                            title:INHERIT_VALUE
                                              url:@"http://y.qq.com/i/song.html#p=7B22736F6E675F4E616D65223A22E4BDA0E4B88DE698AFE79C9FE6ADA3E79A84E5BFABE4B990222C22736F6E675F5761704C69766555524C223A22687474703A2F2F74736D7573696332342E74632E71712E636F6D2F586B303051563558484A645574315070536F4B7458796931667443755A68646C2F316F5A4465637734356375386355672B474B304964794E6A3770633447524A574C48795333383D2F3634363232332E6D34613F7569643D32333230303738313038266469723D423226663D312663743D3026636869643D222C22736F6E675F5769666955524C223A22687474703A2F2F73747265616D31382E71716D757369632E71712E636F6D2F33303634363232332E6D7033222C226E657454797065223A2277696669222C22736F6E675F416C62756D223A22E5889BE980A0EFBC9AE5B08FE5B7A8E89B8B444E414C495645EFBC81E6BC94E594B1E4BC9AE5889BE7BAAAE5BD95E99FB3222C22736F6E675F4944223A3634363232332C22736F6E675F54797065223A312C22736F6E675F53696E676572223A22E4BA94E69C88E5A4A9222C22736F6E675F576170446F776E4C6F616455524C223A22687474703A2F2F74736D757369633132382E74632E71712E636F6D2F586C464E4D31354C5569396961495674593739786D436534456B5275696879366A702F674B65356E4D6E684178494C73484D6C6A307849634A454B394568572F4E3978464B316368316F37636848323568413D3D2F33303634363232332E6D70333F7569643D32333230303738313038266469723D423226663D302663743D3026636869643D2673747265616D5F706F733D38227D"
                                            image:INHERIT_VALUE
                                     imageQuality:INHERIT_VALUE
                                     musicFileUrl:@"http://mp3.mwap8.com/destdir/Music/2009/20090601/ZuiXuanMinZuFeng20090601119.mp3"
                                          extInfo:nil
                                         fileData:nil];
    
    //定制QQ分享内容
    [publishContent addQQUnitWithType:INHERIT_VALUE
                              content:@"Hello QQ!"
                                title:INHERIT_VALUE
                                  url:INHERIT_VALUE
                                image:INHERIT_VALUE
                         imageQuality:INHERIT_VALUE];
    
    //定制邮件分享内容
    [publishContent addMailUnitWithSubject:INHERIT_VALUE
                                   content:@"<a href='http://sharesdk.cn'>Hello Mail</a>"
                                    isHTML:[NSNumber numberWithBool:YES]
                               attachments:INHERIT_VALUE];
    
    //定制短信分享内容
    [publishContent addSMSUnitWithContent:@"Hello SMS!"];
    
    //定制有道云笔记分享内容
    [publishContent addYouDaoNoteUnitWithContent:INHERIT_VALUE
                                           title:@"ShareSDK分享"
                                          author:@"ShareSDK"
                                          source:@"http://www.sharesdk.cn"
                                     attachments:INHERIT_VALUE];
    
    //定制Instapaper分享内容
    [publishContent addInstapaperContentWithUrl:INHERIT_VALUE
                                          title:@"Hello Instapaper"
                                    description:INHERIT_VALUE];
    
    [ShareSDK showShareActionSheet:self
                     iPadContainer:[ShareSDK iPadShareContainerWithView:sender arrowDirect:UIPopoverArrowDirectionUp]
                         shareList:nil
                           content:publishContent
                     statusBarTips:YES
                        convertUrl:YES      //委托转换链接标识，YES：对分享链接进行转换，NO：对分享链接不进行转换，为此值时不进行回流统计。
                       authOptions:nil
                  shareViewOptions:[ShareSDK defaultShareViewOptionsWithTitle:@"内容分享"
                                                              oneKeyShareList:[NSArray defaultOneKeyShareList]
                                                               qqButtonHidden:NO
                                                        wxSessionButtonHidden:NO
                                                       wxTimelineButtonHidden:NO
                                                         showKeyboardOnAppear:YES]
                            result:^(ShareType type, SSPublishContentState state, id<ISSStatusInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                if (state == SSPublishContentStateSuccess)
                                {
                                    NSLog(@"分享成功");
                                }
                                else if (state == SSPublishContentStateFail)
                                {
                                    NSLog(@"分享失败,错误码:%d,错误描述:%@", [error errorCode], [error errorDescription]);
                                }
                            }];
    
    //需要定制分享视图的显示属性，使用以下接口
//    [ShareSDK showShareActionSheet:self
//                         shareList:nil
//                           content:publishContent
//                     statusBarTips:YES
//                          autoAuth:YES
//                        convertUrl:YES
//                  shareViewOptions:[ShareSDK defaultShareViewOptionsWithTitle:@"内容分享"
//                                                              oneKeyShareList:[NSArray defaultOneKeyShareList]
//                                                               qqButtonHidden:YES
//                                                        wxSessionButtonHidden:YES
//                                                       wxTimelineButtonHidden:YES]
//                            result:^(ShareType type, SSPublishContentState state, id<ISSStatusInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
//                                if (state == SSPublishContentStateSuccess)
//                                {
//                                    NSLog(@"发送成功");
//                                }
//                                else
//                                {
//                                    NSLog(@"发送失败");
//                                }
//                            }];
}

/**
 *	@brief	简单分享全部
 *
 *	@param 	sender 	事件对象
 */
- (void)simpleShareAllButtonClickHandler:(id)sender
{
    id<ISSPublishContent> publishContent = [ShareSDK publishContent:CONTENT
                                                     defaultContent:@""
                                                              image:[UIImage imageNamed:IMAGE_NAME]
                                                       imageQuality:0.8
                                                          mediaType:SSPublishContentMediaTypeNews
                                                              title:@"ShareSDK"
                                                                url:@"http://www.sharesdk.cn"
                                                       musicFileUrl:nil
                                                            extInfo:nil
                                                           fileData:nil];
    //定制人人网分享
    [publishContent addRenRenUnitWithName:@"Hello 人人网"
                              description:@"这是一条测试信息"
                                      url:INHERIT_VALUE
                                  message:INHERIT_VALUE
                              imageObject:INHERIT_VALUE
                                  caption:nil];
    
    //定制QQ空间分享
    [publishContent addQQSpaceUnitWithTitle:INHERIT_VALUE
                                        url:INHERIT_VALUE
                                    comment:INHERIT_VALUE
                                    summary:@"Hello QQ空间"
                                imageObject:INHERIT_VALUE
                                       type:INHERIT_VALUE
                                    playUrl:INHERIT_VALUE
                                  syncWeibo:INHERIT_VALUE];
    
    //定制微信好友内容
    [publishContent addWeixinSessionUnitWithType:INHERIT_VALUE
                                         content:@"Hello 微信好友!"
                                           title:INHERIT_VALUE
                                             url:INHERIT_VALUE
                                           image:INHERIT_VALUE
                                    imageQuality:INHERIT_VALUE
                                    musicFileUrl:INHERIT_VALUE
                                         extInfo:INHERIT_VALUE
                                        fileData:INHERIT_VALUE];
    
    //定制微信朋友圈内容
    [publishContent addWeixinTimelineUnitWithType:[NSNumber numberWithInteger:SSPublishContentMediaTypeMusic]
                                          content:@"Hello 微信朋友圈!"
                                            title:INHERIT_VALUE
                                              url:@"http://y.qq.com/i/song.html#p=7B22736F6E675F4E616D65223A22E4BDA0E4B88DE698AFE79C9FE6ADA3E79A84E5BFABE4B990222C22736F6E675F5761704C69766555524C223A22687474703A2F2F74736D7573696332342E74632E71712E636F6D2F586B303051563558484A645574315070536F4B7458796931667443755A68646C2F316F5A4465637734356375386355672B474B304964794E6A3770633447524A574C48795333383D2F3634363232332E6D34613F7569643D32333230303738313038266469723D423226663D312663743D3026636869643D222C22736F6E675F5769666955524C223A22687474703A2F2F73747265616D31382E71716D757369632E71712E636F6D2F33303634363232332E6D7033222C226E657454797065223A2277696669222C22736F6E675F416C62756D223A22E5889BE980A0EFBC9AE5B08FE5B7A8E89B8B444E414C495645EFBC81E6BC94E594B1E4BC9AE5889BE7BAAAE5BD95E99FB3222C22736F6E675F4944223A3634363232332C22736F6E675F54797065223A312C22736F6E675F53696E676572223A22E4BA94E69C88E5A4A9222C22736F6E675F576170446F776E4C6F616455524C223A22687474703A2F2F74736D757369633132382E74632E71712E636F6D2F586C464E4D31354C5569396961495674593739786D436534456B5275696879366A702F674B65356E4D6E684178494C73484D6C6A307849634A454B394568572F4E3978464B316368316F37636848323568413D3D2F33303634363232332E6D70333F7569643D32333230303738313038266469723D423226663D302663743D3026636869643D2673747265616D5F706F733D38227D"
                                            image:INHERIT_VALUE
                                     imageQuality:INHERIT_VALUE
                                     musicFileUrl:@"http://mp3.mwap8.com/destdir/Music/2009/20090601/ZuiXuanMinZuFeng20090601119.mp3"
                                          extInfo:nil
                                         fileData:nil];
    
    //定制QQ分享内容
    [publishContent addQQUnitWithType:INHERIT_VALUE
                              content:@"Hello QQ!"
                                title:INHERIT_VALUE
                                  url:INHERIT_VALUE
                                image:INHERIT_VALUE
                         imageQuality:INHERIT_VALUE];
    
    //定制邮件分享内容
    [publishContent addMailUnitWithSubject:INHERIT_VALUE
                                   content:@"<a href='http://sharesdk.cn'>Hello Mail</a>"
                                    isHTML:[NSNumber numberWithBool:YES]
                               attachments:INHERIT_VALUE];
    
    //定制短信分享内容
    [publishContent addSMSUnitWithContent:@"Hello SMS!"];
    
    //定制有道云笔记分享内容
    [publishContent addYouDaoNoteUnitWithContent:INHERIT_VALUE
                                           title:@"ShareSDK分享"
                                          author:@"ShareSDK"
                                          source:@"http://www.sharesdk.cn"
                                     attachments:INHERIT_VALUE];
    
    //定制Instapaper分享内容
    [publishContent addInstapaperContentWithUrl:INHERIT_VALUE
                                          title:@"Hello Instapaper"
                                    description:INHERIT_VALUE];
    
    [ShareSDK showShareActionSheet:self
                     iPadContainer:[ShareSDK iPadShareContainerWithView:sender arrowDirect:UIPopoverArrowDirectionUp]
                         shareList:nil
                           content:publishContent
                     statusBarTips:YES
                        convertUrl:YES      //委托转换链接标识，YES：对分享链接进行转换，NO：对分享链接不进行转换，为此值时不进行回流统计。
                       authOptions:nil
                  shareViewOptions:[ShareSDK simpleShareViewOptionWithTitle:@"内容分享"]
                            result:^(ShareType type, SSPublishContentState state, id<ISSStatusInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                if (state == SSPublishContentStateSuccess)
                                {
                                    NSLog(@"分享成功");
                                }
                                else if (state == SSPublishContentStateFail)
                                {
                                    NSLog(@"分享失败,错误码:%d,错误描述:%@", [error errorCode], [error errorDescription]);
                                }
                            }];
}

- (void)noneUIShareAllButtonClickHandler:(id)sender
{
    UIImage *shareImage = [UIImage imageNamed:@"sharesdk_img.jpg"];
    id<ISSPublishContent> publishContent = [ShareSDK publishContent:CONTENT
                                                     defaultContent:nil
                                                        imageObject:[ShareSDK jpegImage:shareImage quality:0.8 fileName:nil]];
    //定制人人网分享
    [publishContent addRenRenUnitWithName:@"Hello 人人网"
                              description:@"这是一条测试信息"
                                      url:INHERIT_VALUE
                                  message:INHERIT_VALUE
                              imageObject:INHERIT_VALUE
                                  caption:nil];
    
    //定制QQ空间分享
    [publishContent addQQSpaceUnitWithTitle:INHERIT_VALUE
                                        url:INHERIT_VALUE
                                    comment:INHERIT_VALUE
                                    summary:@"Hello QQ空间"
                                imageObject:INHERIT_VALUE
                                       type:INHERIT_VALUE
                                    playUrl:INHERIT_VALUE
                                  syncWeibo:INHERIT_VALUE];
    
    //定制微信好友内容
    [publishContent addWeixinSessionUnitWithType:INHERIT_VALUE
                                         content:@"Hello 微信好友!"
                                           title:INHERIT_VALUE
                                             url:INHERIT_VALUE
                                           image:INHERIT_VALUE
                                    imageQuality:INHERIT_VALUE
                                    musicFileUrl:INHERIT_VALUE
                                         extInfo:INHERIT_VALUE
                                        fileData:INHERIT_VALUE];
    
    //定制微信朋友圈内容
    [publishContent addWeixinTimelineUnitWithType:[NSNumber numberWithInteger:SSPublishContentMediaTypeMusic]
                                          content:@"Hello 微信朋友圈!"
                                            title:INHERIT_VALUE
                                              url:@"http://y.qq.com/i/song.html#p=7B22736F6E675F4E616D65223A22E4BDA0E4B88DE698AFE79C9FE6ADA3E79A84E5BFABE4B990222C22736F6E675F5761704C69766555524C223A22687474703A2F2F74736D7573696332342E74632E71712E636F6D2F586B303051563558484A645574315070536F4B7458796931667443755A68646C2F316F5A4465637734356375386355672B474B304964794E6A3770633447524A574C48795333383D2F3634363232332E6D34613F7569643D32333230303738313038266469723D423226663D312663743D3026636869643D222C22736F6E675F5769666955524C223A22687474703A2F2F73747265616D31382E71716D757369632E71712E636F6D2F33303634363232332E6D7033222C226E657454797065223A2277696669222C22736F6E675F416C62756D223A22E5889BE980A0EFBC9AE5B08FE5B7A8E89B8B444E414C495645EFBC81E6BC94E594B1E4BC9AE5889BE7BAAAE5BD95E99FB3222C22736F6E675F4944223A3634363232332C22736F6E675F54797065223A312C22736F6E675F53696E676572223A22E4BA94E69C88E5A4A9222C22736F6E675F576170446F776E4C6F616455524C223A22687474703A2F2F74736D757369633132382E74632E71712E636F6D2F586C464E4D31354C5569396961495674593739786D436534456B5275696879366A702F674B65356E4D6E684178494C73484D6C6A307849634A454B394568572F4E3978464B316368316F37636848323568413D3D2F33303634363232332E6D70333F7569643D32333230303738313038266469723D423226663D302663743D3026636869643D2673747265616D5F706F733D38227D"
                                            image:INHERIT_VALUE
                                     imageQuality:INHERIT_VALUE
                                     musicFileUrl:@"http://mp3.mwap8.com/destdir/Music/2009/20090601/ZuiXuanMinZuFeng20090601119.mp3"
                                          extInfo:nil
                                         fileData:nil];
    
    //定制QQ分享内容
    [publishContent addQQUnitWithType:INHERIT_VALUE
                              content:@"Hello QQ!"
                                title:INHERIT_VALUE
                                  url:INHERIT_VALUE
                                image:INHERIT_VALUE
                         imageQuality:INHERIT_VALUE];
    
    //定制邮件分享内容
    [publishContent addMailUnitWithSubject:INHERIT_VALUE
                                   content:@"<a href='http://sharesdk.cn'>Hello Mail</a>"
                                    isHTML:[NSNumber numberWithBool:YES]
                               attachments:INHERIT_VALUE];
    
    //定制短信分享内容
    [publishContent addSMSUnitWithContent:@"Hello SMS!"];
    
    //定制有道云笔记分享内容
    [publishContent addYouDaoNoteUnitWithContent:INHERIT_VALUE
                                           title:@"ShareSDK分享"
                                          author:@"ShareSDK"
                                          source:@"http://www.sharesdk.cn"
                                     attachments:INHERIT_VALUE];
    
    
    [ShareSDK showShareActionSheet:self
                     iPadContainer:[ShareSDK iPadShareContainerWithView:sender arrowDirect:UIPopoverArrowDirectionUp]
                         shareList:[ShareSDK customShareListWithType:
                                    [ShareSDK shareActionSheetItemWithTitle:[ShareSDK getClientNameWithType:ShareTypeSinaWeibo]
                                                                       icon:[ShareSDK getClientIconWithType:ShareTypeSinaWeibo]
                                                               clickHandler:^{
                                                                   [ShareSDK shareContentWithShareList:[ShareSDK getShareListWithType:ShareTypeSinaWeibo, nil]
                                                                                               content:publishContent
                                                                                         statusBarTips:YES
                                                                                                result:^(ShareType type, SSPublishContentState state, id<ISSStatusInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                                                                                    if (state == SSPublishContentStateSuccess)
                                                                                                    {
                                                                                                        NSLog(@"分享成功");
                                                                                                    }
                                                                                                    else if (state == SSPublishContentStateFail)
                                                                                                    {
                                                                                                        NSLog(@"分享失败,错误码:%d,错误描述:%@", [error errorCode], [error errorDescription]);
                                                                                                    }
                                                                                                }];
                                                               }],
                                    [ShareSDK shareActionSheetItemWithTitle:[ShareSDK getClientNameWithType:ShareTypeTencentWeibo]
                                                                       icon:[ShareSDK getClientIconWithType:ShareTypeTencentWeibo]
                                                               clickHandler:^{
                                                                   [ShareSDK shareContentWithShareList:[ShareSDK getShareListWithType:ShareTypeTencentWeibo,nil]
                                                                                               content:publishContent
                                                                                         statusBarTips:YES
                                                                                                result:^(ShareType type, SSPublishContentState state, id<ISSStatusInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                                                                                    if (state == SSPublishContentStateSuccess)
                                                                                                    {
                                                                                                        NSLog(@"分享成功");
                                                                                                    }
                                                                                                    else if (state == SSPublishContentStateFail)
                                                                                                    {
                                                                                                        NSLog(@"分享失败,错误码:%d,错误描述:%@", [error errorCode], [error errorDescription]);
                                                                                                    }
                                                                                                }];
                                                               }],
                                    SHARE_TYPE_NUMBER(ShareTypeSMS),
                                    [ShareSDK shareActionSheetItemWithTitle:[ShareSDK getClientNameWithType:ShareTypeQQSpace]
                                                                       icon:[ShareSDK getClientIconWithType:ShareTypeQQSpace]
                                                               clickHandler:^{
                                                                   [ShareSDK shareContentWithShareList:[ShareSDK getShareListWithType:ShareTypeQQSpace,nil]
                                                                                               content:publishContent
                                                                                         statusBarTips:YES
                                                                                                result:^(ShareType type, SSPublishContentState state, id<ISSStatusInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                                                                                    if (state == SSPublishContentStateSuccess)
                                                                                                    {
                                                                                                        NSLog(@"分享成功");
                                                                                                    }
                                                                                                    else if (state == SSPublishContentStateFail)
                                                                                                    {
                                                                                                        NSLog(@"分享失败,错误码:%d,错误描述:%@", [error errorCode], [error errorDescription]);
                                                                                                    }
                                                                                                }];
                                                               }],
                                    SHARE_TYPE_NUMBER(ShareTypeWeixiSession),
                                    SHARE_TYPE_NUMBER(ShareTypeWeixiTimeline),
                                    SHARE_TYPE_NUMBER(ShareTypeQQ),
                                    [ShareSDK shareActionSheetItemWithTitle:[ShareSDK getClientNameWithType:ShareTypeFacebook]
                                                                       icon:[ShareSDK getClientIconWithType:ShareTypeFacebook]
                                                               clickHandler:^{
                                                                   [ShareSDK shareContentWithShareList:[ShareSDK getShareListWithType:ShareTypeFacebook,nil]
                                                                                               content:publishContent
                                                                                         statusBarTips:YES
                                                                                                result:^(ShareType type, SSPublishContentState state, id<ISSStatusInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                                                                                    if (state == SSPublishContentStateSuccess)
                                                                                                    {
                                                                                                        NSLog(@"分享成功");
                                                                                                    }
                                                                                                    else if (state == SSPublishContentStateFail)
                                                                                                    {
                                                                                                        NSLog(@"分享失败,错误码:%d,错误描述:%@", [error errorCode], [error errorDescription]);
                                                                                                    }
                                                                                                }];
                                                               }],
                                    [ShareSDK shareActionSheetItemWithTitle:[ShareSDK getClientNameWithType:ShareTypeTwitter]
                                                                       icon:[ShareSDK getClientIconWithType:ShareTypeTwitter]
                                                               clickHandler:^{
                                                                   [ShareSDK shareContentWithShareList:[ShareSDK getShareListWithType:ShareTypeTwitter,nil]
                                                                                               content:publishContent
                                                                                         statusBarTips:YES
                                                                                                result:^(ShareType type, SSPublishContentState state, id<ISSStatusInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                                                                                    if (state == SSPublishContentStateSuccess)
                                                                                                    {
                                                                                                        NSLog(@"分享成功");
                                                                                                    }
                                                                                                    else if (state == SSPublishContentStateFail)
                                                                                                    {
                                                                                                        NSLog(@"分享失败,错误码:%d,错误描述:%@", [error errorCode], [error errorDescription]);
                                                                                                    }
                                                                                                }];
                                                               }],
                                    [ShareSDK shareActionSheetItemWithTitle:[ShareSDK getClientNameWithType:ShareTypeRenren]
                                                                       icon:[ShareSDK getClientIconWithType:ShareTypeRenren]
                                                               clickHandler:^{
                                                                   [ShareSDK shareContentWithShareList:[ShareSDK getShareListWithType:ShareTypeRenren,nil]
                                                                                               content:publishContent
                                                                                         statusBarTips:YES
                                                                                                result:^(ShareType type, SSPublishContentState state, id<ISSStatusInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                                                                                    if (state == SSPublishContentStateSuccess)
                                                                                                    {
                                                                                                        NSLog(@"分享成功");
                                                                                                    }
                                                                                                    else if (state == SSPublishContentStateFail)
                                                                                                    {
                                                                                                        NSLog(@"分享失败,错误码:%d,错误描述:%@", [error errorCode], [error errorDescription]);
                                                                                                    }
                                                                                                }];
                                                               }],
                                    [ShareSDK shareActionSheetItemWithTitle:[ShareSDK getClientNameWithType:ShareTypeKaixin]
                                                                       icon:[ShareSDK getClientIconWithType:ShareTypeKaixin]
                                                               clickHandler:^{
                                                                   [ShareSDK shareContentWithShareList:[ShareSDK getShareListWithType:ShareTypeKaixin,nil]
                                                                                               content:publishContent
                                                                                         statusBarTips:YES
                                                                                                result:^(ShareType type, SSPublishContentState state, id<ISSStatusInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                                                                                    if (state == SSPublishContentStateSuccess)
                                                                                                    {
                                                                                                        NSLog(@"分享成功");
                                                                                                    }
                                                                                                    else if (state == SSPublishContentStateFail)
                                                                                                    {
                                                                                                        NSLog(@"分享失败,错误码:%d,错误描述:%@", [error errorCode], [error errorDescription]);
                                                                                                    }
                                                                                                }];
                                                               }],
                                    SHARE_TYPE_NUMBER(ShareTypeMail),
                                    SHARE_TYPE_NUMBER(ShareTypeAirPrint),
                                    SHARE_TYPE_NUMBER(ShareTypeCopy),
                                    [ShareSDK shareActionSheetItemWithTitle:[ShareSDK getClientNameWithType:ShareTypeSohuWeibo]
                                                                       icon:[ShareSDK getClientIconWithType:ShareTypeSohuWeibo]
                                                               clickHandler:^{
                                                                   [ShareSDK shareContentWithShareList:[ShareSDK getShareListWithType:ShareTypeSohuWeibo,nil]
                                                                                               content:publishContent
                                                                                         statusBarTips:YES
                                                                                                result:^(ShareType type, SSPublishContentState state, id<ISSStatusInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                                                                                    if (state == SSPublishContentStateSuccess)
                                                                                                    {
                                                                                                        NSLog(@"分享成功");
                                                                                                    }
                                                                                                    else if (state == SSPublishContentStateFail)
                                                                                                    {
                                                                                                        NSLog(@"分享失败,错误码:%d,错误描述:%@", [error errorCode], [error errorDescription]);
                                                                                                    }
                                                                                                }];
                                                               }],
                                    [ShareSDK shareActionSheetItemWithTitle:[ShareSDK getClientNameWithType:ShareType163Weibo]
                                                                       icon:[ShareSDK getClientIconWithType:ShareType163Weibo]
                                                               clickHandler:^{
                                                                   [ShareSDK shareContentWithShareList:[ShareSDK getShareListWithType:ShareType163Weibo,nil]
                                                                                               content:publishContent
                                                                                         statusBarTips:YES
                                                                                                result:^(ShareType type, SSPublishContentState state, id<ISSStatusInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                                                                                    if (state == SSPublishContentStateSuccess)
                                                                                                    {
                                                                                                        NSLog(@"分享成功");
                                                                                                    }
                                                                                                    else if (state == SSPublishContentStateFail)
                                                                                                    {
                                                                                                        NSLog(@"分享失败,错误码:%d,错误描述:%@", [error errorCode], [error errorDescription]);
                                                                                                    }
                                                                                                }];
                                                               }],
                                    [ShareSDK shareActionSheetItemWithTitle:[ShareSDK getClientNameWithType:ShareTypeDouBan]
                                                                       icon:[ShareSDK getClientIconWithType:ShareTypeDouBan]
                                                               clickHandler:^{
                                                                   [ShareSDK shareContentWithShareList:[ShareSDK getShareListWithType:ShareTypeDouBan,nil]
                                                                                               content:publishContent
                                                                                         statusBarTips:YES
                                                                                                result:^(ShareType type, SSPublishContentState state, id<ISSStatusInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                                                                                    if (state == SSPublishContentStateSuccess)
                                                                                                    {
                                                                                                        NSLog(@"分享成功");
                                                                                                    }
                                                                                                    else if (state == SSPublishContentStateFail)
                                                                                                    {
                                                                                                        NSLog(@"分享失败,错误码:%d,错误描述:%@", [error errorCode], [error errorDescription]);
                                                                                                    }
                                                                                                }];
                                                               }],
                                    [ShareSDK shareActionSheetItemWithTitle:[ShareSDK getClientNameWithType:ShareTypeInstapaper]
                                                                       icon:[ShareSDK getClientIconWithType:ShareTypeInstapaper]
                                                               clickHandler:^{
                                                                   [ShareSDK shareContentWithShareList:[ShareSDK getShareListWithType:ShareTypeInstapaper,nil]
                                                                                               content:publishContent
                                                                                         statusBarTips:YES
                                                                                                result:^(ShareType type, SSPublishContentState state, id<ISSStatusInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                                                                                    if (state == SSPublishContentStateSuccess)
                                                                                                    {
                                                                                                        NSLog(@"分享成功");
                                                                                                    }
                                                                                                    else if (state == SSPublishContentStateFail)
                                                                                                    {
                                                                                                        NSLog(@"分享失败,错误码:%d,错误描述:%@", [error errorCode], [error errorDescription]);
                                                                                                    }
                                                                                                }];
                                                               }],
                                    [ShareSDK shareActionSheetItemWithTitle:[ShareSDK getClientNameWithType:ShareTypeYouDaoNote]
                                                                       icon:[ShareSDK getClientIconWithType:ShareTypeYouDaoNote]
                                                               clickHandler:^{
                                                                   [ShareSDK shareContentWithShareList:[ShareSDK getShareListWithType:ShareTypeYouDaoNote,nil]
                                                                                               content:publishContent
                                                                                         statusBarTips:YES
                                                                                                result:^(ShareType type, SSPublishContentState state, id<ISSStatusInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                                                                                    if (state == SSPublishContentStateSuccess)
                                                                                                    {
                                                                                                        NSLog(@"分享成功");
                                                                                                    }
                                                                                                    else if (state == SSPublishContentStateFail)
                                                                                                    {
                                                                                                        NSLog(@"分享失败,错误码:%d,错误描述:%@", [error errorCode], [error errorDescription]);
                                                                                                    }
                                                                                                }];
                                                               }],
                                    nil]
                           content:publishContent
                     statusBarTips:YES
                        convertUrl:YES
                       authOptions:nil
                  shareViewOptions:nil
                            result:^(ShareType type, SSPublishContentState state, id<ISSStatusInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                if (state == SSPublishContentStateSuccess)
                                {
                                    NSLog(@"发表成功");
                                }
                                else if (state == SSPublishContentStateFail)
                                {
                                    NSLog(@"发布失败!error code == %d, error code == %@", [error errorCode], [error errorDescription]);
                                }
                            }];
}

/**
 *	@brief	分享到新浪微博
 *
 *	@param 	sender 	事件对象
 */
- (void)shareToSinaWeiboClickHandler:(UIButton *)sender
{
    id<ISSPublishContent> publishContent = [ShareSDK publishContent:CONTENT
                                                     defaultContent:@""
                                                              image:[UIImage imageNamed:IMAGE_NAME]
                                                       imageQuality:0.8
                                                          mediaType:SSPublishContentMediaTypeText];
    [ShareSDK shareContentWithType:ShareTypeSinaWeibo
                           content:publishContent
               containerController:self
                     statusBarTips:YES
                   oneKeyShareList:[NSArray defaultOneKeyShareList]
                    shareViewStyle:ShareViewStyleDefault
                    shareViewTitle:@"内容分享"
                            result:nil];    
}

/**
 *	@brief	分享到腾讯微博
 *
 *	@param 	sender 	事件对象
 */
- (void)shareToTencentWeiboClickHandler:(UIButton *)sender
{
    id<ISSPublishContent> publishContent = [ShareSDK publishContent:CONTENT
                                                     defaultContent:@""
                                                              image:[UIImage imageNamed:IMAGE_NAME]
                                                       imageQuality:0.8
                                                          mediaType:SSPublishContentMediaTypeText];
    [ShareSDK shareContentWithType:ShareTypeTencentWeibo
                           content:publishContent
               containerController:self
                     statusBarTips:YES
                   oneKeyShareList:[NSArray defaultOneKeyShareList]
                    shareViewStyle:ShareViewStyleDefault
                    shareViewTitle:@"内容分享"
                            result:nil];
}

/**
 *	@brief	分享给QQ好友
 *
 *	@param 	sender 	事件对象
 */
- (void)shareToQQFriendClickHandler:(UIButton *)sender
{
    id<ISSPublishContent> publishContent = [ShareSDK publishContent:CONTENT
                                                     defaultContent:@""
                                                              image:[UIImage imageNamed:IMAGE_NAME]
                                                       imageQuality:0.8
                                                          mediaType:SSPublishContentMediaTypeText
                                                              title:@"ShareSDK"
                                                                url:@"http://www.sharesdk.cn"
                                                       musicFileUrl:nil
                                                            extInfo:nil
                                                           fileData:nil];
    [ShareSDK shareContentWithType:ShareTypeQQ
                           content:publishContent
               containerController:self
                     statusBarTips:NO
                   oneKeyShareList:nil
                    shareViewStyle:ShareViewStyleDefault
                    shareViewTitle:@"内容分享"
                            result:nil];
}

/**
 *	@brief	分享到QQ空间
 *
 *	@param 	sender 	事件对象
 */
- (void)shareToQQSpaceClickHandler:(UIButton *)sender
{
    id<ISSPublishContent> publishContent = [ShareSDK publishContent:CONTENT
                                                     defaultContent:@""
                                                              image:[UIImage imageNamed:IMAGE_NAME]
                                                       imageQuality:0.8
                                                          mediaType:SSPublishContentMediaTypeText];
    [publishContent addQQSpaceUnitWithTitle:@"Hello QQ空间"
                                        url:@"http://www.sharesdk.cn"
                                    comment:INHERIT_VALUE
                                    summary:CONTENT
                                      image:INHERIT_VALUE
                               imageQuality:INHERIT_VALUE
                                       type:INHERIT_VALUE
                                    playUrl:nil
                                  syncWeibo:nil];
    
    [ShareSDK shareContentWithType:ShareTypeQQSpace
                           content:publishContent
               containerController:self
                     statusBarTips:YES
                   oneKeyShareList:[NSArray defaultOneKeyShareList]
                    shareViewStyle:ShareViewStyleDefault
                    shareViewTitle:@"内容分享"
                            result:nil];
}

/**
 *	@brief	分享给微信好友
 *
 *	@param 	sender 	事件对象
 */
- (void)shareToWeixinSessionClickHandler:(UIButton *)sender
{
    id<ISSPublishContent> publishContent = [ShareSDK publishContent:CONTENT
                                                     defaultContent:@""
                                                              image:[UIImage imageNamed:IMAGE_NAME]
                                                       imageQuality:0.8
                                                          mediaType:SSPublishContentMediaTypeText
                                                              title:@"ShareSDK"
                                                                url:@"http://www.sharesdk.cn"
                                                       musicFileUrl:nil
                                                            extInfo:nil
                                                           fileData:nil];
    [ShareSDK shareContentWithType:ShareTypeWeixiSession
                           content:publishContent
               containerController:self
                     statusBarTips:NO
                   oneKeyShareList:nil
                    shareViewStyle:ShareViewStyleDefault
                    shareViewTitle:@"内容分享"
                            result:nil];
}

/**
 *	@brief	分享给微信朋友圈
 *
 *	@param 	sender 	事件对象
 */
- (void)shareToWeixinTimelineClickHandler:(UIButton *)sender
{
    id<ISSPublishContent> publishContent = [ShareSDK publishContent:CONTENT
                                                     defaultContent:@""
                                                              image:[UIImage imageNamed:IMAGE_NAME]
                                                       imageQuality:0.8
                                                          mediaType:SSPublishContentMediaTypeNews
                                                              title:@"ShareSDK"
                                                                url:@"http://www.baidu.com"
                                                       musicFileUrl:nil
                                                            extInfo:nil
                                                           fileData:nil];
    [ShareSDK shareContentWithType:ShareTypeWeixiTimeline
                           content:publishContent
               containerController:self
                     statusBarTips:YES
                          autoAuth:YES
                        convertUrl:YES
                  shareViewOptions:nil
                            result:nil];
}

/**
 *	@brief	分享到网易微博
 *
 *	@param 	sender 	事件对象
 */
- (void)shareTo163WeiboClickHandler:(UIButton *)sender
{
    id<ISSPublishContent> publishContent = [ShareSDK publishContent:CONTENT
                                                     defaultContent:@""
                                                              image:[UIImage imageNamed:IMAGE_NAME]
                                                       imageQuality:0.8
                                                          mediaType:SSPublishContentMediaTypeText];
    [ShareSDK shareContentWithType:ShareType163Weibo
                           content:publishContent
               containerController:self
                     statusBarTips:YES
                   oneKeyShareList:[NSArray defaultOneKeyShareList]
                    shareViewStyle:ShareViewStyleDefault
                    shareViewTitle:@"内容分享"
                            result:nil];
}

/**
 *	@brief	分享到搜狐微博
 *
 *	@param 	sender 	事件对象
 */
- (void)shareToSohuWeiboClickHandler:(UIButton *)sender
{
    id<ISSPublishContent> publishContent = [ShareSDK publishContent:CONTENT
                                                     defaultContent:@""
                                                              image:[UIImage imageNamed:IMAGE_NAME]
                                                       imageQuality:0.8
                                                          mediaType:SSPublishContentMediaTypeText];
    [ShareSDK shareContentWithType:ShareTypeSohuWeibo
                           content:publishContent
               containerController:self
                     statusBarTips:YES
                   oneKeyShareList:[NSArray defaultOneKeyShareList]
                    shareViewStyle:ShareViewStyleDefault
                    shareViewTitle:@"内容分享"
                            result:nil];
}

/**
 *	@brief	分享到人人网
 *
 *	@param 	sender 	事件对象
 */
- (void)shareToRenRenClickHandler:(UIButton *)sender
{
    id<ISSPublishContent> publishContent = [ShareSDK publishContent:CONTENT
                                                     defaultContent:@""
                                                              image:[UIImage imageNamed:IMAGE_NAME]
                                                       imageQuality:0.8
                                                          mediaType:SSPublishContentMediaTypeText];
    
    [ShareSDK shareContentWithType:ShareTypeRenren
                           content:publishContent
               containerController:self
                     statusBarTips:YES
                   oneKeyShareList:[NSArray defaultOneKeyShareList]
                    shareViewStyle:ShareViewStyleDefault
                    shareViewTitle:@"内容分享"
                            result:nil];
}

/**
 *	@brief	分享到开心网
 *
 *	@param 	sender 	事件对象
 */
- (void)shareToKaiXinClickHandler:(UIButton *)sender
{
    
    id<ISSPublishContent> publishContent = [ShareSDK publishContent:CONTENT
                                                     defaultContent:@""
                                                              image:[UIImage imageNamed:IMAGE_NAME]
                                                       imageQuality:0.8
                                                          mediaType:SSPublishContentMediaTypeText];
    [ShareSDK shareContentWithType:ShareTypeKaixin
                           content:publishContent
               containerController:self
                     statusBarTips:YES
                   oneKeyShareList:[NSArray defaultOneKeyShareList]
                    shareViewStyle:ShareViewStyleDefault
                    shareViewTitle:@"内容分享"
                            result:nil];
}

/**
 *	@brief	分享到豆瓣我说
 *
 *	@param 	sender 	事件对象
 */
- (void)shareToDouBanClickHandler:(UIButton *)sender
{
    id<ISSPublishContent> publishContent = [ShareSDK publishContent:CONTENT
                                                     defaultContent:@""
                                                              image:[UIImage imageNamed:IMAGE_NAME]
                                                       imageQuality:0.8
                                                          mediaType:SSPublishContentMediaTypeText];
    [ShareSDK shareContentWithType:ShareTypeDouBan
                           content:publishContent
               containerController:self
                     statusBarTips:YES
                   oneKeyShareList:[NSArray defaultOneKeyShareList]
                    shareViewStyle:ShareViewStyleDefault
                    shareViewTitle:@"内容分享"
                            result:nil];
}

/**
 *	@brief	分享到Instapaper
 *
 *	@param 	sender 	事件对象
 */
- (void)shareToInstapaperClickHandler:(UIButton *)sender
{
    id<ISSPublishContent> publishContent = [ShareSDK publishContent:CONTENT
                                                     defaultContent:@""
                                                              image:[UIImage imageNamed:IMAGE_NAME]
                                                       imageQuality:0.8
                                                          mediaType:SSPublishContentMediaTypeText];
    [ShareSDK shareContentWithType:ShareTypeInstapaper
                           content:publishContent
               containerController:self
                     statusBarTips:YES
                   oneKeyShareList:[NSArray defaultOneKeyShareList]
                    shareViewStyle:ShareViewStyleDefault
                    shareViewTitle:@"内容分享"
                            result:nil];
}

/**
 *	@brief	分享到Facebook
 *
 *	@param 	sender  事件对象
 */
- (void)shareToFacebookClickHandler:(UIButton *)sender

{
    id<ISSPublishContent> publishContent = [ShareSDK publishContent:CONTENT
                                                     defaultContent:@""
                                                              image:[UIImage imageNamed:IMAGE_NAME]
                                                       imageQuality:0.8
                                                          mediaType:SSPublishContentMediaTypeText];
    
    [ShareSDK shareContentWithType:ShareTypeFacebook
                           content:publishContent
               containerController:self
                     statusBarTips:YES
                   oneKeyShareList:[NSArray defaultOneKeyShareList]
                    shareViewStyle:ShareViewStyleDefault
                    shareViewTitle:@"内容分享"
                            result:nil];
}

/**
 *	@brief	分享到Twitter
 *
 *	@param 	sender 	Twitter
 */
- (void)shareToTwitterClickHandler:(UIButton *)sender
{
    id<ISSPublishContent> publishContent = [ShareSDK publishContent:CONTENT
                                                     defaultContent:@""
                                                              image:[UIImage imageNamed:IMAGE_NAME]
                                                       imageQuality:0.8
                                                          mediaType:SSPublishContentMediaTypeText];
    
    [ShareSDK shareContentWithType:ShareTypeTwitter
                           content:publishContent
               containerController:self
                     statusBarTips:YES
                   oneKeyShareList:[NSArray defaultOneKeyShareList]
                    shareViewStyle:ShareViewStyleDefault
                    shareViewTitle:@"内容分享"
                            result:nil];
}

/**
 *	@brief	短信分享
 *
 *	@param 	sender 	事件对象
 */
- (void)shareBySMSClickHandler:(UIButton *)sender
{
    id<ISSPublishContent> publishContent = [ShareSDK publishContent:CONTENT
                                                     defaultContent:@""
                                                              image:[UIImage imageNamed:IMAGE_NAME]
                                                       imageQuality:0.8
                                                          mediaType:SSPublishContentMediaTypeText];
    [ShareSDK shareContentWithType:ShareTypeSMS
                           content:publishContent
               containerController:self
                     statusBarTips:YES
                   oneKeyShareList:[NSArray defaultOneKeyShareList]
                    shareViewStyle:ShareViewStyleDefault
                    shareViewTitle:@"内容分享"
                            result:^(ShareType type, SSPublishContentState state, id<ISSStatusInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                if (state == SSPublishContentStateSuccess)
                                {
                                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                                                        message:@"分享成功"
                                                                                       delegate:nil
                                                                              cancelButtonTitle:@"知道了"
                                                                              otherButtonTitles: nil];
                                    [alertView show];
                                    [alertView release];
                                }
                                else if(state == SSPublishContentStateFail)
                                {
                                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                                                        message:error.errorDescription
                                                                                       delegate:nil
                                                                              cancelButtonTitle:@"知道了"
                                                                              otherButtonTitles: nil];
                                    [alertView show];
                                    [alertView release];
                                }
                            }];
}

/**
 *	@brief	邮件分享
 *
 *	@param 	sender 	事件对象
 */
- (void)shareByMailClickHandler:(UIButton *)sender
{
    id<ISSPublishContent> publishContent = [ShareSDK publishContent:CONTENT
                                                     defaultContent:@""
                                                              image:[UIImage imageNamed:IMAGE_NAME]
                                                       imageQuality:0.8
                                                          mediaType:SSPublishContentMediaTypeText];
    [ShareSDK shareContentWithType:ShareTypeMail
                           content:publishContent
               containerController:self
                     statusBarTips:YES
                   oneKeyShareList:[NSArray defaultOneKeyShareList]
                    shareViewStyle:ShareViewStyleDefault
                    shareViewTitle:@"内容分享"
                            result:^(ShareType type, SSPublishContentState state, id<ISSStatusInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                if (state == SSPublishContentStateSuccess)
                                {
                                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                                                        message:@"分享成功"
                                                                                       delegate:nil
                                                                              cancelButtonTitle:@"知道了"
                                                                              otherButtonTitles: nil];
                                    [alertView show];
                                    [alertView release];
                                }
                                else if(state == SSPublishContentStateFail)
                                {
                                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                                                        message:error.errorDescription
                                                                                       delegate:nil
                                                                              cancelButtonTitle:@"知道了"
                                                                              otherButtonTitles: nil];
                                    [alertView show];
                                    [alertView release];
                                }
                            }];
}

/**
 *	@brief	打印、拷贝
 *
 *	@param 	sender 	事件对象
 */
- (void)shareByPrintOrCopyClickHandler:(UIButton *)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"请选择" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"打印", @"拷贝", nil];
    actionSheet.tag = ACTION_SHEET_PRINT_COPY;
    [actionSheet showInView:self.view];
    [actionSheet release];
}

/**
 *	@brief	分享到有道云笔记
 *
 *	@param 	sender 	事件对象
 */
- (void)shareToYouDaoClickHandler:(UIButton *)sender
{
    id<ISSPublishContent> publishContent = [ShareSDK publishContent:CONTENT
                                                     defaultContent:@""
                                                              image:[UIImage imageNamed:IMAGE_NAME]
                                                       imageQuality:0.8
                                                          mediaType:SSPublishContentMediaTypeText];
    [publishContent addYouDaoNoteUnitWithContent:INHERIT_VALUE
                                           title:@"ShareSDK分享"
                                          author:@"ShareSDK"
                                          source:@"http://www.sharesdk.cn"
                                     attachments:INHERIT_VALUE];
    
    [ShareSDK shareContentWithType:ShareTypeYouDaoNote
                           content:publishContent
               containerController:self
                     statusBarTips:YES
                   oneKeyShareList:[NSArray defaultOneKeyShareList]
                    shareViewStyle:ShareViewStyleDefault
                    shareViewTitle:@"内容分享"
                            result:nil];
    
}

/**
 *	@brief	打印分享内容
 */
- (void)airPrintShareContent
{
    id<ISSPublishContent> publishContent = [ShareSDK publishContent:CONTENT
                                                     defaultContent:@""
                                                              image:[UIImage imageNamed:IMAGE_NAME]
                                                       imageQuality:0.8
                                                          mediaType:SSPublishContentMediaTypeText];
    [ShareSDK shareContentWithType:ShareTypeAirPrint
                           content:publishContent
               containerController:self
                     statusBarTips:YES
                   oneKeyShareList:[NSArray defaultOneKeyShareList]
                    shareViewStyle:ShareViewStyleDefault
                    shareViewTitle:@"内容分享"
                            result:^(ShareType type, SSPublishContentState state, id<ISSStatusInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                if (state == SSPublishContentStateSuccess)
                                {
                                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                                                        message:@"打印成功"
                                                                                       delegate:nil
                                                                              cancelButtonTitle:@"知道了"
                                                                              otherButtonTitles: nil];
                                    [alertView show];
                                    [alertView release];
                                }
                                else if(state == SSPublishContentStateFail)
                                {
                                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                                                        message:error.errorDescription
                                                                                       delegate:nil
                                                                              cancelButtonTitle:@"知道了"
                                                                              otherButtonTitles: nil];
                                    [alertView show];
                                    [alertView release];
                                }
                            }];
}

/**
 *	@brief	拷贝分享内容
 */
- (void)copyShareContent
{
    
    id<ISSPublishContent> publishContent = [ShareSDK publishContent:CONTENT
                                                     defaultContent:@""
                                                              image:[UIImage imageNamed:IMAGE_NAME]
                                                       imageQuality:0.8
                                                          mediaType:SSPublishContentMediaTypeText];
    [ShareSDK shareContentWithType:ShareTypeCopy
                           content:publishContent
               containerController:self
                     statusBarTips:YES
                   oneKeyShareList:[NSArray defaultOneKeyShareList]
                    shareViewStyle:ShareViewStyleDefault
                    shareViewTitle:@"内容分享"
                            result:^(ShareType type, SSPublishContentState state, id<ISSStatusInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                if (state == SSPublishContentStateSuccess)
                                {
                                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                                                        message:@"拷贝成功"
                                                                                       delegate:nil
                                                                              cancelButtonTitle:@"知道了"
                                                                              otherButtonTitles: nil];
                                    [alertView show];
                                    [alertView release];
                                }
                                else if(state == SSPublishContentStateFail)
                                {
                                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                                                        message:error.errorDescription
                                                                                       delegate:nil
                                                                              cancelButtonTitle:@"知道了"
                                                                              otherButtonTitles: nil];
                                    [alertView show];
                                    [alertView release];
                                }
                            }];
}

/**
 *	@brief	关注官方微博
 *
 *	@param 	sender 	事件对象
 */
- (void)followOfficerWeiboClickHandler:(UIButton *)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:self
                                                    cancelButtonTitle:@"取消"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"新浪微博",@"腾讯微博",nil];
    actionSheet.tag = ACTION_SHEET_FOLLOW_USER;
    [actionSheet showInView:self.view];
    [actionSheet release];
}

- (void)followWeixinClickHandler:(UIButton *)sender
{
    [ShareSDK followWeixinUser:@"http://weixin.qq.com/r/HHURHl7EjmDxh099nyA4"];
}

/**
 *	@brief	获取用户信息
 *
 *	@param 	sender 	事件对象
 */
- (void)getUserInfoClickHandler:(UIButton *)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:self
                                                    cancelButtonTitle:@"取消"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"新浪微博",@"腾讯微博",@"搜狐微博",@"网易微博",@"豆瓣社区",@"QQ空间",@"人人网",@"开心网",@"Instapaper",@"有道云笔记",@"Facebook",@"Twitter", nil];
    actionSheet.tag = ACTION_SHEET_GET_USER_INFO;
    [actionSheet showInView:self.view];
    [actionSheet release];
}

- (void)getOtherUserInfoClickHandler:(UIButton *)sender
{
    AGInputUserNameViewController *vc = [[AGInputUserNameViewController alloc] init];
    UINavigationController *navVC = [[[UINavigationController alloc] initWithRootViewController:vc] autorelease];
    [vc release];
    
    [self presentModalViewController:navVC animated:YES];
}

/**
 *	@brief	SSO登录开关按钮点击
 *
 *	@param 	sender 	事件对象
 */
- (void)ssoEnabledClickHandler:(UIButton *)sender
{
    _ssoEnable = !_ssoEnable;
    [sender setTitle:[NSString stringWithFormat:@"SSO登录:%@", _ssoEnable ? @"YES" : @"NO"] forState:UIControlStateNormal];
    [ShareSDK ssoEnabled:_ssoEnable];
}

/**
 *	@brief	获取AccessToken按钮点击
 *
 *	@param 	sender 	事件对象
 */
- (void)getAccessTokenClickHandler:(UIButton *)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:self
                                                    cancelButtonTitle:@"取消"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"新浪微博",@"腾讯微博",@"搜狐微博",@"网易微博",@"豆瓣社区",@"QQ空间",@"人人网",@"开心网",@"Instapaper", @"有道云笔记", @"Facebook", @"Twitter", nil];
    actionSheet.tag = ACTION_SHEET_GET_ACCESS_TOKEN;
    [actionSheet showInView:self.view];
    [actionSheet release];
}

- (void)setAccessTokenClickHandler:(UIButton *)sender
{
    id<IClientToken> token = [ShareSDK getClientTokenWithType:ShareTypeSinaWeibo];
    
    //令牌数据可以为外部授权后取得的数据字典结构。
    id<IClientToken> newToken = [ShareSDK clientTokenWithData:[token sourceData] type:ShareTypeSinaWeibo];
    [ShareSDK setClientToken:newToken];
}

/**
 *	@brief	自定义分享菜单项按钮点击
 *
 *	@param 	sender 	事件对象
 */
- (void)customShareMenuClickHandler:(UIButton *)sender
{
    NSArray *shareList = [ShareSDK getShareListWithType:ShareTypeTwitter, ShareTypeFacebook, ShareTypeSinaWeibo, ShareTypeTencentWeibo, ShareTypeRenren, ShareTypeKaixin, ShareTypeSohuWeibo, ShareType163Weibo, nil];
    
    id<ISSPublishContent> publishContent = [ShareSDK publishContent:CONTENT
                                                     defaultContent:@""
                                                              image:[UIImage imageNamed:IMAGE_NAME]
                                                       imageQuality:0.8
                                                          mediaType:SSPublishContentMediaTypeNews
                                                              title:@"ShareSDK"
                                                                url:@"http://www.sharesdk.cn"
                                                       musicFileUrl:nil
                                                            extInfo:nil
                                                           fileData:nil];
    
    [ShareSDK showShareActionSheet:self
                     iPadContainer:[ShareSDK iPadShareContainerWithView:sender
                                                            arrowDirect:UIPopoverArrowDirectionDown]
                         shareList:shareList
                           content:publishContent
                     statusBarTips:YES
                        convertUrl:YES      //委托转换链接标识，YES：对分享链接进行转换，NO：对分享链接不进行转换，为此值时不进行回流统计。
                       authOptions:nil
                  shareViewOptions:[ShareSDK defaultShareViewOptionsWithTitle:@"内容分享"
                                                              oneKeyShareList:[NSArray defaultOneKeyShareList]
                                                               qqButtonHidden:NO
                                                        wxSessionButtonHidden:NO
                                                       wxTimelineButtonHidden:NO
                                                         showKeyboardOnAppear:YES]
                            result:^(ShareType type, SSPublishContentState state, id<ISSStatusInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                if (state == SSPublishContentStateSuccess)
                                {
                                    NSLog(@"分享成功");
                                }
                                else if (state == SSPublishContentStateFail)
                                {
                                    NSLog(@"分享失败,错误码:%d,错误描述:%@", [error errorCode], [error errorDescription]);
                                }
                            }];
}

/**
 *	@brief	自定义分享菜单项按钮点击
 *
 *	@param 	sender 	事件对象
 */
- (void)customShareMenuItemClickHandler:(UIButton *)sender
{
    id<ISSPublishContent> publishContent = [ShareSDK publishContent:CONTENT
                                                     defaultContent:@""
                                                              image:[UIImage imageNamed:IMAGE_NAME]
                                                       imageQuality:0.8
                                                          mediaType:SSPublishContentMediaTypeNews
                                                              title:@"ShareSDK"
                                                                url:@"http://www.sharesdk.cn"
                                                       musicFileUrl:nil
                                                            extInfo:nil
                                                           fileData:nil];
    
    [ShareSDK showShareActionSheet:self
                     iPadContainer:[ShareSDK iPadShareContainerWithView:sender
                                                            arrowDirect:UIPopoverArrowDirectionDown]
                         shareList:[ShareSDK customShareListWithType:
                                    SHARE_TYPE_NUMBER(ShareTypeSinaWeibo),
                                    [ShareSDK shareActionSheetItemWithTitle:@"自定义项1"
                                                                       icon:[UIImage imageNamed:@"qqicon.png"]
                                                               clickHandler:^{
                                                                   UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"自定义项1被点击了!" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
                                                                   [alertView show];
                                                                   [alertView release];
                                                               }],
                                    [ShareSDK shareActionSheetItemWithTitle:@"自定义项2"
                                                                       icon:[UIImage imageNamed:@"qqicon.png"]
                                                               clickHandler:^{
                                                                   UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"自定义项2被点击了!" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
                                                                   [alertView show];
                                                                   [alertView release];
                                                               }],
                                    [ShareSDK shareActionSheetItemWithTitle:@"自定义项3"
                                                                       icon:[UIImage imageNamed:@"qqicon.png"]
                                                               clickHandler:^{
                                                                   UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"自定义项3被点击了!" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
                                                                   [alertView show];
                                                                   [alertView release];
                                                               }],
                                    [ShareSDK shareActionSheetItemWithTitle:@"自定义项4"
                                                                       icon:[UIImage imageNamed:@"qqicon.png"]
                                                               clickHandler:^{
                                                                   UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"自定义项4被点击了!" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
                                                                   [alertView show];
                                                                   [alertView release];
                                                               }],
                                    [ShareSDK shareActionSheetItemWithTitle:@"自定义项5"
                                                                       icon:[UIImage imageNamed:@"qqicon.png"]
                                                               clickHandler:^{
                                                                   UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"自定义项5被点击了!" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
                                                                   [alertView show];
                                                                   [alertView release];
                                                               }],
                                    nil]
                           content:publishContent
                     statusBarTips:YES
                        convertUrl:YES      //委托转换链接标识，YES：对分享链接进行转换，NO：对分享链接不进行转换，为此值时不进行回流统计。
                       authOptions:nil
                  shareViewOptions:[ShareSDK defaultShareViewOptionsWithTitle:@"内容分享"
                                                              oneKeyShareList:[NSArray defaultOneKeyShareList]
                                                               qqButtonHidden:NO
                                                        wxSessionButtonHidden:NO
                                                       wxTimelineButtonHidden:NO
                                                         showKeyboardOnAppear:YES]
                            result:^(ShareType type, SSPublishContentState state, id<ISSStatusInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                if (state == SSPublishContentStateSuccess)
                                {
                                    NSLog(@"分享成功");
                                }
                                else if (state == SSPublishContentStateFail)
                                {
                                    NSLog(@"分享失败,错误码:%d,错误描述:%@", [error errorCode], [error errorDescription]);
                                }
                            }];
}

- (void)shareGifPicClickHandler:(id)sender
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"res6" ofType:@"gif"];
    id<ISSPublishContent> publishContent = [ShareSDK publishContent:CONTENT
                                                     defaultContent:nil
                                                        imageObject:[ShareSDK gifImageWithData:[NSData dataWithContentsOfFile:path] fileName:nil]];
//    [ShareSDK publishContent:CONTENT
//                                                     defaultContent:@""
//                                                              image:[UIImage imageNamed:IMAGE_NAME]
//                                                       imageQuality:0.8
//                                                          mediaType:SSPublishContentMediaTypeNews
//                                                              title:@"ShareSDK"
//                                                                url:@"http://www.sharesdk.cn"
//                                                       musicFileUrl:nil
//                                                            extInfo:nil
//                                                           fileData:nil];
    
    
    //定制人人网分享
    [publishContent addRenRenUnitWithName:@"Hello 人人网"
                              description:@"这是一条测试信息"
                                      url:SHARE_URL
                                  message:INHERIT_VALUE
                              imageObject:INHERIT_VALUE
                                  caption:nil];
    
    //定制QQ空间分享
    [publishContent addQQSpaceUnitWithTitle:INHERIT_VALUE
                                        url:SHARE_URL
                                    comment:INHERIT_VALUE
                                    summary:@"Hello QQ空间"
                                imageObject:INHERIT_VALUE
                                       type:INHERIT_VALUE
                                    playUrl:INHERIT_VALUE
                                  syncWeibo:INHERIT_VALUE];
    
    //定制微信好友内容
    [publishContent addWeixinSessionUnitWithType:[NSNumber numberWithInteger:SSPublishContentMediaTypeNews]
                                         content:@"Hello 微信好友!"
                                           title:INHERIT_VALUE
                                             url:SHARE_URL
                                           image:INHERIT_VALUE
                                    imageQuality:INHERIT_VALUE
                                    musicFileUrl:INHERIT_VALUE
                                         extInfo:INHERIT_VALUE
                                        fileData:INHERIT_VALUE];
    
    //定制微信朋友圈内容
    [publishContent addWeixinTimelineUnitWithType:[NSNumber numberWithInteger:SSPublishContentMediaTypeMusic]
                                          content:@"Hello 微信朋友圈!"
                                            title:INHERIT_VALUE
                                              url:@"http://y.qq.com/i/song.html#p=7B22736F6E675F4E616D65223A22E4BDA0E4B88DE698AFE79C9FE6ADA3E79A84E5BFABE4B990222C22736F6E675F5761704C69766555524C223A22687474703A2F2F74736D7573696332342E74632E71712E636F6D2F586B303051563558484A645574315070536F4B7458796931667443755A68646C2F316F5A4465637734356375386355672B474B304964794E6A3770633447524A574C48795333383D2F3634363232332E6D34613F7569643D32333230303738313038266469723D423226663D312663743D3026636869643D222C22736F6E675F5769666955524C223A22687474703A2F2F73747265616D31382E71716D757369632E71712E636F6D2F33303634363232332E6D7033222C226E657454797065223A2277696669222C22736F6E675F416C62756D223A22E5889BE980A0EFBC9AE5B08FE5B7A8E89B8B444E414C495645EFBC81E6BC94E594B1E4BC9AE5889BE7BAAAE5BD95E99FB3222C22736F6E675F4944223A3634363232332C22736F6E675F54797065223A312C22736F6E675F53696E676572223A22E4BA94E69C88E5A4A9222C22736F6E675F576170446F776E4C6F616455524C223A22687474703A2F2F74736D757369633132382E74632E71712E636F6D2F586C464E4D31354C5569396961495674593739786D436534456B5275696879366A702F674B65356E4D6E684178494C73484D6C6A307849634A454B394568572F4E3978464B316368316F37636848323568413D3D2F33303634363232332E6D70333F7569643D32333230303738313038266469723D423226663D302663743D3026636869643D2673747265616D5F706F733D38227D"
                                            image:INHERIT_VALUE
                                     imageQuality:INHERIT_VALUE
                                     musicFileUrl:@"http://mp3.mwap8.com/destdir/Music/2009/20090601/ZuiXuanMinZuFeng20090601119.mp3"
                                          extInfo:nil
                                         fileData:nil];
    
    //定制QQ分享内容
    [publishContent addQQUnitWithType:[NSNumber numberWithInteger:SSPublishContentMediaTypeNews]
                              content:@"Hello QQ!"
                                title:INHERIT_VALUE
                                  url:SHARE_URL
                                image:INHERIT_VALUE
                         imageQuality:INHERIT_VALUE];
    
    //定制邮件分享内容
    [publishContent addMailUnitWithSubject:INHERIT_VALUE
                                   content:@"<a href='http://sharesdk.cn'>Hello Mail</a>"
                                    isHTML:[NSNumber numberWithBool:YES]
                               attachments:INHERIT_VALUE];
    
    //定制短信分享内容
    [publishContent addSMSUnitWithContent:@"Hello SMS!"];
    
    //定制有道云笔记分享内容
    [publishContent addYouDaoNoteUnitWithContent:INHERIT_VALUE
                                           title:@"ShareSDK分享"
                                          author:@"ShareSDK"
                                          source:SHARE_URL
                                     attachments:INHERIT_VALUE];
    //定制Instapaper分享内容
    [publishContent addInstapaperContentWithUrl:SHARE_URL
                                          title:@"Hello Instapaper"
                                    description:INHERIT_VALUE];
    
    [ShareSDK showShareActionSheet:self
                     iPadContainer:[ShareSDK iPadShareContainerWithView:sender arrowDirect:UIPopoverArrowDirectionUp]
                         shareList:nil
                           content:publishContent
                     statusBarTips:YES
                        convertUrl:YES      //委托转换链接标识，YES：对分享链接进行转换，NO：对分享链接不进行转换，为此值时不进行回流统计。
                       authOptions:nil
                  shareViewOptions:[ShareSDK defaultShareViewOptionsWithTitle:@"内容分享"
                                                              oneKeyShareList:[NSArray defaultOneKeyShareList]
                                                               qqButtonHidden:NO
                                                        wxSessionButtonHidden:NO
                                                       wxTimelineButtonHidden:NO
                                                         showKeyboardOnAppear:YES]
                            result:^(ShareType type, SSPublishContentState state, id<ISSStatusInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                if (state == SSPublishContentStateSuccess)
                                {
                                    NSLog(@"分享成功");
                                }
                                else if (state == SSPublishContentStateFail)
                                {
                                    NSLog(@"分享失败,错误码:%d,错误描述:%@", [error errorCode], [error errorDescription]);
                                }
                            }];
}

#pragma mark - Private

- (void)leftButtonClickHandler:(id)sender
{
    [self.viewDeckController toggleLeftViewAnimated:YES];
}

- (void)moreButtonClickHanlder:(id)sender
{
    UIViewController *moreVC = [[[ShareSDKDemoMoreViewController alloc] init] autorelease];
    moreVC.title = @"更多";
    UINavigationController *navMoreVC = [[[UINavigationController alloc] initWithRootViewController:moreVC] autorelease];
    [self presentModalViewController:navMoreVC animated:YES];
}

- (void)layoutPortrait
{
    UIButton *btn = (UIButton *)self.navigationItem.leftBarButtonItem.customView;
    btn.frame = CGRectMake(btn.left, btn.top, 55.0, 32.0);
    [btn setBackgroundImage:[UIImage imageNamed:@"PublishEx/NavigationButtonBG.png"
                                     bundleName:BUNDLE_NAME]
                   forState:UIControlStateNormal];
    
    if ([UIDevice currentDevice].isPad)
    {
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"PublishEx_iPad/NavigationBarBG.png" bundleName:BUNDLE_NAME]];
    }
    else
    {
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"PublishEx/NavigationBarBG.png" bundleName:BUNDLE_NAME]];
    }
}

- (void)layoutLandscape
{
    if (![UIDevice currentDevice].isPad)
    {
        //iPhone
        UIButton *btn = (UIButton *)self.navigationItem.leftBarButtonItem.customView;
        btn.frame = CGRectMake(btn.left, btn.top, 48.0, 24.0);
        [btn setBackgroundImage:[UIImage imageNamed:@"PublishEx_Landscape/NavigationButtonBG.png"
                                         bundleName:BUNDLE_NAME]
                       forState:UIControlStateNormal];
        
        if ([[UIDevice currentDevice] isPhone5])
        {
            [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"PublishEx_Landscape/NavigationBarBG-568h.png"
                                                                                 bundleName:BUNDLE_NAME]];
        }
        else
        {
            [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"PublishEx_Landscape/NavigationBarBG.png"
                                                                                 bundleName:BUNDLE_NAME]];
        }
    }
    else
    {
        UIButton *btn = (UIButton *)self.navigationItem.leftBarButtonItem.customView;
        btn.frame = CGRectMake(btn.left, btn.top, 55.0, 32.0);
        [btn setBackgroundImage:[UIImage imageNamed:@"PublishEx/NavigationButtonBG.png"
                                         bundleName:BUNDLE_NAME]
                       forState:UIControlStateNormal];
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"PublishEx_iPad_Landscape/NavigationBarBG.png" bundleName:BUNDLE_NAME]];
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

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        //关注用户
        [ShareSDK followUserWithName:@"ShareSDK"
                           shareType:_followType
                              result:^(BOOL result, id<ISSUserInfo> userInfo, id<ICMErrorInfo> error) {
                                  NSString *msg = nil;
                                  if (result)
                                  {
                                      msg = @"关注成功";
                                  }
                                  else
                                  {
                                      msg = [NSString stringWithFormat:@"关注失败:%@", error.errorDescription];
                                  }
                                  
                                  UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                                                      message:msg
                                                                                     delegate:nil
                                                                            cancelButtonTitle:@"知道了"
                                                                            otherButtonTitles:nil];
                                  [alertView show];
                                  [alertView release];
                              }];
    }
}

@end
