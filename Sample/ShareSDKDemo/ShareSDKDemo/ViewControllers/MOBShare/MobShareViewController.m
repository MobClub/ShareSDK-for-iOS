//
//  MobShareViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 2017/5/11.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MobShareViewController.h"
#import <ShareSDK/ShareSDK+Base.h>
#import <ShareSDKUI/ShareSDKUI.h>
#import <ShareSDKExtension/SSEShareHelper.h>
#import "AppDelegate.h"
#import "MobScreenshotCenter.h"

#import "MOBLoadingViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
//#import <ShareSDK/SSDKVideoUploadCenter.h>
#import <ShareSDKUI/SSUIShareActionSheetStyle.h>

#import "MOBShareSDKHelper.h"

#import "MOBRollLabel.h"
#import "MOBAboutLinkCardViewController.h"
#import "MOBAboutMobLinkViewController.h"

@interface MobShareViewController ()
{
    IBOutlet UITableView *myTableView;
    NSArray *_platforemArray;
    NSArray *_overseasPlatforemArray;
    NSArray *_systemPlatforemArray;
    NSBundle *_uiBundle;
    NSBundle *_enBundle;
    NSArray *_titleArray;
    IBOutlet UITableViewCell *topCell;
    BOOL onShakeShare;
    IBOutlet UIView *shakeShareView;
    BOOL isAnimate;
    IBOutlet UIButton *menuButton;
    //视频分享菜单
    MOBLoadingViewController *loadingViewController;
    //    SSDKHttpServiceModel *httpServiceModel;
    IBOutlet UIView *noticeView;
    MOBRollLabel *_rollLabel;
}

@end

@implementation MobShareViewController

static const NSInteger otherInfo = 1;



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    loadingViewController = [[MOBLoadingViewController alloc] initWithNibName:@"MOBLoadingViewController" bundle:nil];
    loadingViewController.view.frame = [UIScreen mainScreen].bounds;
    
    _platforemArray = @[
                        @(SSDKPlatformTypeOasis),
                        @(SSDKPlatformTypeDouyin),
                        @(SSDKPlatformSubTypeQQFriend),
                        @(SSDKPlatformSubTypeQZone),
                        @(SSDKPlatformSubTypeWechatSession),
                        @(SSDKPlatformSubTypeWechatTimeline),
                        @(SSDKPlatformSubTypeWechatFav),
                        @(SSDKPlatformTypeSinaWeibo),
                        @(SSDKPlatformTypeAliSocial),
                        @(SSDKPlatformTypeAliSocialTimeline),
                        @(SSDKPlatformTypeDingTalk),
                        @(SSDKPlatformTypeTencentWeibo),
                        @(SSDKPlatformTypeDouBan),
                        @(SSDKPlatformTypeMeiPai),
                        @(SSDKPlatformTypeYinXiang),
                        @(SSDKPlatformTypeYouDaoNote),
                        @(SSDKPlatformTypeMingDao),
                        @(SSDKPlatformTypeKaixin),
                        @(SSDKPlatformTypeRenren),
                        @(SSDKPlatformSubTypeYiXinSession),
                        @(SSDKPlatformSubTypeYiXinTimeline),
                        @(SSDKPlatformSubTypeYiXinFav),
                        @(SSDKPlatformTypeWework),
                        ];
    _overseasPlatforemArray = @[
                                @(SSDKPlatformTypeFacebook),
                                @(SSDKPlatformTypeFacebookMessenger),
                                @(SSDKPlatformTypeTwitter),
                                @(SSDKPlatformTypeWhatsApp),
                                @(SSDKPlatformTypeLine),
                                @(SSDKPlatformTypeGooglePlus),
                                @(SSDKPlatformSubTypeKakaoTalk),
                                @(SSDKPlatformSubTypeKakaoStory),
                                @(SSDKPlatformTypeYouTube),
                                @(SSDKPlatformTypeInstagram),
                                @(SSDKPlatformTypeFlickr),
                                @(SSDKPlatformTypeDropbox),
                                @(SSDKPlatformTypeEvernote),
                                @(SSDKPlatformTypePinterest),
                                @(SSDKPlatformTypePocket),
                                @(SSDKPlatformTypeLinkedIn),
                                @(SSDKPlatformTypeVKontakte),
                                @(SSDKPlatformTypeInstapaper),
                                @(SSDKPlatformTypeTumblr),
                                @(SSDKPlatformTypeTelegram),
                                @(SSDKPlatformTypeReddit)
                                ];
    _systemPlatforemArray = @[
                              @(SSDKPlatformTypeSMS),
                              @(SSDKPlatformTypeMail),
                              @(SSDKPlatformTypeCopy),
                              @(SSDKPlatformTypePrint)
                              ];
    _titleArray = @[@"  分享演示",@"  国内平台",@"  海外平台",@"  系统平台"];
    
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"ShareSDKUI" ofType:@"bundle"];
    _uiBundle = [NSBundle bundleWithPath:bundlePath];
    
    NSString *path = [_uiBundle pathForResource:@"en" ofType:@"lproj"];
    _enBundle = [NSBundle bundleWithPath:path];
    onShakeShare = NO;
    shakeShareView.layer.masksToBounds = YES;
    shakeShareView.layer.cornerRadius = 15;
    
    
    _rollLabel = [[MOBRollLabel alloc] initWithFrame:CGRectMake(35, 0,   [UIScreen mainScreen].bounds.size.width - 35, 35) font:[UIFont systemFontOfSize:15] textColor:[UIColor colorWithRed:244.0/255.0 green:103.0/255.0 blue:2.0/255.0 alpha:1]];
    _rollLabel.backgroundColor = [UIColor clearColor];
    _rollLabel.text = @"好消息：闭环分享重磅上线！一键实现闭环分享！错过它，就错过了全世界~  ";
    _rollLabel.rollSpeed = 0.2;
    [noticeView addSubview:_rollLabel];
    [noticeView sendSubviewToBack:_rollLabel];
}



