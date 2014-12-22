//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.mob.com
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import "AGViewController.h"
#import <ShareSDK/ShareSDK.h>
#import <AGCommon/UIImage+Common.h>
#import "AGShareCell.h"
#import <AGCommon/UINavigationBar+Common.h>
#import "AGShareButton.h"
#import <AGCommon/UIColor+Common.h>
#import "IIViewDeckController.h"
#import <AGCommon/UIDevice+Common.h>
#import "AGAppDelegate.h"
#import <AGCommon/NSString+Common.h>

#define TYPE_CELL_ID @"TypeCell"
#define STYLE_CELL_ID @"StyleCell"
#define TARGET_CELL_ID @"TargetCell"
#define SSO_CELL_ID @"SSOCell"

@interface AGViewController (Private)

/**
 *	@brief	分享点击
 *
 *	@param 	sender 	事件对象
 */
- (void)actionClickHandler:(id)sender;

/**
 *	@brief	分享按钮点击事件
 *
 *	@param 	sender 	事件对象
 */
- (void)shareButtonClickHandler:(UIButton *)sender;

@end

@implementation AGViewController

- (id)init
{
    if (self = [super init])
    {
        _appDelegate = (AGAppDelegate *)[UIApplication sharedApplication].delegate;
        
        UIButton *leftBtn = [[[UIButton alloc] init] autorelease];
        [leftBtn setBackgroundImage:[UIImage imageNamed:@"Common/NavigationButtonBG.png" bundleName:BUNDLE_NAME]
                       forState:UIControlStateNormal];
        [leftBtn setImage:[UIImage imageNamed:@"LeftSideViewIcon.png"] forState:UIControlStateNormal];
        leftBtn.frame = CGRectMake(0.0, 0.0, 53.0, 30.0);
        [leftBtn addTarget:self action:@selector(leftButtonClickHandler:) forControlEvents:UIControlEventTouchUpInside];
        
        self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:leftBtn] autorelease];
        
        UIButton *btn = [[[UIButton alloc] init] autorelease];
        [btn setBackgroundImage:[UIImage imageNamed:@"Common/NavigationButtonBG.png" bundleName:BUNDLE_NAME]
                       forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"ShareButtonIcon.png"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"ShareButtonHighLightedIcon.png"] forState:UIControlStateHighlighted];
        btn.frame = CGRectMake(0.0, 0.0, 53.0, 30.0);
        [btn addTarget:self action:@selector(actionClickHandler:) forControlEvents:UIControlEventTouchUpInside];
        
        self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:btn]
                                                  autorelease];
        
        if ([UIDevice currentDevice].isPad || [[UIDevice currentDevice].systemVersion versionStringCompare:@"7.0"] != NSOrderedAscending)
        {
            UILabel *label = [[UILabel alloc] init];
            label.backgroundColor = [UIColor clearColor];
            label.textColor = [UIColor whiteColor];
            label.shadowColor = [UIColor grayColor];
            label.font = [UIFont systemFontOfSize:22];
            self.navigationItem.titleView = label;
            [label release];
        }
        
        _curShareViewStyle = 0;
        _curAuthViewStyle = 0;
        _curContentType = 2;
        
        _shareTypeArray = [[NSMutableArray alloc] init];
        _noneUIShareTypeArray = [[NSMutableArray alloc] init];
        
        NSArray *shareTypes = [ShareSDK connectedPlatformTypes];
        for (int i = 0; i < [shareTypes count]; i++)
        {
            NSNumber *shareTypeNum = [shareTypes objectAtIndex:i];
            ShareType type = (ShareType)[shareTypeNum integerValue];
            
            NSMutableDictionary *itemDict = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                             [NSNumber numberWithBool:YES],
                                             @"selected",
                                             shareTypeNum,
                                             @"type",
                                             nil];
            
            id<ISSPlatformApp> app = [ShareSDK getClientWithType:type];
            
            if ([app isSupportOneKeyShare])
            {
                [_noneUIShareTypeArray addObject:itemDict];
            }
            
            [_shareTypeArray addObject:itemDict];
        }
        
        self.title = NSLocalizedString(@"TEXT_DEMO", @"演示");
    }
    
    return self;
}

- (void)dealloc
{
    SAFE_RELEASE(_shareTypeArray);
    
    [super dealloc];
}

