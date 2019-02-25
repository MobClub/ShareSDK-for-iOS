//
//  PinterestViewController.m
//  ShareSDKDemo
//
//  Created by Max on 2018/6/29.
//  Copyright © 2018年 Max. All rights reserved.
//

#import "PinterestViewController.h"

@interface PinterestViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UIView *tableView;

@end

@implementation PinterestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Pinterest";
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
    
    return 1;
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
        cell.textLabel.text = @"分享图片";
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
        [self _share];
    }
}

- (void)_share
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    //平台定制
            [parameters SSDKSetupPinterestParamsByImage:[[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"]
                                                   desc:@"Share SDK"
                                                    url:[NSURL URLWithString:@"http://www.mob.com"]
                                              boardName:@"aadaa11111"];
    
    [ShareSDK shareWithParameters:parameters platformType:SSDKPlatformTypePinterest stateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
        SSDKAlertShareCallback;
    }];
}

- (void)_auth
{
    [ShareSDK authorize:SSDKPlatformTypePinterest settings:nil stateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
        SSDKAlertAuthCallback;
    }];
}

- (void)_getUserInfo
{
    [ShareSDK getUserInfo:SSDKPlatformTypePinterest condition:nil stateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
        SSDKAlertAuthCallback;
    }];
}

@end
