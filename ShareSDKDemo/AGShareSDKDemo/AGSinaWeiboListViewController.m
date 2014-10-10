//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.mob.com
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import "AGSinaWeiboListViewController.h"
#import <AGCommon/UIImage+Common.h>
#import <AGCommon/UIDevice+Common.h>
#import <AGCommon/UINavigationBar+Common.h>
#import <ShareSDK/ShareSDK.h>
#import "AGAppDelegate.h"
#import <SinaWeiboConnection/SinaWeiboConnection.h>
#import <SinaWeiboConnection/SSSinaWeiboStatus.h>
#import "AGSinaWeiboMoreCell.h"
#import "AGSinaWeiboFriendsViewController.h"
#import "AGSinaWeiboUserDetailInfoViewController.h"
#import "AGSinaWeiboPictureViewController.h"
#import <AGCommon/NSString+Common.h>

#define WEIBO_CELL @"weiboCell"
#define MORE_CELL @"moreCell"
#define HEADER_HEIGHT 145

#define USER_NAME @"陈钢强"
#define CACHE_NAME @"%@/sinaweibo_%@_timeline"

@implementation AGSinaWeiboListViewController

- (id)init
{
    self = [super init];
    if (self)
    {
        _appDelegate = (AGAppDelegate *)[UIApplication sharedApplication].delegate;
        _appDelegate.interfaceOrientationMask = SSInterfaceOrientationMaskPortrait;
        
        _imageCacheManager = [[CMImageCacheManager alloc] init];
        _statusArray = [[NSMutableArray alloc] init];
        _heightDict = [[NSMutableDictionary alloc] init];
        _statusCell = [[AGSinaWeiboStatusCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                   reuseIdentifier:WEIBO_CELL
                                                 imageCacheManager:_imageCacheManager];
        
        self.title = NSLocalizedString(@"TEXT_PERSONAL_HOMEPAGE", @"个人主页");
        
        UIButton *leftBtn = [[[UIButton alloc] init] autorelease];
        [leftBtn setBackgroundImage:[UIImage imageNamed:@"Common/NavigationButtonBG.png" bundleName:BUNDLE_NAME]
                           forState:UIControlStateNormal];
        [leftBtn setTitle:NSLocalizedString(@"TEXT_CANCEL", @"取消") forState:UIControlStateNormal];
        leftBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        leftBtn.frame = CGRectMake(0.0, 0.0, 53.0, 30.0);
        [leftBtn addTarget:self action:@selector(cancelButtonClickHandler:) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:leftBtn] autorelease];
    }
    return self;
}

