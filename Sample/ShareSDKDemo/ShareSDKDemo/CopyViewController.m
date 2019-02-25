//
//  CopyViewController.m
//  ShareSDKDemo
//
//  Created by Max on 2018/7/9.
//  Copyright © 2018年 Max. All rights reserved.
//

#import "CopyViewController.h"

@interface CopyViewController ()

@end

@implementation CopyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Copy";
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"分享";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"bbbbbbbb"];
    
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
            
        default:
            break;
    }
    
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
                [self _shareWeb];
                break;
                
            default:
                break;
        }
}

#pragma mark - 分享

- (void)_shareText
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupCopyParamsByText:@"Share SDK"
                                       images:nil
                                          url:nil
                                         type:SSDKContentTypeText];
    
    [self _shareParams:parameters];
}

- (void)_shareImage
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters SSDKSetupCopyParamsByText:nil
                                       images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                          url:nil
                                         type:SSDKContentTypeImage];
    [self _shareParams:parameters];
}


- (void)_shareWeb
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupCopyParamsByText:nil
                                   images:nil
                                      url:[NSURL URLWithString:@"https://www.mob.com"]
                                     type:SSDKContentTypeWebPage];
    [self _shareParams:parameters];
}

- (void)_shareParams:(NSMutableDictionary *)params
{
    [ShareSDK shareWithParameters:params platformType:SSDKPlatformTypeCopy stateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
        
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
