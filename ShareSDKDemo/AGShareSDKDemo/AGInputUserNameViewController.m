//
//  AGInputUserNameViewController.m
//  AGShareSDKDemo
//
//  Created by 冯 鸿杰 on 13-1-17.
//  Copyright (c) 2013年 vimfung. All rights reserved.
//

#import "AGInputUserNameViewController.h"
#import "AGUserInfoViewController.h"
#import "AGShareCell.h"
#import <AGCommon/UIImage+Common.h>
#import <AGCommon/UINavigationBar+Common.h>
#import <AGCommon/UIImage+Common.h>

#define INPUT_CELL_ID @"inputCellId"
#define PARAM_CELL_ID @"paramCellId"
#define PLAT_CELL_ID @"platCellId"

@implementation AGInputUserNameViewController

- (id)init
{
    if (self = [super init])
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:[UIImage imageNamed:@"AGShareSDK/PublishEx/NavigationButtonBG.png" bundleName:@"Appgo"]
                       forState:UIControlStateNormal];
        [btn setTitle:@"取消" forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        btn.frame = CGRectMake(0.0, 0.0, 53.0, 30.0);
        [btn addTarget:self action:@selector(cancelButtonClickHandler:) forControlEvents:UIControlEventTouchUpInside];
        
        self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:btn] autorelease];
        
        btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:[UIImage imageNamed:@"AGShareSDK/PublishEx/NavigationButtonBG.png" bundleName:@"Appgo"]
                       forState:UIControlStateNormal];
        [btn setTitle:@"确定" forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        btn.frame = CGRectMake(0.0, 0.0, 53.0, 30.0);
        [btn addTarget:self action:@selector(submitButtonClickHandler:) forControlEvents:UIControlEventTouchUpInside];
        
        self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:btn] autorelease];
        
        _shareType = ShareTypeSinaWeibo;
        _paramType = UserParamTypeName;
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"AGShareSDK/PublishEx/NavigationBarBG.png" bundleName:@"Appgo"]];
    
	// Do any additional setup after loading the view.
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.width, self.view.height)
                                              style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:_tableView];
    [_tableView release];
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
            return 3;
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
                _textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
                _textField.delegate = self;
                cell.accessoryView = _textField;
                [_textField release];
            }
            
            if (_paramType == UserParamTypeName)
            {
                cell.textLabel.text = @"用户昵称:";
            }
            else
            {
                cell.textLabel.text = @"用户ID:";
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
                    cell.textLabel.text = @"用户昵称";
                    if (_paramType == UserParamTypeName)
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
                    cell.textLabel.text = @"用户ID";
                    if (_paramType == UserParamTypeUid)
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
                    cell.textLabel.text = @"新浪微博";
                    cell.imageView.image = [UIImage imageNamed:@"AGShareSDK/Icon/sns_icon_1.png" bundleName:@"Appgo"];
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
                    cell.textLabel.text = @"腾讯微博";
                    cell.imageView.image = [UIImage imageNamed:@"AGShareSDK/Icon/sns_icon_2.png" bundleName:@"Appgo"];
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
                    cell.textLabel.text = @"人人网";
                    cell.imageView.image = [UIImage imageNamed:@"AGShareSDK/Icon/sns_icon_7.png" bundleName:@"Appgo"];
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
                    _paramType = UserParamTypeName;
                    break;
                case 1:
                    _paramType = UserParamTypeUid;
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