- (void)dealloc
{
    NSMutableArray *statusArray = [NSMutableArray array];
    for (int i = 0; i < [_statusArray count]; i++)
    {
        SSSinaWeiboStatusInfoReader *status = [_statusArray objectAtIndex:i];
        [statusArray addObject:[status sourceData]];
    }
    
        //对数据进行缓存
        NSDictionary *cacheData = [NSDictionary dictionaryWithObjectsAndKeys:
                               _user,
                               @"user",
                               statusArray,
                               @"status",
                               [NSNumber numberWithBool:_hasNext],
                               @"hasnext",
                               [NSNumber numberWithInteger:_page],
                               @"page",
                               nil];
    [NSKeyedArchiver archiveRootObject:cacheData toFile:[NSString stringWithFormat:CACHE_NAME, NSTemporaryDirectory(), USER_NAME]];
    
    _appDelegate.interfaceOrientationMask = SSInterfaceOrientationMaskAll;
    _appDelegate = nil;
    _statusesTableView.delegate = nil;
    _statusesTableView.dataSource = nil;
    _statusesTableView = nil;
    _headerView = nil;
    _refreshTableHeaderView = nil;
    
    SAFE_RELEASE(_imageCacheManager);
    SAFE_RELEASE(_statusArray);
    SAFE_RELEASE(_heightDict);
    SAFE_RELEASE(_statusCell);
    SAFE_RELEASE(_user);
    
    [super dealloc];
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
    
    if (!_initialized)
    {
                //读取缓存
                @try
        {
            NSString *cachePath = [NSString stringWithFormat:CACHE_NAME, NSTemporaryDirectory(), USER_NAME];
            NSDictionary *cacheDict = [NSKeyedUnarchiver unarchiveObjectWithFile:cachePath];
            if ([cacheDict isKindOfClass:[NSDictionary class]])
            {
                id value = [cacheDict objectForKey:@"user"];
                if ([value isKindOfClass:[SSSinaWeiboUser class]])
                {
                    _user = [value retain];
                }
                
                value = [cacheDict objectForKey:@"status"];
                if ([value isKindOfClass:[NSArray class]])
                {
                    for (int i = 0; i < [value count]; i++)
                    {
                        id item = [value objectAtIndex:i];
                        if ([item isKindOfClass:[NSDictionary class]])
                        {
                            SSSinaWeiboStatusInfoReader *status = [SSSinaWeiboStatusInfoReader readerWithSourceData:item];
                            [_statusArray addObject:status];
                        }
                    }
                    
                }
                
                value = [cacheDict objectForKey:@"hasnext"];
                if ([value isKindOfClass:[NSNumber class]])
                {
                    _hasNext = [value boolValue];
                }
                
                value = [cacheDict objectForKey:@"page"];
                if ([value isKindOfClass:[NSNumber class]])
                {
                    _page = [value integerValue];
                }
            }
        }
        @catch (NSException *exception) {
            
        }
    }
    
    _statusesTableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.width, self.view.height)
                                                      style:UITableViewStylePlain];
    _statusesTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    _statusesTableView.delegate = self;
    _statusesTableView.dataSource = self;
    _statusesTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_statusesTableView];
    [_statusesTableView release];
    
    _headerView = [[AGSinaWeiboUserInfoHeaderView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.width, HEADER_HEIGHT)
                                                     imageCacheManager:_imageCacheManager];
    _headerView.delegate = self;
    _statusesTableView.tableHeaderView = _headerView;
    if (_user)
    {
        [_headerView setUserInfo:_user];
    }
    [_headerView.friendsButton addTarget:self action:@selector(friendsButtonClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [_headerView.followerButton addTarget:self action:@selector(followerButtonClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [_headerView.infoButton addTarget:self action:@selector(infoButtonClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [_headerView release];
    
        //下拉刷新
        _refreshTableHeaderView = [[CMRefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f,
                                                                                    0.0f - _statusesTableView.bounds.size.height,
                                                                                    self.view.width,
                                                                                    _statusesTableView.bounds.size.height)
                                                              arrowImage:[UIImage imageNamed:@"BlueArrow.png"]
                                                               textColor:nil];
    _refreshTableHeaderView.delegate = self;
    [_statusesTableView addSubview:_refreshTableHeaderView];
    [_refreshTableHeaderView refreshLastUpdatedDate];
    [_refreshTableHeaderView release];
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

        if (!_user)
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
            
            [ShareSDK getUserInfoWithType:ShareTypeSinaWeibo
                                    field:USER_NAME
                                fieldType:SSUserFieldTypeName
                              authOptions:authOptions
                                   result:^(BOOL result, id<ISSPlatformUser> userInfo, id<ICMErrorInfo> error) {
                                       
                                       if (result)
                                       {
                                           SAFE_RELEASE(_user);
                                           _user = [userInfo retain];
                                           [_headerView setUserInfo:userInfo];
                                           
                                           //获取微博列表
                                           [self getTimelineWithPage:1];
                                       }
                                   }];
        }
        else if ([_statusArray count] == 0)
        {
            [_headerView setUserInfo:_user];
            [self getTimelineWithPage:1];
        }
        else
        {
            [_headerView setUserInfo:_user];
            [_statusesTableView reloadData];
        }
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return NO;
}

-(BOOL)shouldAutorotate
{
        //iOS6下旋屏方法
        return NO;
}

- (NSUInteger)supportedInterfaceOrientations
{
        //iOS6下旋屏方法
        return SSInterfaceOrientationMaskPortrait;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self layoutView:toInterfaceOrientation];
}

#pragma mark - Private

- (void)cancelButtonClickHandler:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
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

- (void)getTimelineWithPage:(NSInteger)page
{
    if (!_isGetting)
    {
        _isGetting = YES;
        
        id<ISSSinaWeiboApp> sinaWeiboApp = (id<ISSSinaWeiboApp>)[ShareSDK getClientWithType:ShareTypeSinaWeibo];
        id<ISSCParameters> params = [ShareSDKCoreService parameters];
        [params addParameter:@"page" value:[NSNumber numberWithInteger:page]];
        [params addParameter:@"uid" value:_user.uid];
        
        [sinaWeiboApp api:@"https://api.weibo.com/2/statuses/user_timeline.json"
                   method:SSSinaWeiboRequestMethodGet
                   params:params
                     user:nil
                   result:^(id responder) {
                       _isGetting = NO;
                       _page = page;
                       
                       if (page == 1)
                       {
                           [_statusArray removeAllObjects];
                           [_heightDict removeAllObjects];
                       }
                       
                       id value = [responder objectForKey:@"statuses"];
                       if ([value isKindOfClass:[NSArray class]])
                       {
                           for (int i = 0; i < [value count]; i++)
                           {
                               id item = [value objectAtIndex:i];
                               if ([item isKindOfClass:[NSDictionary class]])
                               {
                                   SSSinaWeiboStatusInfoReader *status = [SSSinaWeiboStatusInfoReader readerWithSourceData:item];
                                   [_statusArray addObject:status];
                               }
                           }
                           
                           if ([value count] == 0)
                           {
                               _hasNext = NO;
                           }
                           else
                           {
                               value = [responder objectForKey:@"total_number"];
                               if ([value isKindOfClass:[NSNumber class]])
                               {
                                   _hasNext = [value integerValue] > [_statusArray count] ? YES : NO;
                               }
                               else
                               {
                                   _hasNext = NO;
                               }
                           }
                       }
                       else
                       {
                           _hasNext = NO;
                       }
                       
                       
                       [_statusesTableView reloadData];
                   }
                    fault:^(CMErrorInfo *error) {
                        _isGetting = NO;
                    }];
    }
    
}

- (void)refreshData
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
    
    [ShareSDK getUserInfoWithType:ShareTypeSinaWeibo
                            field:USER_NAME
                        fieldType:SSUserFieldTypeName
                      authOptions:authOptions
                           result:^(BOOL result, id<ISSPlatformUser> userInfo, id<ICMErrorInfo> error) {
                               
                               if (result)
                               {
                                   SAFE_RELEASE(_user);
                                   _user = [userInfo retain];
                                   [_headerView setUserInfo:_user];
                                   
                                                                      //获取微博列表
                                                                      [self getTimelineWithPage:1];
                               }
                               
                               _isGetting = NO;
                               
                                                              //结束下拉
                                                              _refreshData = NO;
                               [_refreshTableHeaderView refreshScrollViewDataSourceDidFinishedLoading:_statusesTableView];
                           }];

}

- (void)friendsButtonClickHandler:(id)sender
{
    AGSinaWeiboFriendsViewController *vc = [[[AGSinaWeiboFriendsViewController alloc] initWithType:AGSinaWeiboFriendsTypeFriend
                                                                                          userName:USER_NAME
                                                                                 imageCacheManager:_imageCacheManager]
                                            autorelease];
    UINavigationController *navController = [[[UINavigationController alloc] initWithRootViewController:vc] autorelease];
    [self presentModalViewController:navController animated:YES];
    
}

- (void)followerButtonClickHandler:(id)sender
{
    AGSinaWeiboFriendsViewController *vc = [[[AGSinaWeiboFriendsViewController alloc] initWithType:AGSinaWeiboFriendsTypeFollower
                                                                                          userName:USER_NAME
                                                                                 imageCacheManager:_imageCacheManager]
                                            autorelease];
    UINavigationController *navController = [[[UINavigationController alloc] initWithRootViewController:vc] autorelease];
    [self presentModalViewController:navController animated:YES];
}

- (void)infoButtonClickHandler:(id)sender
{
    SSSinaWeiboUserInfoReader *user = [SSSinaWeiboUserInfoReader readerWithSourceData:[_user sourceData]];
    AGSinaWeiboUserDetailInfoViewController *vc = [[[AGSinaWeiboUserDetailInfoViewController alloc] initWithUser:user] autorelease];
    UINavigationController *navController = [[[UINavigationController alloc] initWithRootViewController:vc] autorelease];
    [self presentModalViewController:navController animated:YES];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_hasNext)
    {
        return [_statusArray count] + 1;
    }
    
    return [_statusArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    if (indexPath.row < [_statusArray count])
    {
        cell = [tableView dequeueReusableCellWithIdentifier:WEIBO_CELL];
        if (cell == nil)
        {
            cell = [[[AGSinaWeiboStatusCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                 reuseIdentifier:WEIBO_CELL
                                               imageCacheManager:_imageCacheManager]
                    autorelease];
        }
        
        ((AGSinaWeiboStatusCell *)cell).status = [_statusArray objectAtIndex:indexPath.row];
        ((AGSinaWeiboStatusCell *)cell).delegate = self;
    }
    else
    {
                //创建获取更多单元格
                cell = [tableView dequeueReusableCellWithIdentifier:MORE_CELL];
        if (cell == nil)
        {
            cell = [[[AGSinaWeiboMoreCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MORE_CELL] autorelease];
        }
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSNumber *rowNumber = [NSNumber numberWithInteger:indexPath.row];
    if ([_heightDict objectForKey:[NSNumber numberWithInteger:rowNumber]])
    {
        return [[_heightDict objectForKey:rowNumber] floatValue];
    }
    else
    {
        if (indexPath.row < [_statusArray count])
        {
            CGFloat cellHeight = [_statusCell layoutThatStaus:[_statusArray objectAtIndex:indexPath.row] isCalCellHeight:YES];
            [_heightDict setObject:[NSNumber numberWithFloat:cellHeight] forKey:rowNumber];
            
            return cellHeight;
        }
        
        return tableView.rowHeight;
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell isKindOfClass:[AGSinaWeiboMoreCell class]])
    {
                //加载下一页
                if (_hasNext)
        {
            [self getTimelineWithPage:_page + 1];
        }
    }
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
	[_refreshTableHeaderView refreshScrollViewDidScroll:scrollView];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
	[_refreshTableHeaderView refreshScrollViewDidEndDragging:scrollView];
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

#pragma mark - AGSinaWeiboStatusCellDelegate

- (void)cell:(AGSinaWeiboStatusCell *)cell onShowPic:(NSString *)url
{
    AGSinaWeiboPictureViewController *picViewController = [[[AGSinaWeiboPictureViewController alloc] initWithImageUrl:url
                                                                                                    imageCacheManager:_imageCacheManager]
                                                           autorelease];
    UINavigationController *navController = [[[UINavigationController alloc] initWithRootViewController:picViewController] autorelease];
    [self presentModalViewController:navController animated:YES];
}

#pragma mark - AGSinaWeiboUserInfoHeaderViewDelegate

- (void)headerViewOnAddFriend:(AGSinaWeiboUserInfoHeaderView *)headerView
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
    
        //重新获取用户资料
        [ShareSDK getUserInfoWithType:ShareTypeSinaWeibo
                            field:USER_NAME
                        fieldType:SSUserFieldTypeName
                      authOptions:authOptions
                           result:^(BOOL result, id<ISSPlatformUser> userInfo, id<ICMErrorInfo> error) {
                               
                               if (result)
                               {
                                   SAFE_RELEASE(_user);
                                   _user = [userInfo retain];
                                   [_headerView setUserInfo:_user];
                               }
                           }];
}

@end
