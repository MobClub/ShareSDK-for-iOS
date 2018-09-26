//
//  SinaWeiboViewController.m
//  ShareSDKDemo
//
//  Created by wukx on 2018/6/13.
//  Copyright © 2018年 Max. All rights reserved.
//

#import "SinaWeiboViewController.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDK/ShareSDK+Base.h>

@interface SinaWeiboViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SinaWeiboViewController

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
        return 4;
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
                cell.textLabel.text = @"文字+图片";
                break;
            case 2:
                cell.textLabel.text = @"链接";
                break;
            case 3:
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
            
        default:
            break;
    }
}

- (void)_shareText
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    //通用参数设置
        [params SSDKSetupShareParamsByText:@"Share SDK"
                                    images:nil
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeText];
    //平台定制
//    [params SSDKSetupSinaWeiboShareParamsByText:@"Share SDK"
//                                          title:nil
//                                         images:nil
//                                          video:nil
//                                            url:nil
//                                       latitude:0
//                                      longitude:0
//                                       objectID:nil
//                                 isShareToStory:YES
//                                           type:SSDKContentTypeText];
    
    [self _shareParams:params];
}

- (void)_shareImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                    images:@[[UIImage imageNamed:@"COD13.jpg"],[UIImage imageNamed:@"D45.jpg"]]
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    
    
    [self _shareParams:parameters];
}

- (void)_shareLink
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:@"Share SDK Link Desc"
                                    images:[UIImage imageNamed:@"COD13.jpg"]
                                       url:[NSURL URLWithString:@"http://www.mob.com"]
                                     title:@"MOB"
                                      type:SSDKContentTypeWebPage];

    
    [self _shareParams:parameters];
}

- (void)_shareVideo
{
    NSString *videoPath = [[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"];
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupSinaWeiboShareParamsByText:@"ShareSDK"
                                              title:nil
                                             images:nil
                                              video:videoPath
                                                url:nil
                                           latitude:0
                                          longitude:0
                                           objectID:nil
                                     isShareToStory:NO
                                               type:SSDKContentTypeVideo];
    [self _shareParams:parameters];
}

- (void)_shareParams:(NSMutableDictionary *)params
{
    [ShareSDK shareWithParameters:params platformType:SSDKPlatformTypeSinaWeibo stateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
        
        switch (state)
        {
            case SSDKResponseStateSuccess:
                NSLog(@"SinaWeibo Share-------------------------->Success!:\n userData:%@ \n contentEntity:%@",userData,contentEntity);
                break;
            case SSDKResponseStateCancel:
                NSLog(@"SinaWeibo Share-------------------------->Cancel!");
                break;
            case SSDKResponseStateFail:
                NSLog(@"SinaWeibo Share-------------------------->Failed:%@",error);
                break;
                
            default:
                break;
        }
    }];
}

- (void)_auth
{
    [ShareSDK authorize:SSDKPlatformTypeSinaWeibo settings:nil stateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
        switch (state)
        {
            case SSDKResponseStateSuccess:
                NSLog(@"SinaWeibo Auth-------------------------->Success! User:%@",user.dictionaryValue);
                break;
            case SSDKResponseStateCancel:
                NSLog(@"SinaWeibo Auth-------------------------->Cancel!");
                break;
            case SSDKResponseStateFail:
                NSLog(@"SinaWeibo Auth-------------------------->Failed:%@",error);
                break;
                
            default:
                break;
        }
    }];
}

- (void)_getUserInfo
{
//    [ShareSDK platform:SSDKPlatformTypeSinaWeibo needRequestAuthToken:^(NSString *authCode, void (^getUserinfo)(NSString *uid, NSString *token)) {
//
//        getUserinfo(@"1234567890",@"1234567890");
//    }];
//
//    [ShareSDK platform:SSDKPlatformTypeSinaWeibo needRefreshAuthToken:^(NSString *uid, void (^getUserinfo)(NSString *token)) {
//
//        getUserinfo(@"9876543210");
//    }];
    
    [ShareSDK getUserInfo:SSDKPlatformTypeSinaWeibo condition:nil stateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
        
        switch (state)
        {
            case SSDKResponseStateSuccess:
                NSLog(@"SinaWeibo getUserInfo-------------------------->Success! %@",user.dictionaryValue);
                break;
            case SSDKResponseStateCancel:
                NSLog(@"SinaWeibo getUserInfo-------------------------->Cancel!");
                break;
            case SSDKResponseStateFail:
                NSLog(@"SinaWeibo getUserInfo-------------------------->Failed:%@",error);
                break;
                
            default:
                break;
        }
    }];
}

- (void)_cancelAuth
{
    [ShareSDK cancelAuthorize:SSDKPlatformTypeSinaWeibo result:^(NSError *error) {
        
    }];
}
@end
