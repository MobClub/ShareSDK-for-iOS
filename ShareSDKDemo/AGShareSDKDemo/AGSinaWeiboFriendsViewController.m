//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.mob.com
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import "AGSinaWeiboFriendsViewController.h"
#import "AGAppDelegate.h"
#import "AGSinaWeiboMoreCell.h"
#import "AGSinaWeiboUserCell.h"
#import <ShareSDK/ShareSDK.h>
#import <AGCommon/UIDevice+Common.h>
#import <AGCommon/UIImage+Common.h>
#import <AGCommon/UINavigationBar+Common.h>
#import <AGCommon/NSString+Common.h>
#import <SinaWeiboConnection/SSSinaWeiboUserInfoReader.h>

#define USER_CELL_ID @"userCell"
#define MORE_CELL_ID @"moreCell"

@implementation AGSinaWeiboFriendsViewController

- (id)initWithType:(AGSinaWeiboFriendsType)type
          userName:(NSString *)userName
 imageCacheManager:(CMImageCacheManager *)imageCacheManager
{
    self = [super init];
    if (self)
    {
        _type = type;
        _appDelegate = (AGAppDelegate *)[UIApplication sharedApplication].delegate;
        if (imageCacheManager)
        {
            _imageCacheManager = [imageCacheManager retain];
        }
        else
        {
            _imageCacheManager = [[CMImageCacheManager alloc] init];
        }
        
        _friendsArray = [[NSMutableArray alloc] init];
        _userName = [userName copy];
        
        UIButton *leftBtn = [[[UIButton alloc] init] autorelease];
        [leftBtn setBackgroundImage:[UIImage imageNamed:@"NavigationButtonBG.png"]
                           forState:UIControlStateNormal];
        [leftBtn setTitle:NSLocalizedString(@"TEXT_BACK", @"返回") forState:UIControlStateNormal];
        leftBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        leftBtn.frame = CGRectMake(0.0, 0.0, 53.0, 30.0);
        [leftBtn addTarget:self action:@selector(backButtonClickHandler:) forControlEvents:UIControlEventTouchUpInside];
        
        self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:leftBtn] autorelease];

        
        switch (_type)
        {
            case AGSinaWeiboFriendsTypeFriend:
                self.title = NSLocalizedString(@"TEXT_FOLLOW", @"关注");
                break;
            case AGSinaWeiboFriendsTypeFollower:
                self.title = NSLocalizedString(@"TEXT_FANS", @"粉丝");
                break;
            default:
                break;
        }
    }
    return self;
}

- (void)dealloc
{
    SAFE_RELEASE(_imageCacheManager);
    SAFE_RELEASE(_friendsArray);
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
    
    if ([[UIDevice currentDevice].systemVersion versionStringCompare:@"7.0"] != NSOrderedAscending)
    {
        [self setExtendedLayoutIncludesOpaqueBars:NO];
        [self setEdgesForExtendedLayout:SSRectEdgeBottom | SSRectEdgeLeft | SSRectEdgeRight];
    }
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.view.backgroundColor = [UIColor whiteColor];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.width, self.view.height) style:UITableViewStylePlain];
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
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self layoutView:self.interfaceOrientation];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self beginRefreshData];
}

- (void)refreshData
{
    _refreshData = NO;
    [_friendsArray removeAllObjects];
    
    _page = 1;
    _hasNext = NO;
    
    
    [self getFriends:1];
}

- (void)doGetFriends:(NSInteger)page
{
    id<ISSSinaWeiboApp> sinaApp = (id<ISSSinaWeiboApp>)[ShareSDK getClientWithType:ShareTypeSinaWeibo];
    NSString *urlString = nil;
    
    switch (_type)
    {
        case AGSinaWeiboFriendsTypeFriend:
        {
            urlString = @"https://api.weibo.com/2/friendships/friends.json";
            break;
        }
        case AGSinaWeiboFriendsTypeFollower:
        {
            urlString = @"https://api.weibo.com/2/friendships/followers.json";
            break;
        }
        default:
            break;
    }
    
    id<ISSCParameters> params = [ShareSDKCoreService parameters];
    [params addParameter:@"screen_name" value:_userName];
    [params addParameter:@"cursor" value:[NSNumber numberWithInteger:(page - 1) * 50]];
    
    [sinaApp api:urlString
          method:SSSinaWeiboRequestMethodGet
          params:params
            user:nil
          result:^(id responder) {
              _isGetting = NO;
              _page = page;
              
              if (page == 1)
              {
                  [_friendsArray removeAllObjects];
              }
              
              id value = [responder objectForKey:@"users"];
              if ([value isKindOfClass:[NSArray class]])
              {
                  for (int i = 0; i < [value count]; i++)
                  {
                      id item = [value objectAtIndex:i];
                      if ([item isKindOfClass:[NSDictionary class]])
                      {
                          SSSinaWeiboUserInfoReader *user = [SSSinaWeiboUserInfoReader readerWithSourceData:item];
                          [_friendsArray addObject:user];
                      }
                  }
                  
                  if ([value count] == 0)
                  {
                      _hasNext = YES;
                  }
                  else
                  {
                      value = [responder objectForKey:@"total_number"];
                      if ([value isKindOfClass:[NSNumber class]])
                      {
                          _hasNext = [value integerValue] > [_friendsArray count] ? YES : NO;
                      }
                      else
                      {
                          _hasNext = NO;
                      }
                  }
                  
                                    //刷新表格
                                    [_tableView reloadData];
              }
              else
              {
                  _hasNext = NO;
              }
              
              [_refreshHeaderView refreshScrollViewDataSourceDidFinishedLoading:_tableView];
          }
           fault:^(CMErrorInfo *error) {
               _isGetting = NO;
               
               [_refreshHeaderView refreshScrollViewDataSourceDidFinishedLoading:_tableView];
           }];
}

- (void)getFriends:(NSInteger)page
{
    if (!_isGetting)
    {
        _isGetting = YES;
        
        if ([ShareSDK hasAuthorizedWithType:ShareTypeSinaWeibo])
        {
            [self doGetFriends:page];
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
            
            [ShareSDK getUserInfoWithType:ShareTypeSinaWeibo
                                    field:_userName
                                fieldType:SSUserFieldTypeName
                              authOptions:authOptions
                                   result:^(BOOL result, id<ISSPlatformUser> userInfo, id<ICMErrorInfo> error) {
                                       
                                       if (result)
                                       {
                                           [self doGetFriends:page];
                                       }
                                   }];
        }
    }
    
}

- (void)beginRefreshData
{
        //触发下拉刷新
        _tableView.contentOffset = CGPointMake(_tableView.contentOffset.x, -65.0);
    [_refreshHeaderView refreshScrollViewDidEndDragging:_tableView];
}

- (void)backButtonClickHandler:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
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
            cell = [[[AGSinaWeiboMoreCell alloc] initWithStyle:UITableViewCellStyleDefault
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
            cell = [[[AGSinaWeiboUserCell alloc] initWithStyle:UITableViewCellStyleDefault
                                               reuseIdentifier:USER_CELL_ID
                                             imageCacheManager:_imageCacheManager]
                    autorelease];
        }
        
        if (indexPath.row < [_friendsArray count])
        {
            SSSinaWeiboUserInfoReader *userInfo = [_friendsArray objectAtIndex:indexPath.row];
            ((AGSinaWeiboUserCell *)cell).userInfo = userInfo;
        }
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell isKindOfClass:[AGSinaWeiboMoreCell class]])
    {
                //加载更多
                if (_hasNext)
        {
            [self getFriends:_page + 1];
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
