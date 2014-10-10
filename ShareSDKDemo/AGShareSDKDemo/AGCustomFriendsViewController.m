//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.mob.com
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import "AGCustomFriendsViewController.h"
#import <AGCommon/UIImage+Common.h>
#import <AGCommon/UIDevice+Common.h>
#import <AGCommon/UINavigationBar+Common.h>
#import "AGCustomUserInfoCell.h"
#import "AGCustomMoreCell.h"
#import "AGAppDelegate.h"
#import <AGCommon/NSString+Common.h>

#define USER_CELL_ID @"userCell"
#define MORE_CELL_ID @"moreCell"

#define TOOLBAR_HEIGHT 54

@implementation AGCustomFriendsViewController

- (id)initWithShareType:(ShareType)shareType changeHandler:(void(^)(NSArray *users, ShareType shareType))changeHandler
{
    self = [super init];
    if (self)
    {
        _appDelegate = (AGAppDelegate *)[UIApplication sharedApplication].delegate;
        _shareType = shareType;
        _changeHandler = [changeHandler copy];
        _imageCacheManager = [[CMImageCacheManager alloc] init];
        _friendsArray = [[NSMutableArray alloc] init];
        _selectedArray = [[NSMutableArray alloc] init];
        
        UIButton *leftBtn = [[[UIButton alloc] init] autorelease];
        [leftBtn setBackgroundImage:[UIImage imageNamed:@"NavigationButtonBG.png"]
                           forState:UIControlStateNormal];
        [leftBtn setTitle:NSLocalizedString(@"TEXT_BACK", @"返回") forState:UIControlStateNormal];
        leftBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        leftBtn.frame = CGRectMake(0.0, 0.0, 53.0, 30.0);
        [leftBtn addTarget:self action:@selector(backButtonClickHandler:) forControlEvents:UIControlEventTouchUpInside];
        
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
        
        switch (shareType)
        {
            case ShareTypeSinaWeibo:
                self.title = NSLocalizedString(@"TEXT_MENTION_SINA_WEIBO_FRIENDS", @"@新浪微博好友");
                break;
            case ShareTypeTencentWeibo:
                self.title = NSLocalizedString(@"TEXT_MENTION_TENCENT_WEIBO_FRIEND", @"@腾讯微博好友");
                break;
            case ShareTypeTwitter:
                self.title = NSLocalizedString(@"TEXT_MENTION_TWITTER_FRIEND", @"@Twitter好友");
                break;
            default:
                break;
        }
    }
    return self;
}

- (void)dealloc
{
    SAFE_RELEASE(_friendsArray);
    SAFE_RELEASE(_selectedArray);
    SAFE_RELEASE(_imageCacheManager);
    SAFE_RELEASE(_changeHandler);
    
    _tableView.delegate = nil;
    _tableView.dataSource = nil;
    _tableView = nil;
    
    _refreshHeaderView = nil;
    
    [super dealloc];
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
	// Do any additional setup after loading the view.
    
    if ([[UIDevice currentDevice].systemVersion versionStringCompare:@"7.0"] != NSOrderedAscending)
    {
        [self setExtendedLayoutIncludesOpaqueBars:NO];
        [self setEdgesForExtendedLayout:SSRectEdgeBottom | SSRectEdgeLeft | SSRectEdgeRight];
    }
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.view.backgroundColor = [UIColor whiteColor];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.width, self.view.height - TOOLBAR_HEIGHT + 6) style:UITableViewStylePlain];
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.rowHeight = 62;
    [self.view addSubview:_tableView];
    [_tableView release];
    
        //下拉刷新
        _refreshHeaderView = [[CMRefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f,
                                                                                    0.0f - _tableView.bounds.size.height,
                                                                                    self.view.width,
                                                                                    _tableView.bounds.size.height)
                                                              arrowImage:[UIImage imageNamed:@"BlueArrow.png"]
                                                               textColor:nil];
    _refreshHeaderView.delegate = self;
    [_tableView addSubview:_refreshHeaderView];
    [_refreshHeaderView refreshLastUpdatedDate];
    [_refreshHeaderView release];
    
    _toolbar = [[AGCustomFriendListViewToolbar alloc] initWithFrame:CGRectMake(0.0, self.view.height - TOOLBAR_HEIGHT + 6, self.view.width, TOOLBAR_HEIGHT)
                                                      selectedArray:_selectedArray
                                                  imageCacheManager:_imageCacheManager
                                                          shareType:_shareType
                                                   itemClickHandler:^(NSMutableDictionary *userInfo) {
                                                       [userInfo setObject:[NSNumber numberWithBool:NO] forKey:@"selected"];
                                                       [self removeSelectedUser:userInfo];
                                                       
                                                       [_tableView reloadData];
                                                       [_toolbar reloadData];
                                                   }
                                                    completeHandler:^{
                                                        if (_changeHandler)
                                                        {
                                                            ((void(^)(NSArray *users, ShareType shareType))_changeHandler)(_selectedArray, _shareType);
                                                        }
                                                        [self dismissModalViewControllerAnimated:YES];
                                                    }];
    _toolbar.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    [self.view addSubview:_toolbar];
    [_toolbar release];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    [self layoutView:self.interfaceOrientation];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (!_initialized)
    {
        _initialized = YES;
        [self beginRefreshData];
    }
}

