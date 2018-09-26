//
//  GooglePlusViewController.m
//  ShareSDKDemo
//
//  Created by Max on 2018/7/9.
//  Copyright © 2018年 Max. All rights reserved.
//

#import "GooglePlusViewController.h"

@interface GooglePlusViewController () <UITableViewDelegate,UITableViewDataSource>

@end

@implementation GooglePlusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Google Plus";
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
    
    return 2;
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
                cell.textLabel.text = @"链接";
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
                [self _shareWeb];
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
        [params SSDKSetupGooglePlusParamsByText:@"Share SDK"
                                                url:nil
                                               type:SSDKContentTypeText];
    [self _shareParams:params];
}

- (void)_shareWeb
{
    NSMutableDictionary *params = @{}.mutableCopy;

    [params SSDKSetupGooglePlusParamsByText:@"Share SDK"
                                            url:[NSURL URLWithString:@"http://sharesdk.mob.com/"]
                                           type:SSDKContentTypeWebPage];
    
    [self _shareParams:params];
}



- (void)_shareParams:(NSMutableDictionary *)params
{
    [ShareSDK shareWithParameters:params platformType:SSDKPlatformTypeGooglePlus stateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
        SSDKAlertShareCallback;
    }];
}

- (void)_auth
{
    [ShareSDK authorize:SSDKPlatformTypeGooglePlus settings:nil stateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
        SSDKAlertAuthCallback;
    }];
}

- (void)_getUserInfo
{
    [ShareSDK getUserInfo:SSDKPlatformTypeGooglePlus condition:nil stateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
        SSDKAlertAuthCallback;
    }];
}
@end
