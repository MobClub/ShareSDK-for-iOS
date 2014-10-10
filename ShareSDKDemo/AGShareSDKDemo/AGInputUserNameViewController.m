//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.mob.com
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import "AGInputUserNameViewController.h"
#import "AGUserInfoViewController.h"
#import "AGShareCell.h"
#import <AGCommon/UIImage+Common.h>
#import <AGCommon/UINavigationBar+Common.h>
#import <AGCommon/UIColor+Common.h>
#import <AGCommon/UIDevice+Common.h>
#import <AGCommon/NSString+Common.h>

#define INPUT_CELL_ID @"inputCellId"
#define PARAM_CELL_ID @"paramCellId"
#define PLAT_CELL_ID @"platCellId"

@implementation AGInputUserNameViewController

- (id)init
{
    if (self = [super init])
    {
        if ([[UIDevice currentDevice].systemVersion versionStringCompare:@"7.0"] != NSOrderedAscending)
        {
                        //改写导航栏标题样式
                        UILabel *label = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
            label.backgroundColor = [UIColor clearColor];
            label.textColor = [UIColor whiteColor];
            label.font = [UIFont boldSystemFontOfSize:18];
            [label sizeToFit];
            
            self.navigationItem.titleView = label;
        }
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:[UIImage imageNamed:@"Common/NavigationButtonBG.png" bundleName:BUNDLE_NAME]
                       forState:UIControlStateNormal];
        [btn setTitle:NSLocalizedString(@"TEXT_CANCEL", @"取消") forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        btn.frame = CGRectMake(0.0, 0.0, 53.0, 30.0);
        [btn addTarget:self action:@selector(cancelButtonClickHandler:) forControlEvents:UIControlEventTouchUpInside];
        
        self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:btn] autorelease];
        
        btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:[UIImage imageNamed:@"Common/NavigationButtonBG.png" bundleName:BUNDLE_NAME]
                       forState:UIControlStateNormal];
        [btn setTitle:NSLocalizedString(@"TEXT_OK", @"确定") forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        btn.frame = CGRectMake(0.0, 0.0, 53.0, 30.0);
        [btn addTarget:self action:@selector(submitButtonClickHandler:) forControlEvents:UIControlEventTouchUpInside];
        
        self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:btn] autorelease];
        
        _shareType = ShareTypeSinaWeibo;
        _paramType = SSUserFieldTypeName;
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    
    if ([[UIDevice currentDevice].systemVersion versionStringCompare:@"7.0"] != NSOrderedAscending)
    {
        [self setExtendedLayoutIncludesOpaqueBars:NO];
        [self setEdgesForExtendedLayout:SSRectEdgeBottom | SSRectEdgeLeft | SSRectEdgeRight];
    }
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"iPhoneNavigationBarBG.png"]];
    
	// Do any additional setup after loading the view.
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.width, self.view.height)
                                              style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor colorWithRGB:0xe1e0de];
    _tableView.backgroundView = nil;
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:_tableView];
    [_tableView release];
}

- (void)setTitle:(NSString *)title
{
    [super setTitle:title];
    
    if ([[UIDevice currentDevice].systemVersion versionStringCompare:@"7.0"] != NSOrderedAscending)
    {
        ((UILabel *)self.navigationItem.titleView).text = title;
        [(UILabel *)self.navigationItem.titleView sizeToFit];
    }
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

#pragma mark - Private

- (void)cancelButtonClickHandler:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)submitButtonClickHandler:(id)sender
{
    AGUserInfoViewController *vc = [[AGUserInfoViewController alloc] initWithType:_shareType name:_textField.text paramType:_paramType];
    [self.navigationController pushViewController:vc animated:YES];
    [vc release];
}

- (void)tapGestureRecognizerHandler:(UITapGestureRecognizer *)gestureRecognizer
{
    [_textField resignFirstResponder];
}

