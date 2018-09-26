//
//  WeChatViewController.m
//  ShareSDKDemo
//
//  Created by Max on 2018/6/8.
//  Copyright © 2018年 Max. All rights reserved.
//

#import "WeChatViewController.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDK/ShareSDK+Base.h>
#import <ShareSDK/SSDKWorkflow.h>

@interface WeChatViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    SSDKPlatformType _selectedSubPlatform;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation WeChatViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"子平台切换" style:UIBarButtonItemStylePlain target:self action:@selector(_switchSubPlatform)];
    [self _switchSubPlatform];
}

- (void)_switchSubPlatform
{
    NSArray *titles = @[@"微信好友",@"微信朋友圈",@"微信收藏"];
    
    static NSInteger i = 0;
    
    NSInteger index = i++ % 3;
    self.title = titles[index];
    
    switch (index)
    {
        case 0:
            _selectedSubPlatform = SSDKPlatformSubTypeWechatSession;
            break;
            
        case 1:
            _selectedSubPlatform = SSDKPlatformSubTypeWechatTimeline;
            break;
            
        case 2:
            _selectedSubPlatform = SSDKPlatformSubTypeWechatFav;
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
    
    return 9;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"12121"];
    
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
                cell.textLabel.text = @"音乐";
                break;
            case 4:
                cell.textLabel.text = @"视频";
                break;
            case 5:
                cell.textLabel.text = @"应用";
                break;
            case 6:
                cell.textLabel.text = @"表情";
                break;
            case 7:
                cell.textLabel.text = @"文件";
                break;
            case 8:
                cell.textLabel.text = @"小程序";
                break;
                
            default:
                break;
        }
        
    }
    
    return cell;
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
            [self _shareMusic];
            break;
        case 4:
            [self _shareVideo];
            break;
        case 5:
            [self _shareApp];
            break;
        case 6:
            [self _shareEmotiocon];
            break;
        case 7:
            [self _shareFile];
            break;
        case 8:
            [self _shareMiniProgram];
            break;
            
        default:
            break;
    }
}

- (void)_shareText
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    //通用参数设置
//    [params SSDKSetupShareParamsByText:@"Share SDK"
//                                images:nil
//                                   url:nil
//                                 title:nil
    //                                  type:SSDKContentTypeText];
    //平台定制
    [params SSDKSetupWeChatParamsByText:@"Share SDK"
                                  title:nil
                                    url:nil
                             thumbImage:nil
                                  image:nil
                           musicFileURL:nil
                                extInfo:nil
                               fileData:nil
                           emoticonData:nil
                    sourceFileExtension:nil
                         sourceFileData:nil
                                   type:SSDKContentTypeText
                     forPlatformSubType:_selectedSubPlatform];
    
    [self _shareParams:params];
}

- (void)_shareImage
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    //    [params SSDKSetupShareParamsByText:@"testText"
    //                                images:@[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1526463559502&di=f078ab4b4d8ebfb092c76a4bead1bd87&imgtype=0&src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201805%2F11%2F190556y96ja6qjal9l99ah.jpg"]
    //                                   url:[NSURL URLWithString:@"www.mob.com"]
    //                                 title:@"I love u"
    //                                  type:SSDKContentTypeImage];
    
    [params SSDKSetupWeChatParamsByText:@"https://www.baidu.com/"
                                  title:@"------------"
                                    url:nil
                             thumbImage:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                  image:@[@"http://fd.topitme.com/d/a8/1d/11315383988791da8do.jpg",@"http://fd.topitme.com/d/a8/1d/11315383988791da8do.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1526463559502&di=f078ab4b4d8ebfb092c76a4bead1bd87&imgtype=0&src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201805%2F11%2F190556y96ja6qjal9l99ah.jpg"]
                           musicFileURL:nil
                                extInfo:nil
                               fileData:nil
                           emoticonData:nil
                    sourceFileExtension:nil
                         sourceFileData:nil
                                   type:SSDKContentTypeImage
                     forPlatformSubType:_selectedSubPlatform];
    
    
    [self _shareParams:params];
}

- (void)_shareLink
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
//    [parameters SSDKSetupShareParamsByText:@"Share SDK Link Desc"
//                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
//                                       url:[NSURL URLWithString:@"https://www.mob.com"]
//                                     title:@"Share SDK"
//                                      type:SSDKContentTypeWebPage];
    //平台定制
            [parameters SSDKSetupWeChatParamsByText:@"Share SDK Link Desc"
                                              title:@"Share SDK"
                                                url:[NSURL URLWithString:@"https://www.mob.com"]
                                         thumbImage:nil
                                              image:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       musicFileURL:nil
                                            extInfo:nil
                                           fileData:nil
                                       emoticonData:nil
                                sourceFileExtension:nil
                                     sourceFileData:nil
                                               type:SSDKContentTypeWebPage
                                 forPlatformSubType:_selectedSubPlatform];
    
    [self _shareParams:parameters];
}

- (void)_shareMusic
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //网络音频
    //通用参数设置
