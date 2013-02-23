//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:1955211608
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import "AGAppDelegate.h"
#import "AGViewController.h"
#import "AGAuthViewController.h"
#import "AGApiViewController.h"
#import "ShareSDKDemoMoreViewController.h"
#import "QQDemoViewController.h"
#import "RespViewController.h"
#import "AGWeiXinQQDemoController.h"
#import "AGLeftSideViewController.h"

@implementation AGAppDelegate

- (id)init
{
    if(self = [super init])
    {
        _scene = WXSceneSession;
    }
    return self;
}

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [WXApi registerApp:@"wx6dd7a9b94f3dd72a"];
    [QQApi registerPluginWithId:@"QQ075BCD15"];
    [ShareSDK registerApp:@"520520test"];
    
    //横屏设置
//    [ShareSDK setInterfaceOrientationMask:UIInterfaceOrientationMaskLandscape];
    
    //监听用户信息变更
    [ShareSDK addNotificationWithName:SSN_USER_INFO_UPDATE
                               target:self
                               action:@selector(userInfoUpdateHandler:)];
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];

    //主视图
    UIViewController *apiVC = [[[AGApiViewController alloc] init] autorelease];
    apiVC.title = @"接口";
    UINavigationController *navApiVC = [[[UINavigationController alloc] initWithRootViewController:apiVC] autorelease];
    
    //左视图
    AGLeftSideViewController *leftVC = [[[AGLeftSideViewController alloc] init] autorelease];
    
    IIViewDeckController *vc = [[[IIViewDeckController alloc] initWithCenterViewController:navApiVC leftViewController:leftVC] autorelease];
    vc.leftSize = self.window.width - (320 - 44.0);
    self.viewController = vc;
    
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)application:(UIApplication *)application willChangeStatusBarOrientation:(UIInterfaceOrientation)newStatusBarOrientation duration:(NSTimeInterval)duration
{
    if (UIInterfaceOrientationIsLandscape(newStatusBarOrientation))
    {
        self.viewController.leftSize = self.window.height - (320 - 44.0);
    }
    else
    {
        self.viewController.leftSize = self.window.width - (320 - 44.0);
    }
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return [ShareSDK handleOpenURL:url wxDelegate:self];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return  [ShareSDK handleOpenURL:url wxDelegate:self];
}

- (void)userInfoUpdateHandler:(NSNotification *)notif
{
    NSMutableArray *authList = [NSMutableArray arrayWithContentsOfFile:[NSString stringWithFormat:@"%@/authListCache.plist",NSTemporaryDirectory()]];
    if (authList == nil)
    {
        authList = [NSMutableArray array];
    }
    
    NSString *platName = nil;
    NSInteger plat = [[[notif userInfo] objectForKey:SSK_PLAT] integerValue];
    switch (plat)
    {
        case ShareTypeSinaWeibo:
            platName = @"新浪微博";
            break;
        case ShareType163Weibo:
            platName = @"网易微博";
            break;
        case ShareTypeDouBan:
            platName = @"豆瓣";
            break;
        case ShareTypeFacebook:
            platName = @"Facebook";
            break;
        case ShareTypeKaixin:
            platName = @"开心网";
            break;
        case ShareTypeQQSpace:
            platName = @"QQ空间";
            break;
        case ShareTypeRenren:
            platName = @"人人网";
            break;
        case ShareTypeSohuWeibo:
            platName = @"搜狐微博";
            break;
        case ShareTypeTencentWeibo:
            platName = @"腾讯微博";
            break;
        case ShareTypeTwitter:
            platName = @"Twitter";
            break;
        case ShareTypeInstapaper:
            platName = @"Instapaper";
            break;
        case ShareTypeYouDaoNote:
            platName = @"有道云笔记";
            break;
        default:
            platName = @"未知";
    }
    id<ISSUserInfo> userInfo = [[notif userInfo] objectForKey:SSK_USER_INFO];
    
    BOOL hasExists = NO;
    for (int i = 0; i < [authList count]; i++)
    {
        NSMutableDictionary *item = [authList objectAtIndex:i];
        ShareType type = [[item objectForKey:@"type"] integerValue];
        if (type == plat)
        {
            [item setObject:[userInfo nickname] forKey:@"username"];
            hasExists = YES;
            break;
        }
    }
    
    if (!hasExists)
    {
        NSDictionary *newItem = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                 platName,
                                 @"title",
                                 [NSNumber numberWithInteger:plat],
                                 @"type",
                                 [userInfo nickname],
                                 @"username",
                                 nil];
        [authList addObject:newItem];
    }
    
    [authList writeToFile:[NSString stringWithFormat:@"%@/authListCache.plist",NSTemporaryDirectory()] atomically:YES];
}

#pragma mark - WXApiDelegate

-(void) onReq:(BaseReq*)req
{
    
}

-(void) onResp:(BaseResp*)resp
{
    
}

@end
