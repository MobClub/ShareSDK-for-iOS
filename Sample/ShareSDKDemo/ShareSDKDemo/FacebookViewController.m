//
//  FacebookViewController.m
//  ShareSDKDemo
//
//  Created by wukx on 2018/6/21.
//  Copyright © 2018年 Max. All rights reserved.
//

#import "FacebookViewController.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDK/ShareSDK+Base.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface FacebookViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation FacebookViewController

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
        return 5;
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
                cell.textLabel.text = @"文字";
                break;
            case 1:
                cell.textLabel.text = @"图片";
                break;
            case 2:
                cell.textLabel.text = @"链接";
                break;
            case 3:
                cell.textLabel.text = @"视频";
                break;
            case 4:
                cell.textLabel.text = @"应用邀请";
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
            [self _shareText];
            break;
        case 1:
            [self _shareImage];
            break;
        case 2:
            [self _shareLink];
            break;
            
        case 3:
            [self _shareVideo];
            break;
        case 4:
            [self _shareApp];
            break;
        default:
            break;
    }
}

- (void)_shareText
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    //通用参数设置
    [params SSDKSetupShareParamsByText:@"Share SDK test test"
                                images:nil
                                   url:nil
                                 title:nil
                                  type:SSDKContentTypeText];
    
    [self _shareParams:params];
}

- (void)_shareImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"];
    NSString *path2 = [[NSBundle mainBundle] pathForResource:@"D11" ofType:@"jpg"];
    NSString *path3 = [[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"];
    NSString *path4 = [[NSBundle mainBundle] pathForResource:@"shareImg" ofType:@"png"];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:nil
                                    images:@[path1,path2,path3,path4]
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    
    
    [self _shareParams:parameters];
}

- (void)_shareLink
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    //图片必须为网络图片
    [parameters SSDKSetupShareParamsByText:@"Share SDK Link Desc"
                                    images:@"http://ww4.sinaimg.cn/bmiddle/005Q8xv4gw1evlkov50xuj30go0a6mz3.jpg"
                                       url:[NSURL URLWithString:@"https://www.mob.com"]
                                     title:@"Share SDK"
                                      type:SSDKContentTypeWebPage];
    //平台定制
//    [parameters SSDKSetupFacebookParamsByText:@"Share SDK Link Desc"
//                                        image:@"http://ww4.sinaimg.cn/bmiddle/005Q8xv4gw1evlkov50xuj30go0a6mz3.jpg"
//                                          url:[NSURL URLWithString:@"https://www.mob.com"]
//                                     urlTitle:@"Share SDK"
//                                      urlName:nil
//                               attachementUrl:nil
//                                         type:SSDKContentTypeWebPage];
    
    [self _shareParams:parameters];
}

- (void)_shareVideo
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"];
    NSURL *url = [NSURL URLWithString:path];
    ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
    __weak __typeof__ (self) weakSelf = self;
    [assetsLibrary writeVideoAtPathToSavedPhotosAlbum:url completionBlock:^(NSURL *assetURL, NSError *error) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        //通用参数设置
        [parameters SSDKSetupShareParamsByText:nil
                                        images:nil
                                           url:assetURL
                                         title:nil
                                          type:SSDKContentTypeVideo];
        //平台定制
        //         [parameters SSDKSetupFacebookParamsByText:nil
        //                                             image:nil
        //                                               url:assetURL
        //                                          urlTitle:nil
        //                                           urlName:nil
        //                                    attachementUrl:nil
        //                                              type:SSDKContentTypeVideo];
        
        [weakSelf _shareParams:parameters];
    }];
}

- (void)_shareApp
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params SSDKSetupFacebookParamsByText:nil
                                    image:@"http://www.mob.com/public/images/logo_black.png"
                                      url:[NSURL URLWithString:@"https://fb.me/1492137904189216"]
                                 urlTitle:nil
                                  urlName:nil
                           attachementUrl:nil
                                     type:SSDKContentTypeApp];
    [self _shareParams:params];
}

- (void)_shareParams:(NSMutableDictionary *)params
{
    [ShareSDK shareWithParameters:params platformType:SSDKPlatformTypeFacebook stateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
        
        switch (state)
        {
            case SSDKResponseStateSuccess:
                NSLog(@"Facebook Share-------------------------->Success!:\n userData:%@ \n contentEntity:%@",userData,contentEntity);
                break;
            case SSDKResponseStateCancel:
                NSLog(@"Facebook Share-------------------------->Cancel!");
                break;
            case SSDKResponseStateFail:
                NSLog(@"Facebook Share-------------------------->Failed:%@",error);
                break;
                
            default:
                break;
        }
    }];
}

- (void)_auth
{
    [ShareSDK authorize:SSDKPlatformTypeFacebook settings:nil stateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
        switch (state)
        {
            case SSDKResponseStateSuccess:
                NSLog(@"Facebook auth-------------------------->Success! User:%@",user.dictionaryValue);
                break;
            case SSDKResponseStateCancel:
                NSLog(@"Facebook auth-------------------------->Cancel!");
                break;
            case SSDKResponseStateFail:
                NSLog(@"Facebook auth-------------------------->Failed:%@",error);
                break;
                
            default:
                break;
        }
    }];
}

- (void)_getUserInfo
{

    [ShareSDK getUserInfo:SSDKPlatformTypeFacebook condition:nil stateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
        
        switch (state)
        {
            case SSDKResponseStateSuccess:
                NSLog(@"Facebook getUserInfo-------------------------->Success! %@",user.dictionaryValue);
                break;
            case SSDKResponseStateCancel:
                NSLog(@"Facebook getUserInfo-------------------------->Cancel!");
                break;
            case SSDKResponseStateFail:
                NSLog(@"Facebook getUserInfo-------------------------->Failed:%@",error);
                break;
                
            default:
                break;
        }
    }];
}

- (void)_cancelAuth
{
    [ShareSDK cancelAuthorize:SSDKPlatformTypeFacebook result:^(NSError *error) {
        
    }];
}

@end
