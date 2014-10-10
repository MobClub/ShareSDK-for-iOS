//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.mob.com
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import "AGSinaWeiboUserDetailInfoViewController.h"
#import <AGCommon/UIImage+Common.h>
#import <AGCommon/UINavigationBar+Common.h>
#import <AGCommon/UIDevice+Common.h>
#import <AGCommon/UIColor+Common.h>
#import <ShareSDK/ShareSDK.h>
#import <AGCommon/NSString+Common.h>
#import "AGAppDelegate.h"


#define VERIFIED_CELL @"verifiedCell"
#define NICKNAME_CELL @"nickNameCell"
#define GENDER_CELL @"genderCell"
#define LOCATION_CELL @"locationCell"
#define DESC_CELL @"descCell"

@implementation AGSinaWeiboUserDetailInfoViewController

- (id)initWithUser:(SSSinaWeiboUserInfoReader *)user
{
    if (self = [super init])
    {
        self.title = NSLocalizedString(@"TEXT_DETAIL_INFO", @"详细资料");
        
        _user = [user retain];
        _rowInfoArray = [[NSMutableArray alloc] init];
        _descCell = [[AGSinaWeiboUserDescItemCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:DESC_CELL];
        _infoCell = [[AGSinaWeiboUserInfoItemCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:VERIFIED_CELL];
        
        
        UIButton *leftBtn = [[[UIButton alloc] init] autorelease];
        [leftBtn setBackgroundImage:[UIImage imageNamed:@"NavigationButtonBG.png"]
                           forState:UIControlStateNormal];
        [leftBtn setTitle:NSLocalizedString(@"TEXT_BACK", @"返回") forState:UIControlStateNormal];
        leftBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        leftBtn.frame = CGRectMake(0.0, 0.0, 53.0, 30.0);
        [leftBtn addTarget:self action:@selector(backButtonClickHandler:) forControlEvents:UIControlEventTouchUpInside];
        
        self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:leftBtn] autorelease];
    }
    
    return self;
}

- (id)initWithUserName:(NSString *)userName
{
    if (self = [super init])
    {
        self.title = NSLocalizedString(@"TEXT_DETAIL_INFO", @"详细资料");
        
        _userName = [userName copy];
        _rowInfoArray = [[NSMutableArray alloc] init];
        _descCell = [[AGSinaWeiboUserDescItemCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:DESC_CELL];
        _infoCell = [[AGSinaWeiboUserInfoItemCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:VERIFIED_CELL];
        
        
        UIButton *leftBtn = [[[UIButton alloc] init] autorelease];
        [leftBtn setBackgroundImage:[UIImage imageNamed:@"NavigationButtonBG.png"]
                           forState:UIControlStateNormal];
        [leftBtn setTitle:NSLocalizedString(@"TEXT_BACK", @"返回") forState:UIControlStateNormal];
        leftBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        leftBtn.frame = CGRectMake(0.0, 0.0, 53.0, 30.0);
        [leftBtn addTarget:self action:@selector(backButtonClickHandler:) forControlEvents:UIControlEventTouchUpInside];
        
        self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:leftBtn] autorelease];
    }
    
    return self;
}

- (void)dealloc
{
    _tableView.delegate = nil;
    _tableView.dataSource = nil;
    _tableView = nil;
    SAFE_RELEASE(_user);
    SAFE_RELEASE(_userName);
    SAFE_RELEASE(_rowInfoArray);
    SAFE_RELEASE(_descCell);
    SAFE_RELEASE(_infoCell);
    
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([[UIDevice currentDevice].systemVersion versionStringCompare:@"7.0"] != NSOrderedAscending)
    {
        [self setExtendedLayoutIncludesOpaqueBars:NO];
        [self setEdgesForExtendedLayout:SSRectEdgeBottom | SSRectEdgeLeft | SSRectEdgeRight];
    }
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    _tableView.backgroundView = nil;
    _tableView.backgroundColor = [UIColor colorWithRGB:0xeeeeee];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    [_tableView release];
    
    
    
    if (_userName)
    {
        AGAppDelegate *appDelegate = (AGAppDelegate *)[UIApplication sharedApplication].delegate;
        
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
        
        [ShareSDK getUserInfoWithType:ShareTypeSinaWeibo
                                field:_userName
                            fieldType:SSUserFieldTypeName
                          authOptions:authOptions
                               result:^(BOOL result, id<ISSPlatformUser> userInfo, id<ICMErrorInfo> error) {
                                   
                                   SAFE_RELEASE(_user);
                                   _user = [[SSSinaWeiboUserInfoReader readerWithSourceData:[userInfo sourceData]] retain];
                                   
                                                                      //计算需要显示多少行
                                                                      [_rowInfoArray removeAllObjects];
                                   
                                                                      //认证信息
                                                                      if (_user.verified)
                                   {
                                       [_rowInfoArray addObject:[NSArray arrayWithObjects:NSLocalizedString(@"TEXT_VERIFIED_INFO", @"认证信息"), VERIFIED_CELL, nil]];
                                   }
                                   
                                                                      //基础信息
                                                                      NSMutableArray *basicArr = [NSMutableArray arrayWithObject:NSLocalizedString(@"TEXT_BASIC_INFO", @"基础信息")];
                                   [basicArr addObject:NICKNAME_CELL];
                                   [basicArr addObject:GENDER_CELL];
                                   [basicArr addObject:LOCATION_CELL];
                                   [basicArr addObject:DESC_CELL];
                                   [_rowInfoArray addObject:basicArr];
                                   
                                   [_tableView reloadData];
                               }];
    }
    else
    {
                //计算需要显示多少行
                [_rowInfoArray removeAllObjects];
        
                //认证信息
                if (_user.verified)
        {
            [_rowInfoArray addObject:[NSArray arrayWithObjects:NSLocalizedString(@"TEXT_VERIFIED_INFO", @"认证信息"), VERIFIED_CELL, nil]];
        }
        
                //基础信息
                NSMutableArray *basicArr = [NSMutableArray arrayWithObject:NSLocalizedString(@"TEXT_BASIC_INFO", @"基础信息")];
        [basicArr addObject:NICKNAME_CELL];
        [basicArr addObject:GENDER_CELL];
        [basicArr addObject:LOCATION_CELL];
        [basicArr addObject:DESC_CELL];
        [_rowInfoArray addObject:basicArr];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self layoutView:self.interfaceOrientation];
}