- (void)layoutPortrait
{
    UIButton *btn = (UIButton *)self.navigationItem.leftBarButtonItem.customView;
    btn.frame = CGRectMake(btn.left, btn.top, 55.0, 32.0);
    [btn setBackgroundImage:[UIImage imageNamed:@"Common/NavigationButtonBG.png"
                                     bundleName:BUNDLE_NAME]
                   forState:UIControlStateNormal];
    btn = (UIButton *)self.navigationItem.rightBarButtonItem.customView;
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
    
    UIImageView *imageView = [[(UIImageView *)_tableView.tableHeaderView retain] autorelease];
    _tableView.tableHeaderView = nil;
    imageView.frame = CGRectMake(0.0, 0.0, [UIScreen mainScreen].bounds.size.width, imageView.height * [UIScreen mainScreen].bounds.size.width / imageView.width);
    _tableView.tableHeaderView = imageView;
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
        btn = (UIButton *)self.navigationItem.rightBarButtonItem.customView;
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
        btn = (UIButton *)self.navigationItem.rightBarButtonItem.customView;
        btn.frame = CGRectMake(btn.left, btn.top, 55.0, 32.0);
        [btn setBackgroundImage:[UIImage imageNamed:@"Common/NavigationButtonBG.png"
                                         bundleName:BUNDLE_NAME]
                       forState:UIControlStateNormal];
        
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"iPadLandscapeNavigationBarBG.png"]];
    }
    
    
    
    UIImageView *imageView = [[(UIImageView *)_tableView.tableHeaderView retain] autorelease];
    _tableView.tableHeaderView = nil;
    imageView.frame = CGRectMake(0.0, 0.0, [UIScreen mainScreen].bounds.size.height, imageView.height * [UIScreen mainScreen].bounds.size.height / imageView.width);
    _tableView.tableHeaderView = imageView;
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
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
            return 1;
        case 1:
            return 2;
        case 2:
            return 5;
        default:
            return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    switch (indexPath.section)
    {
        case 0:
        {
            cell = [tableView dequeueReusableCellWithIdentifier:INPUT_CELL_ID];
            if (cell == nil)
            {
                cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:INPUT_CELL_ID] autorelease];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
                _textField = [[UITextField alloc] initWithFrame:CGRectMake(0.0, 0.0, 200.0, 40)];
                _textField.autoresizingMask = UIViewAutoresizingFlexibleWidth;
                _textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
                _textField.delegate = self;
                cell.accessoryView = _textField;
                [_textField release];
            }
            
            if (_paramType == SSUserFieldTypeName)
            {
                cell.textLabel.text = NSLocalizedString(@"TEXT_NICKNAME", @"用户昵称:");
            }
            else
            {
                cell.textLabel.text = NSLocalizedString(@"TEXT_USERID", @"用户ID:");
            }
            break;
        }
        case 1:
        {
            cell = [tableView dequeueReusableCellWithIdentifier:PARAM_CELL_ID];
            if (cell == nil)
            {
                cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:PARAM_CELL_ID] autorelease];
            }
            
            switch (indexPath.row)
            {
                case 0:
                {
                    cell.textLabel.text = NSLocalizedString(@"TEXT_NICKNAME", @"用户昵称:");
                    if (_paramType == SSUserFieldTypeName)
                    {
                        cell.accessoryType = UITableViewCellAccessoryCheckmark;
                    }
                    else
                    {
                        cell.accessoryType = UITableViewCellAccessoryNone;
                    }
                    break;
                }
                case 1:
                {
                    cell.textLabel.text = NSLocalizedString(@"TEXT_USERID", @"用户ID:");
                    if (_paramType == SSUserFieldTypeUid)
                    {
                        cell.accessoryType = UITableViewCellAccessoryCheckmark;
                    }
                    else
                    {
                        cell.accessoryType = UITableViewCellAccessoryNone;
                    }
                    break;
                }
            }
            break;
        }
        case 2:
        {
            cell = [tableView dequeueReusableCellWithIdentifier:PLAT_CELL_ID];
            if (cell == nil)
            {
                cell = [[[AGShareCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:PLAT_CELL_ID] autorelease];
            }
            
            switch (indexPath.row)
            {
                case 0:
                {
                    cell.textLabel.text = NSLocalizedString(@"TEXT_SINA_WEIBO", @"新浪微博");
                    cell.imageView.image = [UIImage imageNamed:@"Icon/sns_icon_1.png" bundleName:BUNDLE_NAME];
                    if (_shareType == ShareTypeSinaWeibo)
                    {
                        cell.accessoryType = UITableViewCellAccessoryCheckmark;
                    }
                    else
                    {
                        cell.accessoryType = UITableViewCellAccessoryNone;
                    }
                    break;
                }
                case 1:
                {
                    cell.textLabel.text = NSLocalizedString(@"TEXT_TENCENT_WEIBO", @"腾讯微博");
                    cell.imageView.image = [UIImage imageNamed:@"Icon/sns_icon_2.png" bundleName:BUNDLE_NAME];
                    if (_shareType == ShareTypeTencentWeibo)
                    {
                        cell.accessoryType = UITableViewCellAccessoryCheckmark;
                    }
                    else
                    {
                        cell.accessoryType = UITableViewCellAccessoryNone;
                    }
                    break;
                }
                case 2:
                {
                    cell.textLabel.text = NSLocalizedString(@"TEXT_RENREN", @"人人网");
                    cell.imageView.image = [UIImage imageNamed:@"Icon/sns_icon_7.png" bundleName:BUNDLE_NAME];
                    if (_shareType == ShareTypeRenren)
                    {
                        cell.accessoryType = UITableViewCellAccessoryCheckmark;
                    }
                    else
                    {
                        cell.accessoryType = UITableViewCellAccessoryNone;
                    }
                    break;
                }
                case 3:
                {
                    cell.textLabel.text = @"Facebook";
                    cell.imageView.image = [UIImage imageNamed:@"Icon/sns_icon_10.png" bundleName:BUNDLE_NAME];
                    if (_shareType == ShareTypeFacebook)
                    {
                        cell.accessoryType = UITableViewCellAccessoryCheckmark;
                    }
                    else
                    {
                        cell.accessoryType = UITableViewCellAccessoryNone;
                    }
                    break;
                }
                case 4:
                {
                    cell.textLabel.text = @"Twitter";
                    cell.imageView.image = [UIImage imageNamed:@"Icon/sns_icon_11.png" bundleName:BUNDLE_NAME];
                    if (_shareType == ShareTypeTwitter)
                    {
                        cell.accessoryType = UITableViewCellAccessoryCheckmark;
                    }
                    else
                    {
                        cell.accessoryType = UITableViewCellAccessoryNone;
                    }
                    break;
                }
            }
            break;
        }
        default:
            break;
    }

    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section)
    {
        case 1:
        {
            switch (indexPath.row)
            {
                case 0:
                    _paramType = SSUserFieldTypeName;
                    break;
                case 1:
                    _paramType = SSUserFieldTypeUid;
                    break;
            }
            [_tableView reloadData];
            break;
        }
        case 2:
        {
            switch (indexPath.row)
            {
                case 0:
                    _shareType = ShareTypeSinaWeibo;
                    break;
                case 1:
                    _shareType = ShareTypeTencentWeibo;
                    break;
                case 2:
                    _shareType = ShareTypeRenren;
                    break;
                case 3:
                    _shareType = ShareTypeFacebook;
                    break;
                case 4:
                    _shareType = ShareTypeTwitter;
                    break;
            }
            [_tableView reloadData];
            break;
        }
        default:
            break;
    }
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (_gestureRecognizer == nil)
    {
        _gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognizerHandler:)];
    }
    [self.view addGestureRecognizer:_gestureRecognizer];
    [_gestureRecognizer release];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self.view removeGestureRecognizer:_gestureRecognizer];
    _gestureRecognizer = nil;
}

@end
