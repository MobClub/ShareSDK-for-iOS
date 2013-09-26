//
//  AGCustomShareViewController.m
//  AGShareSDKDemo
//
//  Created by 冯 鸿杰 on 13-3-5.
//  Copyright (c) 2013年 vimfung. All rights reserved.
//

#import "AGCustomShareViewController.h"
#import "AGCustomAtPlatListViewController.h"
#import <AGCommon/UIImage+Common.h>
#import <AGCommon/UIDevice+Common.h>
#import <AGCommon/UINavigationBar+Common.h>
#import <AGCommon/UIColor+Common.h>
#import <AGCommon/NSString+Common.h>
#import "AGAppDelegate.h"

#define IMAGE_WIDTH 80.0
#define IMAGE_HEIGHT 80.0
#define IMAGE_LANDSCAPE_WIDTH 50.0
#define IMAGE_LANDSCAPE_HEIGHT 50.0

#define TOOLBAR_HEIGHT 40

#define PADDING_LEFT 1.0
#define PADDING_TOP 1.0
#define PADDING_RIGHT 1.0
#define PADDING_BOTTOM 2.0
#define HORIZONTAL_GAP 2.0
#define VERTICAL_GAP 5.0

#define IMAGE_PADDING_TOP 19
#define IMAGE_PADDING_RIGHT 10

#define PIN_PADDING_TOP 4

#define AT_BUTTON_PADDING_LEFT 9
#define AT_BUTTON_PADDING_BOTTOM 6
#define AT_BUTTON_WIDTH 34
#define AT_BUTTON_HEIGHT 29
#define AT_BUTTON_HORIZONTAL_GAP 9.0

#define WORD_COUNT_LABEL_PADDING_RIGHT 10
#define WORD_COUNT_LABEL_PADDING_BOTTOM 19

@implementation AGCustomShareViewController

- (id)initWithImage:(UIImage *)image
            content:(NSString *)content
{
    self = [self init];
    if (self)
    {
        _appDelegate = (AGAppDelegate *)[UIApplication sharedApplication].delegate;
        _image = [image retain];
        _content = [content copy];
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        UIButton *leftBtn = [[[UIButton alloc] init] autorelease];
        [leftBtn setBackgroundImage:[UIImage imageNamed:@"NavigationButtonBG.png"]
                           forState:UIControlStateNormal];
        [leftBtn setTitle:@"取消" forState:UIControlStateNormal];
        leftBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        leftBtn.frame = CGRectMake(0.0, 0.0, 53.0, 30.0);
        [leftBtn addTarget:self action:@selector(cancelButtonClickHandler:) forControlEvents:UIControlEventTouchUpInside];
        
        self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:leftBtn] autorelease];
        
        UIButton *rightBtn = [[[UIButton alloc] init] autorelease];
        [rightBtn setBackgroundImage:[UIImage imageNamed:@"NavigationButtonBG.png"]
                           forState:UIControlStateNormal];
        [rightBtn setTitle:@"发布" forState:UIControlStateNormal];
        rightBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        rightBtn.frame = CGRectMake(0.0, 0.0, 53.0, 30.0);
        [rightBtn addTarget:self action:@selector(publishButtonClickHandler:) forControlEvents:UIControlEventTouchUpInside];

        self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:rightBtn] autorelease];
        
        if ([UIDevice currentDevice].isPad)
        {
            UILabel *label = [[UILabel alloc] init];
            label.backgroundColor = [UIColor clearColor];
            label.textColor = [UIColor whiteColor];
            label.shadowColor = [UIColor grayColor];
            label.font = [UIFont systemFontOfSize:22];
            self.navigationItem.titleView = label;
            [label release];
        }
        
        self.title = @"内容分享";
    }
    return self;
}

