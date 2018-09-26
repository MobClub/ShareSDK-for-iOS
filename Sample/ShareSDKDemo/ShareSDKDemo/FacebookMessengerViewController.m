//
//  FacebookMessengerViewController.m
//  ShareSDKDemo
//
//  Created by wukx on 2018/6/25.
//  Copyright © 2018年 Max. All rights reserved.
//

#import "FacebookMessengerViewController.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDK/ShareSDK+Base.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface FacebookMessengerViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation FacebookMessengerViewController

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
        return 7;
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
                cell.textLabel.text = @"图片";
                break;
            case 1:
                cell.textLabel.text = @"GIF";
                break;
            case 2:
                cell.textLabel.text = @"本地音频";
                break;
            case 3:
                cell.textLabel.text = @"本地视频";
                break;
            case 4:
                cell.textLabel.text = @"链接";
                break;
            case 5:
                cell.textLabel.text = @"多图";
                break;
            case 6:
                cell.textLabel.text = @"相册视频";
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
    
    if (indexPath.section != 0) {
        return;
    }
    
    switch (indexPath.row)
    {
        case 0:
            [self _shareImage];
            break;
        case 1:
            [self _shareGif];
            break;
        case 2:
            [self _shareAudio];
            break;
        case 3:
            [self _shareVideo];
            break;
        case 4:
            [self _shareLink];
            break;
        case 5:
            [self _shareImages];
            break;
        case 6:
            [self _shareAssetVideo];
            break;
        default:
            break;
    }
}

- (void)_shareImage
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    //通用参数设置
    [params SSDKSetupShareParamsByText:nil
                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    [self _shareParams:params];
}

- (void)_shareGif
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
//
//
    //平台定制
    [params SSDKSetupFacebookMessengerParamsByTitle:nil
                                                url:nil
                                          quoteText:nil
                                             images:nil
                                                gif:[[NSBundle mainBundle] pathForResource:@"res6" ofType:@"gif"]
                                              audio:nil
                                              video:nil
                                               type:SSDKContentTypeImage];

    //NSMutableDictionary *params = [NSMutableDictionary dictionary];
    //通用参数设置
//    [params SSDKSetupShareParamsByText:nil
//                                images:[[NSBundle mainBundle] pathForResource:@"res6" ofType:@"gif"]
//                                   url:nil
//                                 title:nil
//                                  type:SSDKContentTypeImage];

    [self _shareParams:params];
}

- (void)_shareAudio
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    //平台定制
    [params SSDKSetupFacebookMessengerParamsByTitle:nil
                                                url:nil
                                          quoteText:nil
                                             images:nil
                                                gif:nil
                                              audio:[[NSBundle mainBundle] pathForResource:@"music" ofType:@"mp3"]
                                              video:nil
                                               type:SSDKContentTypeAudio];
    
    [self _shareParams:params];
}

- (void)_shareVideo
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    [params SSDKSetupShareParamsByText:nil
                                images:nil
                                   url:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]]
                                 title:nil
                                  type:SSDKContentTypeVideo];
    [self _shareParams:params];
}

- (void)_shareLink
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    //通用参数设置
    //图片必须为网络图片
    [params SSDKSetupShareParamsByText:@"Share SDK Link Desc"
                                images:@"http://ww4.sinaimg.cn/bmiddle/005Q8xv4gw1evlkov50xuj30go0a6mz3.jpg"
                                   url:[NSURL URLWithString:@"http://sharesdk.mob.com/"]
                                 title:@"Share SDK"
                                  type:SSDKContentTypeWebPage];
    [self _shareParams:params];
}

- (void)_shareImages
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"];
    NSString *path2 = [[NSBundle mainBundle] pathForResource:@"D11" ofType:@"jpg"];
    NSString *path3 = [[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"];
    NSString *path4 = [[NSBundle mainBundle] pathForResource:@"shareImg" ofType:@"png"];
    
    //通用参数设置
    [params SSDKSetupShareParamsByText:nil
                                images:@[path1,path2,path3,path4]
                                   url:nil
                                 title:nil
                                  type:SSDKContentTypeFBMessageImages];
    [self _shareParams:params];
}

- (void)_shareAssetVideo
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"];
    NSURL *url = [NSURL URLWithString:path];
    ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
    __weak typeof(self)weakSelf = self;
    [assetsLibrary writeVideoAtPathToSavedPhotosAlbum:url completionBlock:^(NSURL *assetURL, NSError *error) {
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        //通用参数设置
        [params SSDKSetupShareParamsByText:nil
                                    images:nil
                                       url:assetURL
                                     title:nil
                                      type:SSDKContentTypeFBMessageVideo];
        [weakSelf _shareParams:params];
    }];
}

- (void)_shareParams:(NSMutableDictionary *)params
{
    [ShareSDK shareWithParameters:params platformType:SSDKPlatformTypeFacebookMessenger stateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
        
        switch (state)
        {
            case SSDKResponseStateSuccess:
                NSLog(@"FacebookMessenger Share-------------------------->Success!:\n userData:%@ \n contentEntity:%@",userData,contentEntity);
                break;
            case SSDKResponseStateCancel:
                NSLog(@"FacebookMessenger Share-------------------------->Cancel!");
                break;
            case SSDKResponseStateFail:
                NSLog(@"FacebookMessenger Share-------------------------->Failed:%@",error);
                break;
                
            default:
                break;
        }
    }];
}

@end
