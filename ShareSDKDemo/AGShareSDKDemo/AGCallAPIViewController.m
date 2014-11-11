//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.mob.com
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import "AGCallAPIViewController.h"
#import <AGCommon/UIImage+Common.h>
#import <AGCommon/UIDevice+Common.h>
#import <AGCommon/UINavigationBar+Common.h>
#import "IIViewDeckController.h"
#import <ShareSDK/ShareSDK.h>
#import <SinaWeiboConnection/SinaWeiboConnection.h>
#import <TencentWeiboConnection/TencentWeiboConnection.h>
#import <AGCommon/NSString+Common.h>

#define LEFT_PADDING 10.0
#define RIGHT_PADDING 10.0
#define HORIZONTAL_GAP 10.0
#define VERTICAL_GAP 10.0

#define ITEM_HEIGHT 30.0

@implementation AGCallAPIViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        UIButton *leftBtn = [[[UIButton alloc] init] autorelease];
        [leftBtn setBackgroundImage:[UIImage imageNamed:@"Common/NavigationButtonBG.png" bundleName:BUNDLE_NAME]
                           forState:UIControlStateNormal];
        [leftBtn setImage:[UIImage imageNamed:@"LeftSideViewIcon.png"] forState:UIControlStateNormal];
        leftBtn.frame = CGRectMake(0.0, 0.0, 53.0, 30.0);
        [leftBtn addTarget:self action:@selector(leftButtonClickHandler:) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:leftBtn] autorelease];
        
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
        
        self.title = NSLocalizedString(@"TEXT_CALL_API", @"调用API");
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardShowHandler:)
                                                     name:UIKeyboardWillShowNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardHideHandler:)
                                                     name:UIKeyboardWillHideNotification
                                                   object:nil];
    }
    return self;
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
    
    CGFloat top = 0.0;
    
    _contentView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.width, self.view.height)];
    _contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.0, top, self.view.width, ITEM_HEIGHT)];
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    label.backgroundColor = [UIColor lightGrayColor];
    label.text = NSLocalizedString(@"TEXT_GET_SINA_WEIBO_COMMENTS", @"获取新浪微博评论列表");
    [_contentView addSubview:label];
    [label release];
    
    top += VERTICAL_GAP + ITEM_HEIGHT;
    
    label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.backgroundColor = [UIColor clearColor];
    label.text = NSLocalizedString(@"TEXT_WEIBO_ID", @"微博ID:");
    [label sizeToFit];
    label.frame = CGRectMake(LEFT_PADDING, top, label.width, ITEM_HEIGHT);
    [_contentView addSubview:label];
    [label release];
    
    _sinaGetCmtStatusIdField = [[UITextField alloc] initWithFrame:CGRectMake(label.right + HORIZONTAL_GAP, top, self.view.width - label.right - HORIZONTAL_GAP - RIGHT_PADDING, ITEM_HEIGHT)];
    _sinaGetCmtStatusIdField.delegate = self;
    _sinaGetCmtStatusIdField.borderStyle = UITextBorderStyleRoundedRect;
    _sinaGetCmtStatusIdField.text = @"3481474642286341";
    [_contentView addSubview:_sinaGetCmtStatusIdField];
    [_sinaGetCmtStatusIdField release];
    
    top += VERTICAL_GAP + ITEM_HEIGHT;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:NSLocalizedString(@"TEXT_CALL_METHOD", @"调用方法")
         forState:UIControlStateNormal];
    [btn sizeToFit];
    [btn addTarget:self action:@selector(getSinaWeiboCommentListHandler:) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(LEFT_PADDING, top, btn.width, ITEM_HEIGHT);
    [_contentView addSubview:btn];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn2 setTitle:NSLocalizedString(@"TEXT_GET_LAST_COMMENT", @"获取最新评论") forState:UIControlStateNormal];
    [btn2 sizeToFit];
    [btn2 addTarget:self action:@selector(getSinaWeiboLastCommentHandler:) forControlEvents:UIControlEventTouchUpInside];
    btn2.frame = CGRectMake(btn.right + HORIZONTAL_GAP, top, btn2.width, ITEM_HEIGHT);
    [_contentView addSubview:btn2];
    
    top += VERTICAL_GAP + ITEM_HEIGHT;
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(0.0, top, self.view.width, ITEM_HEIGHT)];
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    label.backgroundColor = [UIColor lightGrayColor];
    label.text = NSLocalizedString(@"TEXT_GET_SINA_WEIBO_FAV_LIST", @"获取新浪微博收藏列表");
    [_contentView addSubview:label];
    [label release];
    
    top += VERTICAL_GAP + ITEM_HEIGHT;
    
    btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:NSLocalizedString(@"TEXT_CALL_METHOD", @"调用方法") forState:UIControlStateNormal];
    [btn sizeToFit];
    [btn addTarget:self action:@selector(getSinaWeiboFavoriteListHandler:) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(LEFT_PADDING, top, btn.width, ITEM_HEIGHT);
    [_contentView addSubview:btn];
    
    btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn2 setTitle:NSLocalizedString(@"TEXT_GET_LAST_FAV", @"获取最新收藏")
          forState:UIControlStateNormal];
    [btn2 sizeToFit];
    [btn2 addTarget:self action:@selector(getSinaWeiboLastFavoriteHandler:) forControlEvents:UIControlEventTouchUpInside];
    btn2.frame = CGRectMake(btn.right + HORIZONTAL_GAP, top, btn2.width, ITEM_HEIGHT);
    [_contentView addSubview:btn2];
    
    top += VERTICAL_GAP + ITEM_HEIGHT;
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(0.0, top, self.view.width, ITEM_HEIGHT)];
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    label.backgroundColor = [UIColor lightGrayColor];
    label.text = NSLocalizedString(@"TEXT_REPLY_SINA_WEIBO_COMMENT", @"回复新浪微博评论");
    [_contentView addSubview:label];
    [label release];
    
    top += VERTICAL_GAP + ITEM_HEIGHT;
    
    label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.backgroundColor = [UIColor clearColor];
    label.text = NSLocalizedString(@"TEXT_WEIBO_ID", @"微博ID:");
    [label sizeToFit];
    label.frame = CGRectMake(LEFT_PADDING, top, label.width, ITEM_HEIGHT);
    [_contentView addSubview:label];
    [label release];
    
    _sinaReplyStatusIdField = [[UITextField alloc] initWithFrame:CGRectMake(label.right + HORIZONTAL_GAP, top, self.view.width - label.right - HORIZONTAL_GAP - RIGHT_PADDING, ITEM_HEIGHT)];
    _sinaReplyStatusIdField.delegate = self;
    _sinaReplyStatusIdField.borderStyle = UITextBorderStyleRoundedRect;
    _sinaReplyStatusIdField.text = @"3444517204329764";
    [_contentView addSubview:_sinaReplyStatusIdField];
    [_sinaReplyStatusIdField release];
    
    top += VERTICAL_GAP + ITEM_HEIGHT;
    
    label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.backgroundColor = [UIColor clearColor];
    label.text = NSLocalizedString(@"TEXT_COMMENT_ID", @"评论ID:");
    [label sizeToFit];
    label.frame = CGRectMake(LEFT_PADDING, top, label.width, ITEM_HEIGHT);
    [_contentView addSubview:label];
    [label release];
    
    _sinaReplyCommendIdField = [[UITextField alloc] initWithFrame:CGRectMake(label.right + HORIZONTAL_GAP, top, self.view.width - label.right - HORIZONTAL_GAP - RIGHT_PADDING, ITEM_HEIGHT)];
    _sinaReplyCommendIdField.delegate = self;
    _sinaReplyCommendIdField.borderStyle = UITextBorderStyleRoundedRect;
    _sinaReplyCommendIdField.text = @"3486209583798050";
    [_contentView addSubview:_sinaReplyCommendIdField];
    [_sinaReplyCommendIdField release];
    
    
    top += VERTICAL_GAP + ITEM_HEIGHT;
    
    label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.backgroundColor = [UIColor clearColor];
    label.text = NSLocalizedString(@"TEXT_COMMENT_MSG", @"评论内容:");
    [label sizeToFit];
    label.frame = CGRectMake(LEFT_PADDING, top, label.width, ITEM_HEIGHT);
    [_contentView addSubview:label];
    [label release];
    
    _sinaReplyContentField = [[UITextField alloc] initWithFrame:CGRectMake(label.right + HORIZONTAL_GAP, top, self.view.width - label.right - HORIZONTAL_GAP - RIGHT_PADDING, ITEM_HEIGHT)];
    _sinaReplyContentField.delegate = self;
    _sinaReplyContentField.borderStyle = UITextBorderStyleRoundedRect;
    _sinaReplyContentField.text = NSLocalizedString(@"TEXT_TEST_COMMENT_MSG", @"测试评论内容");
    [_contentView addSubview:_sinaReplyContentField];
    [_sinaReplyContentField release];
    
    top += VERTICAL_GAP + ITEM_HEIGHT;
    
    btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:NSLocalizedString(@"TEXT_CALL_METHOD", @"调用方法") forState:UIControlStateNormal];
    [btn sizeToFit];
    [btn addTarget:self action:@selector(sinaReplyCommentHandler:) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(LEFT_PADDING, top, btn.width, ITEM_HEIGHT);
    [_contentView addSubview:btn];
    
    btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn2 setTitle:NSLocalizedString(@"TEXT_GET_REPLY_COMMENT_ID", @"获取回复评论ID") forState:UIControlStateNormal];
    [btn2 sizeToFit];
    [btn2 addTarget:self action:@selector(getSinaReplyIdHandler:) forControlEvents:UIControlEventTouchUpInside];
    btn2.frame = CGRectMake(btn.right + HORIZONTAL_GAP, top, btn2.width, ITEM_HEIGHT);
    [_contentView addSubview:btn2];
    
    top += VERTICAL_GAP + ITEM_HEIGHT;
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(0.0, top, self.view.width, ITEM_HEIGHT)];
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    label.backgroundColor = [UIColor lightGrayColor];
    label.text = NSLocalizedString(@"TEXT_GET_TENCENT_WEIBO_COMMENTS", @"获取腾讯微博评论列表");
    [_contentView addSubview:label];
    [label release];
    
    top += VERTICAL_GAP + ITEM_HEIGHT;
    
    label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.backgroundColor = [UIColor clearColor];
    label.text = NSLocalizedString(@"TEXT_WEIBO_ID", @"微博ID:");
    [label sizeToFit];
    label.frame = CGRectMake(LEFT_PADDING, top, label.width, ITEM_HEIGHT);
    [_contentView addSubview:label];
    [label release];
    
    _tencentGetCmtStatusIdField = [[UITextField alloc] initWithFrame:CGRectMake(label.right + HORIZONTAL_GAP, top, self.view.width - label.right - HORIZONTAL_GAP - RIGHT_PADDING, ITEM_HEIGHT)];
    _tencentGetCmtStatusIdField.delegate = self;
    _tencentGetCmtStatusIdField.borderStyle = UITextBorderStyleRoundedRect;
    _tencentGetCmtStatusIdField.text = @"112714089895346";
    [_contentView addSubview:_tencentGetCmtStatusIdField];
    [_tencentGetCmtStatusIdField release];
    
    top += VERTICAL_GAP + ITEM_HEIGHT;
    
    btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:NSLocalizedString(@"TEXT_CALL_METHOD", @"调用方法") forState:UIControlStateNormal];
    [btn sizeToFit];
    [btn addTarget:self action:@selector(getTencentWeiboCommentListHandler:) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(LEFT_PADDING, top, btn.width, ITEM_HEIGHT);
    [_contentView addSubview:btn];
    
    btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn2 setTitle:NSLocalizedString(@"TEXT_GET_LAST_COMMENT", @"获取最新评论") forState:UIControlStateNormal];
    [btn2 sizeToFit];
    [btn2 addTarget:self action:@selector(getTencentWeiboLastCommentHandler:) forControlEvents:UIControlEventTouchUpInside];
    btn2.frame = CGRectMake(btn.right + HORIZONTAL_GAP, top, btn2.width, ITEM_HEIGHT);
    [_contentView addSubview:btn2];
    
    top += VERTICAL_GAP + ITEM_HEIGHT;
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(0.0, top, self.view.width, ITEM_HEIGHT)];
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    label.backgroundColor = [UIColor lightGrayColor];
    label.text = NSLocalizedString(@"TEXT_GET_TENCENT_WEIBO_FAV_LIST", @"获取腾讯微博收藏列表");
    [_contentView addSubview:label];
    [label release];
    
    top += VERTICAL_GAP + ITEM_HEIGHT;
    
    btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:NSLocalizedString(@"TEXT_CALL_METHOD", @"调用方法") forState:UIControlStateNormal];
    [btn sizeToFit];
    [btn addTarget:self action:@selector(getTencentWeiboFavoriteListHandler:) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(LEFT_PADDING, top, btn.width, ITEM_HEIGHT);
    [_contentView addSubview:btn];
    
    btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn2 setTitle:NSLocalizedString(@"TEXT_GET_LAST_FAV", @"获取最新收藏") forState:UIControlStateNormal];
    [btn2 sizeToFit];
    [btn2 addTarget:self action:@selector(getTencentWeiboLastFavoriteHandler:) forControlEvents:UIControlEventTouchUpInside];
    btn2.frame = CGRectMake(btn.right + HORIZONTAL_GAP, top, btn2.width, ITEM_HEIGHT);
    [_contentView addSubview:btn2];
    
    top += VERTICAL_GAP + ITEM_HEIGHT;
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(0.0, top, self.view.width, ITEM_HEIGHT)];
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    label.backgroundColor = [UIColor lightGrayColor];
    label.text = NSLocalizedString(@"TEXT_REPLY_TENCENT_WEIBO", @"回复腾讯微博");
    [_contentView addSubview:label];
    [label release];
    
    top += VERTICAL_GAP + ITEM_HEIGHT;
    
    label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.backgroundColor = [UIColor clearColor];
    label.text = NSLocalizedString(@"TEXT_REPLY_WEIBO_ID", @"回复微博ID:");
    [label sizeToFit];
    label.frame = CGRectMake(LEFT_PADDING, top, label.width, ITEM_HEIGHT);
    [_contentView addSubview:label];
    [label release];
    
    _tencentReplyStatusIdField = [[UITextField alloc] initWithFrame:CGRectMake(label.right + HORIZONTAL_GAP, top, self.view.width - label.right - HORIZONTAL_GAP - RIGHT_PADDING, ITEM_HEIGHT)];
    _tencentReplyStatusIdField.delegate = self;
    _tencentReplyStatusIdField.borderStyle = UITextBorderStyleRoundedRect;
    _tencentReplyStatusIdField.text = @"8409097845403";
    [_contentView addSubview:_tencentReplyStatusIdField];
    [_tencentReplyStatusIdField release];
    
    top += VERTICAL_GAP + ITEM_HEIGHT;
    
    label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.backgroundColor = [UIColor clearColor];
    label.text = NSLocalizedString(@"TEXT_REPLY_CONTENT", @"回复内容:");
    [label sizeToFit];
    label.frame = CGRectMake(LEFT_PADDING, top, label.width, ITEM_HEIGHT);
    [_contentView addSubview:label];
    [label release];
    
    _tencentReplyContentField = [[UITextField alloc] initWithFrame:CGRectMake(label.right + HORIZONTAL_GAP, top, self.view.width - label.right - HORIZONTAL_GAP - RIGHT_PADDING, ITEM_HEIGHT)];
    _tencentReplyContentField.delegate = self;
    _tencentReplyContentField.borderStyle = UITextBorderStyleRoundedRect;
    _tencentReplyContentField.text = @"helloworld";
    [_contentView addSubview:_tencentReplyContentField];
    [_tencentReplyContentField release];
    
    top += VERTICAL_GAP + ITEM_HEIGHT;
    
    btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:NSLocalizedString(@"TEXT_CALL_METHOD", @"调用方法") forState:UIControlStateNormal];
    [btn sizeToFit];
    [btn addTarget:self action:@selector(getTencentWeiboReplyHandler:) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(LEFT_PADDING, top, btn.width, ITEM_HEIGHT);
    [_contentView addSubview:btn];
    
    btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn2 setTitle:NSLocalizedString(@"TEXT_GET_REPLY_ID", @"获取回复ID") forState:UIControlStateNormal];
    [btn2 sizeToFit];
    [btn2 addTarget:self action:@selector(getTencentWeiboLastReplyHandler:) forControlEvents:UIControlEventTouchUpInside];
    btn2.frame = CGRectMake(btn.right + HORIZONTAL_GAP, top, btn2.width, ITEM_HEIGHT);
    [_contentView addSubview:btn2];
    
    _contentView.contentSize = CGSizeMake(self.view.width, top + ITEM_HEIGHT + VERTICAL_GAP);
    [self.view addSubview:_contentView];
    [_contentView release];
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

