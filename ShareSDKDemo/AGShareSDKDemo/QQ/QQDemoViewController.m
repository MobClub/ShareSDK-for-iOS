//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.mob.com
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import "QQDemoViewController.h"
#import "HeadView.h"
#import "QQTextViewController.h"
#import <TencentOpenAPI/QQApi.h>
#import <AGCommon/UINavigationBar+Common.h>
#import <AGCommon/UIImage+Common.h>
#import <AGCommon/UIDevice+Common.h>
#import <ShareSDK/ShareSDK.h>
#import "ShareSDKDemoMoreViewController.h"
#import "IIViewDeckController.h"
#import "AGAppDelegate.h"
#import <AGCommon/NSString+Common.h>

@interface QQDemoViewController (TestMethods)
- (BOOL)checkQQ;
- (void)sendTextMessage;
- (void)sendImageMessage;
- (void)sendNewsMessage;
- (void)sendAudioMessage;
- (void)sendVideoMessage;
- (void)doEditText;
- (void)doSelImage;
- (void)showTestContent;
@end


@implementation QQDemoViewController



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if(self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
    {
        _appDelegate = (AGAppDelegate *)[UIApplication sharedApplication].delegate;
        
        UIButton *leftBtn = [[[UIButton alloc] init] autorelease];
        [leftBtn setBackgroundImage:[UIImage imageNamed:@"Common/NavigationButtonBG.png" bundleName:BUNDLE_NAME]
                           forState:UIControlStateNormal];
        [leftBtn setImage:[UIImage imageNamed:@"LeftSideViewIcon.png"] forState:UIControlStateNormal];
        leftBtn.frame = CGRectMake(0.0, 0.0, 53.0, 30.0);
        [leftBtn addTarget:self action:@selector(leftButtonClickHandler:) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:leftBtn] autorelease];
        
        _featureNames = [[NSMutableArray alloc] initWithObjects:
                         NSLocalizedString(@"TEXT_SEND_TEXT_TYPE", @"发送文本消息"),
                         NSLocalizedString(@"TEXT_SEND_IMAGE_TYPE", @"发送图片消息"),
                         NSLocalizedString(@"TEXT_SEND_NEWS_TYPE", @"发送新闻消息"),
                         NSLocalizedString(@"TEXT_SEND_AUDIO_TYPE", @"发送音频消息"),
                         NSLocalizedString(@"TEXT_SEND_VIDEO_TYPE", @"发送视频消息"),
                         nil];
        
        _featureNames2 = [[NSMutableArray alloc] initWithObjects:
                          NSLocalizedString(@"TEXT_EDIT_SEND_TEXT", @"编辑发送文本"),
                          NSLocalizedString(@"TEXT_SELECT_IMAGE", @"选择发送图片"),
                          nil];
        
        _featureNames3 = [[NSMutableArray alloc] initWithObjects:
                          NSLocalizedString(@"TEXT_SHOW_TEST_CONTENT", @"显示测试内容"),
                          nil];
        
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
    }
    
    return self;
}

- (void)dealloc
{
    [_featureNames release];
    [_featureNames2 release];
    [_featureNames3 release];
    [super dealloc];
}

- (void)setTitle:(NSString *)title
{
    [super setTitle:title];
    
    ((UILabel *)self.navigationItem.titleView).text = title;
    [self.navigationItem.titleView sizeToFit];
}

- (void)leftButtonClickHandler:(id)sender
{
    [self.viewDeckController toggleLeftViewAnimated:YES];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([[UIDevice currentDevice].systemVersion versionStringCompare:@"7.0"] != NSOrderedAscending)
    {
        [self setExtendedLayoutIncludesOpaqueBars:NO];
        [self setEdgesForExtendedLayout:SSRectEdgeBottom | SSRectEdgeLeft | SSRectEdgeRight];
    }
    
    self.title = @"QQ";

    self.view.backgroundColor = [UIColor colorWithRed:0xe0/255.f green:0xe0/255.f blue:0xe0/255.f alpha:1.f];
    const int h = 110;
	
    // head
    HeadView* headView = [[[HeadView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, h)] autorelease];
    headView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:headView];
    
    // table
    int tableH = self.view.height - h;
    _featureListView = [[UITableView alloc] initWithFrame:CGRectMake(0, h, self.view.width, tableH) style:UITableViewStyleGrouped];
    _featureListView.scrollEnabled = YES;
    _featureListView.dataSource = self;
    _featureListView.delegate = self;
    _featureListView.backgroundColor = [UIColor colorWithRed:(214.f/255.f) green:(214.f/255.f) blue:(214.f/255.f) alpha:1];
    _featureListView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:_featureListView];
    
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackTranslucent];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    [_featureListView release];
    _featureListView = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self layoutView:self.interfaceOrientation];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
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

