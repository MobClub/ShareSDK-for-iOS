//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.mob.com
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import "AGCustomViewController.h"
#import "AGCustomShareViewController.h"
#import <AGCommon/UIDevice+Common.h>
#import <AGCommon/UIImage+Common.h>
#import <AGCommon/UINavigationBar+Common.h>
#import "IIViewDeckController.h"
#import "AGAppDelegate.h"
#import <AGCommon/NSString+Common.h>

@implementation AGCustomViewController

- (id)init
{
    self = [super init];
    if (self)
    {
        _appDelegate = (AGAppDelegate *)[UIApplication sharedApplication].delegate;
        
        // Custom initialization
        UIButton *leftBtn = [[[UIButton alloc] init] autorelease];
        [leftBtn setBackgroundImage:[UIImage imageNamed:@"Common/NavigationButtonBG.png" bundleName:BUNDLE_NAME]
                           forState:UIControlStateNormal];
        [leftBtn setImage:[UIImage imageNamed:@"LeftSideViewIcon.png"] forState:UIControlStateNormal];
        leftBtn.frame = CGRectMake(0.0, 0.0, 53.0, 30.0);
        [leftBtn addTarget:self action:@selector(leftButtonClickHandler:) forControlEvents:UIControlEventTouchUpInside];
        
        self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:leftBtn] autorelease];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([[UIDevice currentDevice].systemVersion versionStringCompare:@"7.0"] != NSOrderedAscending)
    {
        [self setExtendedLayoutIncludesOpaqueBars:NO];
        [self setEdgesForExtendedLayout:SSRectEdgeBottom | SSRectEdgeLeft | SSRectEdgeRight];
    }
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:NSLocalizedString(@"TEXT_CUSTOM_SHARE", @"自定义分享")
            forState:UIControlStateNormal];
    [button sizeToFit];
    button.frame = CGRectMake(5.0, 5.0, self.view.width - 10, 60);
    button.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [button addTarget:self action:@selector(buttonClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button2 setTitle:NSLocalizedString(@"TEXT_CUSTOM_SHARE_MENU", @"自定义菜单分享") forState:UIControlStateNormal];
    [button2 sizeToFit];
    button2.frame = CGRectMake(5.0, 70.0, self.view.width - 10, 60);
    button2.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [button2 addTarget:self action:@selector(button2ClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self layoutView:self.interfaceOrientation];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

-(BOOL)shouldAutorotate
{
        //iOS6下旋屏方法
        return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
        //iOS6下旋屏方法
        return SSInterfaceOrientationMaskAll;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self layoutView:toInterfaceOrientation];
}

- (void)layoutPortrait
{
    UIButton *btn = (UIButton *)self.navigationItem.leftBarButtonItem.customView;
    btn.frame = CGRectMake(btn.left, btn.top, 55.0, 32.0);
    [btn setBackgroundImage:[UIImage imageNamed:@"Common/NavigationButtonBG.png"
                                     bundleName:BUNDLE_NAME]
                   forState:UIControlStateNormal];
    
    if ([UIDevice currentDevice].isPad)
    {
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"iPadNavigationBarBG.png"]];
    }
    else
    {
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"iPhoneNavigationBarBG.png"]];
    }
}

- (void)layoutLandscape
{
    if (![UIDevice currentDevice].isPad)
    {
        //iPhone
        UIButton *btn = (UIButton *)self.navigationItem.leftBarButtonItem.customView;
        btn.frame = CGRectMake(btn.left, btn.top, 48.0, 24.0);
        [btn setBackgroundImage:[UIImage imageNamed:@"Common_Landscape/NavigationButtonBG.png"
                                         bundleName:BUNDLE_NAME]
                       forState:UIControlStateNormal];
        
        if ([[UIDevice currentDevice] isPhone5])
        {
            [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"iPhoneLandscapeNavigationBarBG-568h.png"]];
        }
        else
        {
            [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"iPhoneLandscapeNavigationBarBG.png"]];
        }
    }
    else
    {
        UIButton *btn = (UIButton *)self.navigationItem.leftBarButtonItem.customView;
        btn.frame = CGRectMake(btn.left, btn.top, 55.0, 32.0);
        [btn setBackgroundImage:[UIImage imageNamed:@"Common_Landscape/NavigationButtonBG.png"
                                         bundleName:BUNDLE_NAME]
                       forState:UIControlStateNormal];
        
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"iPadLandscapeNavigationBarBG.png"]];
    }
}

