//
//  TwitterViewController.m
//  ShareSDKDemo
//
//  Created by Max on 2018/6/20.
//  Copyright © 2018年 Max. All rights reserved.
//

#import "TwitterViewController.h"

@interface TwitterViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *shares;

@end

@implementation TwitterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Twitter";
    
    _shares = @[@"文字",@"文字+图片",@"文字+视频（上传进度）"];
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
        return _shares.count;
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
        
        cell.textLabel.text = _shares[indexPath.row];
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
                
            case 2:
                [self _shareVideo];
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
    [parameters SSDKSetupTwitterParamsByText:@"Share SDK" images:nil video:nil latitude:0 longitude:0 type:SSDKContentTypeText];
    [self _shareParams:parameters];
}

- (void)_shareImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //图片最多4张 GIF只能1张
//    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"];
//    NSString *path2 = [[NSBundle mainBundle] pathForResource:@"D11" ofType:@"jpg"];
//    NSString *path3 = [[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"];
    NSString *path4 = [[NSBundle mainBundle] pathForResource:@"res6" ofType:@"gif"];
    
//    [parameters SSDKSetupTwitterParamsByText:@"Share SDK"
//                                      images:path4
//                                    latitude:0
//                                   longitude:0
//                                        type:SSDKContentTypeImage];
//    [self shareWithParameters:parameters];
    
    [parameters SSDKSetupTwitterParamsByText:@"ShareSDK" images:path4 video:nil latitude:0 longitude:0 type:SSDKContentTypeImage];
    
    [self _shareParams:parameters];
}

- (void)_shareVideo
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupTwitterParamsByText:@"Share SDK" images:nil video:[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]] latitude:0 longitude:0 type:SSDKContentTypeVideo];
    [self _shareParams:parameters];
}

- (void)_shareParams:(NSMutableDictionary *)params
{
    SSDKSession *session = [ShareSDK shareWithParameters:params platformType:SSDKPlatformTypeTwitter stateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
        
        if (state == SSDKResponseStateUpload)
        {
            NSLog(@"----------->%@",userData);
        }
        else
        {
            SSDKAlertShareCallback;
        }
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [session cancel];
    });
}

#pragma mark - 授权
- (void)_auth
{
    [ShareSDK authorize:SSDKPlatformTypeTwitter settings:nil stateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
        SSDKAlertAuthCallback;
    }];
}

- (void)_getUserinfo
{
    [ShareSDK getUserInfo:SSDKPlatformTypeTwitter condition:nil stateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
        SSDKAlertAuthCallback;
    }];
}

@end