- (IBAction)buttonNotice:(UIButton *)sender
{
    MOBAboutMobLinkViewController *aboutMobLinkCardVC = [MOBAboutMobLinkViewController new];
    
    UINavigationController *navigationController = (UINavigationController *)self.view.window.rootViewController;
    [navigationController pushViewController:aboutMobLinkCardVC animated:YES];
}

- (IBAction)buttonAct:(UIButton *)sender
{
    if(sender.tag == 0)//分享菜单
    {
        [self shareMenu];
    }
    else if(sender.tag == 1)//截图分享
    {
        //调用截屏分享
        [[MobScreenshotCenter shareInstance] screenCaptureShareWithMode:SSEScreenCaptureUIModeAlert
                                                               duration:3.0
                                                         useClientShare:YES];
    }
    else if(sender.tag == 2)//摇一摇分享
    {
        [self shakeShare];
    }
}

#pragma mark - 摇一摇分享
//摇一摇分享
- (void)shakeShare
{
    if(!isAnimate)
    {
        [self showPrompt];
    }
    if(!onShakeShare)
    {
        onShakeShare = YES;
        [SSEShareHelper beginShakeShare:nil
                              onEndSake:nil
                     onWillShareHandler:^(SSEShareHandler shareHandler) {
                         //调用截屏分享
                         [[MobScreenshotCenter shareInstance] screenCaptureShareWithMode:SSEScreenCaptureUIModeAlert
                                                                                duration:3.0
                                                                          useClientShare:YES];
                     }
                         onStateChanged:nil];
    }
    
//    也可以 使用 摇一摇后马上分享
//        [SSEShareHelper beginShakeShare:nil
//                              onEndSake:nil
//                     onWillShareHandler:^(SSEShareHandler shareHandler){
//                         NSLog(@"======开始分享");
//                         //构造分享参数
//                         NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
//                         NSArray* imageArray = @[[UIImage imageNamed:@"shareImg.png"]];
//                         if (imageArray)
//                         {
//                             [shareParams SSDKSetupShareParamsByText:@"摇着摇着就可以分享出去了，使用ShareSDK分享就是便捷方便。 http://www.mob.com/"
//                                                              images:imageArray
//                                                                 url:nil
//                                                               title:nil
//                                                                type:SSDKContentTypeImage];
//                             //回调分享
//                             if (shareHandler)
//                             {
//                                 shareHandler (SSDKPlatformTypeSinaWeibo, shareParams);
//                             }
//                         }
//                     }
//                     onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
//                         switch (state)
//                         {
//                             case SSDKResponseStateSuccess:
//                             {
//
//                             UIAlertControllerAlertCreate(@"分享成功", nil)
//                                 .addCancelAction(@"确定", 0)
//                                 .showFromViewController(self);
//                                 break;
//                             }
//                             case SSDKResponseStateFail:
//                             {
//                            UIAlertControllerAlertCreate(@"分享失败", [NSString stringWithFormat:@"%@",error])
//                                 .addCancelAction(@"确定", 0)
//                                 .showFromViewController(self);
//                                 break;
//                             }
//                             case SSDKResponseStateCancel:
//                             {
//                             UIAlertControllerAlertCreate(@"分享已取消", nil)
//                                 .addCancelAction(@"确定", 0)
//                                 .showFromViewController(self);
//                                 break;
//                             }
//                             default:
//                                 break;
//                         }
//                     }];
}

