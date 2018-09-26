//
//  MeiPaiViewController.m
//  ShareSDKDemo
//
//  Created by Max on 2018/7/9.
//  Copyright © 2018年 Max. All rights reserved.
//

#import "MeiPaiViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface MeiPaiViewController ()

@end

@implementation MeiPaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"美拍";
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
        return 4;
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
        
        switch (indexPath.row)
        {
            case 0:
                cell.textLabel.text = @"图片";
                break;
            case 1:
                cell.textLabel.text = @"视频";
                break;
            case 2:
                cell.textLabel.text = @"相册图片";
                break;
            case 3:
                cell.textLabel.text = @"相册视频";
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
                [self _shareImage];
                break;
                
            case 1:
                [self _shareVideo];
                break;
                
            case 2:
                [self _shareImageAlbum];
                break;
            
            case 3:
                [self _shareVideoAlbum];
                break;
                
            default:
                break;
        }
    }
}

#pragma mark - 分享

- (void)_shareImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupMeiPaiParamsByUrl:[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]] contentType:SSDKContentTypeAuto];
    [self _shareParams:parameters];
}

- (void)_shareVideo
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupMeiPaiParamsByUrl:[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]] contentType:SSDKContentTypeAuto];
    [self _shareParams:parameters];
}

- (void)_shareImageAlbum
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"];
    ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
    __weak __typeof__ (self) weakSelf = self;
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    [assetsLibrary writeImageToSavedPhotosAlbum:[image CGImage]
                                    orientation:(ALAssetOrientation)image.imageOrientation
                                completionBlock:^(NSURL *assetURL, NSError *error) {
                                    
                                    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
                                    [parameters SSDKSetupMeiPaiParamsByUrl:assetURL contentType:SSDKContentTypeAuto];
                                   [self _shareParams:parameters];
                                }];
}

- (void)_shareVideoAlbum
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"];
    NSURL *url = [NSURL URLWithString:path];
    ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
    __weak __typeof__ (self) weakSelf = self;
    [assetsLibrary writeVideoAtPathToSavedPhotosAlbum:url completionBlock:^(NSURL *assetURL, NSError *error) {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupMeiPaiParamsByUrl:assetURL contentType:SSDKContentTypeAuto];
         [self _shareParams:parameters];
    }];
}

- (void)_shareParams:(NSMutableDictionary *)params
{
    [ShareSDK shareWithParameters:params platformType:SSDKPlatformTypeMeiPai stateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
        
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
    [ShareSDK authorize:SSDKPlatformTypeCMCC settings:nil stateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
        SSDKAlertAuthCallback;
    }];
}

- (void)_getUserinfo
{
    [ShareSDK getUserInfo:SSDKPlatformTypeCMCC condition:nil stateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
        SSDKAlertAuthCallback;
    }];
}


@end