#pragma mark - 
#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0) return [_featureNames count];
    else if(section == 1) return [_featureNames2 count];
    else if(section == 2) return [_featureNames3 count];
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[[UITableViewCell alloc]
				 initWithStyle:UITableViewCellStyleDefault
				 reuseIdentifier:cellIdentifier] autorelease];
    }
    
    if(indexPath.section == 0)
    {
		cell.textLabel.text = [_featureNames objectAtIndex:indexPath.row];
		cell.textLabel.textAlignment = UITextAlignmentCenter;
	}
    else if(indexPath.section == 1)
    {
        cell.textLabel.text = [_featureNames2 objectAtIndex:indexPath.row];
        cell.textLabel.textAlignment = UITextAlignmentCenter;
    }
    else if(indexPath.section == 2)
    {
        cell.textLabel.text = [_featureNames3 objectAtIndex:indexPath.row];
        cell.textLabel.textAlignment = UITextAlignmentCenter;
    }
	
    return cell;
}

#pragma mark -
#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = indexPath.section;
	NSInteger row = indexPath.row;
	if(section == 0)
    {
		switch (row)
        {
			case 0:
				[self sendTextMessage];
				break;
			case 1:
				[self sendImageMessage];
				break;                
			case 2:
				[self sendNewsMessage];
				break;
			case 3:
				[self sendAudioMessage];
				break;
			case 4:
				[self sendVideoMessage];
				break;
			default:
				NSLog(@"No event handling for row %ld",(long)row);
				break;
		}
	}
    else if(section == 1)
    {
        switch (row) 
        {
            case 0:
                [self doEditText];
                break;
            case 1:
                [self doSelImage];
                break;
            default:
                break;
        }
    }
    else if(section == 2)
    {
        switch (row) 
        {
            case 0:
                [self showTestContent];
                break;
                
            default:
                break;
        }
    }
	
	[_featureListView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark -

- (void)onTextViewCancel
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)onTextViewDone:(NSString*)text
{
    [self dismissModalViewControllerAnimated:YES];
    
    id<ISSContent> content = [ShareSDK content:text
                                defaultContent:nil
                                         image:nil
                                         title:nil
                                           url:nil
                                   description:nil
                                     mediaType:SSPublishContentMediaTypeText];
    
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

    [ShareSDK shareContent:content
                      type:ShareTypeQQ
               authOptions:authOptions
             statusBarTips:YES
                    result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                        
                        if (state == SSPublishContentStateSuccess)
                        {
                            NSLog(@"success");
                        }
                        else if (state == SSPublishContentStateFail)
                        {
                            NSLog(@"fail");
                        }
                    }];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    if([self checkQQ])
    {
        UIImage * selImg = [info objectForKey:UIImagePickerControllerEditedImage];
        
        id<ISSContent> content = [ShareSDK content:NSLocalizedString(@"TEXT_USER_IMAGE", @"这是用户自选的图片哦！！！")
                                    defaultContent:nil
                                             image:[ShareSDK jpegImageWithImage:selImg quality:1]
                                             title:NSLocalizedString(@"TEXT_IMAGE_MSG_TITLE", @"图片消息标题")
                                               url:nil
                                       description:nil
                                         mediaType:SSPublishContentMediaTypeImage];
        
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

        [ShareSDK shareContent:content
                          type:ShareTypeQQ
                   authOptions:authOptions
                 statusBarTips:YES
                        result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                            
                            if (state == SSPublishContentStateSuccess)
                            {
                                NSLog(@"success");
                            }
                            else if (state == SSPublishContentStateFail)
                            {
                                NSLog(@"fail");
                            }
                        }];
    }
    
    [picker dismissModalViewControllerAnimated:YES];
}