- (void)layoutView:(UIInterfaceOrientation)orientation
{
    if (UIInterfaceOrientationIsLandscape(orientation))
    {
        [self layoutLandscape];
    }
    else
    {
        [self layoutPortrait];
    }
}

- (void)buttonClickHandler:(id)sender
{
    AGCustomShareViewController *vc = [[[AGCustomShareViewController alloc] initWithImage:[UIImage imageNamed:@"sharesdk_img.jpg"]
                                                                                  content:CONTENT]
                                       autorelease];
    UINavigationController *naVC = [[[UINavigationController alloc] initWithRootViewController:vc] autorelease];
    
    if ([UIDevice currentDevice].isPad)
    {
        naVC.modalPresentationStyle = UIModalPresentationFormSheet;
    }
    
    [self presentModalViewController:naVC animated:YES];
}

- (void)button2ClickHandler:(id)sender
{
    UIImage *shareImage = [UIImage imageNamed:@"sharesdk_img.jpg"];
    id<ISSContent> publishContent = [ShareSDK content:CONTENT
                                       defaultContent:nil
                                                image:[ShareSDK jpegImageWithImage:shareImage quality:0.8]
                                                title:@"ShareSDK"
                                                  url:@"http://www.mob.com"
                                          description:NSLocalizedString(@"TEXT_TEST_MSG", @"这时一条测试信息")
                                            mediaType:SSPublishContentMediaTypeNews];
    
        //定制人人网分享
        [publishContent addRenRenUnitWithName:NSLocalizedString(@"TEXT_HELLO_RENREN", @"Hello 人人网")
                              description:INHERIT_VALUE
                                      url:INHERIT_VALUE
                                  message:INHERIT_VALUE
                                    image:INHERIT_VALUE
                                  caption:nil];
    
        //定制QQ空间分享
        [publishContent addQQSpaceUnitWithTitle:NSLocalizedString(@"TEXT_HELLO_QZONE", @"Hello QQ空间")
                                        url:INHERIT_VALUE
                                       site:nil
                                    fromUrl:nil
                                    comment:INHERIT_VALUE
                                    summary:INHERIT_VALUE
                                      image:INHERIT_VALUE
                                       type:INHERIT_VALUE
                                    playUrl:nil
                                       nswb:nil];
    
        //定制微信好友内容
        [publishContent addWeixinSessionUnitWithType:INHERIT_VALUE
                                         content:NSLocalizedString(@"TEXT_HELLO_WECHAT_SESSION", @"Hello 微信好友!")
                                           title:INHERIT_VALUE
                                             url:INHERIT_VALUE
                                           image:INHERIT_VALUE
                                    musicFileUrl:INHERIT_VALUE
                                         extInfo:nil
                                        fileData:nil
                                    emoticonData:nil];
    
        //定制微信朋友圈内容
        [publishContent addWeixinTimelineUnitWithType:[NSNumber numberWithInteger:SSPublishContentMediaTypeMusic]
                                          content:NSLocalizedString(@"TEXT_HELLO_WECHAT_TIMELINE", @"Hello 微信朋友圈!")
                                            title:INHERIT_VALUE
                                              url:@"http://y.qq.com/i/song.html#p=7B22736F6E675F4E616D65223A22E4BDA0E4B88DE698AFE79C9FE6ADA3E79A84E5BFABE4B990222C22736F6E675F5761704C69766555524C223A22687474703A2F2F74736D7573696332342E74632E71712E636F6D2F586B303051563558484A645574315070536F4B7458796931667443755A68646C2F316F5A4465637734356375386355672B474B304964794E6A3770633447524A574C48795333383D2F3634363232332E6D34613F7569643D32333230303738313038266469723D423226663D312663743D3026636869643D222C22736F6E675F5769666955524C223A22687474703A2F2F73747265616D31382E71716D757369632E71712E636F6D2F33303634363232332E6D7033222C226E657454797065223A2277696669222C22736F6E675F416C62756D223A22E5889BE980A0EFBC9AE5B08FE5B7A8E89B8B444E414C495645EFBC81E6BC94E594B1E4BC9AE5889BE7BAAAE5BD95E99FB3222C22736F6E675F4944223A3634363232332C22736F6E675F54797065223A312C22736F6E675F53696E676572223A22E4BA94E69C88E5A4A9222C22736F6E675F576170446F776E4C6F616455524C223A22687474703A2F2F74736D757369633132382E74632E71712E636F6D2F586C464E4D31354C5569396961495674593739786D436534456B5275696879366A702F674B65356E4D6E684178494C73484D6C6A307849634A454B394568572F4E3978464B316368316F37636848323568413D3D2F33303634363232332E6D70333F7569643D32333230303738313038266469723D423226663D302663743D3026636869643D2673747265616D5F706F733D38227D"
                                            image:INHERIT_VALUE
                                     musicFileUrl:@"http://mp3.mwap8.com/destdir/Music/2009/20090601/ZuiXuanMinZuFeng20090601119.mp3"
                                          extInfo:nil
                                         fileData:nil
                                     emoticonData:nil];
    
        //定制QQ分享内容
        [publishContent addQQUnitWithType:INHERIT_VALUE
                              content:@"Hello QQ!"
                                title:INHERIT_VALUE
                                  url:INHERIT_VALUE
                                image:INHERIT_VALUE];
    
        //定制邮件分享内容
        [publishContent addMailUnitWithSubject:INHERIT_VALUE
                                   content:@"<a href='http://sharesdk.cn'>Hello Mail</a>"
                                    isHTML:[NSNumber numberWithBool:YES]
                               attachments:INHERIT_VALUE
                                        to:nil
                                        cc:nil
                                       bcc:nil];
    
        //定制短信分享内容
        [publishContent addSMSUnitWithContent:@"Hello SMS!"];
    
        //定制有道云笔记分享内容
        [publishContent addYouDaoNoteUnitWithContent:INHERIT_VALUE
                                           title:NSLocalizedString(@"TEXT_SDK_SHARE", @"ShareSDK分享")
                                          author:@"ShareSDK"
                                          source:@"http://www.mob.com"
                                     attachments:INHERIT_VALUE];
    
    id clickHandler = ^{
        AGCustomShareViewController *vc = [[[AGCustomShareViewController alloc] initWithImage:shareImage content:CONTENT] autorelease];
        UINavigationController *naVC = [[[UINavigationController alloc] initWithRootViewController:vc] autorelease];
        
        if ([UIDevice currentDevice].isPad)
        {
            naVC.modalPresentationStyle = UIModalPresentationFormSheet;
        }
        
        [self presentModalViewController:naVC animated:YES];
    };
    
        //创建自定义分享列表
        NSArray *shareList = [ShareSDK customShareListWithType:
                          [ShareSDK shareActionSheetItemWithTitle:[ShareSDK getClientNameWithType:ShareTypeSinaWeibo]
                                                             icon:[ShareSDK getClientIconWithType:ShareTypeSinaWeibo]
                                                     clickHandler:clickHandler],
                          [ShareSDK shareActionSheetItemWithTitle:[ShareSDK getClientNameWithType:ShareTypeTencentWeibo]
                                                             icon:[ShareSDK getClientIconWithType:ShareTypeTencentWeibo]
                                                     clickHandler:clickHandler],
                          SHARE_TYPE_NUMBER(ShareTypeSMS),
                          SHARE_TYPE_NUMBER(ShareTypeQQSpace),
                          SHARE_TYPE_NUMBER(ShareTypeWeixiSession),
                          SHARE_TYPE_NUMBER(ShareTypeWeixiTimeline),
                          SHARE_TYPE_NUMBER(ShareTypeQQ),
                          [ShareSDK shareActionSheetItemWithTitle:[ShareSDK getClientNameWithType:ShareTypeFacebook]
                                                             icon:[ShareSDK getClientIconWithType:ShareTypeFacebook]
                                                     clickHandler:clickHandler],
                          [ShareSDK shareActionSheetItemWithTitle:[ShareSDK getClientNameWithType:ShareTypeTwitter]
                                                             icon:[ShareSDK getClientIconWithType:ShareTypeTwitter]
                                                     clickHandler:clickHandler],
                          SHARE_TYPE_NUMBER(ShareTypeGooglePlus),
                          [ShareSDK shareActionSheetItemWithTitle:[ShareSDK getClientNameWithType:ShareTypeRenren]
                                                             icon:[ShareSDK getClientIconWithType:ShareTypeRenren]
                                                     clickHandler:clickHandler],
                          [ShareSDK shareActionSheetItemWithTitle:[ShareSDK getClientNameWithType:ShareTypeKaixin]
                                                             icon:[ShareSDK getClientIconWithType:ShareTypeKaixin]
                                                     clickHandler:clickHandler],
                          SHARE_TYPE_NUMBER(ShareTypeMail),
                          SHARE_TYPE_NUMBER(ShareTypeAirPrint),
                          SHARE_TYPE_NUMBER(ShareTypeCopy),
//                          [ShareSDK shareActionSheetItemWithTitle:[ShareSDK getClientNameWithType:ShareTypeSohuWeibo]
//                                                             icon:[ShareSDK getClientIconWithType:ShareTypeSohuWeibo]
//                                                     clickHandler:clickHandler],
//                          [ShareSDK shareActionSheetItemWithTitle:[ShareSDK getClientNameWithType:ShareType163Weibo]
//                                                             icon:[ShareSDK getClientIconWithType:ShareType163Weibo]
//                                                     clickHandler:clickHandler],
                          [ShareSDK shareActionSheetItemWithTitle:[ShareSDK getClientNameWithType:ShareTypeDouBan]
                                                             icon:[ShareSDK getClientIconWithType:ShareTypeDouBan]
                                                     clickHandler:clickHandler],
                          [ShareSDK shareActionSheetItemWithTitle:[ShareSDK getClientNameWithType:ShareTypeInstapaper]
                                                             icon:[ShareSDK getClientIconWithType:ShareTypeInstapaper]
                                                     clickHandler:clickHandler],
                          [ShareSDK shareActionSheetItemWithTitle:[ShareSDK getClientNameWithType:ShareTypeYouDaoNote]
                                                             icon:[ShareSDK getClientIconWithType:ShareTypeYouDaoNote]
                                                     clickHandler:clickHandler],
                          [ShareSDK shareActionSheetItemWithTitle:[ShareSDK getClientNameWithType:ShareTypeSohuKan]
                                                             icon:[ShareSDK getClientIconWithType:ShareTypeSohuKan]
                                                     clickHandler:clickHandler],
                          nil];
    
        //创建容器
        id<ISSContainer> container = [ShareSDK container];
    [container setIPadContainerWithView:sender arrowDirect:UIPopoverArrowDirectionUp];
    
    id<ISSAuthOptions> authOptions = [ShareSDK authOptionsWithAutoAuth:YES
                                                         allowCallback:YES
                                                         authViewStyle:SSAuthViewStyleFullScreenPopup
                                                          viewDelegate:nil
                                               authManagerViewDelegate:_appDelegate.viewDelegate];
    
        //在授权页面中添加关注官方微博
        [authOptions setFollowAccounts:[NSDictionary dictionaryWithObjectsAndKeys:
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeSinaWeibo),
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(ShareTypeTencentWeibo),
                                    nil]];
    
    [ShareSDK showShareActionSheet:container
                         shareList:shareList
                           content:publishContent
                     statusBarTips:YES
                       authOptions:authOptions
                      shareOptions:[ShareSDK defaultShareOptionsWithTitle:nil
                                                          oneKeyShareList:[NSArray defaultOneKeyShareList]
                                                           qqButtonHidden:NO
                                                    wxSessionButtonHidden:NO
                                                   wxTimelineButtonHidden:NO
                                                     showKeyboardOnAppear:NO
                                                        shareViewDelegate:_appDelegate.viewDelegate
                                                      friendsViewDelegate:_appDelegate.viewDelegate
                                                    picViewerViewDelegate:nil]
                            result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                
                                if (state == SSPublishContentStateSuccess)
                                {
                                    NSLog(NSLocalizedString(@"TEXT_SHARE_SUC", @"发表成功"));
                                }
                                else if (state == SSPublishContentStateFail)
                                {
                                    NSLog(NSLocalizedString(@"TEXT_SHARE_FAI", @"发布失败!error code == %d, error code == %@"), [error errorCode], [error errorDescription]);
                                }
                            }];
}

- (void)leftButtonClickHandler:(id)sender
{
    [self.viewDeckController toggleLeftViewAnimated:YES];
}

@end