#pragma mark - Private

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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_rowInfoArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section < [_rowInfoArray count])
    {
        return [[_rowInfoArray objectAtIndex:section] count] - 1;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellId = nil;
    if (indexPath.section < [_rowInfoArray count])
    {
        NSArray *cellArray = [_rowInfoArray objectAtIndex:indexPath.section];
        if (indexPath.row < [cellArray count] - 1)
        {
            cellId = [cellArray objectAtIndex:indexPath.row + 1];
        }
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil)
    {
        if (![cellId isEqualToString:DESC_CELL])
        {
            cell = [[[AGSinaWeiboUserInfoItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId] autorelease];
        }
        else
        {
            cell = [[[AGSinaWeiboUserDescItemCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId] autorelease];
        }
        
        if ([cellId isEqualToString:VERIFIED_CELL])
        {
            cell.textLabel.text = NSLocalizedString(@"TEXT_SINA_WEIBO_VERIFIED", @"新浪认证");
            cell.detailTextLabel.text = _user.verifiedReason;
        }
        else if ([cellId isEqualToString:NICKNAME_CELL])
        {
            cell.textLabel.text = NSLocalizedString(@"TEXT_NICKNAME_2", @"昵称");
            cell.detailTextLabel.text = _user.screenName;
        }
        else if ([cellId isEqualToString:GENDER_CELL])
        {
            cell.textLabel.text = NSLocalizedString(@"TEXT_GENDER", @"性别");
            if ([_user.gender isEqualToString:@"m"])
            {
                cell.detailTextLabel.text = NSLocalizedString(@"TEXT_MALE", @"男");
            }
            else if ([_user.gender isEqualToString:@"f"])
            {
                cell.detailTextLabel.text = NSLocalizedString(@"TEXT_FEMALE", @"女");
            }
            else
            {
                cell.detailTextLabel.text = NSLocalizedString(@"TEXT_UNKNOWN", @"未知");
            }
        }
        else if ([cellId isEqualToString:LOCATION_CELL])
        {
            cell.textLabel.text = NSLocalizedString(@"TEXT_LOCATION", @"所在地");
            cell.detailTextLabel.text = _user.location;
        }
        else if ([cellId isEqualToString:DESC_CELL])
        {
            cell.textLabel.text = NSLocalizedString(@"TEXT_PROFILE", @"简介");
            cell.detailTextLabel.text = _user.description;
        }
    }
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section < [_rowInfoArray count])
    {
        NSArray *infoArr = [_rowInfoArray objectAtIndex:section];
        if ([infoArr count] > 0)
        {
            return [infoArr objectAtIndex:0];
        }
    }
    
    return nil;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellId = nil;
    if (indexPath.section < [_rowInfoArray count])
    {
        NSArray *cellArray = [_rowInfoArray objectAtIndex:indexPath.section];
        if (indexPath.row < [cellArray count] - 1)
        {
            cellId = [cellArray objectAtIndex:indexPath.row + 1];
        }
        
        if ([cellId isEqualToString:DESC_CELL])
        {
            _descCell.textLabel.text = NSLocalizedString(@"TEXT_PROFILE", @"简介");
            _descCell.detailTextLabel.text = _user.description;
            return _descCell.cellHeight;
        }
        else if ([cellId isEqualToString:VERIFIED_CELL])
        {
            _infoCell.textLabel.text = NSLocalizedString(@"TEXT_SINA_WEIBO_VERIFIED", @"新浪认证");
            _infoCell.detailTextLabel.text = _user.verifiedReason;
            return _infoCell.cellHeight;
        }
        else if ([cellId isEqualToString:NICKNAME_CELL])
        {
            _infoCell.textLabel.text = NSLocalizedString(@"TEXT_NICKNAME", @"昵称");
            _infoCell.detailTextLabel.text = _user.screenName;
            return _infoCell.cellHeight;
        }
        else if ([cellId isEqualToString:GENDER_CELL])
        {
            _infoCell.textLabel.text = NSLocalizedString(@"TEXT_GENDER", @"性别");
            if ([_user.gender isEqualToString:@"m"])
            {
                _infoCell.detailTextLabel.text = NSLocalizedString(@"TEXT_MALE", @"男");
            }
            else if ([_user.gender isEqualToString:@"f"])
            {
                _infoCell.detailTextLabel.text = NSLocalizedString(@"TEXT_FEMALE", @"女");
            }
            else
            {
                _infoCell.detailTextLabel.text = NSLocalizedString(@"TEXT_UNKNOWN", @"未知");
            }
            return _infoCell.cellHeight;
        }
        else if ([cellId isEqualToString:LOCATION_CELL])
        {
            _infoCell.textLabel.text = NSLocalizedString(@"TEXT_LOCATION", @"所在地");
            _infoCell.detailTextLabel.text = _user.location;
            return _infoCell.cellHeight;
        }
    }

    return tableView.rowHeight;
}

@end