- (void)leftButtonClickHandler:(id)sender
{
    [self.viewDeckController toggleLeftViewAnimated:YES];
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

- (void)keyboardShowHandler:(NSNotification *)notif
{
    CGRect keyboardFrame;
    NSValue *value =[[notif userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey];
    [value getValue:&keyboardFrame];
    
    _contentView.frame = CGRectMake(0.0, 0.0, self.view.width, self.view.height - keyboardFrame.size.height);
}

- (void)keyboardHideHandler:(NSNotification *)notif
{
     _contentView.frame = self.view.bounds;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    _focusTextField = textField;
}

#pragma mark - 调用方法

- (void)getSinaWeiboCommentListHandler:(id)sender
{
    [_focusTextField resignFirstResponder];
    
    //调用获取评论列表方法，接口文档：http://open.weibo.com/wiki/2/comments/show
    //先获取相关平台的App对象
    id<ISSSinaWeiboApp> app = (id<ISSSinaWeiboApp>)[ShareSDK getClientWithType:ShareTypeSinaWeibo];

    //构造参数
    id<ISSCParameters> params = [ShareSDKCoreService parameters];
    [params addParameter:@"id" value:_sinaGetCmtStatusIdField.text];
    
    //调用接口
    [app api:@"https://api.weibo.com/2/comments/show.json"
      method:SSSinaWeiboRequestMethodGet
      params:params
        user:nil
      result:^(id responder) {
          UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                              message:[NSString stringWithFormat:
                                                                       @"%@",
                                                                       responder]
                                                             delegate:nil
                                                    cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                    otherButtonTitles:nil];
          [alertView show];
          [alertView release];
      }
       fault:^(CMErrorInfo *error) {
           UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                               message:[NSString stringWithFormat:
                                                                        NSLocalizedString(@"TEXT_CALL_FAI", @"调用失败：%d:%@"),
                                                                        [error errorCode],
                                                                        [error errorDescription]]
                                                              delegate:nil
                                                     cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                     otherButtonTitles:nil];
           [alertView show];
           [alertView release];
       }];
}

