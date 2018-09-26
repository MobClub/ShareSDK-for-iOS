//
//  QQViewController.m
//  ShareSDKDemo
//
//  Created by Max on 2018/6/8.
//  Copyright © 2018年 Max. All rights reserved.
//

#import "QQViewController.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDK/ShareSDK+Base.h>

@interface QQViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    SSDKPlatformType _selectedSubPlatform;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *shares;

@end

@implementation QQViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"子平台切换" style:UIBarButtonItemStylePlain target:self action:@selector(_switchSubPlatform)];
    [self _switchSubPlatform];
    
    _shares = @[@"文字",@"图片",@"链接",@"音乐链接",@"视频链接"];
}

- (void)_switchSubPlatform
{
    NSArray *titles = @[@"QQ好友",@"QQ空间"];
    
    static NSInteger i = 0;
    
    NSInteger index = i++ % 2;
    self.title = titles[index];
    
    switch (index)
    {
        case 0:
            _selectedSubPlatform = SSDKPlatformSubTypeQQFriend;
            break;
            
        case 1:
            _selectedSubPlatform = SSDKPlatformSubTypeQZone;
            break;
            
        default:
            break;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
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
                [self _shareLink];
                break;
                
            case 3:
                [self _shareAudio];
                break;
                
            case 4:
                [self _shareVideo];
                break;
            default:
                break;
        }
    }
}

#pragma mark - 分享

/**
 分享文字
 */
- (void)_shareText
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                    images:nil
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeText];
    
    //平台定制
    //    [parameters SSDKSetupQQParamsByText:@"Share SDK"
    //                                  title:nil
    //                                    url:nil
    //                          audioFlashURL:nil
    //                          videoFlashURL:nil
    //                             thumbImage:nil
    //                                 images:nil
    //                                   type:SSDKContentTypeText
    //                     forPlatformSubType:SSDKPlatformSubTypeQQFriend];
    [self _shareParams:parameters];
}

/**
 分享图片
 */
- (void)_shareImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                    images:@[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1530095833580&di=6d18816e8afb2bac07f0426005b0e856&imgtype=0&src=http%3A%2F%2Fimg1.3lian.com%2F2015%2Fw22%2F87%2Fd%2F105.jpg",[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]]
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    //    [parameters SSDKEnableExtensionShare];
    
    
    //平台定制
    //    [parameters SSDKSetupQQParamsByText:@"Share SDK"
    //                                  title:nil
    //                                    url:nil
    //                          audioFlashURL:nil
    //                          videoFlashURL:nil
    //                             thumbImage:nil
    //                                 images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
    //                                   type:SSDKContentTypeImage
    //                     forPlatformSubType:SSDKPlatformSubTypeQQFriend];
    [self _shareParams:parameters];
}

- (void)_shareLink
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:@"Share SDK Link Desc"
                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:[NSURL URLWithString:@"http://www.mob.com"]
                                     title:@"Share SDK"
                                      type:SSDKContentTypeWebPage];
    
    //平台定制
    //    [parameters SSDKSetupQQParamsByText:@"Share SDK Link Desc"
    //                                  title:@"Share SDK"
    //                                    url:[NSURL URLWithString:@"https://www.mob.com"]
    //                          audioFlashURL:nil
    //                          videoFlashURL:nil
    //                             thumbImage:nil
    //                                 images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
    //                                   type:SSDKContentTypeWebPage
    //                     forPlatformSubType:SSDKPlatformSubTypeQQFriend];
    
    [self _shareParams:parameters];
}

- (void)_shareAudio
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:@"Share SDK Link Desc"
                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:[NSURL URLWithString:@"http://i.y.qq.com/v8/playsong.html?hostuin=0&songid=&songmid=002x5Jje3eUkXT&_wv=1&source=qq&appshare=iphone&media_mid=002x5Jje3eUkXT""http://www.mob.com"]
                                     title:@"Share SDK"
                                      type:SSDKContentTypeAudio];
    
    //平台定制
    //        [parameters SSDKSetupQQParamsByText:@"Share SDK Link Desc"
    //                                      title:@"Share SDK"
    //                                        url:[NSURL URLWithString:@"http://i.y.qq.com/v8/playsong.html?hostuin=0&songid=&songmid=002x5Jje3eUkXT&_wv=1&source=qq&appshare=iphone&media_mid=002x5Jje3eUkXT"]
    //                              audioFlashURL:[NSURL URLWithString:@"http://i.y.qq.com/v8/playsong.html?hostuin=0&songid=&songmid=002x5Jje3eUkXT&_wv=1&source=qq&appshare=iphone&media_mid=002x5Jje3eUkXT"]
    //                              videoFlashURL:nil
    //                                 thumbImage:nil
    //                                     images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
    //                                       type:SSDKContentTypeAudio
    //                         forPlatformSubType:SSDKPlatformSubTypeQQFriend];
    
    [self _shareParams:parameters];
}

- (void)_shareVideo
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:@"Share SDK Link Desc"
                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:[NSURL URLWithString:@"http://www.mob.com"]
                                     title:@"Share SDK"
                                      type:SSDKContentTypeVideo];
    
    //平台定制
    //    [parameters SSDKSetupQQParamsByText:@"Share SDK Link Desc"
    //                                  title:@"Share SDK"
    //                                    url:[NSURL URLWithString:@"https://www.mob.com"]
    //                          audioFlashURL:nil
    //                          videoFlashURL:nil
    //                             thumbImage:nil
    //                                 images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
    //                                   type:SSDKContentTypeWebPage
    //                     forPlatformSubType:SSDKPlatformSubTypeQQFriend];
    
    [self _shareParams:parameters];
}

- (void)_shareParams:(NSMutableDictionary *)params
{
    [ShareSDK shareWithParameters:params platformType:_selectedSubPlatform stateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
        SSDKAlertShareCallback;
    }];
}

#pragma mark - 授权

- (void)_auth
{
    [ShareSDK authorize:SSDKPlatformTypeQQ settings:nil stateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
        SSDKAlertAuthCallback;
    }];
}

- (void)_getUserinfo
{
    [ShareSDK getUserInfo:SSDKPlatformTypeQQ condition:nil stateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
        SSDKAlertAuthCallback;
    }];
}


@end
