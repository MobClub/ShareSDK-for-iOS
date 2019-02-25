//
//  TumblrViewController.m
//  ShareSDKDemo
//
//  Created by Max on 2018/7/9.
//  Copyright © 2018年 Max. All rights reserved.
//

#import "TumblrViewController.h"

@interface TumblrViewController ()

@end

@implementation TumblrViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Tumblr";
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
        return 2;
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
        
        if (indexPath.row)
        {
            cell.textLabel.text = @"图片";
        }
        else
        {
            cell.textLabel.text = @"文字";
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
            [self _getUserinfo];
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
                
            default:
                break;
        }
    }
}

#pragma mark - 分享

- (void)_shareText
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupTumblrParamsByText:@"Share SDK"
                                          image:nil
                                            url:nil
                                          title:nil
                                       blogName:nil
                                           type:SSDKContentTypeText];
    [self _shareParams:parameters];
}

- (void)_shareImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupTumblrParamsByText:nil
                                          image:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                            url:nil
                                          title:@"Share SDK"
                                       blogName:nil
                                           type:SSDKContentTypeImage];
    
    [self _shareParams:parameters];
}

- (void)_shareParams:(NSMutableDictionary *)params
{
    [ShareSDK shareWithParameters:params platformType:SSDKPlatformTypeTumblr stateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
        
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
    [ShareSDK authorize:SSDKPlatformTypeTumblr settings:nil stateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
        SSDKAlertAuthCallback;
    }];
}

- (void)_getUserinfo
{
    [ShareSDK getUserInfo:SSDKPlatformTypeTumblr condition:nil stateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
        SSDKAlertAuthCallback;
    }];
}


@end