- (void)getSinaWeiboLastCommentHandler:(id)sender
{
    [_focusTextField resignFirstResponder];
    
    //调用获取评论列表方法，接口文档：http://open.weibo.com/wiki/2/comments/show
    //先获取相关平台的App对象
    id<ISSSinaWeiboApp> app = (id<ISSSinaWeiboApp>)[ShareSDK getClientWithType:ShareTypeSinaWeibo];
    
    //构造参数
    id<ISSCParameters> params = [ShareSDKCoreService parameters];
    [params addParameter:@"id" value:_sinaGetCmtStatusIdField.text];
    
    //调用接口
    [app api:@"https://api.weibo.com/2/comments/show.json"
      method:SSSinaWeiboRequestMethodGet
      params:params
        user:nil
      result:^(id responder) {
          id value = [responder objectForKey:@"comments"];
          if ([value isKindOfClass:[NSArray class]] && [value count] > 0)
          {
              id item = [value objectAtIndex:0];
              if ([item isKindOfClass:[NSDictionary class]])
              {
                  UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                                      message:[NSString stringWithFormat:
                                                                               @"%@",
                                                                               [item objectForKey:@"text"]]
                                                                     delegate:nil
                                                            cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                            otherButtonTitles:nil];
                  [alertView show];
                  [alertView release];
                  
                  return;
              }
          }
          
          UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                              message:NSLocalizedString(@"TEXT_NO_COMMENTS", @"无评论")
                                                             delegate:nil
                                                    cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                    otherButtonTitles:nil];
          [alertView show];
          [alertView release];
      }
       fault:^(CMErrorInfo *error) {
           UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                               message:[NSString stringWithFormat:
                                                                        NSLocalizedString(@"TEXT_CALL_FAI", @"调用失败：%d:%@"),
                                                                        [error errorCode],
                                                                        [error errorDescription]]
                                                              delegate:nil
                                                     cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                     otherButtonTitles:nil];
           [alertView show];
           [alertView release];
       }];
}

