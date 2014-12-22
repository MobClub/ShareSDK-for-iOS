//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.mob.com
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import "AGAuthViewController.h"
#import <AGCommon/UIImage+Common.h>
#import "AGShareCell.h"
#import <AGCommon/UINavigationBar+Common.h>
#import "ShareSDKDemoMoreViewController.h"

#import <AGCommon/UIColor+Common.h>
#import "IIViewDeckController.h"
#import <AGCommon/UIDevice+Common.h>
#import "AGAppDelegate.h"
#import <AGCommon/NSString+Common.h>

#define TARGET_CELL_ID @"targetCell"
#define BASE_TAG 100

@interface AGAuthViewController (Private)

/**
 *	@brief	用户信息更新
 *
 *	@param 	notif 	通知
 */
- (void)userInfoUpdateHandler:(NSNotification *)notif;


@end

@implementation AGAuthViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
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
        
        //监听用户信息变更
        [ShareSDK addNotificationWithName:SSN_USER_INFO_UPDATE
                                   target:self
                                   action:@selector(userInfoUpdateHandler:)];
        
        _shareTypeArray = [[NSMutableArray alloc] init];

        NSArray *shareTypes = [ShareSDK connectedPlatformTypes];
        for (int i = 0; i < [shareTypes count]; i++)
        {
            NSNumber *typeNum = [shareTypes objectAtIndex:i];
            ShareType type = (ShareType)[typeNum integerValue];
            id<ISSPlatformApp> app = [ShareSDK getClientWithType:type];
            
            
            if ([app isSupportOneKeyShare] || type == ShareTypeInstagram || type == ShareTypeGooglePlus || type == ShareTypeQQSpace || type == ShareTypeWeixiSession)
            {
                [_shareTypeArray addObject:[NSMutableDictionary dictionaryWithObject:[shareTypes objectAtIndex:i]
                                                                              forKey:@"type"]];
            }
        }
        
        NSArray *authList = [NSArray arrayWithContentsOfFile:[NSString stringWithFormat:@"%@/authListCache.plist",NSTemporaryDirectory()]];
        if (authList == nil)
        {
            [_shareTypeArray writeToFile:[NSString stringWithFormat:@"%@/authListCache.plist",NSTemporaryDirectory()] atomically:YES];
        }
        else
        {
            for (int i = 0; i < [authList count]; i++)
            {
                NSDictionary *item = [authList objectAtIndex:i];
                for (int j = 0; j < [_shareTypeArray count]; j++)
                {
                    if ([[[_shareTypeArray objectAtIndex:j] objectForKey:@"type"] integerValue] == [[item objectForKey:@"type"] integerValue])
                    {
                        [_shareTypeArray replaceObjectAtIndex:j withObject:[NSMutableDictionary dictionaryWithDictionary:item]];
                        break;
                    }
                }
            }
        }
    }
    return self;
}

- (void)dealloc
{
    [ShareSDK removeNotificationWithName:SSN_USER_INFO_UPDATE target:self];
    SAFE_RELEASE(_shareTypeArray);
    
    [super dealloc];
}

- (void)setTitle:(NSString *)title
{
    [super setTitle:title];
    ((UILabel *)self.navigationItem.titleView).text = title;
    [self.navigationItem.titleView sizeToFit];
}

- (void)loadView
{
    [super loadView];
    
    if ([[UIDevice currentDevice].systemVersion versionStringCompare:@"7.0"] != NSOrderedAscending)
    {
        [self setExtendedLayoutIncludesOpaqueBars:NO];
        [self setEdgesForExtendedLayout:SSRectEdgeBottom | SSRectEdgeLeft | SSRectEdgeRight];
    }

    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.width, self.view.height)
                                               style:UITableViewStyleGrouped];
    _tableView.rowHeight = 50.0;
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    _tableView.backgroundColor = [UIColor colorWithRGB:0xe1e0de];
    _tableView.backgroundView = nil;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    [_tableView release];
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

