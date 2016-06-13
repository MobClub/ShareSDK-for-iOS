//
//  CustomUIViewController.m
//  ShareSDKDemo
//
//  Created by 刘靖煌 on 15/10/24.
//  Copyright © 2015年 mob.com. All rights reserved.
//

#import "CustomizeViewController.h"

//ShareSDK头文件
#import <ShareSDK/ShareSDK.h>

//自定义分享编辑页面需要
#import <ShareSDK/ISSShareViewDelegate.h>

//调用开放平台接口需要
#import <SinaWeiboConnection/ISSSinaWeiboApp.h>

@interface CustomizeViewController ()<ISSShareViewDelegate>

@end

@implementation CustomizeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //添加测试按钮
    [self addButtonWithName:NSLocalizedString(@"CustomizeShareEditView", nil) action:@selector(customizeShareEditView:) index:0];
    [self addButtonWithName:NSLocalizedString(@"CallOpenAPI", nil) action:@selector(callOpenAPI:) index:1];
}

- (void)addButtonWithName:(NSString *)buttonName action:(SEL)action index:(NSInteger)index
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:buttonName forState:UIControlStateNormal];
    [btn sizeToFit];
    btn.frame = CGRectMake(self.view.frame.size.width/2 - 150 , 50 + index * 50, 300, 40);
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)customizeShareEditView:(id)sender
{
    id<ISSContent> publishContent = [ShareSDK content:@"Share Content"
                                       defaultContent:@"Default Content"
                                                image:[ShareSDK imageWithUrl:@"http://www.mob.com/mob/images/index/sharesdk1.png"]
                                                title:@"title"
                                                  url:@"http://www.mob.com"
                                          description:@"This is a message used for test."
                                            mediaType:SSPublishContentMediaTypeNews];
    
    id<ISSShareOptions> shareOptions = [ShareSDK defaultShareOptionsWithTitle:@"Title"
                                                              oneKeyShareList:[ShareSDK getShareListWithType:ShareTypeSinaWeibo, nil]
                                                               qqButtonHidden:YES
                                                        wxSessionButtonHidden:YES
                                                       wxTimelineButtonHidden:YES
                                                         showKeyboardOnAppear:NO
                                                            shareViewDelegate:self                                                          friendsViewDelegate:nil
                                                        picViewerViewDelegate:nil];
    //显示分享菜单
    [ShareSDK showShareViewWithType:ShareTypeSinaWeibo
                          container:nil
                            content:publishContent
                      statusBarTips:YES
                        authOptions:nil
                       shareOptions:shareOptions
                             result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end)
     {
         if (state == SSPublishContentStateSuccess)
         {
             NSLog(@"Success");
         }
         else if (state == SSPublishContentStateFail)
         {
             NSLog(@"Failed,error code == %zi, error code == %@", [error errorCode], [error errorDescription]);
         }
     }];
}

- (void)viewOnWillDisplay:(UIViewController *)viewController shareType:(ShareType)shareType
{
    //修改导航栏背景颜色、图片
//    viewController.navigationController.navigationBar.barTintColor = [UIColor blueColor];
//    [viewController.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"ShareButtonBG.png"] forBarMetrics:UIBarMetricsDefault];
    
    //修改左右按钮的文字颜色
    UIBarButtonItem *leftBtn = viewController.navigationItem.leftBarButtonItem;
    UIBarButtonItem *rightBtn = viewController.navigationItem.rightBarButtonItem;
    [leftBtn setTintColor:[UIColor yellowColor]];
    [rightBtn setTintColor:[UIColor yellowColor]];
    
    //修改标题颜色和文字
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor blueColor];
    label.text = viewController.title;
    label.text = @"测试";
    label.font = [UIFont boldSystemFontOfSize:18];
    [label sizeToFit];
    viewController.navigationItem.titleView = label;
    
    //修改左右按钮的背景
    UIBarButtonItem *leftBtn1 = viewController.navigationItem.leftBarButtonItem;
    UIBarButtonItem *rightBtn1 = viewController.navigationItem.rightBarButtonItem;
    [leftBtn1 setBackgroundImage:[UIImage imageNamed:@"ShareButtonBG.png"]  forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [rightBtn1 setBackgroundImage:[UIImage imageNamed:@"ShareButtonBG.png"]  forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
}

- (void)callOpenAPI:(id)sender
{
    if ([ShareSDK hasAuthorizedWithType:ShareTypeSinaWeibo])
    {
        [self callOpenAPIAfterAuthorize];
    }
    else
    {
        [ShareSDK authWithType:ShareTypeSinaWeibo
                       options:nil
                        result:^(SSAuthState state, id<ICMErrorInfo> error) {
                        
                            if (state == SSAuthStateSuccess)
                            {
                                [self callOpenAPIAfterAuthorize];
                            }
                            else
                            {
                                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Failed"
                                                                                    message:[NSString stringWithFormat:
                                                                                             @"Error Code：%zi, Error Description:%@",[error errorCode],[error errorDescription]]
                                                                                   delegate:nil
                                                                          cancelButtonTitle:@"OK"
                                                                          otherButtonTitles:nil];
                                [alertView show];
                            }
                        }];
    }
}

- (void)callOpenAPIAfterAuthorize
{
    //1、先通过getClientWithType获取对应平台的App对象
    id<ISSSinaWeiboApp> app = (id<ISSSinaWeiboApp>)[ShareSDK getClientWithType:ShareTypeSinaWeibo];
    
    //2、构造参数
    id<ISSCParameters> params = [ShareSDKCoreService parameters];
    [params addParameter:@"id" value:@"3481474642286341"];
    
    //3、调用接口：当需要非ShareSDK提供支持的接口（即除授权、分享、获取用户信息、好友列表、添加好友）时,可以使用这个接口
    //首先需要取得API的调用地址，以及需要提交的请求的方式。以新浪微博为例，假如要获取用户微博列表，则需要先到http://open.weibo.com/wiki/2/statuses/user_timeline中查看该接口的地址以及其他信息。
    //注意：微博开放平台这个接口要返回数据，要先使用授权接口成功授权后才能返回有效数据。
    [app api:@"https://api.weibo.com/2/favorites.json"
      method:SSCallAPIRequestMethodGet
      params:params
        user:nil
      result:^(id responder)
     {
         NSLog(@"===== responder : %@",responder);
         UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Success"
                                                             message:[NSString stringWithFormat:@"%@",responder]
                                                            delegate:nil
                                                   cancelButtonTitle:@"OK"
                                                   otherButtonTitles:nil];
         [alertView show];
         
     }
       fault:^(CMErrorInfo *error)
     {
         UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Failed"
                                                             message:[NSString stringWithFormat:
                                                                      @"Error Code：%zi, Error Description:%@",[error errorCode],[error errorDescription]]
                                                            delegate:nil
                                                   cancelButtonTitle:@"OK"
                                                   otherButtonTitles:nil];
         [alertView show];
     }];
}

@end