- (void)getSinaWeiboFavoriteListHandler:(id)sender
{
    [_focusTextField resignFirstResponder];
    
        //调用获取收藏列表方法，接口文档：https://api.weibo.com/2/favorites.json
    //先获取相关平台的App对象
        id<ISSSinaWeiboApp> app = (id<ISSSinaWeiboApp>)[ShareSDK getClientWithType:ShareTypeSinaWeibo];
    
        //调用接口
        [app api:@"https://api.weibo.com/2/favorites.json"
      method:SSSinaWeiboRequestMethodGet
      params:nil
        user:nil
      result:^(id responder) {
          UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                              message:[NSString stringWithFormat:
                                                                       @"%@",
                                                                       responder]
                                                             delegate:nil
                                                    cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                    otherButtonTitles:nil];
          [alertView show];
          [alertView release];
      }
       fault:^(CMErrorInfo *error) {
           UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                               message:[NSString stringWithFormat:
                                                                        NSLocalizedString(@"TEXT_CALL_FAI", @"调用失败：%d:%@"),
                                                                        [error errorCode],
                                                                        [error errorDescription]]
                                                              delegate:nil
                                                     cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                     otherButtonTitles:nil];
           [alertView show];
           [alertView release];
       }];
    
}

- (void)getSinaWeiboLastFavoriteHandler:(id)sender
{
    [_focusTextField resignFirstResponder];
    
    //调用获取收藏列表方法，接口文档：https://api.weibo.com/2/favorites.json
    //先获取相关平台的App对象
    id<ISSSinaWeiboApp> app = (id<ISSSinaWeiboApp>)[ShareSDK getClientWithType:ShareTypeSinaWeibo];
    
    //调用接口
    [app api:@"https://api.weibo.com/2/favorites.json"
      method:SSSinaWeiboRequestMethodGet
      params:nil
        user:nil
      result:^(id responder) {
          id value = [responder objectForKey:@"favorites"];
          if ([value isKindOfClass:[NSArray class]] && [value count] > 0)
          {
              id item = [value objectAtIndex:0];
              if ([item isKindOfClass:[NSDictionary class]])
              {
                  item = [item objectForKey:@"status"];
                  if ([item isKindOfClass:[NSDictionary class]])
                  {
                      UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                                          message:[NSString stringWithFormat:
                                                                                   @"%@",
                                                                                   [item objectForKey:@"text"]]
                                                                         delegate:nil
                                                                cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                                otherButtonTitles:nil];
                      [alertView show];
                      [alertView release];
                      
                      return;
                  }
              }
          }
          
          UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                              message:NSLocalizedString(@"TEXT_NO_FAV", @"无收藏")
                                                             delegate:nil
                                                    cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                    otherButtonTitles:nil];
          [alertView show];
          [alertView release];
      }
       fault:^(CMErrorInfo *error) {
           UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                               message:[NSString stringWithFormat:
                                                                        NSLocalizedString(@"TEXT_CALL_FAI", @"调用失败：%d:%@"),
                                                                        [error errorCode],
                                                                        [error errorDescription]]
                                                              delegate:nil
                                                     cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                     otherButtonTitles:nil];
           [alertView show];
           [alertView release];
       }];
}