- (void)authSwitchChangeHandler:(UISwitch *)sender
{
    AGAppDelegate *appDelegate = (AGAppDelegate *)[UIApplication sharedApplication].delegate;
    
    NSInteger index = sender.tag - BASE_TAG;
    
    if (index < [_shareTypeArray count])
    {
        NSMutableDictionary *item = [_shareTypeArray objectAtIndex:index];
        if (sender.on)
        {
            
            //用户用户信息
            ShareType type = (ShareType)[[item objectForKey:@"type"] integerValue];
            
            id<ISSAuthOptions> authOptions = [ShareSDK authOptionsWithAutoAuth:YES
                                                                 allowCallback:YES
                                                                 authViewStyle:SSAuthViewStyleFullScreenPopup
                                                                  viewDelegate:nil
                                                       authManagerViewDelegate:appDelegate.viewDelegate];
            
            //在授权页面中添加关注官方微博
            [authOptions setFollowAccounts:[NSDictionary dictionaryWithObjectsAndKeys:
                                            [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                            SHARE_TYPE_NUMBER(ShareTypeSinaWeibo),
                                            [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                            SHARE_TYPE_NUMBER(ShareTypeTencentWeibo),
                                            nil]];
            
            [ShareSDK getUserInfoWithType:type
                              authOptions:authOptions
                                   result:^(BOOL result, id<ISSPlatformUser> userInfo, id<ICMErrorInfo> error) {
                                       if (result)
                                       {
                                           [item setObject:[userInfo nickname] forKey:@"username"];
                                           [_shareTypeArray writeToFile:[NSString stringWithFormat:@"%@/authListCache.plist",NSTemporaryDirectory()] atomically:YES];
                                       }
                                       NSLog(@"%ld:%@",(long)[error errorCode], [error errorDescription]);
                                       [_tableView reloadData];
                                   }];
        }
        else
        {
            //取消授权
            [ShareSDK cancelAuthWithType:(ShareType)[[item objectForKey:@"type"] integerValue]];
            [_tableView reloadData];
        }
        
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_shareTypeArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TARGET_CELL_ID];
    if (cell == nil)
    {
        cell = [[[AGShareCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TARGET_CELL_ID] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UISwitch *switchCtrl = [[UISwitch alloc] initWithFrame:CGRectZero];
        [switchCtrl sizeToFit];
        [switchCtrl addTarget:self action:@selector(authSwitchChangeHandler:) forControlEvents:UIControlEventValueChanged];
        cell.accessoryView = switchCtrl;
        [switchCtrl release];
    }
    if (indexPath.row < [_shareTypeArray count])
    {
        NSDictionary *item = [_shareTypeArray objectAtIndex:indexPath.row];
        
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:
                                            @"Icon/sns_icon_%ld.png",
                                            (long)[[item objectForKey:@"type"] integerValue]]
                                bundleName:BUNDLE_NAME];
        cell.imageView.image = img;
        
        ((UISwitch *)cell.accessoryView).on = [ShareSDK hasAuthorizedWithType:(ShareType)[[item objectForKey:@"type"] integerValue]];
        ((UISwitch *)cell.accessoryView).tag = BASE_TAG + indexPath.row;
        
        if (((UISwitch *)cell.accessoryView).on)
        {
            cell.textLabel.text = [item objectForKey:@"username"];
        }
        else
        {
            cell.textLabel.text = NSLocalizedString(@"TEXT_UNAUTH_2", @"尚未授权");
        }
    }
    
    return cell;
}

#pragma mark - Private

- (void)leftButtonClickHandler:(id)sender
{
    [self.viewDeckController toggleLeftViewAnimated:YES];
}

- (void)moreButtonClickHanlder:(id)sender
{
    UIViewController *moreVC = [[[ShareSDKDemoMoreViewController alloc] init] autorelease];
    moreVC.title = NSLocalizedString(@"TEXT_MORE", @"更多");
    UINavigationController *navMoreVC = [[[UINavigationController alloc] initWithRootViewController:moreVC] autorelease];
    [self presentModalViewController:navMoreVC animated:YES];
}

- (void)userInfoUpdateHandler:(NSNotification *)notif
{
    NSInteger plat = [[[notif userInfo] objectForKey:SSK_PLAT] integerValue];
    id<ISSPlatformUser> userInfo = [[notif userInfo] objectForKey:SSK_USER_INFO];
    
    for (int i = 0; i < [_shareTypeArray count]; i++)
    {
        NSMutableDictionary *item = [_shareTypeArray objectAtIndex:i];
        ShareType type = (ShareType)[[item objectForKey:@"type"] integerValue];
        if (type == plat)
        {
            [item setObject:[userInfo nickname] forKey:@"username"];
            [_tableView reloadData];
        }
    }
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