- (void)dealloc
{
    _picImageView = nil;
    _textView = nil;
    _toolbar = nil;
    
    SAFE_RELEASE(_image);
    SAFE_RELEASE(_content);
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
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
    
    self.view.backgroundColor = [UIColor blackColor];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShowHandler:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHideHandler:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    _contentBG = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"SharePanelBG.png"] stretchableImageWithLeftCapWidth:12 topCapHeight:11]];
    _contentBG.frame = CGRectMake(PADDING_LEFT, PADDING_TOP, self.view.width - PADDING_LEFT - PADDING_RIGHT, self.view.height - TOOLBAR_HEIGHT - VERTICAL_GAP - PADDING_BOTTOM);
    _contentBG.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:_contentBG];
    [_contentBG release];
    
    _toolbarBG = [[UIImageView alloc] initWithImage:nil];
    _toolbarBG.frame = CGRectMake(PADDING_LEFT + 1, _contentBG.bottom + VERTICAL_GAP, self.view.width - PADDING_LEFT - PADDING_RIGHT - 2, TOOLBAR_HEIGHT);
    _toolbarBG.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    [self.view addSubview:_toolbarBG];
    [_toolbarBG release];
	
    //图片
    _picBG = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ShareImageBG.png"]];
    _picBG.frame = CGRectMake(self.view.width - IMAGE_PADDING_RIGHT - _picBG.width, IMAGE_PADDING_TOP, _picBG.width, _picBG.height);
    _picBG.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    [self.view addSubview:_picBG];
    [_picBG release];
    
    _picImageView = [[CMImageView alloc] initWithFrame:CGRectMake(_picBG.left + 3, _picBG.top + 3, _picBG.width - 6, _picBG.height - 6)];
    _picImageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    _picImageView.image = _image;
    [self.view addSubview:_picImageView];
    [_picImageView release];
    
    _pinImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"SharePin.png"]];
    _pinImageView.frame = CGRectMake(self.view.width - _pinImageView.width, PIN_PADDING_TOP, _pinImageView.width, _pinImageView.height);
    _pinImageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    [self.view addSubview:_pinImageView];
    [_pinImageView release];
    
    //文本框
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(PADDING_LEFT,
                                                             PADDING_TOP + 1,
                                                             _picBG.left - HORIZONTAL_GAP - PADDING_LEFT,
                                                             _contentBG.bottom - AT_BUTTON_PADDING_BOTTOM - AT_BUTTON_HEIGHT - VERTICAL_GAP - 1)];
    _textView.backgroundColor = [UIColor clearColor];
    _textView.font = [UIFont systemFontOfSize:18.0];
    _textView.text = _content;
    _textView.delegate = self;
    _textView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:_textView];
    [_textView release];
    
    if (!_image)
    {
        _picBG.hidden = YES;
        _picImageView.hidden = YES;
        _pinImageView.hidden = YES;
        _textView.frame = CGRectMake(PADDING_LEFT,
                                     PADDING_TOP + 1,
                                     _contentBG.right - PADDING_RIGHT - PADDING_LEFT,
                                     _contentBG.bottom - AT_BUTTON_PADDING_BOTTOM - AT_BUTTON_HEIGHT - VERTICAL_GAP - 1);
    }
    
    //工具栏
    _toolbar = [[AGCustomShareViewToolbar alloc] initWithFrame:CGRectMake(_toolbarBG.left + 2, _toolbarBG.top, _toolbarBG.width - 4, _toolbarBG.height)];
    _toolbar.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    [self.view addSubview:_toolbar];
    [_toolbar release];
    
    _atButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_atButton setBackgroundImage:[UIImage imageNamed:@"atButton.png"] forState:UIControlStateNormal];
    _atButton.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    _atButton.frame = CGRectMake(_contentBG.left + AT_BUTTON_PADDING_LEFT, _contentBG.bottom - AT_BUTTON_PADDING_BOTTOM - AT_BUTTON_HEIGHT, AT_BUTTON_WIDTH, AT_BUTTON_HEIGHT);
    [_atButton addTarget:self action:@selector(addbuttonClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_atButton];
    
    _atTipsLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _atTipsLabel.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    _atTipsLabel.backgroundColor = [UIColor clearColor];
    _atTipsLabel.textColor = [UIColor colorWithRGB:0xd2d2d2];
    _atTipsLabel.text = @"提醒微博好友查看";
    _atTipsLabel.font = [UIFont boldSystemFontOfSize:12];
    [_atTipsLabel sizeToFit];
    _atTipsLabel.frame = CGRectMake(_atButton.right + AT_BUTTON_HORIZONTAL_GAP,
                                    _atButton.top + (_atButton.height - _atTipsLabel.height) / 2,
                                    _atTipsLabel.width,
                                    _atTipsLabel.height);
    [self.view addSubview:_atTipsLabel];
    [_atTipsLabel release];
    
    //字数
    _wordCountLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _wordCountLabel.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    _wordCountLabel.backgroundColor = [UIColor clearColor];
    _wordCountLabel.textColor = [UIColor colorWithRGB:0xd2d2d2];
    _wordCountLabel.text = @"140";
    _wordCountLabel.font = [UIFont boldSystemFontOfSize:16];
    [_wordCountLabel sizeToFit];
    _wordCountLabel.frame = CGRectMake(_contentBG.right - WORD_COUNT_LABEL_PADDING_RIGHT - _wordCountLabel.width,
                                       _contentBG.bottom - WORD_COUNT_LABEL_PADDING_BOTTOM - _wordCountLabel.height,
                                       _wordCountLabel.width,
                                       _wordCountLabel.height);
    [self.view addSubview:_wordCountLabel];
    [_wordCountLabel release];
    
    [self updateWordCount];
    [_textView becomeFirstResponder];
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
    [btn setBackgroundImage:[UIImage imageNamed:@"NavigationButtonBG.png"]
                   forState:UIControlStateNormal];
    
    if (![UIDevice currentDevice].isPad)
    {
        _toolbarBG.hidden = NO;
        _atTipsLabel.hidden = NO;
        _wordCountLabel.hidden = NO;
        
        _contentBG.frame = CGRectMake(PADDING_LEFT,
                                      PADDING_TOP,
                                      self.view.width - PADDING_LEFT - PADDING_RIGHT,
                                      self.view.height - TOOLBAR_HEIGHT - VERTICAL_GAP - PADDING_BOTTOM - _keyboardHeight);
        _toolbarBG.frame = CGRectMake(PADDING_LEFT + 1,
                                      _contentBG.bottom + VERTICAL_GAP,
                                      self.view.width - PADDING_LEFT - PADDING_RIGHT - 2,
                                      TOOLBAR_HEIGHT);
        
        _textView.frame = CGRectMake(PADDING_LEFT,
                                     PADDING_TOP + 1,
                                     _picBG.left - HORIZONTAL_GAP - PADDING_LEFT,
                                     _contentBG.bottom - AT_BUTTON_PADDING_BOTTOM - AT_BUTTON_HEIGHT - VERTICAL_GAP - 1);
        
        _toolbar.frame = CGRectMake(_toolbarBG.left + 2, _toolbarBG.top, _toolbarBG.width - 4, _toolbarBG.height);
        
        _atButton.frame = CGRectMake(_contentBG.left + AT_BUTTON_PADDING_LEFT, _contentBG.bottom - AT_BUTTON_PADDING_BOTTOM - AT_BUTTON_HEIGHT, AT_BUTTON_WIDTH, AT_BUTTON_HEIGHT);
        _atTipsLabel.frame = CGRectMake(_atButton.right + AT_BUTTON_HORIZONTAL_GAP,
                                        _atButton.top + (_atButton.height - _atTipsLabel.height) / 2,
                                        _atTipsLabel.width,
                                        _atTipsLabel.height);
        _wordCountLabel.frame = CGRectMake(_contentBG.right - WORD_COUNT_LABEL_PADDING_RIGHT - _wordCountLabel.width,
                                           _contentBG.bottom - WORD_COUNT_LABEL_PADDING_BOTTOM - _wordCountLabel.height,
                                           _wordCountLabel.width,
                                           _wordCountLabel.height);
    }
}

