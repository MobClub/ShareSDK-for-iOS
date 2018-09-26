//
//  EvernoteViewController.m
//  ShareSDKDemo
//
//  Created by Max on 2018/7/6.
//  Copyright © 2018年 Max. All rights reserved.
//

#import "EvernoteViewController.h"

@interface EvernoteViewController () <UITableViewDelegate, UITableViewDataSource>
{
    SSDKPlatformType _selectedSubPlatform;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation EvernoteViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"子平台切换" style:UIBarButtonItemStylePlain target:self action:@selector(_switchSubPlatform)];
    [self _switchSubPlatform];
}

- (void)_switchSubPlatform
{
    NSArray *titles = @[@"印象笔记",@"Evernote"];
    
    static NSInteger i = 0;
    
    NSInteger index = i++ % 2;
    self.title = titles[index];
    
    switch (index)
    {
        case 0:
        _selectedSubPlatform = SSDKPlatformTypeYinXiang;
        break;
        
        case 1:
        _selectedSubPlatform = SSDKPlatformTypeEvernote;
        break;
        
        default:
        break;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section)
    {
        return 2;
    }
    
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:@"11"];
    
    if (indexPath.section)
    {
        if (indexPath.row)
        {
            cell.textLabel.text = @"获取用户信息";
        }
        else
        {
            cell.textLabel.text = @"授权";
        }
    }
    else
    {
        switch (indexPath.row)
        {
            case 0:
                cell.textLabel.text = @"文字";
            break;
            
            case 1:
                cell.textLabel.text = @"图片";
            break;
            
            case 2:
                cell.textLabel.text = @"视频";
            break;
            
            default:
            break;
        }
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section)
    {
        if (indexPath.row)
        {
            [self _getUserInfo];
        }
        else
        {
            [self _auth];
        }
    }
    else
    {
        switch (indexPath.row)
        {
            case 0:
            [self _shareText];
            break;
            
            case 1:
            [self _shareImage];
            break;
            
            case 2:
            [self _shareVideo];
            break;
            
            default:
            break;
        }
    }
}

- (void)_shareText
{
    // title text 必填
    NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupEvernoteParamsByText:@"Share SDK"
                                           images:nil
                                            video:nil
                                            title:@"Share SDK"
                                         notebook:nil
                                             tags:nil
                                     platformType:_selectedSubPlatform];
    [self _shareParams:params];
}

- (void)_shareImage
{
    NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupEvernoteParamsByText:@"Share SDK"
                                           images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                            video:nil
                                            title:@"Share SDK"
                                         notebook:nil
                                             tags:nil
                                     platformType:_selectedSubPlatform];
    
    [self _shareParams:params];
}

- (void)_shareVideo
{
    NSMutableDictionary *params = @{}.mutableCopy;
        [params SSDKSetupEvernoteParamsByText:@"Share SDK"
                                           images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                            video:[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]
                                            title:@"Share SDK"
                                         notebook:nil
                                             tags:nil
                                     platformType:_selectedSubPlatform];
    
    [self _shareParams:params];
}

- (void)_shareParams:(NSMutableDictionary *)params
{
    [ShareSDK shareWithParameters:params platformType:_selectedSubPlatform stateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
        SSDKAlertShareCallback;
    }];
}

- (void)_auth
{
    [ShareSDK authorize:_selectedSubPlatform settings:nil stateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
        SSDKAlertAuthCallback;
    }];
}

- (void)_getUserInfo
{
    [ShareSDK getUserInfo:_selectedSubPlatform condition:nil stateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
        SSDKAlertAuthCallback;
    }];
}

@end