- (void)sinaReplyCommentHandler:(id)sender
{
    [_focusTextField resignFirstResponder];
    
        //调用回复评论方法，接口文档：https://api.weibo.com/2/comments/reply.json
    //先获取相关平台的App对象
        id<ISSSinaWeiboApp> app = (id<ISSSinaWeiboApp>)[ShareSDK getClientWithType:ShareTypeSinaWeibo];
    
    id<ISSCParameters> params = [ShareSDKCoreService parameters];
    [params addParameter:@"cid" value:_sinaReplyCommendIdField.text];
    [params addParameter:@"id" value:_sinaReplyStatusIdField.text];
    [params addParameter:@"comment" value:_sinaReplyContentField.text];
    
        //调用接口
        [app api:@"https://api.weibo.com/2/comments/reply.json"
      method:SSSinaWeiboRequestMethodPost
      params:params
        user:nil
      result:^(id responder) {
          UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                              message:[NSString stringWithFormat:
                                                                       @"%@",
                                                                       responder]
                                                             delegate:nil
                                                    cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                    otherButtonTitles:nil];
          [alertView show];
          [alertView release];
      }
       fault:^(CMErrorInfo *error) {
           UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                               message:[NSString stringWithFormat:
                                                                        NSLocalizedString(@"TEXT_CALL_FAI", @"调用失败：%d:%@"),
                                                                        [error errorCode],
                                                                        [error errorDescription]]
                                                              delegate:nil
                                                     cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                     otherButtonTitles:nil];
           [alertView show];
           [alertView release];
       }];
}