- (void)setTitle:(NSString *)title
{
    [super setTitle:title];
    
    ((UILabel *)self.navigationItem.titleView).text = title;
    [self.navigationItem.titleView sizeToFit];
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
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.width, self.view.height) style:UITableViewStyleGrouped];
    _tableView.rowHeight = 50;
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    _tableView.backgroundColor = [UIColor colorWithRGB:0xe1e0de];
    _tableView.backgroundView = nil;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [_tableView release];

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

#pragma mark - Private

- (void)shareButtonClickHandler:(UIButton *)sender
{
    NSString *content = nil;
    NSString *url = nil;
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:IMAGE_NAME ofType:IMAGE_EXT];
    SSPublishContentMediaType mediaType = SSPublishContentMediaTypeText;
    switch (_curContentType)
    {
        case 0:
            content = CONTENT;
            break;
        case 1:
            content = NSLocalizedString(@"TEXT_SHARE_IMAGE", @"图片分享");
            mediaType = SSPublishContentMediaTypeImage;
            break;
        case 2:
            content = CONTENT;
            url = @"http://www.mob.com";
            mediaType = SSPublishContentMediaTypeNews;
            break;
        default:
            break;
    }
    
//    SSShareViewStyle  style = SSShareViewStyleDefault;
//    switch (_curShareViewStyle)
//    {
//        case 1:
//            style = SSShareViewStyleSimple;
//            break;
//        case 2:
//            style = SSShareViewStyleAppRecommend;
//            break;
//    }
    
    NSInteger type = [[[_shareTypeArray objectAtIndex:sender.tag - 200] objectForKey:@"type"] integerValue];
    
    id<ISSCAttachment> imageAttach = [ShareSDK imageWithPath:imagePath];
    id<ISSContent> contentObj = [ShareSDK content:content
                                   defaultContent:@""
                                            image:imageAttach
                                            title:@"ShareSDK"
                                              url:url
                                      description:NSLocalizedString(@"TEXT_TEST_MSG", @"这时一条测试数据")
                                        mediaType:mediaType];
    
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
    
    [ShareSDK showShareViewWithType:(ShareType)type
                          container:nil
                            content:contentObj
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
                                     NSString *msg = nil;
                                     switch (type)
                                     {
                                         case ShareTypeAirPrint:
                                             msg = NSLocalizedString(@"TEXT_PRINT_SUC", @"打印成功");
                                             break;
                                         case ShareTypeCopy:
                                             msg = NSLocalizedString(@"TEXT_COPY_SUC", @"拷贝成功");
                                             break;
                                         default:
                                             break;
                                     }
                                     
                                     if (msg)
                                     {
                                         UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                                                             message:msg
                                                                                            delegate:nil
                                                                                   cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了") 
                                                                                   otherButtonTitles: nil];
                                         [alertView show];
                                         [alertView release];
                                     }
                                 }
                             }];
}

- (void)leftButtonClickHandler:(id)sender
{
    [self.viewDeckController toggleLeftViewAnimated:YES];
}