- (void)showPrompt
{
    isAnimate = YES;
    
    UIWindow *window = self.view.window;
    [window addSubview:shakeShareView];
    shakeShareView.center = window.center;
    shakeShareView.alpha = 0;
    [UIView animateWithDuration:0.15 animations:^{
        shakeShareView.alpha = 1;
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:0.15
                              delay:1
                            options:UIViewAnimationOptionTransitionNone
                         animations:^{
                             shakeShareView.alpha = 0;
                         }
                         completion:^(BOOL finished) {
                             [shakeShareView removeFromSuperview];
                             isAnimate = NO;
                         }];
    }];
}

#pragma mark - 菜单分享
- (void)shareMenu
{
    NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
    NSArray* imageArray = @[[[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"]];
    [shareParams SSDKSetupShareParamsByText:@"分享内容"
                                     images:imageArray
                                        url:[NSURL URLWithString:@"https://www.mob.com"]
                                      title:@"分享标题"
                                       type:SSDKContentTypeAuto];
    
//    []
    
    SSUIPlatformItem *item_1 = [[SSUIPlatformItem alloc] init];
    item_1.platformName = @"item_1";
    item_1.iconNormal = [UIImage imageNamed:@"COD13.jpg"];
    item_1.iconSimple = [UIImage imageNamed:@"D11.jpg"];
    item_1.platformId = @"123456789";
    [item_1 addTarget:self action:@selector(test_1:)];
    
    NSArray *items = nil;
//        items = @[
//                  @(SSDKPlatformTypeQQ),
//                  @(SSDKPlatformTypeWechat),
//                  item_1,
//                  @(SSDKPlatformTypeSinaWeibo),
//                  @(SSDKPlatformTypeSMS),
//                  @(SSDKPlatformTypeMail),
//                  @(SSDKPlatformTypeCopy)
//                  ];
    SSUIShareSheetConfiguration *config = [[SSUIShareSheetConfiguration alloc] init];
    config.style = SSUIActionSheetStyleSimple;
//    config.menuBackgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.5];
    [ShareSDK showShareActionSheet:menuButton
                       customItems:items
                       shareParams:shareParams
                sheetConfiguration:config
                    onStateChanged:^(SSDKResponseState state,
                                     SSDKPlatformType platformType,
                                     NSDictionary *userData,
                                     SSDKContentEntity *contentEntity,
                                     NSError *error,
                                     BOOL end)
     {
         
         switch (state) {
             
             case SSDKResponseStateBegin:
             {
                 //设置UI等操作
                 break;
             }
             case SSDKResponseStateSuccess:
             {
                 //Instagram、Line等平台捕获不到分享成功或失败的状态，最合适的方式就是对这些平台区别对待
                 if (platformType == SSDKPlatformTypeInstagram)
                 {
                     break;
                 }
                 UIAlertControllerAlertCreate(@"分享成功", nil)
                 .addCancelAction(@"确定", 0)
                 .showFromViewController(self.view.window.rootViewController);
                 break;
             }
             case SSDKResponseStateFail:
             {
                 NSLog(@"%@",error);
                 UIAlertControllerAlertCreate(@"分享失败", [NSString stringWithFormat:@"%@",error])
                 .addCancelAction(@"OK", 0)
                 .showFromViewController(self.view.window.rootViewController);
                 break;
             }
             case SSDKResponseStateCancel:
             {
                 UIAlertControllerAlertCreate(@"分享已取消", nil)
                 .addCancelAction(@"确定", 0)
                 .showFromViewController(self.view.window.rootViewController);
                 break;
             }
             default:
             break;
         }
     }];
}

- (void)test_1:(SSUIPlatformItem *)item
{
    
    
    NSLog(@"costom item click , id :%@",item.platformId);
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
        return 1;
        case 1:
        return _platforemArray.count;
        case 2:
        return _overseasPlatforemArray.count;
        case 3:
        return _systemPlatforemArray.count;
        case 4:
        return otherInfo;
        default:
        return  0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0)
    {
        return topCell;
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseCell"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuseCell"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    if(indexPath.section == 4)
    {
        cell.textLabel.text = @"其他";
        cell.imageView.image = nil;
        return cell;
    }
    id obj = nil;
    switch (indexPath.section) {
        case 1:
        obj = _platforemArray[indexPath.row];
        break;
        case 2:
        obj = _overseasPlatforemArray[indexPath.row];
        break;
        case 3:
        obj = _systemPlatforemArray[indexPath.row];
        break;
    }
    if([obj isKindOfClass:[NSString class]])
    {
        NSString *title = obj;
        cell.textLabel.text = title;
        cell.imageView.image = nil;
        cell.textLabel.textAlignment = NSTextAlignmentLeft;
    }
    else if([obj isKindOfClass:[NSNumber class]])
    {
        //title
        NSInteger platformType = [obj integerValue];
        NSString *platformTypeName = [NSString stringWithFormat:@"ShareType_%zi",platformType];
        cell.textLabel.text = NSLocalizedStringWithDefaultValue(platformTypeName, @"ShareSDKUI_Localizable", _uiBundle, platformTypeName, nil);
        //icon
        NSString *iconImageName = [NSString stringWithFormat:@"Icon_simple/sns_icon_%ld.png",(long)platformType];
        UIImage *icon = [UIImage imageWithContentsOfFile:[_uiBundle pathForResource:(iconImageName) ofType:nil]];
        cell.imageView.image = icon;
        cell.textLabel.textAlignment = NSTextAlignmentLeft;
    }
    return cell;
}


- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section < _titleArray.count)
    {
        return _titleArray[section];
    }
    return nil;
}


#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0)
    {
        return 100;
    }
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.section == 0)
    {
        return;
    }
    if(indexPath.section == 4)
    {
        Class viewControllerClass = NSClassFromString(@"MOBMoreShareViewController");
        if (viewControllerClass)
        {
            UIViewController *viewController = [[viewControllerClass alloc] init];
           
            UINavigationController *navigationController = (UINavigationController *)self.view.window.rootViewController;
            [navigationController pushViewController:viewController animated:YES];
        }
        return;
    }
    id obj = nil;
    switch (indexPath.section) {
        case 1:
        obj = _platforemArray[indexPath.row];
        break;
        case 2:
        obj = _overseasPlatforemArray[indexPath.row];
        break;
        case 3:
        obj = _systemPlatforemArray[indexPath.row];
        break;
    }
    NSInteger platformType = [obj integerValue];
    NSString *platformTypeName = [NSString stringWithFormat:@"ShareType_%zi",platformType];
    NSString *platformName = NSLocalizedStringWithDefaultValue(platformTypeName, @"ShareSDKUI_Localizable", _enBundle, platformTypeName, nil);
    platformName = [platformName stringByReplacingOccurrencesOfString:@" " withString:@""];
    platformName = [platformName stringByReplacingOccurrencesOfString:@"+" withString:@""];
    NSString *viewControllerName = [NSString stringWithFormat:@"MOB%@ViewController",platformName];
    NSLog(@"move to %@",viewControllerName);
    Class viewControllerClass = NSClassFromString(viewControllerName);
    if (viewControllerClass)
    {
        UIViewController *viewController = [[viewControllerClass alloc] init];
        UINavigationController *navigationController = (UINavigationController *)self.view.window.rootViewController;
        [navigationController pushViewController:viewController animated:YES];
    }
}