- (void)getSinaReplyIdHandler:(id)sender
{
    [_focusTextField resignFirstResponder];
    
        //调用回复评论方法，接口文档：https://api.weibo.com/2/comments/reply.json
    //先获取相关平台的App对象
        id<ISSSinaWeiboApp> app = (id<ISSSinaWeiboApp>)[ShareSDK getClientWithType:ShareTypeSinaWeibo];
    
    id<ISSCParameters> params = [ShareSDKCoreService parameters];
    [params addParameter:@"cid" value:_sinaReplyCommendIdField.text];
    [params addParameter:@"id" value:_sinaReplyStatusIdField.text];
    [params addParameter:@"comment" value:_sinaReplyContentField.text];
    
        //调用接口
        [app api:@"https://api.weibo.com/2/comments/reply.json"
      method:SSSinaWeiboRequestMethodPost
      params:params
        user:nil
      result:^(id responder) {
          UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                              message:[NSString stringWithFormat:
                                                                       @"%@",
                                                                       [responder objectForKey:@"id"]]
                                                             delegate:nil
                                                    cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                    otherButtonTitles:nil];
          [alertView show];
          [alertView release];
      }
       fault:^(CMErrorInfo *error) {
           UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                               message:[NSString stringWithFormat:
                                                                        NSLocalizedString(@"TEXT_CALL_FAI", @"调用失败：%d:%@"),
                                                                        [error errorCode],
                                                                        [error errorDescription]]
                                                              delegate:nil
                                                     cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                     otherButtonTitles:nil];
           [alertView show];
           [alertView release];
       }];
}

- (void)getTencentWeiboCommentListHandler:(id)sender
{
    [_focusTextField resignFirstResponder];
    
    //调用获取评论列表方法，接口文档：http://wiki.open.t.qq.com/index.php/API文档/微博接口/获取单条微博的转发或评论列表
    //先获取相关平台的App对象
    id<ISSTencentWeiboApp> app = (id<ISSTencentWeiboApp>)[ShareSDK getClientWithType:ShareTypeTencentWeibo];
    
    id<ISSCParameters> params = [ShareSDKCoreService parameters];
    [params addParameter:@"format" value:@"json"];
    [params addParameter:@"flag" value:@"1"];
    [params addParameter:@"rootid" value:_tencentGetCmtStatusIdField.text];
    [params addParameter:@"pageflag" value:@"0"];
    [params addParameter:@"pagetime" value:@"0"];
    [params addParameter:@"reqnum" value:@"20"];
    [params addParameter:@"twitterid" value:@"0"];
    
    //调用接口
    [app api:@"https://open.t.qq.com/api/t/re_list"
      method:SSTecentWeiboRequestMethodGet
      params:params
        user:nil
      result:^(id responder) {
          UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                              message:[NSString stringWithFormat:
                                                                       @"%@",
                                                                       responder]
                                                             delegate:nil
                                                    cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                    otherButtonTitles:nil];
          [alertView show];
          [alertView release];
      }
       fault:^(CMErrorInfo *error) {
          UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                              message:[NSString stringWithFormat:
                                                                       NSLocalizedString(@"TEXT_CALL_FAI", @"调用失败：%d:%@"),
                                                                       [error errorCode],
                                                                       [error errorDescription]]
                                                             delegate:nil
                                                    cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                    otherButtonTitles:nil];
          [alertView show];
          [alertView release];
      }];
}

