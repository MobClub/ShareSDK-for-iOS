//
//  PocketViewController.m
//  ShareSDKDemo
//
//  Created by Max on 2018/7/9.
//  Copyright © 2018年 Max. All rights reserved.
//

#import "PocketViewController.h"

@interface PocketViewController ()

@end

@implementation PocketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @" Pocket";
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
    else
    {
        return 1;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section)
    {
        return @"授权";
    }
    else
    {
        return @"分享";
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"bbbbbbbb"];
    
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
            cell.textLabel.text = @"链接";
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
            [self _getUserinfo];
        }
        else
        {
            [self _auth];
        }
    }
    else
    {
        [self _shareWeb];
    }
}

#pragma mark - 分享


- (void)_shareWeb
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupPocketParamsByUrl:[NSURL URLWithString:@"http://www.mob.com"]
                                     title:@"Share SDK"
                                      tags:@"page"
                                   tweetId:nil];
    
    [self _shareParams:parameters];
}

- (void)_shareParams:(NSMutableDictionary *)params
{
    [ShareSDK shareWithParameters:params platformType:SSDKPlatformTypePocket stateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
        
        if (state == SSDKResponseStateUpload)
        {
            NSLog(@"----------->%@",userData);
        }
        else
        {
            SSDKAlertShareCallback;
        }
    }];
}

#pragma mark - 授权
- (void)_auth
{
    [ShareSDK authorize:SSDKPlatformTypePocket settings:nil stateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
        SSDKAlertAuthCallback;
    }];
}

- (void)_getUserinfo
{
    [ShareSDK getUserInfo:SSDKPlatformTypePocket condition:nil stateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
        SSDKAlertAuthCallback;
    }];
}

@end
