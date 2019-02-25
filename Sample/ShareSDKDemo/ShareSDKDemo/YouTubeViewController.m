//
//  YouTubeViewController.m
//  ShareSDKDemo
//
//  Created by wukx on 2018/7/12.
//  Copyright © 2018年 Max. All rights reserved.
//

#import "YouTubeViewController.h"

@interface YouTubeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation YouTubeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 1;
    }
    else if (section == 1)
    {
        return 3;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    
    if (indexPath.section == 1)
    {
        if (indexPath.row == 1)
        {
            cell.textLabel.text = @"获取用户信息";
        }
        else if (indexPath.row == 0)
        {
            cell.textLabel.text = @"授权";
        }
        else if (indexPath.row == 2)
        {
            cell.textLabel.text = @"取消授权";
        }
        else
        {
            cell.textLabel.text = @"";
        }
    }
    else if(indexPath.section == 0)
    {
        switch (indexPath.row)
        {
            case 0:
                cell.textLabel.text = @"视频";
                break;
            default:
                break;
        }
    }
    else
    {
        cell.textLabel.text = @"";
    }
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 1)
    {
        return @"授权";
    }
    else if (section == 0)
    {
        return @"分享";
    }
    return @"";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section)
    {
        if (indexPath.row == 1)
        {
            [self _getUserInfo];
        }
        else if (indexPath.row == 0)
        {
            [self _auth];
        }
        else if (indexPath.row == 2)
        {
            [self _cancelAuth];
        }
        return;
    }
    
    switch (indexPath.row)
    {
        case 0:
            [self _shareVideo];
            break;
        default:
            break;
    }
}

- (void)_shareVideo
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"];
    [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                    images:nil
                                       url:[NSURL fileURLWithPath:filePath]
                                     title:nil
                                      type:SSDKContentTypeVideo];
    
    __weak typeof(self) weakSelf = self;
    [ShareSDK shareWithParameters:parameters platformType:SSDKPlatformTypeYouTube stateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
        switch (state)
        {
            case SSDKResponseStateUpload:
            {
                NSLog(@"YouTube Share-------------------------->Upload!");
                break;
            }
            case SSDKResponseStateSuccess:
            {
                NSLog(@"YouTube Share-------------------------->Success!:\n userData:%@ \n contentEntity:%@",userData,contentEntity);
                break;
            }
            case SSDKResponseStateFail:
            {
                NSLog(@"YouTube Share-------------------------->Failed:%@",error);
                break;
            }
            case SSDKResponseStateCancel:
            {
                NSLog(@"YouTube Share-------------------------->Cancel!");
                break;
            }
            default:
                break;
        }
    }];
}

- (void)_shareParams:(NSMutableDictionary *)params
{
    [ShareSDK shareWithParameters:params platformType:SSDKPlatformTypeYouTube stateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
        
        switch (state)
        {
            case SSDKResponseStateSuccess:
                NSLog(@"YouTube Share-------------------------->Success!:\n userData:%@ \n contentEntity:%@",userData,contentEntity);
                break;
            case SSDKResponseStateCancel:
                NSLog(@"YouTube Share-------------------------->Cancel!");
                break;
            case SSDKResponseStateFail:
                NSLog(@"YouTube Share-------------------------->Failed:%@",error);
                break;
                
            default:
                break;
        }
    }];
}

- (void)_getUserInfo
{
    [ShareSDK getUserInfo:SSDKPlatformTypeYouTube condition:nil stateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
        
        switch (state)
        {
            case SSDKResponseStateSuccess:
                NSLog(@"YouTube getUserInfo-------------------------->Success! %@",user.dictionaryValue);
                break;
            case SSDKResponseStateCancel:
                NSLog(@"YouTube getUserInfo-------------------------->Cancel!");
                break;
            case SSDKResponseStateFail:
                NSLog(@"YouTube getUserInfo-------------------------->Failed:%@",error);
                break;
                
            default:
                break;
        }
    }];
}

- (void)_auth
{
    [ShareSDK authorize:SSDKPlatformTypeYouTube settings:nil stateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
        switch (state)
        {
            case SSDKResponseStateSuccess:
                NSLog(@"YouTube auth-------------------------->Success! User:%@",user.dictionaryValue);
                break;
            case SSDKResponseStateCancel:
                NSLog(@"YouTube auth-------------------------->Cancel!");
                break;
            case SSDKResponseStateFail:
                NSLog(@"YouTube auth-------------------------->Failed:%@",error);
                break;
                
            default:
                break;
        }
    }];
}

- (void)_cancelAuth
{
    [ShareSDK cancelAuthorize:SSDKPlatformTypeYouTube result:^(NSError *error) {
        
    }];
}

@end