#pragma mark - 分享菜单 视频
/**
 分享菜单 视频
 */
- (void)shareMenuVideo
{
    
    //设置显示平台 不支持视频分享的 新浪微博 不加入 朋友圈官方暂不支持视频分享 qq好友不支持分享视频
    
    //Facebook 相册视频 客户端分享 , 本地视频 使用应用内分享
    //FacebookMessager 支持 本地视频 和 相册视频 客户端分享
    //Instagram 支持 本地视频 和 相册视频 客户端分享
    //Twitter 支持 本地视频 应用内分享
    //YouTube 支持 本地视频 应用内分享
    //QZone 只支持相册视频 客户端分享
    //微信好友&收藏 只支持本地文件 客户端分享
    //美拍 支持 本地视频 和 相册视频 客户端分享
    NSArray *items = @[
                       @(SSDKPlatformTypeFacebook),
                       @(SSDKPlatformTypeFacebookMessenger),
                       @(SSDKPlatformTypeInstagram),
                       @(SSDKPlatformTypeTwitter),
                       @(SSDKPlatformTypeYouTube),
                       @(SSDKPlatformSubTypeQZone),
                       @(SSDKPlatformSubTypeWechatSession),
                       @(SSDKPlatformSubTypeWechatFav),
                       @(SSDKPlatformTypeMeiPai),
                       ];
    
    NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp4"];
    [shareParams SSDKSetupShareParamsByText:@"Share SDK"
                                     images:nil
                                        url:[NSURL fileURLWithPath:filePath]
                                      title:nil
                                       type:SSDKContentTypeVideo];
    //设置微信好友的视频分享
    [shareParams SSDKSetupWeChatParamsByText:@"share SDK"
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
                          forPlatformSubType:SSDKPlatformSubTypeWechatSession];
    //设置微信收藏的视频分享
    [shareParams SSDKSetupWeChatParamsByText:@"share SDK"
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
                          forPlatformSubType:SSDKPlatformSubTypeWechatFav];
    //设置保存视频并获取相册地址 并设置QQ视频分享
    NSURL *url = [NSURL URLWithString:filePath];
    ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
    __weak __typeof__ (self) weakSelf = self;
    [assetsLibrary writeVideoAtPathToSavedPhotosAlbum:url completionBlock:^(NSURL *assetURL, NSError *error) {
        [shareParams SSDKSetupQQParamsByText:nil
                                       title:nil
                                         url:assetURL
                               audioFlashURL:nil
                               videoFlashURL:nil
                                  thumbImage:nil
                                      images:nil
                                        type:SSDKContentTypeVideo
                          forPlatformSubType:SSDKPlatformSubTypeQZone];
        [weakSelf shareWithParameters:shareParams items:items filePath:filePath];
    }];
}