- (void)actionClickHandler:(id)sender
{
    [ShareSDK ssoEnabled:_ssoSwitch.on];
    
    NSString *content = nil;
    NSString *url = nil;
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:IMAGE_NAME ofType:IMAGE_EXT];
    SSPublishContentMediaType mediaType = SSPublishContentMediaTypeText;
    switch (_curContentType)
    {
        case 0:
            content = CONTENT;
            break;
        case 1:
            content = NSLocalizedString(@"TEXT_SHARE_IMAGE", @"图片分享");
            mediaType = SSPublishContentMediaTypeImage;
            break;
        case 2:
            content = CONTENT;
            url = @"http://www.mob.com";
            mediaType = SSPublishContentMediaTypeNews;
            break;
        default:
            break;
    }
    
    NSMutableArray *shareList = [NSMutableArray array];
    if (_curShareViewStyle == 3)
    {
        for (int i = 0; i < [_noneUIShareTypeArray count]; i++)
        {
            NSDictionary *item = [_noneUIShareTypeArray objectAtIndex:i];
            if([[item objectForKey:@"selected"] boolValue])
            {
                [shareList addObject:[NSNumber numberWithInteger:[[item objectForKey:@"type"] integerValue]]];
            }
        }
        
        id<ISSCAttachment> imageAttach = [ShareSDK imageWithPath:imagePath];
        id<ISSContent> contentObj = [ShareSDK content:content
                                       defaultContent:@""
                                                image:imageAttach
                                                title:@"ShareSDK"
                                                  url:url
                                          description:NSLocalizedString(@"TEXT_TEST_MSG", @"这时一条测试数据")
                                            mediaType:mediaType];
        
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
        
        [ShareSDK oneKeyShareContent:contentObj
                           shareList:shareList
                         authOptions:authOptions
                       statusBarTips:YES
                              result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                  
                                  if (state == SSPublishContentStateSuccess)
                                  {
                                      NSLog(NSLocalizedString(@"TEXT_SHARE_SUC", @"分享成功"));
                                  }
                                  else if (state == SSPublishContentStateFail)
                                  {
                                      NSLog(NSLocalizedString(@"TEXT_SHARE_FAI", @"分享失败,错误码:%d,错误描述:%@"), [error errorCode], [error errorDescription]);
                                  }
                              }];
    }
    else
    {
        id<ISSShareOptions> shareViewOptions = nil;
        
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

        switch (_curAuthViewStyle)
        {
            case 1:
                [authOptions setViewStyle:SSAuthViewStylePopup];
                break;
            case 2:
                [authOptions setViewStyle:SSAuthViewStyleModal];
                break;
            default:
                [authOptions setViewStyle:SSAuthViewStyleFullScreenPopup];
                break;
        }
        
        switch (_curShareViewStyle)
        {
            case 1:
                shareViewOptions = [ShareSDK simpleShareOptionsWithTitle:NSLocalizedString(@"TEXT_SHARE_TITLE", @"内容分享") shareViewDelegate:nil];
                break;
            case 2:
                shareViewOptions = [ShareSDK appRecommendShareOptionsWithTile:NSLocalizedString(@"TEXT_SHARE_TITLE", @"内容分享") shareViewDelegate:nil];
                break;
            default:
                shareViewOptions = [ShareSDK defaultShareOptionsWithTitle:NSLocalizedString(@"TEXT_SHARE_TITLE", @"内容分享")
                                                          oneKeyShareList:[NSArray defaultOneKeyShareList]
                                                           qqButtonHidden:NO
                                                    wxSessionButtonHidden:NO
                                                   wxTimelineButtonHidden:NO
                                                     showKeyboardOnAppear:NO
                                                        shareViewDelegate:_appDelegate.viewDelegate
                                                      friendsViewDelegate:_appDelegate.viewDelegate
                                                    picViewerViewDelegate:nil];
                break;
        }
        
        
        for (int i = 0; i < [_shareTypeArray count]; i++)
        {
            NSDictionary *item = [_shareTypeArray objectAtIndex:i];
            if([[item objectForKey:@"selected"] boolValue])
            {
                [shareList addObject:[NSNumber numberWithInteger:[[item objectForKey:@"type"] integerValue]]];
            }
        }
        
                //创建容器
                id<ISSContainer> container = [ShareSDK container];
        [container setIPadContainerWithBarButtonItem:self.navigationItem.rightBarButtonItem arrowDirect:UIPopoverArrowDirectionAny];
        
        //创建内容
        id<ISSCAttachment> imageAttach = [ShareSDK imageWithPath:imagePath];
        id<ISSContent> contentObj = [ShareSDK content:content
                                       defaultContent:@""
                                                image:imageAttach
                                                title:@"ShareSDK"
                                                  url:@"http://www.sharesdk.com"
                                          description:NSLocalizedString(@"TEXT_TEST_MSG", @"这是一条测试信息")
                                            mediaType:SSPublishContentMediaTypeNews];
        
                //显示分享选择菜单
                [ShareSDK showShareActionSheet:container
                             shareList:shareList
                               content:contentObj
                         statusBarTips:YES
                           authOptions:authOptions
                          shareOptions:shareViewOptions
                                result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                    
                                    if (state == SSPublishContentStateSuccess)
                                    {
                                        NSString *msg = nil;
                                        switch (type)
                                        {
                                            case ShareTypeAirPrint:
                                                msg = NSLocalizedString(@"TEXT_PRINT_SUC", @"打印成功");
                                                break;
                                            case ShareTypeCopy:
                                                msg = NSLocalizedString(@"TEXT_COPY_SUC", @"拷贝成功");
                                                break;
                                            default:
                                                break;
                                        }
                                        
                                        if (msg)
                                        {
                                            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                                                                message:msg
                                                                                               delegate:nil
                                                                                      cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                                                      otherButtonTitles: nil];
                                            [alertView show];
                                            [alertView release];
                                        }
                                    }
                                }];
    }
    
}