- (void)layoutLandscape
{
    if (![UIDevice currentDevice].isPad)
    {
        //iPhone
        UIButton *btn = (UIButton *)self.navigationItem.leftBarButtonItem.customView;
        btn.frame = CGRectMake(btn.left, btn.top, 48.0, 24.0);
        [btn setBackgroundImage:[UIImage imageNamed:@"NavigationButtonBG_Landscape.png"]
                       forState:UIControlStateNormal];
        
        if (_keyboardHeight > 0)
        {
            _toolbarBG.hidden = YES;
            _atTipsLabel.hidden = YES;
            _wordCountLabel.hidden = YES;
            
            _contentBG.frame = CGRectMake(PADDING_LEFT,
                                          PADDING_TOP,
                                          self.view.width - PADDING_LEFT - PADDING_RIGHT,
                                          self.view.height - PADDING_BOTTOM - _keyboardHeight);
            
            if (_image)
            {
                _textView.frame = CGRectMake(PADDING_LEFT,
                                             PADDING_TOP + 1,
                                             _picBG.left - HORIZONTAL_GAP - PADDING_LEFT,
                                             _contentBG.bottom - AT_BUTTON_PADDING_BOTTOM - AT_BUTTON_HEIGHT - VERTICAL_GAP - 1);
            }
            else
            {
                _textView.frame = CGRectMake(PADDING_LEFT,
                                             PADDING_TOP + 1,
                                             _contentBG.right - PADDING_RIGHT - PADDING_LEFT,
                                             _contentBG.bottom - AT_BUTTON_PADDING_BOTTOM - AT_BUTTON_HEIGHT - VERTICAL_GAP - 1);
            }
            
            _atButton.frame = CGRectMake(_contentBG.left + AT_BUTTON_PADDING_LEFT, _contentBG.bottom - AT_BUTTON_PADDING_BOTTOM - AT_BUTTON_HEIGHT, AT_BUTTON_WIDTH, AT_BUTTON_HEIGHT);
            _toolbar.frame = CGRectMake(_atButton.right + HORIZONTAL_GAP, _contentBG.bottom - TOOLBAR_HEIGHT,_picBG.left - _atButton.right - 2 *HORIZONTAL_GAP, TOOLBAR_HEIGHT);
        }
        else
        {
            _toolbarBG.hidden = NO;
            _atTipsLabel.hidden = NO;
            _wordCountLabel.hidden = NO;
            
            _contentBG.frame = CGRectMake(PADDING_LEFT,
                                          PADDING_TOP,
                                          self.view.width - PADDING_LEFT - PADDING_RIGHT,
                                          self.view.height - TOOLBAR_HEIGHT - VERTICAL_GAP - PADDING_BOTTOM - _keyboardHeight);
            _toolbarBG.frame = CGRectMake(PADDING_LEFT + 1,
                                          _contentBG.bottom + VERTICAL_GAP,
                                          self.view.width - PADDING_LEFT - PADDING_RIGHT - 2,
                                          TOOLBAR_HEIGHT);
            
            if (_image)
            {
                _textView.frame = CGRectMake(PADDING_LEFT,
                                             PADDING_TOP + 1,
                                             _picBG.left - HORIZONTAL_GAP - PADDING_LEFT,
                                             _contentBG.bottom - AT_BUTTON_PADDING_BOTTOM - AT_BUTTON_HEIGHT - VERTICAL_GAP - 1);
            }
            else
            {
                _textView.frame = CGRectMake(PADDING_LEFT,
                                             PADDING_TOP + 1,
                                             _contentBG.right - PADDING_RIGHT - PADDING_LEFT,
                                             _contentBG.bottom - AT_BUTTON_PADDING_BOTTOM - AT_BUTTON_HEIGHT - VERTICAL_GAP - 1);
            }
            
            _toolbar.frame = CGRectMake(_toolbarBG.left + 2, _toolbarBG.top, _toolbarBG.width - 4, _toolbarBG.height);
            
            _atButton.frame = CGRectMake(_contentBG.left + AT_BUTTON_PADDING_LEFT, _contentBG.bottom - AT_BUTTON_PADDING_BOTTOM - AT_BUTTON_HEIGHT, AT_BUTTON_WIDTH, AT_BUTTON_HEIGHT);
            _atTipsLabel.frame = CGRectMake(_atButton.right + AT_BUTTON_HORIZONTAL_GAP,
                                            _atButton.top + (_atButton.height - _atTipsLabel.height) / 2,
                                            _atTipsLabel.width,
                                            _atTipsLabel.height);
            _wordCountLabel.frame = CGRectMake(_contentBG.right - WORD_COUNT_LABEL_PADDING_RIGHT - _wordCountLabel.width,
                                               _contentBG.bottom - WORD_COUNT_LABEL_PADDING_BOTTOM - _wordCountLabel.height,
                                               _wordCountLabel.width,
                                               _wordCountLabel.height);
        }
    }
    else
    {
        UIButton *btn = (UIButton *)self.navigationItem.leftBarButtonItem.customView;
        btn.frame = CGRectMake(btn.left, btn.top, 55.0, 32.0);
        [btn setBackgroundImage:[UIImage imageNamed:@"NavigationButtonBG.png"
                                         bundleName:BUNDLE_NAME]
                       forState:UIControlStateNormal];
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

#pragma mark - Private

- (void)updateWordCount
{
    NSInteger count = 140 - [_textView.text length];
    _wordCountLabel.text = [NSString stringWithFormat:@"%d", count];
    
    if (count < 0)
    {
        _wordCountLabel.textColor = [UIColor redColor];
    }
    else
    {
        _wordCountLabel.textColor = [UIColor colorWithRGB:0xd2d2d2];
    }
    
    [_wordCountLabel sizeToFit];
    _wordCountLabel.frame = CGRectMake(_contentBG.right - WORD_COUNT_LABEL_PADDING_RIGHT - _wordCountLabel.width,
                                       _contentBG.bottom - WORD_COUNT_LABEL_PADDING_BOTTOM - _wordCountLabel.height,
                                       _wordCountLabel.width,
                                       _wordCountLabel.height);
}

- (void)addbuttonClickHandler:(id)sender
{
    AGCustomAtPlatListViewController *vc = [[[AGCustomAtPlatListViewController alloc] initWithChangeHandler:^(NSArray *users, ShareType shareType) {
        NSMutableString *usersString = [NSMutableString string];
        for (int i = 0; i < [users count]; i++)
        {
            NSDictionary *userInfo = [users objectAtIndex:i];
            switch (shareType)
            {
                case ShareTypeTwitter:
                {
                    [usersString appendFormat:@" @%@ ", [userInfo objectForKey:@"screen_name"]];
                    break;
                }
                case ShareTypeTencentWeibo:
                {
                    [usersString appendFormat:@" @%@ ", [userInfo objectForKey:@"name"]];
                    break;
                }
                default:
                {
                    [usersString appendFormat:@" @%@ ", [userInfo objectForKey:@"screen_name"]];
                    break;
                }
            }
        }
        
        _textView.text = [_textView.text stringByAppendingString:usersString];
        [self updateWordCount];
        
        [_textView performSelector:@selector(becomeFirstResponder) withObject:nil afterDelay:0.1];
    } cancelHandler:^{
        
        [_textView becomeFirstResponder];
        
    }] autorelease];
    UINavigationController *navVC = [[[UINavigationController alloc] initWithRootViewController:vc] autorelease];
    
    if ([UIDevice currentDevice].isPad)
    {
        navVC.modalPresentationStyle = UIModalPresentationFormSheet;
    }
    
    [self presentModalViewController:navVC animated:YES];
}

- (void)cancelButtonClickHandler:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)publishButtonClickHandler:(id)sender
{
    NSArray *selectedClients = [_toolbar selectedClients];
    if ([selectedClients count] == 0)
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                            message:@"请选择要发布的平台!"
                                                           delegate:nil
                                                  cancelButtonTitle:@"知道了"
                                                  otherButtonTitles: nil];
        [alertView show];
        [alertView release];
        
        return;
    }
    
    id<ISSContent> publishContent = [ShareSDK content:_textView.text
                                       defaultContent:nil
                                                image:[ShareSDK jpegImageWithImage:_picImageView.image quality:1]
                                                title:@"ShareSDK"
                                                  url:@"http://www.sharesdk.cn"
                                          description:@"这是一条测试信息"
                                            mediaType:SSPublishContentMediaTypeText];
    
    [publishContent addQQSpaceUnitWithTitle:@"Hello QQ空间"
                                        url:INHERIT_VALUE
                                       site:nil
                                    fromUrl:nil
                                    comment:INHERIT_VALUE
                                    summary:INHERIT_VALUE
                                      image:INHERIT_VALUE
                                       type:INHERIT_VALUE
                                    playUrl:nil
                                       nswb:nil];
    [publishContent addInstapaperContentWithUrl:@"http://www.sharesdk.cn"
                                          title:@"Hello Instapaper"
                                    description:INHERIT_VALUE];
    [publishContent addYouDaoNoteUnitWithContent:INHERIT_VALUE
                                           title:@"Hello 有道云笔记"
                                          author:INHERIT_VALUE
                                          source:@"http://www.sharesdk.cn"
                                     attachments:INHERIT_VALUE];
    
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
    
    BOOL needAuth = NO;
    if ([selectedClients count] == 1)
    {
        ShareType shareType = [[selectedClients objectAtIndex:0] integerValue];
        if (![ShareSDK hasAuthorizedWithType:shareType])
        {
            needAuth = YES;
            [ShareSDK getUserInfoWithType:shareType
                              authOptions:authOptions
                                   result:^(BOOL result, id<ISSUserInfo> userInfo, id<ICMErrorInfo> error) {
                                       if (result)
                                       {
                                           //分享内容
                                           [ShareSDK oneKeyShareContent:publishContent
                                                              shareList:selectedClients
                                                            authOptions:authOptions
                                                          statusBarTips:YES
                                                                 result:nil];
                                           
                                           [self dismissModalViewControllerAnimated:YES];
                                       }
                                       else
                                       {
                                           UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                                                               message:[NSString stringWithFormat:@"发送失败!%@", [error errorDescription]]
                                                                                              delegate:nil
                                                                                     cancelButtonTitle:@"知道了"
                                                                                     otherButtonTitles:nil];
                                           [alertView show];
                                           [alertView release];
                                       }
                                   }];
        }
    }
    
    if (!needAuth)
    {
        //分享内容
        [ShareSDK oneKeyShareContent:publishContent
                           shareList:selectedClients
                         authOptions:authOptions
                       statusBarTips:YES
                              result:nil];
        
        [self dismissModalViewControllerAnimated:YES];
    }
}