- (void)shareWithParameters:(NSMutableDictionary *)shareParams items:(NSArray *)items filePath:(NSString *)filePath
{
    __weak __typeof__ (self) weakSelf = self;
    loadingViewController.session = [ShareSDK showShareActionSheet:menuButton
                                                             items:items
                                                       shareParams:shareParams
                                               onShareStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end) {
                                                   
                                                   switch (state) {
                                                       
                                                       case SSDKResponseStateUpload:
                                                       {
                                                           SSDKUploadState state = [userData[@"progressInfo"][@"state"] integerValue];
                                                           
                                                           switch (state)
                                                           {
                                                               case SSDKUploadStateBegin:
                                                               [weakSelf showLoading];
                                                               break;
                                                               
                                                               case SSDKUploadStateUploading:
                                                               {
                                                                   unsigned long long totalBytes = [userData[@"progressInfo"][@"totalBytes"] unsignedLongLongValue];
                                                                   unsigned long long loadedBytes = [userData[@"progressInfo"][@"loadedBytes"] unsignedLongLongValue];
                                                                   
                                                                   CGFloat temp =  loadedBytes*1.0/totalBytes;
                                                                   
                                                                   if(temp > loadingViewController.progressView.progress )
                                                                   {
                                                                       [loadingViewController.progressView setProgress:temp animated:YES];
                                                                   }
                                                               }
                                                               break;
                                                               
                                                               case SSDKUploadStateFinish:
                                                               {
                                                                   [loadingViewController.progressView setProgress:1 animated:YES];
                                                                   [loadingViewController hidden];
                                                               }
                                                               break;
                                                               
                                                               default:
                                                               break;
                                                           }
                                                           break;
                                                       }
                                                       case SSDKResponseStateSuccess:
                                                       {
                                                           //Instagram、FacebookMessage等平台捕获不到分享成功或失败的状态，最合适的方式就是对这些平台区别对待
                                                           if (platformType == SSDKPlatformTypeInstagram || platformType == SSDKPlatformTypeFacebookMessenger)
                                                           {
                                                               break;
                                                           }
                                                           UIAlertControllerAlertCreate(@"分享成功", nil)
                                                           .addCancelAction(@"确定", 0)
                                                           .showFromViewController(self);
                                                             break;
                                                       }
                                                       case SSDKResponseStateFail:
                                                       {
                                                           
                                                           UIAlertControllerAlertCreate(@"分享失败", [NSString stringWithFormat:@"%@",error])
                                                           .addCancelAction(@"OK", 0)
                                                           .showFromViewController(self);
                                                           break;
                                                       }
                                                       case SSDKResponseStateCancel:
                                                       {
                                                           UIAlertControllerAlertCreate(@"分享已取消", nil)
                                                           .addCancelAction(@"确定", 0)
                                                           .showFromViewController(self);
                                                           break;
                                                       }
                                                       default:
                                                       break;
                                                   }
                                                   
                                                   if(state != SSDKResponseStateUpload)
                                                   {
                                                       [loadingViewController hidden];
                                                   }
                                               }];
    //    //设置 点击就分享
    //    [sheet.directSharePlatforms addObject:@(SSDKPlatformTypeFacebook)];
    //    [sheet.directSharePlatforms addObject:@(SSDKPlatformTypeYouTube)];
    //    [sheet.directSharePlatforms addObject:@(SSDKPlatformTypeTwitter)];
}


/**
 进度UI
 */
-(void)showLoading
{

    //    loadingViewController.httpServiceModel = httpServiceModel;
    [self.navigationController.view addSubview:loadingViewController.view];
    loadingViewController.view.alpha = 0;
    [UIView animateWithDuration:0.25 animations:^{
        loadingViewController.view.alpha = 1;
    }];
}




@end
