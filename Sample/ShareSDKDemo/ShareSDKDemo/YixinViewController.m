//
//  YixinViewController.m
//  ShareSDKDemo
//
//  Created by Max on 2018/7/3.
//  Copyright © 2018年 Max. All rights reserved.
//

#import "YixinViewController.h"

@interface YixinViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    SSDKPlatformType _selectedSubPlatform;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *shares;
@end

@implementation YixinViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"子平台切换" style:UIBarButtonItemStylePlain target:self action:@selector(_switchSubPlatform)];
    [self _switchSubPlatform];
    
    _shares = @[@"文字",@"图片",@"链接",@"音乐链接",@"视频链接",@"应用消息"];
}

- (void)_switchSubPlatform
{
    NSArray *titles = @[@"易信好友",@"易信朋友圈",@"易信收藏"];
    
    static NSInteger i = 0;
    
    NSInteger index = i++ % 3;
    self.title = titles[index];
    
    switch (index)
    {
        case 0:
            _selectedSubPlatform = SSDKPlatformSubTypeYiXinSession;
            break;
            
        case 1:
            _selectedSubPlatform = SSDKPlatformSubTypeYiXinTimeline;
            break;
            
        case 2:
            _selectedSubPlatform = SSDKPlatformSubTypeYiXinFav;
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
    
    return @"分享";
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
                
            case 5:
                [self _shareApp];
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
        [parameters SSDKSetupYiXinParamsByText:@"Share SDK"
                                         title:nil
                                           url:nil
                                    thumbImage:nil
                                         image:nil
                                  musicFileURL:nil
                                       extInfo:nil
                                      fileData:nil
                                       comment:nil
                                      toUserId:nil
                                          type:SSDKContentTypeText
                            forPlatformSubType:_selectedSubPlatform];
    [self _shareParams:parameters];
}

/**
 分享图片
 */
- (void)_shareImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupYiXinParamsByText:@"Share SDK"
                                     title:nil
                                       url:nil
                                thumbImage:nil
                                     image:@"http://a3.topitme.com/1/21/79/1128833621e7779211o.jpg"
                              musicFileURL:nil
                                   extInfo:nil
                                  fileData:nil
                                   comment:nil
                                  toUserId:nil
                                      type:SSDKContentTypeImage
                        forPlatformSubType:_selectedSubPlatform];

    [self _shareParams:parameters];
}

- (void)_shareLink
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
        [parameters SSDKSetupYiXinParamsByText:@"Share SDK"
                                         title:@"Share SDK title"
                                           url:[NSURL URLWithString:@"https://www.mob.com"]
                                    thumbImage:nil
                                         image:@"http://a3.topitme.com/1/21/79/1128833621e7779211o.jpg"
                                  musicFileURL:nil
                                       extInfo:nil
                                      fileData:nil
                                       comment:nil
                                      toUserId:nil
                                          type:SSDKContentTypeWebPage
                            forPlatformSubType:_selectedSubPlatform];
    
    [self _shareParams:parameters];
}

- (void)_shareAudio
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
            [parameters SSDKSetupYiXinParamsByText:@"Share SDK"
                                             title:@"Share SDK"
                                               url:[NSURL URLWithString:@"http://i.y.qq.com/v8/playsong.html?hostuin=0&songid=&songmid=002x5Jje3eUkXT&_wv=1&source=qq&appshare=iphone&media_mid=002x5Jje3eUkXT"]
                                        thumbImage:[[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"]
                                             image:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                      musicFileURL:[NSURL URLWithString:@"http://i.y.qq.com/v8/playsong.html?hostuin=0&songid=&songmid=002x5Jje3eUkXT&_wv=1&source=qq&appshare=iphone&media_mid=002x5Jje3eUkXT"]
                                           extInfo:nil
                                          fileData:nil
                                           comment:nil
                                          toUserId:nil
                                              type:SSDKContentTypeAudio
                                forPlatformSubType:_selectedSubPlatform];
    
    [self _shareParams:parameters];
}

- (void)_shareVideo
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupYiXinParamsByText:@"Share SDK"
                                     title:@"Share SDK"
                                       url:[NSURL URLWithString:@"http://v.youku.com/v_show/id_XNTUxNDY1NDY4.html"]
                                thumbImage:nil
                                     image:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                              musicFileURL:nil
                                   extInfo:nil
                                  fileData:nil
                                   comment:nil
                                  toUserId:nil
                                      type:SSDKContentTypeVideo
                        forPlatformSubType:_selectedSubPlatform];

    
    [self _shareParams:parameters];
}

- (void)_shareApp
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupYiXinParamsByText:@"Share SDK"
                                     title:@"App消息"
                                       url:[NSURL URLWithString:@"http://www.mob.com"]
                                thumbImage:nil
                                     image:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                              musicFileURL:nil
                                   extInfo:@"1111"
                                  fileData:[@"13232" dataUsingEncoding:NSUTF8StringEncoding]
                                   comment:nil
                                  toUserId:nil
                                      type:SSDKContentTypeApp
                        forPlatformSubType:_selectedSubPlatform];
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
    [ShareSDK authorize:SSDKPlatformTypeYiXin settings:nil stateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
        SSDKAlertAuthCallback;
    }];
}

- (void)_getUserinfo
{
    [ShareSDK getUserInfo:SSDKPlatformTypeYiXin condition:nil stateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
        SSDKAlertAuthCallback;
    }];
}
@end