#pragma mark - Private

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
            [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"iPhoneLandscapeNavigationBarBG-568h.png"
                                                                                 bundleName:BUNDLE_NAME]];
        }
        else
        {
            [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"iPhoneLandscapeNavigationBarBG.png"
                                                                                 bundleName:BUNDLE_NAME]];
        }
    }
    else
    {
        UIButton *btn = (UIButton *)self.navigationItem.leftBarButtonItem.customView;
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

@end


@implementation QQDemoViewController (TestMethods)

- (BOOL)checkQQ
{
    if(![QQApi isQQInstalled])
    {
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"warning" message:@"QQ is not installed" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alertView show];
        [alertView release];
        return NO;
    }
    
    if(![QQApi isQQSupportApi])
    {
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"warning" message:@"Open API is not supported by current QQ" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alertView show];
        [alertView release];
        return NO;
    }
    
    return YES;
}

- (void) sendTextMessage
{
    id<ISSContent> content = [ShareSDK content:NSLocalizedString(@"TEXT_WECHAT_TEXT", @"过去两年移动互联网有很多开放平台非常成功。事实上到现在来看，发展到现在一年多，最关键的开放平台是能不能真正从用户和经济回报中打造生态链。") 
                                defaultContent:nil
                                         image:nil
                                         title:nil
                                           url:nil
                                   description:nil
                                     mediaType:SSPublishContentMediaTypeText];
    
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
    
    
    [ShareSDK shareContent:content
                      type:ShareTypeQQ
               authOptions:authOptions
             statusBarTips:YES
                    result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                        
                        if (state == SSPublishContentStateSuccess)
                        {
                            NSLog(@"success");
                        }
                        else if (state == SSPublishContentStateFail)
                        {
                            NSLog(@"fail");
                        }
                    }];
}

- (void) sendImageMessage
{
    NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"img.jpg"];
    NSData* data = [NSData dataWithContentsOfFile:path];
    UIImage *image = [[[UIImage alloc] initWithData:data] autorelease];
    
    id<ISSContent> content = [ShareSDK content:@"desc"
                                defaultContent:nil
                                         image:[ShareSDK jpegImageWithImage:image quality:0.8]
                                         title:@"test title"
                                           url:nil
                                   description:nil
                                     mediaType:SSPublishContentMediaTypeImage];
    
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
    
    
    [ShareSDK shareContent:content
                      type:ShareTypeQQ
               authOptions:authOptions
             statusBarTips:YES
                    result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                       
                        if (state == SSPublishContentStateSuccess)
                        {
                            NSLog(@"success");
                        }
                        else if (state == SSPublishContentStateFail)
                        {
                            NSLog(@"fail");
                        }
                    }];
}

- (void) sendNewsMessage
{
    NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"demo.jpg"];
    NSData* data = [NSData dataWithContentsOfFile:path];
    UIImage *image = [[[UIImage alloc] initWithData:data] autorelease];
    
    id<ISSContent> content = [ShareSDK content:NSLocalizedString(@"TEXT_WECHAT_NEWS_TEXT", @"目前国内在售的马自达6为第一代车型，其第二代车型在国内被称作睿翼。日前官方又再次发布了全新第三代马自达6的几张外观图片，新车的神秘面纱总算揭开。据悉，全新马自达6将在今年8月底的莫斯科车展上正式全球首发，随后还会在9月下旬的巴黎车展上亮相，并于明年初正式上市。")
                                defaultContent:nil
                                         image:[ShareSDK jpegImageWithImage:image quality:0.8]
                                         title:NSLocalizedString(@"TEXT_WECHAT_NEWS_TITLE", @"新一代马自达6发布")
                                           url:@"http://info.3g.qq.com/g/s?aid=auto_ss&id=auto_20120727000031&pos=F3G_09hwxc#"
                                   description:nil
                                     mediaType:SSPublishContentMediaTypeNews];
    
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
    
    [ShareSDK shareContent:content
                      type:ShareTypeQQ
               authOptions:authOptions
             statusBarTips:YES
                    result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                        
                        if (state == SSPublishContentStateSuccess)
                        {
                            NSLog(@"success");
                        }
                        else if (state == SSPublishContentStateFail)
                        {
                            NSLog(@"fail");
                        }
                    }];
}