- (void)layoutPortrait
{
    UIButton *btn = (UIButton *)self.navigationItem.leftBarButtonItem.customView;
    btn.frame = CGRectMake(btn.left, btn.top, 55.0, 32.0);
    [btn setBackgroundImage:[UIImage imageNamed:@"Common/NavigationButtonBG.png"
                                     bundleName:BUNDLE_NAME]
                   forState:UIControlStateNormal];
    
    btn = (UIButton *)self.navigationItem.rightBarButtonItem.customView;
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
        
        btn = (UIButton *)self.navigationItem.rightBarButtonItem.customView;
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
        [btn setBackgroundImage:[UIImage imageNamed:@"Common/NavigationButtonBG.png"
                                         bundleName:BUNDLE_NAME]
                       forState:UIControlStateNormal];
        
        btn = (UIButton *)self.navigationItem.rightBarButtonItem.customView;
        btn.frame = CGRectMake(btn.left, btn.top, 55.0, 32.0);
        [btn setBackgroundImage:[UIImage imageNamed:@"Common/NavigationButtonBG.png"
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

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
            return NSLocalizedString(@"TEXT_TYPE", @"类型");
        case 1:
            return @"";
        case 2:
            return NSLocalizedString(@"TEXT_AUTH_STYLE", @"授权视图样式");
        case 3:
            return NSLocalizedString(@"TEXT_SHARE_STYLE", @"分享视图样式");
        case 4:
            return NSLocalizedString(@"TEXT_SHARE_MENU_ITEMS", @"菜单内出现的分享项（可多选）");
        default:
            return nil;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
            return 3;
        case 1:
            return 1;
        case 2:
            return 3;
        case 3:
            return 4;
        case 4:
            if (_curShareViewStyle == 3)
            {
                return [_noneUIShareTypeArray count];
            }
            return [_shareTypeArray count];
        default:
            return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    switch (indexPath.section)
    {
        case 0:
        {
            cell = [tableView dequeueReusableCellWithIdentifier:TYPE_CELL_ID];
            if (cell == nil)
            {
                cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TYPE_CELL_ID] autorelease];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            switch (indexPath.row)
            {
                case 0:
                    cell.textLabel.text = NSLocalizedString(@"TEXT_TYPE_TEXT", @"文字");
                    break;
                case 1:
                    cell.textLabel.text = NSLocalizedString(@"TEXT_TYPE_IMAGE", @"图片");
                    break;
                case 2:
                    cell.textLabel.text = NSLocalizedString(@"TEXT_TYPE_IMAGE_AND_TEXT", @"图文");
                    break;
                default:
                    break;
            }
            if (indexPath.row == _curContentType)
            {
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
            }
            else
            {
                cell.accessoryType = UITableViewCellAccessoryNone;
            }
            break;
        }
        case 1:
        {
            cell = [tableView dequeueReusableCellWithIdentifier:SSO_CELL_ID];
            if (cell == nil)
            {
                cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SSO_CELL_ID] autorelease];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell.textLabel.text = NSLocalizedString(@"TEXT_SSO_LOGIN_2", @"SSO登录");
                
                _ssoSwitch = [[UISwitch alloc] init];
                [_ssoSwitch sizeToFit];
                cell.accessoryView = _ssoSwitch;
                [_ssoSwitch release];
            }
            
            break;
        }
        case 2:
        {
            cell = [tableView dequeueReusableCellWithIdentifier:STYLE_CELL_ID];
            if (cell == nil)
            {
                cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:STYLE_CELL_ID] autorelease];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            switch (indexPath.row)
            {
                case 0:
                    cell.textLabel.text = @"FullScreenPopup(默认)";
                    break;
                case 1:
                    cell.textLabel.text = @"Popup";
                    break;
                case 2:
                    cell.textLabel.text = @"Modal";
                    break;
                default:
                    break;
            }
            if (indexPath.row == _curAuthViewStyle)
            {
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
            }
            else
            {
                cell.accessoryType = UITableViewCellAccessoryNone;
            }
            break;
        }
        case 3:
        {
            cell = [tableView dequeueReusableCellWithIdentifier:STYLE_CELL_ID];
            if (cell == nil)
            {
                cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:STYLE_CELL_ID] autorelease];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            switch (indexPath.row)
            {
                case 0:
                    cell.textLabel.text = NSLocalizedString(@"TEXT_DEFAULT", @"默认");
                    break;
                case 1:
                    cell.textLabel.text = NSLocalizedString(@"TEXT_SIMPLE", @"简单");
                    break;
                case 2:
                    cell.textLabel.text = NSLocalizedString(@"TEXT_APP_RECOMMEND", @"应用推荐");
                    break;
                case 3:
                    cell.textLabel.text = NSLocalizedString(@"TEXT_NONE_UI", @"无界面");
                    break;
                default:
                    break;
            }
            if (indexPath.row == _curShareViewStyle)
            {
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
            }
            else
            {
                cell.accessoryType = UITableViewCellAccessoryNone;
            }
            break;
        }
        case 4:
        {
            cell = [tableView dequeueReusableCellWithIdentifier:TARGET_CELL_ID];
            if (cell == nil)
            {
                cell = [[[AGShareCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TARGET_CELL_ID] autorelease];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            
            if (_curShareViewStyle == 3)
            {
                if (indexPath.row < [_noneUIShareTypeArray count])
                {
                    ((UIButton *)cell.accessoryView).tag = 200 + indexPath.row;
                    NSDictionary *item = [_noneUIShareTypeArray objectAtIndex:indexPath.row];
                    cell.textLabel.text = [ShareSDK getClientNameWithType:(ShareType)[[item objectForKey:@"type"] integerValue]];
                    UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:
                                                        @"Icon/sns_icon_%ld.png",
                                                        (long)[[item objectForKey:@"type"] integerValue]]
                                            bundleName:BUNDLE_NAME];
                    if (![[item objectForKey:@"selected"] boolValue])
                    {
                                                //灰度化图片
                                                img = img.grayImage;
                        cell.accessoryType = UITableViewCellAccessoryNone;
                    }
                    else
                    {
                        cell.accessoryType = UITableViewCellAccessoryCheckmark;
                    }
                    cell.imageView.image = img;
                }
            }
            else
            {
                if (indexPath.row < [_shareTypeArray count])
                {
                    ((UIButton *)cell.accessoryView).tag = 200 + indexPath.row;
                    NSDictionary *item = [_shareTypeArray objectAtIndex:indexPath.row];
                    cell.textLabel.text = [ShareSDK getClientNameWithType:(ShareType)[[item objectForKey:@"type"] integerValue]];
                    UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:
                                                        @"Icon/sns_icon_%ld.png",
                                                        (long)[[item objectForKey:@"type"] integerValue]]
                                            bundleName:BUNDLE_NAME];
                    if (![[item objectForKey:@"selected"] boolValue])
                    {
                                                //灰度化图片
                                                img = img.grayImage;
                        cell.accessoryType = UITableViewCellAccessoryNone;
                    }
                    else
                    {
                        cell.accessoryType = UITableViewCellAccessoryCheckmark;
                    }
                    cell.imageView.image = img;
                }
            }
            break;
        }
        default:
            break;
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section)
    {
        case 0:
            _curContentType = indexPath.row;
            [tableView reloadData];
            break;
        case 2:
            _curAuthViewStyle = indexPath.row;
            [tableView reloadData];
            break;
        case 3:
            _curShareViewStyle = indexPath.row;
            [tableView reloadData];
            break;
        case 4:
            if (_curShareViewStyle == 3)
            {
                if (indexPath.row < [_noneUIShareTypeArray count])
                {
                    NSMutableDictionary *item = [_noneUIShareTypeArray objectAtIndex:indexPath.row];
                    BOOL selected = ![[item objectForKey:@"selected"] boolValue];
                    [item setObject:[NSNumber numberWithBool:selected] forKey:@"selected"];
                    [tableView reloadData];
                }
            }
            else
            {
                if (indexPath.row < [_shareTypeArray count])
                {
                    NSMutableDictionary *item = [_shareTypeArray objectAtIndex:indexPath.row];
                    BOOL selected = ![[item objectForKey:@"selected"] boolValue];
                    [item setObject:[NSNumber numberWithBool:selected] forKey:@"selected"];
                    [tableView reloadData];
                }
            }
            break;
        default:
            break;
    }
}

@end