- (void)refreshData
{
    _refreshData = NO;
    [_friendsArray removeAllObjects];
    
    switch (_shareType)
    {
        case ShareTypeTwitter:
            _page = -1;
            break;
        default:
            _page = 1;
            break;
    }
    _hasNext = NO;
    
    
    [self getFriends];
}

- (void)getFriends
{
    if ([ShareSDK hasAuthorizedWithType:_shareType])
    {
        id<ISSPage> page = nil;
        if (_shareType == ShareTypeTwitter)
        {
            page = [ShareSDK pageWithCursor:_page];
        }
        else
        {
            page = [ShareSDK pageWithPageNo:(NSInteger)_page pageSize:0];
        }
        
        id<ISSAuthOptions> authOptions = [ShareSDK authOptionsWithAutoAuth:YES
                                                             allowCallback:YES
                                                             authViewStyle:SSAuthViewStyleFullScreenPopup
                                                              viewDelegate:nil
                                                   authManagerViewDelegate:_appDelegate.viewDelegate];
        
                //在授权页面中添加关注官方微博
                [authOptions setFollowAccounts:[NSDictionary dictionaryWithObjectsAndKeys:
                                        [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                        SHARE_TYPE_NUMBER(ShareTypeSinaWeibo),
                                        [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                        SHARE_TYPE_NUMBER(ShareTypeTencentWeibo),
                                        nil]];
        
        [ShareSDK getFriendsWithType:_shareType
                                page:page
                         authOptions:authOptions
                              result:^(SSResponseState state, NSArray *users, long long curr, long long prev, long long next, BOOL hasNext, NSDictionary *extInfo, id<ICMErrorInfo> error) {
                                  
                                  if (state == SSResponseStateSuccess)
                                  {
                                      _hasNext = hasNext;
                                      _page = next;
                                      
                                                                            //对用户进行分类
                                                                            for (int i = 0; i < [users count]; i++)
                                      {
                                          id<ISSPlatformUser> userInfo = [users objectAtIndex:i];
                                          NSMutableDictionary *userData = [NSMutableDictionary dictionaryWithDictionary:[userInfo sourceData]];
                                          [userData setObject:[NSNumber numberWithBool:[self hasSelected:userData]] forKey:@"selected"];
                                          [_friendsArray addObject:userData];
                                      }
                                      
                                                                            //刷新表格
                                                                            [_tableView reloadData];
                                  }
                                  
                                  [_refreshHeaderView refreshScrollViewDataSourceDidFinishedLoading:_tableView];
                              }];
    }
    else
    {
        id<ISSAuthOptions> authOptions = [ShareSDK authOptionsWithAutoAuth:YES
                                                             allowCallback:YES
                                                             authViewStyle:SSAuthViewStyleFullScreenPopup
                                                              viewDelegate:nil
                                                   authManagerViewDelegate:_appDelegate.viewDelegate];
        
                //在授权页面中添加关注官方微博
                [authOptions setFollowAccounts:[NSDictionary dictionaryWithObjectsAndKeys:
                                        [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                        SHARE_TYPE_NUMBER(ShareTypeSinaWeibo),
                                        [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                        SHARE_TYPE_NUMBER(ShareTypeTencentWeibo),
                                        nil]];
        
        [ShareSDK getUserInfoWithType:_shareType
                          authOptions:authOptions
                               result:^(BOOL result, id<ISSPlatformUser> userInfo, id<ICMErrorInfo> error) {
                                   
                                   if (result)
                                   {
                                       id<ISSPage> page = nil;
                                       if (_shareType == ShareTypeTwitter)
                                       {
                                           page = [ShareSDK pageWithCursor:_page];
                                       }
                                       else
                                       {
                                           page = [ShareSDK pageWithPageNo:(NSInteger)_page pageSize:0];
                                       }
                                       
                                       id<ISSAuthOptions> authOptions = [ShareSDK authOptionsWithAutoAuth:YES
                                                                                            allowCallback:YES
                                                                                            authViewStyle:SSAuthViewStyleFullScreenPopup
                                                                                             viewDelegate:nil
                                                                                  authManagerViewDelegate:_appDelegate.viewDelegate];
                                       
                                                                              //在授权页面中添加关注官方微博
                                                                              [authOptions setFollowAccounts:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                       [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                                                       SHARE_TYPE_NUMBER(ShareTypeSinaWeibo),
                                                                       [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                                                       SHARE_TYPE_NUMBER(ShareTypeTencentWeibo),
                                                                       nil]];
                                       
                                       [ShareSDK getFriendsWithType:_shareType
                                                               page:page
                                                        authOptions:authOptions
                                                             result:^(SSResponseState state, NSArray *users, long long curr, long long prev, long long next, BOOL hasNext, NSDictionary *extInfo, id<ICMErrorInfo> error) {
                                                                 
                                                                 if (result)
                                                                 {
                                                                     _hasNext = hasNext;
                                                                     _page = next;
                                                                     
                                                                                                                                          //对用户进行分类
                                                                                                                                          for (int i = 0; i < [users count]; i++)
                                                                     {
                                                                         id<ISSPlatformUser> userInfo = [users objectAtIndex:i];
                                                                         NSMutableDictionary *userData = [NSMutableDictionary dictionaryWithDictionary:[userInfo sourceData]];
                                                                         [userData setObject:[NSNumber numberWithBool:[self hasSelected:userData]] forKey:@"selected"];
                                                                         [_friendsArray addObject:userData];
                                                                     }
                                                                     
                                                                                                                                          //刷新表格
                                                                                                                                          [_tableView reloadData];
                                                                 }
                                                                 
                                                                 [_refreshHeaderView refreshScrollViewDataSourceDidFinishedLoading:_tableView];
                                                             }];
                                   }
        }];
    }
}

- (void)beginRefreshData
{
        //触发下拉刷新
        _tableView.contentOffset = CGPointMake(_tableView.contentOffset.x, -65.0);
    [_refreshHeaderView refreshScrollViewDidEndDragging:_tableView];
}

- (BOOL)hasSelected:(NSDictionary *)userInfo
{
    for (int i = 0; i < [_selectedArray count]; i++)
    {
        NSDictionary *user = [_selectedArray objectAtIndex:i];
        switch (_shareType)
        {
            case ShareTypeSinaWeibo:
            {
                id value = [userInfo objectForKey:@"idstr"];
                id value2 = [user objectForKey:@"idstr"];
                if ([value isKindOfClass:[NSString class]] && [value2 isKindOfClass:[NSString class]] && [value isEqualToString:value2])
                {
                    return YES;
                }
                break;
            }
            case ShareTypeTencentWeibo:
            {
                id value = [userInfo objectForKey:@"openid"];
                id value2 = [user objectForKey:@"openid"];
                if ([value isKindOfClass:[NSString class]] && [value2 isKindOfClass:[NSString class]] && [value isEqualToString:value2])
                {
                    return YES;
                }
                break;
            }
            case ShareTypeTwitter:
            {
                id value = [userInfo objectForKey:@"id_str"];
                id value2 = [user objectForKey:@"id_str"];
                if ([value isKindOfClass:[NSString class]] && [value2 isKindOfClass:[NSString class]] && [value isEqualToString:value2])
                {
                    return YES;
                }
                break;
            }
            default:
                break;
        }
    }
    
    return NO;
}

- (void)removeSelectedUser:(NSDictionary *)userInfo
{
    for (int i = 0; i < [_selectedArray count]; i++)
    {
        BOOL exists = NO;
        NSDictionary *user = [_selectedArray objectAtIndex:i];
        switch (_shareType)
        {
            case ShareTypeSinaWeibo:
            {
                id value = [userInfo objectForKey:@"idstr"];
                id value2 = [user objectForKey:@"idstr"];
                if ([value isKindOfClass:[NSString class]] && [value2 isKindOfClass:[NSString class]] && [value isEqualToString:value2])
                {
                    exists = YES;
                }
                break;
            }
            case ShareTypeTencentWeibo:
            {
                id value = [userInfo objectForKey:@"openid"];
                id value2 = [user objectForKey:@"openid"];
                if ([value isKindOfClass:[NSString class]] && [value2 isKindOfClass:[NSString class]] && [value isEqualToString:value2])
                {
                    exists = YES;
                }
                break;
            }
            case ShareTypeTwitter:
            {
                id value = [userInfo objectForKey:@"id_str"];
                id value2 = [user objectForKey:@"id_str"];
                if ([value isKindOfClass:[NSString class]] && [value2 isKindOfClass:[NSString class]] && [value isEqualToString:value2])
                {
                    exists = YES;
                }
                break;
            }
            default:
                break;
        }
        
        if (exists)
        {
            [_selectedArray removeObjectAtIndex:i];
            break;
        }
    }
}

- (void)backButtonClickHandler:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
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

- (void)layoutPortrait
{
    UIButton *btn = (UIButton *)self.navigationItem.leftBarButtonItem.customView;
    btn.frame = CGRectMake(btn.left, btn.top, 55.0, 32.0);
    [btn setBackgroundImage:[UIImage imageNamed:@"NavigationButtonBG.png"]
                   forState:UIControlStateNormal];
}

- (void)layoutLandscape
{
    if (![UIDevice currentDevice].isPad)
    {
        //iPhone
        UIButton *btn = (UIButton *)self.navigationItem.leftBarButtonItem.customView;
        btn.frame = CGRectMake(btn.left, btn.top, 48.0, 24.0);
        [btn setBackgroundImage:[UIImage imageNamed:@"NavigationButtonBG_Landscape.png"]
                       forState:UIControlStateNormal];
    }
    else
    {
        UIButton *btn = (UIButton *)self.navigationItem.leftBarButtonItem.customView;
        btn.frame = CGRectMake(btn.left, btn.top, 55.0, 32.0);
        [btn setBackgroundImage:[UIImage imageNamed:@"NavigationButtonBG.png"]
                       forState:UIControlStateNormal];
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

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _hasNext ? [_friendsArray count] + 1 : [_friendsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    if (indexPath.row == [_friendsArray count])
    {
                //显示加载更多
                cell = [tableView dequeueReusableCellWithIdentifier:MORE_CELL_ID];
        if (cell == nil)
        {
            cell = [[[AGCustomMoreCell alloc] initWithStyle:UITableViewCellStyleDefault
                                            reuseIdentifier:MORE_CELL_ID]
                    autorelease];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
    }
    else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:USER_CELL_ID];
        if (cell == nil)
        {
            cell = [[[AGCustomUserInfoCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                reuseIdentifier:USER_CELL_ID
                                              imageCacheManager:_imageCacheManager
                                                      shareType:_shareType]
                    autorelease];
        }
        
        if (indexPath.row < [_friendsArray count])
        {
            NSDictionary *userInfo = [_friendsArray objectAtIndex:indexPath.row];
            ((AGCustomUserInfoCell *)cell).userInfo = userInfo;
            
            if ([[userInfo objectForKey:@"selected"] boolValue])
            {
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
            }
            else
            {
                cell.accessoryType = UITableViewCellAccessoryNone;
            }
        }
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row < [_friendsArray count])
    {
        NSMutableDictionary *userInfo = [_friendsArray objectAtIndex:indexPath.row];
        BOOL flag = ![[userInfo objectForKey:@"selected"] boolValue];
        if (flag && [_selectedArray count] >= 20)
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                                message:NSLocalizedString(@"TEXT_MAX_FRIENDS", @"最多可以@20个好友") 
                                                               delegate:nil
                                                      cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                      otherButtonTitles:nil];
            [alertView show];
            [alertView release];
            
            return;
        }
        
        [userInfo setObject:[NSNumber numberWithBool:flag] forKey:@"selected"];
        
        if (flag)
        {
            [_selectedArray insertObject:userInfo atIndex:0];
        }
        else
        {
            [self removeSelectedUser:userInfo];
        }
        
        [_tableView reloadData];
        [_toolbar reloadData];
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell isKindOfClass:[AGCustomMoreCell class]])
    {
                //加载更多
                if (_hasNext)
        {
            [self getFriends];
        }
    }
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
	[_refreshHeaderView refreshScrollViewDidScroll:scrollView];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
	[_refreshHeaderView refreshScrollViewDidEndDragging:scrollView];
}

#pragma mark - SKRefreshTableHeaderDelegate

- (void)refreshTableHeaderDidTriggerRefresh:(CMRefreshTableHeaderView *)view
{
	_refreshData = YES;
	[self performSelector:@selector(refreshData) withObject:nil];
}

- (BOOL)refreshTableHeaderDataSourceIsLoading:(CMRefreshTableHeaderView *)view
{
	return _refreshData;
}

- (NSDate*)refreshTableHeaderDataSourceLastUpdated:(CMRefreshTableHeaderView *)view
{
	return [NSDate date];
}

@end