- (void) sendAudioMessage
{
    NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"audio.jpg"];
    NSData* data = [NSData dataWithContentsOfFile:path];
    UIImage *image = [[[UIImage alloc] initWithData:data] autorelease];
    
    id<ISSContent> content = [ShareSDK content:@"Avril Lavigne"
                                defaultContent:nil
                                         image:[ShareSDK jpegImageWithImage:image quality:0.8]
                                         title:@"Wish You Were Here"
                                           url:@"http://wfmusic.3g.qq.com/s?g_f=0&fr=&aid=mu_detail&id=2511915"
                                   description:nil
                                     mediaType:SSPublishContentMediaTypeMusic];
    
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
    
    [ShareSDK shareContent:content
                      type:ShareTypeQQ
               authOptions:authOptions
             statusBarTips:YES
                    result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                        
                        if (state == SSPublishContentStateSuccess)
                        {
                            NSLog(@"success");
                        }
                        else if (state == SSPublishContentStateFail)
                        {
                            NSLog(@"fail");
                        }
                    }];
}

- (void) sendVideoMessage
{
    NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"video.jpg"];
    NSData* data = [NSData dataWithContentsOfFile:path];
    UIImage *image = [[[UIImage alloc] initWithData:data] autorelease];
    
    id<ISSContent> content = [ShareSDK content:NSLocalizedString(@"TEXT_WECHAT_VIDEO_MSG", @"在地球蛮荒时期，一切以武力来解决争斗。远古大陆上，两支兵强马壮的部落军队正在进行厮杀，而其中有一位勇敢的战士率领自己的部落获得了战争的胜利，他就是蛮王柯南（杰森·莫玛饰）。得胜归来的柯南受到了部落的爱戴，他诛杀可怕的怪物，为部落开拓疆土，但一场阴谋正在谋划当中……超自然的邪恶势力正意图侵蚀柯南的部落，它控制部落里的心腹，整个部落惨遭屠杀，连柯南的父亲科灵（朗·普尔曼饰）也未能幸免。意外活下来的柯南，将穿越西伯利亚冰原寻找盟友的帮助，他身负血海深仇，将用最原始、最野蛮的方式，为自己的父亲和同族报仇……")
                                defaultContent:nil
                                         image:[ShareSDK jpegImageWithImage:image quality:0.8]
                                         title:NSLocalizedString(@"TEXT_WECHAT_VIDEO_TITLE", @"王者之剑")
                                           url:@"http://v.youku.com/v_show/id_XNDI0NjA1MTA4.html"
                                   description:nil
                                     mediaType:SSPublishContentMediaTypeVideo];
    
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
    
    [ShareSDK shareContent:content
                      type:ShareTypeQQ
               authOptions:authOptions
             statusBarTips:YES
                    result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                        
                        if (state == SSPublishContentStateSuccess)
                        {
                            NSLog(@"success");
                        }
                        else if (state == SSPublishContentStateFail)
                        {
                            NSLog(@"fail");
                        }
                    }];
}

- (void)doEditText
{
    QQTextViewController* vc = [[[QQTextViewController alloc] init] autorelease];
    vc.delegate = self;
    UINavigationController *nc = [[[UINavigationController alloc] initWithRootViewController:vc] autorelease];
    [self presentModalViewController:nc animated:YES];
}

- (void)doSelImage
{
    UIImagePickerController* picker = [[[UIImagePickerController alloc] init] autorelease];
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
    {
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:picker.sourceType];
    }
    picker.delegate = self;
    picker.allowsEditing = YES;
    [self presentModalViewController:picker animated:YES];
}

- (void)showTestContent
{
    NSMutableString* str = [NSMutableString stringWithString:@""];
    
    NSArray* array = [QQApi getAdItemArray];
    if(array)
    {
        [str appendFormat:@"count:%d ---\n", (int)[array count]];
        for(int i = 0; i < (int)[array count]; i++)
        {
            QQApiAdItem* item = [array objectAtIndex:i];
            if(item)
            {
                [str appendFormat:@"item: %d\n{\n", i];
                
                [str appendFormat:@"title: %@\n", item.title];
                [str appendFormat:@"description: %@\n", item.description];
                [str appendFormat:@"imageData size: %d\n", item.imageData ? (int)[item.imageData length] : 0];
                [str appendFormat:@"target: %@\n", item.target];
                
                [str appendFormat:@"}\n"];
            }
        }
    }
    
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"content" message:str delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    [alertView show];
    [alertView release];
}

- (void)moreButtonClickHanlder:(id)sender
{
    UIViewController *moreVC = [[[ShareSDKDemoMoreViewController alloc] init] autorelease];
    moreVC.title = NSLocalizedString(@"TEXT_MORE", @"更多");
    UINavigationController *navMoreVC = [[[UINavigationController alloc] initWithRootViewController:moreVC] autorelease];
    [self presentModalViewController:navMoreVC animated:YES];
}

@end


