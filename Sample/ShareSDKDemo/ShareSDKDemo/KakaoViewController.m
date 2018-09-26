//
//  KakaoViewController.m
//  ShareSDKDemo
//
//  Created by Max on 2018/7/9.
//  Copyright © 2018年 Max. All rights reserved.
//

#import "KakaoViewController.h"

@interface KakaoViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    SSDKPlatformType _selectedSubPlatform;
}

//@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation KakaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"子平台切换" style:UIBarButtonItemStylePlain target:self action:@selector(_switchSubPlatform)];
    [self _switchSubPlatform];
}

- (void)_switchSubPlatform
{
    NSArray *titles = @[@"KakaoTalk",@"KakaoStory"];
    
    static NSInteger i = 0;
    
    NSInteger index = i++ % 2;
    self.title = titles[index];
    
    switch (index)
    {
        case 0:
            _selectedSubPlatform = SSDKPlatformSubTypeKakaoTalk;
            break;
            
        case 1:
            _selectedSubPlatform = SSDKPlatformSubTypeKakaoStory;
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
    
    return 4;
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
                cell.textLabel.text = @"图片";
                break;
                
            case 2:
                cell.textLabel.text = @"链接";
                break;
                
            case 3:
                cell.textLabel.text = @"应用";
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
                [self _shareImage];
                break;
                
            case 2:
                [self _shareWeb];
                break;
            
            case 3:
                [self _shareApp];
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
    
    [params SSDKSetupKaKaoParamsByText:@"Share SDK"
                                images:nil
                                 title:nil
                                   url:nil
                            permission:nil
                           enableShare:YES
                             imageSize:CGSizeZero
                        appButtonTitle:nil
                      androidExecParam:nil
                      androidMarkParam:nil
                      iphoneExecParams:nil
                       iphoneMarkParam:nil
                        ipadExecParams:nil
                         ipadMarkParam:nil
                                  type:SSDKContentTypeText
                    platformSubType:_selectedSubPlatform];
    
    [self _shareParams:params];
}

- (void)_shareImage
{
    NSMutableDictionary *params = @{}.mutableCopy;

        [params SSDKSetupKaKaoParamsByText:@"Share SDK"
                                        images:@"http://a3.topitme.com/1/21/79/1128833621e7779211o.jpg"
                                         title:nil
                                           url:nil
                                    permission:nil
                                   enableShare:YES
                                     imageSize:CGSizeZero
                                appButtonTitle:nil
                              androidExecParam:nil
                              androidMarkParam:nil
                              iphoneExecParams:nil
                               iphoneMarkParam:nil
                                ipadExecParams:nil
                                 ipadMarkParam:nil
                                          type:SSDKContentTypeImage
                            platformSubType:_selectedSubPlatform];
    [self _shareParams:params];
}

- (void)_shareWeb
{
    NSMutableDictionary *params = @{}.mutableCopy;
    
        [params SSDKSetupKaKaoParamsByText:@"Share SDK"
                                        images:@"http://www.mob.com/images/logo_black.png"
                                         title:@"Share SDK"
                                           url:[NSURL URLWithString:@"http://www.mob.com"]
                                    permission:nil
                                   enableShare:YES
                                     imageSize:CGSizeZero
                                appButtonTitle:nil
                              androidExecParam:nil
                              androidMarkParam:nil
                              iphoneExecParams:nil
                               iphoneMarkParam:nil
                                ipadExecParams:nil
                                 ipadMarkParam:nil
                                          type:SSDKContentTypeWebPage
                            platformSubType:_selectedSubPlatform];
    
    
    [self _shareParams:params];
}

- (void)_shareApp
{
    NSMutableDictionary *params = @{}.mutableCopy;
    
    [params SSDKSetupKaKaoParamsByText:@"Share SDK"
                                    images:@"http://www.mob.com/images/logo_black.png"
                                     title:@"Share SDK"
                                       url:[NSURL URLWithString:@"http://www.mob.com"]
                                permission:nil
                               enableShare:YES
                                 imageSize:CGSizeZero
                            appButtonTitle:@"appButtonTitle"
                          androidExecParam:nil
                          androidMarkParam:nil
                          iphoneExecParams:nil
                           iphoneMarkParam:nil
                            ipadExecParams:nil
                             ipadMarkParam:nil
                                      type:SSDKContentTypeApp
                        platformSubType:_selectedSubPlatform];
    
    [self _shareParams:params];
}

- (void)_shareParams:(NSMutableDictionary *)params
{
    [ShareSDK shareWithParameters:params platformType:_selectedSubPlatform stateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
        SSDKAlertShareCallback;
    }];
}

- (void)_auth
{
    [ShareSDK authorize:_selectedSubPlatform settings:nil stateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
        SSDKAlertAuthCallback;
    }];
}

- (void)_getUserInfo
{
    [ShareSDK getUserInfo:_selectedSubPlatform condition:nil stateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
        SSDKAlertAuthCallback;
    }];
}

@end