//    [parameters SSDKSetupShareParamsByText:@"崔健"
//                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
//                                       url:[NSURL URLWithString:@"http://i.y.qq.com/v8/playsong.html?hostuin=0&songid=&songmid=002x5Jje3eUkXT&_wv=1&source=qq&appshare=iphone&media_mid=002x5Jje3eUkXT"]
//                                     title:@"一无所有"
//                                      type:SSDKContentTypeAudio];
    //平台定制
        [parameters SSDKSetupWeChatParamsByText:@"崔健"
                                          title:@"一无所有"
                                            url:[NSURL URLWithString:@"http://i.y.qq.com/v8/playsong.html?hostuin=0&songid=&songmid=002x5Jje3eUkXT&_wv=1&source=qq&appshare=iphone&media_mid=002x5Jje3eUkXT"]
                                     thumbImage:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                          image:nil
                                   musicFileURL:[NSURL URLWithString:@"http://i.y.qq.com/v8/playsong.html?hostuin=0&songid=&songmid=002x5Jje3eUkXT&_wv=1&source=qq&appshare=iphone&media_mid=002x5Jje3eUkXT"]
                                        extInfo:nil
                                       fileData:nil
                                   emoticonData:nil
                            sourceFileExtension:nil
                                 sourceFileData:nil
                                           type:SSDKContentTypeAudio
                             forPlatformSubType:_selectedSubPlatform];
    [self _shareParams:parameters];
}

- (void)_shareVideo
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //网络视频
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:@"视频"
                                    images:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                       url:[NSURL URLWithString:@"http://v.youku.com/v_show/id_XNTUxNDY1NDY4.html"]
                                     title:@"乔布斯"
                                      type:SSDKContentTypeVideo];
    //平台定制
            [parameters SSDKSetupWeChatParamsByText:@"视频"
                                              title:@"乔布斯"
                                                url:[NSURL URLWithString:@"http://v.youku.com/v_show/id_XNTUxNDY1NDY4.html"]
                                         thumbImage:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                              image:nil
                                       musicFileURL:nil
                                            extInfo:nil
                                           fileData:nil
                                       emoticonData:nil
                                sourceFileExtension:nil
                                     sourceFileData:nil
                                               type:SSDKContentTypeVideo
                                 forPlatformSubType:_selectedSubPlatform];
    [self _shareParams:parameters];
}

- (void)_shareApp
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //平台定制
    [parameters SSDKSetupWeChatParamsByText:@"share SDK"
                                      title:@"App消息"
                                        url:[NSURL URLWithString:@"http://www.mob.com"]
                                 thumbImage:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                      image:nil
                               musicFileURL:nil
                                    extInfo:nil
                                   fileData:[@"13232" dataUsingEncoding:NSUTF8StringEncoding]
                               emoticonData:nil
                        sourceFileExtension:nil
                             sourceFileData:nil
                                       type:SSDKContentTypeApp
                         forPlatformSubType:_selectedSubPlatform];
    [self _shareParams:parameters];
}

- (void)_shareEmotiocon
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //gif 或 普通格式图片
    //平台定制
    [parameters SSDKSetupWeChatParamsByText:nil
                                      title:nil
                                        url:nil
                                 thumbImage:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                      image:nil
                               musicFileURL:nil
                                    extInfo:nil
                                   fileData:nil
                               emoticonData:[[NSBundle mainBundle] pathForResource:@"res6" ofType:@"gif"]
                        sourceFileExtension:nil
                             sourceFileData:nil
                                       type:SSDKContentTypeImage
                         forPlatformSubType:_selectedSubPlatform];
    
    [self _shareParams:parameters];
}

- (void)_shareFile
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //平台定制
    [parameters SSDKSetupWeChatParamsByText:@"share SDK"
                                      title:@"file"
                                        url:nil
                                 thumbImage:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                      image:nil
                               musicFileURL:nil
                                    extInfo:nil
                                   fileData:nil
                               emoticonData:nil
                        sourceFileExtension:@"mp4"
                             sourceFileData:[[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"]
                                       type:SSDKContentTypeFile
                         forPlatformSubType:_selectedSubPlatform];
    
    [self _shareParams:parameters];
}

- (void)_shareMiniProgram
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    [parameters SSDKSetupWeChatMiniProgramShareParamsByTitle:@"MiniProgram"
                                                 description:@"test MiniProgram"
                                                  webpageUrl:[NSURL URLWithString:@"http://www.mob.com"]
                                                        path:@"pages/index/index"
                                                  thumbImage:[[NSBundle mainBundle] pathForResource:@"COD13" ofType:@"jpg"]
                                                hdThumbImage:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1522154322305&di=7f4bf3d0803fe8c2c66c140f0a6ea0b4&imgtype=0&src=http%3A%2F%2Fa4.topitme.com%2Fo%2F201007%2F29%2F12803876734174.jpg"
                                                    userName:@"gh_afb25ac019c9"
                                             withShareTicket:YES
                                             miniProgramType:0
                                          forPlatformSubType:_selectedSubPlatform];
    
    [self _shareParams:parameters];
}

- (void)_shareParams:(NSMutableDictionary *)params
{
    [ShareSDK shareWithParameters:params platformType:_selectedSubPlatform stateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
        SSDKAlertShareCallback;
    }];
}

- (void)_auth
{
    [ShareSDK authorize:SSDKPlatformTypeWechat settings:nil stateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
         SSDKAlertAuthCallback;
    }];
}

- (void)_getUserInfo
{    
    [SSDKWorkFlow setWechatRefreshAuthTokenOperation:^(NSString *uid, void (^getUserinfo)(NSString *token)) {
        getUserinfo(@"9876543210");
    }];
    
    [SSDKWorkFlow setWechatRequestAuthTokenOperation:^(NSString *authCode, void (^getUserinfo)(NSString *uid, NSString *token)) {
        getUserinfo(@"1234567890",@"1234567890");
    }];
    
//    SSDKUserQueryCondition *c = [[SSDKUserQueryCondition alloc] init];
//    c.uid = @"o3LILj1CkoP2HcyUoYIFieQ56Fr8";
//
    [ShareSDK getUserInfo:SSDKPlatformTypeWechat condition:nil stateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
        
        SSDKAlertAuthCallback;
    }];
}
@end