- (void)getTencentWeiboLastCommentHandler:(id)sender
{
    [_focusTextField resignFirstResponder];
    
    //调用获取评论列表方法，接口文档：http://wiki.open.t.qq.com/index.php/API文档/微博接口/获取单条微博的转发或评论列表
    //先获取相关平台的App对象
    id<ISSTencentWeiboApp> app = (id<ISSTencentWeiboApp>)[ShareSDK getClientWithType:ShareTypeTencentWeibo];
    
    id<ISSCParameters> params = [ShareSDKCoreService parameters];
    [params addParameter:@"format" value:@"json"];
    [params addParameter:@"flag" value:@"1"];
    [params addParameter:@"rootid" value:_tencentGetCmtStatusIdField.text];
    [params addParameter:@"pageflag" value:@"0"];
    [params addParameter:@"pagetime" value:@"0"];
    [params addParameter:@"reqnum" value:@"20"];
    [params addParameter:@"twitterid" value:@"0"];
    
    //调用接口
    [app api:@"https://open.t.qq.com/api/t/re_list"
      method:SSTecentWeiboRequestMethodGet
      params:params
        user:nil
      result:^(id responder) {
          
          id value = [responder objectForKey:@"info"];
          if ([value isKindOfClass:[NSArray class]] && [value count] > 0)
          {
              id item = [value objectAtIndex:0];
              if ([item isKindOfClass:[NSDictionary class]])
              {
                  UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                                      message:[NSString stringWithFormat:
                                                                               @"%@",
                                                                               [item objectForKey:@"text"]]
                                                                     delegate:nil
                                                            cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                            otherButtonTitles:nil];
                  [alertView show];
                  [alertView release];
              }
          }
          
         
      } fault:^(CMErrorInfo *error) {
          UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                              message:[NSString stringWithFormat:
                                                                       NSLocalizedString(@"TEXT_CALL_FAI", @"调用失败：%d:%@"),
                                                                       [error errorCode],
                                                                       [error errorDescription]]
                                                             delegate:nil
                                                    cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                    otherButtonTitles:nil];
          [alertView show];
          [alertView release];
      }];
}

- (void)getTencentWeiboFavoriteListHandler:(id)sender
{
    [_focusTextField resignFirstResponder];
    
    //调用获取收藏列表方法，接口文档：http://wiki.open.t.qq.com/index.php/API文档/收藏接口/收藏的微博列表
    //先获取相关平台的App对象
    id<ISSTencentWeiboApp> app = (id<ISSTencentWeiboApp>)[ShareSDK getClientWithType:ShareTypeTencentWeibo];
    
    id<ISSCParameters> params = [ShareSDKCoreService parameters];
    [params addParameter:@"format" value:@"json"];
    [params addParameter:@"pageflag" value:@"0"];
    [params addParameter:@"pagetime" value:@"0"];
    [params addParameter:@"reqnum" value:@"20"];
    [params addParameter:@"lastid" value:@"0"];
    
    //调用接口
    [app api:@"https://open.t.qq.com/api/fav/list_t"
      method:SSTecentWeiboRequestMethodGet
      params:params
        user:nil
      result:^(id responder) {
          UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                              message:[NSString stringWithFormat:
                                                                       @"%@",
                                                                       responder]
                                                             delegate:nil
                                                    cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                    otherButtonTitles:nil];
          [alertView show];
          [alertView release];
      }
       fault:^(CMErrorInfo *error) {
          UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示") 
                                                              message:[NSString stringWithFormat:
                                                                       NSLocalizedString(@"TEXT_SHARE_FAI", @"调用失败：%d:%@"),
                                                                       [error errorCode],
                                                                       [error errorDescription]]
                                                             delegate:nil
                                                    cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                    otherButtonTitles:nil];
          [alertView show];
          [alertView release];
      }];
}

