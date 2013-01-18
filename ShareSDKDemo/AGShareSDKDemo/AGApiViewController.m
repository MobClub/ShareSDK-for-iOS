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

#define TABLE_CELL_ID @"tableCell"

#define ACTION_SHEET_GET_USER_INFO 200
#define ACTION_SHEET_FOLLOW_USER 201
#define ACTION_SHEET_GET_OTHER_USER_INFO 202
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
        UIButton *button = [UIButton buttonWithType:UIButtonTypeInfoLight];
        button.frame = CGRectMake(0.0, 0.0, 43, 33);
        [button addTarget:self action:@selector(moreButtonClickHanlder:) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:button] autorelease];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"AGShareSDK/PublishEx/NavigationBarBG.png" bundleName:@"Appgo"]];
    self.view.backgroundColor = [UIColor whiteColor];
    
//    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.width, self.view.height)
//                                              style:UITableViewStylePlain];
//    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//    _tableView.dataSource = self;
//    _tableView.delegate = self;
//    [self.view addSubview:_tableView];
//    [_tableView release];
    
    CGFloat top = VERTICAL_GAP;
    CGFloat buttonW = (self.view.width - LEFT_PADDING - RIGHT_PADDING - HORIZONTAL_GAP) / 2;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.width, self.view.height)];
    scrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"分享全部" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING, top, self.view.width - LEFT_PADDING - RIGHT_PADDING, 45.0);
    [button addTarget:self action:@selector(shareAllButtonClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    top += button.height + VERTICAL_GAP;
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"关注官方微博" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING, top, buttonW, 45.0);
    [button addTarget:self action:@selector(followOfficerWeiboClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"获取用户资料" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING + buttonW + HORIZONTAL_GAP, top, buttonW, 45.0);
    [button addTarget:self action:@selector(getUserInfoClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    top += button.height + VERTICAL_GAP;
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"关注微信" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING, top, buttonW, 45.0);
    [button addTarget:self action:@selector(followWeixinClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"获取其他用户信息" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING + buttonW + HORIZONTAL_GAP, top, buttonW, 45.0);
    [button addTarget:self action:@selector(getOtherUserInfoClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    top += button.height + VERTICAL_GAP;
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"分享到新浪微博" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING, top, buttonW, 45.0);
    [button addTarget:self action:@selector(shareToSinaWeiboClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"分享到腾讯微博" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING + buttonW + HORIZONTAL_GAP, top, buttonW, 45.0);
    [button addTarget:self action:@selector(shareToTencentWeiboClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    top += button.height + VERTICAL_GAP;
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"分享给QQ好友" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING, top, buttonW, 45.0);
    [button addTarget:self action:@selector(shareToQQFriendClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"分享到QQ空间" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING + buttonW + HORIZONTAL_GAP, top, buttonW, 45.0);
    [button addTarget:self action:@selector(shareToQQSpaceClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    top += button.height + VERTICAL_GAP;
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"分享给微信好友" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING, top, buttonW, 45.0);
    [button addTarget:self action:@selector(shareToWeixinSessionClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"分享到微信朋友圈" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING + buttonW + HORIZONTAL_GAP, top, buttonW, 45.0);
    [button addTarget:self action:@selector(shareToWeixinTimelineClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    top += button.height + VERTICAL_GAP;
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"分享到网易微博" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING, top, buttonW, 45.0);
    [button addTarget:self action:@selector(shareTo163WeiboClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"分享到搜狐微博" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING + buttonW + HORIZONTAL_GAP, top, buttonW, 45.0);
    [button addTarget:self action:@selector(shareToSohuWeiboClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    top += button.height + VERTICAL_GAP;
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"分享到人人网" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING, top, buttonW, 45.0);
    [button addTarget:self action:@selector(shareToRenRenClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"分享到开心网" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING + buttonW + HORIZONTAL_GAP, top, buttonW, 45.0);
    [button addTarget:self action:@selector(shareToKaiXinClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    top += button.height + VERTICAL_GAP;
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"分享到豆瓣我说" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING, top, buttonW, 45.0);
    [button addTarget:self action:@selector(shareToDouBanClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"短信分享" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING + buttonW + HORIZONTAL_GAP, top, buttonW, 45.0);
    [button addTarget:self action:@selector(shareBySMSClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    top += button.height + VERTICAL_GAP;
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"邮件分享" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING, top, buttonW, 45.0);
    [button addTarget:self action:@selector(shareByMailClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"打印、拷贝" forState:UIControlStateNormal];
    button.frame = CGRectMake(LEFT_PADDING + buttonW + HORIZONTAL_GAP, top, buttonW, 45.0);
    [button addTarget:self action:@selector(shareByPrintOrCopyClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
    scrollView.contentSize = CGSizeMake(self.view.width, top += button.height + VERTICAL_GAP);
    [self.view addSubview:scrollView];
    [scrollView release];
    
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
            [actionSheet showFromTabBar:self.tabBarController.tabBar];
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
            [actionSheet showFromTabBar:self.tabBarController.tabBar];
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
    [ShareSDK showShareActionSheet:self
                         shareList:nil
                           content:publishContent
                     statusBarTips:YES
                   oneKeyShareList:[NSArray defaultOneKeyShareList]
                    shareViewStyle:ShareViewStyleDefault
                    shareViewTitle:@"内容分享"
                            result:^(ShareType type, SSPublishContentState state, id<ISSStatusInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                if (state == SSPublishContentStateSuccess)
                                {
                                    NSLog(@"发送成功");
                                }
                                else
                                {
                                    NSLog(@"发送失败");
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
                                                          mediaType:SSPublishContentMediaTypeText
                                                              title:@"ShareSDK"
                                                                url:@"http://www.sharesdk.cn"
                                                       musicFileUrl:nil
                                                            extInfo:nil
                                                           fileData:nil];
    [ShareSDK shareContentWithType:ShareTypeWeixiTimeline
                           content:publishContent
               containerController:self
                     statusBarTips:NO
                   oneKeyShareList:nil
                    shareViewStyle:ShareViewStyleDefault
                    shareViewTitle:@"内容分享"
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
    [actionSheet showFromTabBar:self.tabBarController.tabBar];
    [actionSheet release];
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
    [actionSheet showFromTabBar:self.tabBarController.tabBar];
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
                                                    otherButtonTitles:@"新浪微博",@"腾讯微博",@"搜狐微博",@"网易微博",@"豆瓣社区",@"QQ空间",@"人人网",@"开心网", nil];
    actionSheet.tag = ACTION_SHEET_GET_USER_INFO;
    [actionSheet showFromTabBar:self.tabBarController.tabBar];
    [actionSheet release];
}

- (void)getOtherUserInfoClickHandler:(UIButton *)sender
{
    AGInputUserNameViewController *vc = [[AGInputUserNameViewController alloc] init];
    UINavigationController *navVC = [[[UINavigationController alloc] initWithRootViewController:vc] autorelease];
    [vc release];
    
    [self presentModalViewController:navVC animated:YES];
}

#pragma mark - Private

- (void)moreButtonClickHanlder:(id)sender
{
    UIViewController *moreVC = [[[ShareSDKDemoMoreViewController alloc] init] autorelease];
    moreVC.title = @"更多";
    UINavigationController *navMoreVC = [[[UINavigationController alloc] initWithRootViewController:moreVC] autorelease];
    [self presentModalViewController:navMoreVC animated:YES];
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
