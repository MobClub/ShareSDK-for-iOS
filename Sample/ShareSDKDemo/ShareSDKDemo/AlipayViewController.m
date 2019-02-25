//
//  AlipayViewController.m
//  ShareSDKDemo
//
//  Created by Max on 2018/6/27.
//  Copyright © 2018年 Max. All rights reserved.
//

#import "AlipayViewController.h"

@interface AlipayViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    SSDKPlatformType _selectedSubPlatform;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *shares;

@end

@implementation AlipayViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"子平台切换" style:UIBarButtonItemStylePlain target:self action:@selector(_switchSubPlatform)];
    [self _switchSubPlatform];
    _shares = @[@"文字",@"文字+图片",@"链接"];
    
}

- (void)_switchSubPlatform
{
    NSArray *titles = @[@"支付宝",@"支付宝朋友圈"];
    
    static NSInteger i = 0;
    
    NSInteger index = i++ % 2;
    self.title = titles[index];
    
    switch (index)
    {
        case 0:
            _selectedSubPlatform = SSDKPlatformTypeAliSocial;
            break;
            
        case 1:
            _selectedSubPlatform = SSDKPlatformTypeAliSocialTimeline;
            break;
            
        default:
            break;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _shares.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"分享";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"bbbbbbbb"];
    cell.textLabel.text = _shares[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row)
    {
        case 0:
            [self _shareText];
            break;
            
        case 1:
            [self _shareImage];
            break;
            
        case 2:
            [self _shareLink];
            break;
        default:
            break;
    }
}

#pragma mark - 分享

- (void)_shareText
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupAliSocialParamsByText:@"Share SDK"
                                            image:nil
                                            title:nil
                                              url:nil
                                             type:SSDKContentTypeText
                                     platformType:_selectedSubPlatform];
    [self _shareParams:parameters];
}

- (void)_shareImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupAliSocialParamsByText:@"Share SDK"
                                            image:@"http://ww4.sinaimg.cn/bmiddle/005Q8xv4gw1evlkov50xuj30go0a6mz3.jpg"
                                            title:nil
                                              url:nil
                                             type:SSDKContentTypeImage
                                     platformType:_selectedSubPlatform];
    [self _shareParams:parameters];
}

- (void)_shareLink
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupAliSocialParamsByText:@"Share SDK"
                                         image:@[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1530095833580&di=6d18816e8afb2bac07f0426005b0e856&imgtype=0&src=http%3A%2F%2Fimg1.3lian.com%2F2015%2Fw22%2F87%2Fd%2F105.jpg",@"123"]
                                            title:@"Share SDK"
                                              url:[NSURL URLWithString:@"https://www.mob.com"]
                                             type:SSDKContentTypeWebPage
                                     platformType:_selectedSubPlatform];
    [self _shareParams:parameters];
}

- (void)_shareParams:(NSMutableDictionary *)params
{
    [ShareSDK shareWithParameters:params platformType:_selectedSubPlatform stateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
        
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

@end