- (void)keyboardWillShowHandler:(NSNotification *)notif
{
    CGRect keyboardFrame;
    NSValue *value =[[notif userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey];
    [value getValue:&keyboardFrame];
    
    CGFloat fixedHeight = 0;
    
    if (UIInterfaceOrientationIsLandscape(self.interfaceOrientation))
    {
        _keyboardHeight = keyboardFrame.size.width;
        
        fixedHeight = (self.view.height + self.navigationController.navigationBar.height) - ([UIScreen mainScreen].bounds.size.width - _keyboardHeight - 20);
    }
    else
    {
        _keyboardHeight = keyboardFrame.size.height;
        
        fixedHeight = _keyboardHeight - ([UIScreen mainScreen].bounds.size.height - self.view.height - self.navigationController.navigationBar.height - 20) / 2;
    }
    
    [UIView beginAnimations:@"change" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:0.15];
    
    if ([UIDevice currentDevice].isPad)
    {
        _toolbarBG.hidden = NO;
        _atTipsLabel.hidden = NO;
        _wordCountLabel.hidden = NO;
        _keyboardHeight = keyboardFrame.size.height;
        
        _contentBG.frame = CGRectMake(PADDING_LEFT,
                                      PADDING_TOP,
                                      self.view.width - PADDING_LEFT - PADDING_RIGHT,
                                      self.view.height - TOOLBAR_HEIGHT - VERTICAL_GAP - PADDING_BOTTOM - fixedHeight);
        _toolbarBG.frame = CGRectMake(PADDING_LEFT + 1,
                                      _contentBG.bottom + VERTICAL_GAP,
                                      self.view.width - PADDING_LEFT - PADDING_RIGHT - 2,
                                      TOOLBAR_HEIGHT);
        
        if (_image)
        {
            _textView.frame = CGRectMake(PADDING_LEFT,
                                         PADDING_TOP + 1,
                                         _picBG.left - HORIZONTAL_GAP - PADDING_LEFT,
                                         _contentBG.bottom - AT_BUTTON_PADDING_BOTTOM - AT_BUTTON_HEIGHT - VERTICAL_GAP - 1);
        }
        else
        {
            _textView.frame = CGRectMake(PADDING_LEFT,
                                         PADDING_TOP + 1,
                                         _contentBG.right - PADDING_RIGHT - PADDING_LEFT,
                                         _contentBG.bottom - AT_BUTTON_PADDING_BOTTOM - AT_BUTTON_HEIGHT - VERTICAL_GAP - 1);
        }
        
        
        _toolbar.frame = CGRectMake(_toolbarBG.left + 2, _toolbarBG.top, _toolbarBG.width - 4, _toolbarBG.height);
        
        _atButton.frame = CGRectMake(_contentBG.left + AT_BUTTON_PADDING_LEFT, _contentBG.bottom - AT_BUTTON_PADDING_BOTTOM - AT_BUTTON_HEIGHT, AT_BUTTON_WIDTH, AT_BUTTON_HEIGHT);
        _atTipsLabel.frame = CGRectMake(_atButton.right + AT_BUTTON_HORIZONTAL_GAP,
                                        _atButton.top + (_atButton.height - _atTipsLabel.height) / 2,
                                        _atTipsLabel.width,
                                        _atTipsLabel.height);
        _wordCountLabel.frame = CGRectMake(_contentBG.right - WORD_COUNT_LABEL_PADDING_RIGHT - _wordCountLabel.width,
                                           _contentBG.bottom - WORD_COUNT_LABEL_PADDING_BOTTOM - _wordCountLabel.height,
                                           _wordCountLabel.width,
                                           _wordCountLabel.height);
    }
    else
    {
        if (UIInterfaceOrientationIsLandscape(self.interfaceOrientation))
        {
            _toolbarBG.hidden = YES;
            _atTipsLabel.hidden = YES;
            _wordCountLabel.hidden = YES;
            _keyboardHeight = keyboardFrame.size.width;
            
            _contentBG.frame = CGRectMake(PADDING_LEFT,
                                          PADDING_TOP,
                                          self.view.width - PADDING_LEFT - PADDING_RIGHT,
                                          self.view.height - PADDING_BOTTOM - _keyboardHeight);
            
            if (_image)
            {
                _textView.frame = CGRectMake(PADDING_LEFT,
                                             PADDING_TOP + 1,
                                             _picBG.left - HORIZONTAL_GAP - PADDING_LEFT,
                                             _contentBG.bottom - AT_BUTTON_PADDING_BOTTOM - AT_BUTTON_HEIGHT - VERTICAL_GAP - 1);
            }
            else
            {
                _textView.frame = CGRectMake(PADDING_LEFT,
                                             PADDING_TOP + 1,
                                             _contentBG.right - PADDING_RIGHT - PADDING_LEFT,
                                             _contentBG.bottom - AT_BUTTON_PADDING_BOTTOM - AT_BUTTON_HEIGHT - VERTICAL_GAP - 1);
            }
            
            _atButton.frame = CGRectMake(_contentBG.left + AT_BUTTON_PADDING_LEFT, _contentBG.bottom - AT_BUTTON_PADDING_BOTTOM - AT_BUTTON_HEIGHT, AT_BUTTON_WIDTH, AT_BUTTON_HEIGHT);
            _toolbar.frame = CGRectMake(_atButton.right + HORIZONTAL_GAP, _contentBG.bottom - TOOLBAR_HEIGHT,_picBG.left - _atButton.right - 2 *HORIZONTAL_GAP, TOOLBAR_HEIGHT);
        }
        else
        {
            _toolbarBG.hidden = NO;
            _atTipsLabel.hidden = NO;
            _wordCountLabel.hidden = NO;
            _keyboardHeight = keyboardFrame.size.height;
            
            _contentBG.frame = CGRectMake(PADDING_LEFT,
                                          PADDING_TOP,
                                          self.view.width - PADDING_LEFT - PADDING_RIGHT,
                                          self.view.height - TOOLBAR_HEIGHT - VERTICAL_GAP - PADDING_BOTTOM - _keyboardHeight);
            _toolbarBG.frame = CGRectMake(PADDING_LEFT + 1,
                                          _contentBG.bottom + VERTICAL_GAP,
                                          self.view.width - PADDING_LEFT - PADDING_RIGHT - 2,
                                          TOOLBAR_HEIGHT);
            
            if (_image)
            {
                _textView.frame = CGRectMake(PADDING_LEFT,
                                             PADDING_TOP + 1,
                                             _picBG.left - HORIZONTAL_GAP - PADDING_LEFT,
                                             _contentBG.bottom - AT_BUTTON_PADDING_BOTTOM - AT_BUTTON_HEIGHT - VERTICAL_GAP - 1);
            }
            else
            {
                _textView.frame = CGRectMake(PADDING_LEFT,
                                             PADDING_TOP + 1,
                                             _contentBG.right - PADDING_RIGHT - PADDING_LEFT,
                                             _contentBG.bottom - AT_BUTTON_PADDING_BOTTOM - AT_BUTTON_HEIGHT - VERTICAL_GAP - 1);
            }
            
            _toolbar.frame = CGRectMake(_toolbarBG.left + 2, _toolbarBG.top, _toolbarBG.width - 4, _toolbarBG.height);

            _atButton.frame = CGRectMake(_contentBG.left + AT_BUTTON_PADDING_LEFT, _contentBG.bottom - AT_BUTTON_PADDING_BOTTOM - AT_BUTTON_HEIGHT, AT_BUTTON_WIDTH, AT_BUTTON_HEIGHT);
            _atTipsLabel.frame = CGRectMake(_atButton.right + AT_BUTTON_HORIZONTAL_GAP,
                                            _atButton.top + (_atButton.height - _atTipsLabel.height) / 2,
                                            _atTipsLabel.width,
                                            _atTipsLabel.height);
            _wordCountLabel.frame = CGRectMake(_contentBG.right - WORD_COUNT_LABEL_PADDING_RIGHT - _wordCountLabel.width,
                                               _contentBG.bottom - WORD_COUNT_LABEL_PADDING_BOTTOM - _wordCountLabel.height,
                                               _wordCountLabel.width,
                                               _wordCountLabel.height);
        }
    }
    [UIView commitAnimations];
}

- (void)keyboardWillHideHandler:(NSNotification *)notif
{
    _keyboardHeight = 0;
    
    [UIView beginAnimations:@"change" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:0.15];
    
    _toolbarBG.hidden = NO;
    _atTipsLabel.hidden = NO;
    
    _contentBG.frame = CGRectMake(PADDING_LEFT,
                                  PADDING_TOP,
                                  self.view.width - PADDING_LEFT - PADDING_RIGHT,
                                  self.view.height - TOOLBAR_HEIGHT - VERTICAL_GAP - PADDING_BOTTOM - _keyboardHeight);
    _toolbarBG.frame = CGRectMake(PADDING_LEFT + 1,
                                  _contentBG.bottom + VERTICAL_GAP,
                                  self.view.width - PADDING_LEFT - PADDING_RIGHT - 2,
                                  TOOLBAR_HEIGHT);
    
    if (_image)
    {
        _textView.frame = CGRectMake(PADDING_LEFT,
                                     PADDING_TOP + 1,
                                     _picBG.left - HORIZONTAL_GAP - PADDING_LEFT,
                                     _contentBG.bottom - AT_BUTTON_PADDING_BOTTOM - AT_BUTTON_HEIGHT - VERTICAL_GAP - 1);
    }
    else
    {
        _textView.frame = CGRectMake(PADDING_LEFT,
                                     PADDING_TOP + 1,
                                     _contentBG.right - PADDING_RIGHT - PADDING_LEFT,
                                     _contentBG.bottom - AT_BUTTON_PADDING_BOTTOM - AT_BUTTON_HEIGHT - VERTICAL_GAP - 1);
    }
    
    _toolbar.frame = CGRectMake(_toolbarBG.left + 2, _toolbarBG.top, _toolbarBG.width - 4, _toolbarBG.height);
    
    _atButton.frame = CGRectMake(_contentBG.left + AT_BUTTON_PADDING_LEFT, _contentBG.bottom - AT_BUTTON_PADDING_BOTTOM - AT_BUTTON_HEIGHT, AT_BUTTON_WIDTH, AT_BUTTON_HEIGHT);
    _atTipsLabel.frame = CGRectMake(_atButton.right + AT_BUTTON_HORIZONTAL_GAP,
                                    _atButton.top + (_atButton.height - _atTipsLabel.height) / 2,
                                    _atTipsLabel.width,
                                    _atTipsLabel.height);
    _wordCountLabel.frame = CGRectMake(_contentBG.right - WORD_COUNT_LABEL_PADDING_RIGHT - _wordCountLabel.width,
                                       _contentBG.bottom - WORD_COUNT_LABEL_PADDING_BOTTOM - _wordCountLabel.height,
                                       _wordCountLabel.width,
                                       _wordCountLabel.height);
    
    [UIView commitAnimations];
}

#pragma mark - UITextViewDelegate

- (void)textViewDidChange:(UITextView *)textView
{
    [self updateWordCount];
}

@end