- (void)getTencentWeiboLastFavoriteHandler:(id)sender
{
    [_focusTextField resignFirstResponder];
    
    //调用获取收藏列表方法，接口文档：http://wiki.open.t.qq.com/index.php/API文档/收藏接口/收藏的微博列表
    //先获取相关平台的App对象
    id<ISSTencentWeiboApp> app = (id<ISSTencentWeiboApp>)[ShareSDK getClientWithType:ShareTypeTencentWeibo];
    
    id<ISSCParameters> params = [ShareSDKCoreService parameters];
    [params addParameter:@"format" value:@"json"];
    [params addParameter:@"pageflag" value:@"0"];
    [params addParameter:@"pagetime" value:@"0"];
    [params addParameter:@"reqnum" value:@"20"];
    [params addParameter:@"lastid" value:@"0"];
    
    //调用接口
    [app api:@"https://open.t.qq.com/api/fav/list_t"
      method:SSTecentWeiboRequestMethodGet
      params:params
        user:nil
      result:^(id responder) {
          id value = [responder objectForKey:@"info"];
          if ([value isKindOfClass:[NSArray class]] && [value count] > 0)
          {
              id item = [value objectAtIndex:0];
              if ([item isKindOfClass:[NSDictionary class]])
              {
                  UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                                      message:[NSString stringWithFormat:
                                                                               @"%@",
                                                                               [item objectForKey:@"text"]]
                                                                     delegate:nil
                                                            cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                            otherButtonTitles:nil];
                  [alertView show];
                  [alertView release];
                  
                  return;
              }
          }
          
          UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                              message:NSLocalizedString(@"TEXT_NO_FAV", @"无收藏!")
                                                             delegate:nil
                                                    cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                    otherButtonTitles:nil];
          [alertView show];
          [alertView release];
          
      } fault:^(CMErrorInfo *error) {
          UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                              message:[NSString stringWithFormat:
                                                                       NSLocalizedString(@"TEXT_CALL_FAI", @"调用失败：%d:%@"),
                                                                       [error errorCode],
                                                                       [error errorDescription]]
                                                             delegate:nil
                                                    cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                    otherButtonTitles:nil];
          [alertView show];
          [alertView release];
      }];
}

- (void)getTencentWeiboReplyHandler:(id)sender
{
    [_focusTextField resignFirstResponder];
    
    //调用回复微博方法，接口文档：http://wiki.open.t.qq.com/index.php/API文档/微博接口/回复一条微博
    //先获取相关平台的App对象
    id<ISSTencentWeiboApp> app = (id<ISSTencentWeiboApp>)[ShareSDK getClientWithType:ShareTypeTencentWeibo];
    
    id<ISSCParameters> params = [ShareSDKCoreService parameters];
    [params addParameter:@"format" value:@"json"];
    [params addParameter:@"content" value:_tencentReplyContentField.text];
    [params addParameter:@"reid" value:_tencentReplyStatusIdField.text];
    
    //调用接口
    [app api:@"https://open.t.qq.com/api/t/reply"
      method:SSTecentWeiboRequestMethodPost
      params:params
        user:nil
      result:^(id responder) {
          UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                              message:[NSString stringWithFormat:
                                                                       @"%@",
                                                                       responder]
                                                             delegate:nil
                                                    cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                    otherButtonTitles:nil];
          [alertView show];
          [alertView release];
      } fault:^(CMErrorInfo *error) {
          UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                              message:[NSString stringWithFormat:
                                                                       NSLocalizedString(@"TEXT_CALL_FAI", @"调用失败：%d:%@"),
                                                                       [error errorCode],
                                                                       [error errorDescription]]
                                                             delegate:nil
                                                    cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                    otherButtonTitles:nil];
          [alertView show];
          [alertView release];
      }];
}

- (void)getTencentWeiboLastReplyHandler:(id)sender
{
    [_focusTextField resignFirstResponder];
    
    //调用回复微博方法，接口文档：http://wiki.open.t.qq.com/index.php/API文档/微博接口/回复一条微博
    //先获取相关平台的App对象
    id<ISSTencentWeiboApp> app = (id<ISSTencentWeiboApp>)[ShareSDK getClientWithType:ShareTypeTencentWeibo];
    
    id<ISSCParameters> params = [ShareSDKCoreService parameters];
    [params addParameter:@"format" value:@"json"];
    [params addParameter:@"content" value:_tencentReplyContentField.text];
    [params addParameter:@"reid" value:_tencentReplyStatusIdField.text];
    
    //调用接口
    [app api:@"https://open.t.qq.com/api/t/reply"
      method:SSTecentWeiboRequestMethodPost
      params:params
        user:nil
      result:^(id responder) {
          UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                              message:[NSString stringWithFormat:
                                                                       @"%@",
                                                                       [responder objectForKey:@"id"]]
                                                             delegate:nil
                                                    cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                    otherButtonTitles:nil];
          [alertView show];
          [alertView release];
      } fault:^(CMErrorInfo *error) {
          UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                              message:[NSString stringWithFormat:
                                                                       NSLocalizedString(@"TEXT_CALL_FAI", @"调用失败：%d:%@"),
                                                                       [error errorCode],
                                                                       [error errorDescription]]
                                                             delegate:nil
                                                    cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                    otherButtonTitles:nil];
          [alertView show];
          [alertView release];
      }];
}


@end
