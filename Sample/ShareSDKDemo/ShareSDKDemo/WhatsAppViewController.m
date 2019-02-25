//
//  WhatsAppViewController.m
//  ShareSDKDemo
//
//  Created by wukx on 2018/7/16.
//  Copyright © 2018年 Max. All rights reserved.
//

#import "WhatsAppViewController.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDK/ShareSDK+Base.h>

@interface WhatsAppViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation WhatsAppViewController

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
        return 4;
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
                cell.textLabel.text = @"音频";
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
            [self _shareAudio];
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
    //通用参数设置
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                    images:nil
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeText];
    //平台定制
//        [parameters SSDKSetupWhatsAppParamsByText:@"Share SDK"
//                                            image:nil
//                                            audio:nil
//                                            video:nil
//                                 menuDisplayPoint:CGPointZero
//                                             type:SSDKContentTypeText];
    [self _shareParams:parameters];
}

- (void)_shareImage
{
    //通用参数设置
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:@"Share SDK"
                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    //平台定制
//        [parameters SSDKSetupWhatsAppParamsByText:@"Share SDK"
//                                            image:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
//                                            audio:nil
//                                            video:nil
//                                 menuDisplayPoint:CGPointZero
//                                             type:SSDKContentTypeImage];
    [self _shareParams:parameters];
}

- (void)_shareAudio
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];

    [parameters SSDKSetupWhatsAppParamsByText:@"Share SDK"
                                        image:nil
                                        audio:[[NSBundle mainBundle] pathForResource:@"music" ofType:@"mp3"]
                                        video:nil
                             menuDisplayPoint:CGPointZero
                                         type:SSDKContentTypeAudio];

    [self _shareParams:parameters];
}

- (void)_shareVideo
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //平台定制
    [parameters SSDKSetupWhatsAppParamsByText:@"Share SDK"
                                        image:nil
                                        audio:nil
                                        video:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]
                             menuDisplayPoint:CGPointZero
                                         type:SSDKContentTypeVideo];
    [self _shareParams:parameters];
}

- (void)_shareParams:(NSMutableDictionary *)params
{
    [ShareSDK shareWithParameters:params platformType:SSDKPlatformTypeWhatsApp stateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {

        switch (state)
        {
            case SSDKResponseStateSuccess:
                NSLog(@"WhatsApp Share-------------------------->Success!:\n userData:%@ \n contentEntity:%@",userData,contentEntity);
                break;
            case SSDKResponseStateCancel:
                NSLog(@"WhatsApp Share-------------------------->Cancel!");
                break;
            case SSDKResponseStateFail:
                NSLog(@"WhatsApp Share-------------------------->Failed:%@",error);
                break;

            default:
                break;
        }
    }];
}

@end
