//
//  MailViewController.m
//  ShareSDKDemo
//
//  Created by wukx on 2018/7/17.
//  Copyright © 2018年 Max. All rights reserved.
//

#import "MailViewController.h"

@interface MailViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MailViewController

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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 3;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    
    if(indexPath.section == 0)
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
    if (section == 0)
    {
        return @"分享";
    }
    return @"";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section != 0)
    {
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
            [self _shareVideo];
            break;
        default:
            break;
    }
    
    
}

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
//        [parameters SSDKSetupMailParamsByText:@"Share SDK"
//                                        title:nil
//                                       images:nil
//                                  attachments:nil
//                                   recipients:nil
//                                 ccRecipients:nil
//                                bccRecipients:nil
//                                         type:SSDKContentTypeText];
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
                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    //平台定制
    //    [parameters SSDKSetupMailParamsByText:@"Share SDK"
    //                                    title:nil
    //                                   images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
    //                              attachments:nil
    //                               recipients:nil
    //                             ccRecipients:nil
    //                            bccRecipients:nil
    //                                     type:SSDKContentTypeImage];
    [self _shareParams:parameters];
}

- (void)_shareVideo
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                    images:nil
                                       url:[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]
                                     title:nil
                                      type:SSDKContentTypeVideo];
    //平台定制
    //        [parameters SSDKSetupMailParamsByText:@"Share SDK"
    //                                        title:nil
    //                                       images:nil
    //                                  attachments:@[[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]]
    //                                   recipients:nil
    //                                 ccRecipients:nil
    //                                bccRecipients:nil
    //                                         type:SSDKContentTypeAuto];
    [self _shareParams:parameters];
}

- (void)_shareParams:(NSMutableDictionary *)params
{
    [ShareSDK shareWithParameters:params platformType:SSDKPlatformTypeMail stateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
        
        switch (state)
        {
            case SSDKResponseStateSuccess:
                NSLog(@"Mail Share-------------------------->Success!:\n userData:%@ \n contentEntity:%@",userData,contentEntity);
                break;
            case SSDKResponseStateCancel:
                NSLog(@"Mail Share-------------------------->Cancel!");
                break;
            case SSDKResponseStateFail:
                NSLog(@"Mail Share-------------------------->Failed:%@",error);
                break;
                
            default:
                break;
        }
    }];
}

@end
