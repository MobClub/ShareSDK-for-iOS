//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.mob.com
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import "RespForWeChatViewController.h"
#import <AGCommon/NSString+Common.h>

#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]

@implementation RespForWeChatViewController
@synthesize delegate = _delegate;
@synthesize m_nsLastText;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)sendAppContent
{
    if (_delegate)
    {
        [_delegate RespAppContent];
    }
}

- (void)sendNonGifContent
{
    if (_delegate) {
        [_delegate RespNonGifContent];
    }
}

- (void)sendGifContent
{
    if (_delegate) {
        [_delegate RespGifContent];
    }
}

-(void) onCancelText
{
    [self dismissModalViewControllerAnimated:YES];
}

-(void) onCompleteText:(NSString*)nsText type:(ShareType)type
{
    [self dismissModalViewControllerAnimated:NO];
    self.m_nsLastText = nsText;
    if (_delegate)
    {
        [_delegate RespTextContent:m_nsLastText] ;
    }
    [self dismissModalViewControllerAnimated:NO];
}

- (void)sendTextContent
{
    TextViewController* viewController = [[[TextViewController alloc] init] autorelease];
    viewController.m_delegate = self;
    viewController.m_nsLastText = m_nsLastText;
    
    
    UINavigationController *navigatitonController = [[[UINavigationController alloc]initWithRootViewController:viewController] autorelease];
	[self presentModalViewController:navigatitonController animated:YES];
}
- (void)sendImageContent
{
    if (_delegate)
    {
        [_delegate RespImageContent];
    }
    [self dismissModalViewControllerAnimated:YES];
}
- (void)sendMusicContent
{
    if (_delegate)
    {
        [_delegate RespMusicContent] ;
    }
    [self dismissModalViewControllerAnimated:YES];
}
- (void)sendVideoContent
{
    if (_delegate)
    {
        [_delegate RespVideoContent] ;
    }
    [self dismissModalViewControllerAnimated:YES];
}
- (void)sendNewsContent
{
    if (_delegate)
    {
        [_delegate RespNewsContent] ;
    }
    [self dismissModalViewControllerAnimated:YES];
}

//- (void)doOAuth
//{
//    if (_delegate)
//    {
//        [_delegate doAuth];
//    }
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    if ([[UIDevice currentDevice].systemVersion versionStringCompare:@"7.0"] != NSOrderedAscending)
    {
        [self setExtendedLayoutIncludesOpaqueBars:NO];
        [self setEdgesForExtendedLayout:SSRectEdgeBottom | SSRectEdgeLeft | SSRectEdgeRight];
    }
    
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 135)];
    [headView setBackgroundColor:RGBCOLOR(0xe1, 0xe0, 0xde)];
    UIImage *image = [UIImage imageNamed:@"micro_messenger.png"];
    NSInteger tlx = (headView.frame.size.width -  image.size.width) / 2;
    NSInteger tly = 20;
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(tlx, tly, image.size.width, image.size.height)];
    [imageView setImage:image];
    [headView addSubview:imageView];
    [imageView release];

    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(0, tly + image.size.height, 320, 40)];
    [title setText:NSLocalizedString(@"TEXT_WECHAT_DEMO", @"微信OpenAPI Sample Demo")];
    title.font = [UIFont systemFontOfSize:17];
    title.textColor = RGBCOLOR(0x11, 0x11, 0x11);
    title.textAlignment = UITextAlignmentCenter;
    title.backgroundColor = [UIColor clearColor];
    [headView addSubview:title];
    [title release];
    
    [self.view addSubview:headView];
    [headView release];
    
    UIView *lineView1 = [[UIView alloc] initWithFrame:CGRectMake(0, headView.frame.size.height, 320, 1)] ; 
    lineView1.backgroundColor = [UIColor blackColor] ; 
    lineView1.alpha = 0.1f ;
    [self.view addSubview:lineView1];
    [lineView1 release];
    
    UIView *lineView2 = [[UIView alloc]initWithFrame:CGRectMake(0, headView.frame.size.height + 1, 320, 1)];
    lineView2.backgroundColor = [UIColor whiteColor];
    lineView2.alpha = 0.25f;
    [self.view addSubview:lineView2];
    [lineView2 release];
    
    UIView *footView = [[UIView alloc]initWithFrame:CGRectMake(0, headView.frame.size.height + 1, 320, 480 - headView.frame.size.height - 2)];
    [footView setBackgroundColor:RGBCOLOR(0xef, 0xef, 0xef)];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:NSLocalizedString(@"TEXT_RESPONSE_WECHAT_TEXT", @"回应文本消息给微信") forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14]; 
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setFrame:CGRectMake(10, 25, 145, 40)];
    [btn addTarget:self action:@selector(sendTextContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn2 setTitle:NSLocalizedString(@"TEXT_RESPONSE_WECHAT_PHOTO", @"回应Photo消息给微信") forState:UIControlStateNormal];
    btn2.titleLabel.font = [UIFont systemFontOfSize:14]; 
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn2 setFrame:CGRectMake(165, 25, 145, 40)];
    [btn2 addTarget:self action:@selector(sendImageContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn2];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn3 setTitle:NSLocalizedString(@"TEXT_RESPONSE_WECHAT_MUSIC", @"回应Music消息给微信") forState:UIControlStateNormal];
    btn3.titleLabel.font = [UIFont systemFontOfSize:14]; 
    [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn3 setFrame:CGRectMake(10, 80, 145, 40)];
    [btn3 addTarget:self action:@selector(sendMusicContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn3];
    
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn4 setTitle:NSLocalizedString(@"TEXT_RESPONSE_WECHAT_NEWS", @"回应News消息给微信") forState:UIControlStateNormal];
    btn4.titleLabel.font = [UIFont systemFontOfSize:14]; 
    [btn4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn4 setFrame:CGRectMake(165, 80, 145, 40)];
    [btn4 addTarget:self action:@selector(sendNewsContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn4];
    
    UIButton *btn5 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn5 setTitle:NSLocalizedString(@"TEXT_RESPONSE_WECHAT_VIDEO", @"回应Video消息给微信") forState:UIControlStateNormal];
    btn5.titleLabel.font = [UIFont systemFontOfSize:14]; 
    [btn5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn5 setFrame:CGRectMake(10, 135, 145, 40)];
    [btn5 addTarget:self action:@selector(sendVideoContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn5];
    
    UIButton *btn6 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn6 setTitle:NSLocalizedString(@"TEXT_RESPONSE_WECHAT_APP", @"回应App消息给微信") forState:UIControlStateNormal];
    btn6.titleLabel.font = [UIFont systemFontOfSize:14]; 
    [btn6 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn6 setFrame:CGRectMake(165, 135, 145, 40)];
    [btn6 addTarget:self action:@selector(sendAppContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn6];
    
    UIButton *btn7 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn7 setTitle:NSLocalizedString(@"TEXT_RESPONSE_WECHAT_NON_GIF", @"回应非gif消息给微信") forState:UIControlStateNormal];
    btn7.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn7 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn7 setFrame:CGRectMake(10, 190, 145, 40)];
    [btn7 addTarget:self action:@selector(sendNonGifContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn7];
    
    UIButton *btn10 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn10 setTitle:NSLocalizedString(@"TEXT_RESPONSE_WECHAT_GIF", @"回应gif消息给微信") forState:UIControlStateNormal];
    btn10.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn10 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn10 setFrame:CGRectMake(165, 190, 145, 40)];
    [btn10 addTarget:self action:@selector(sendGifContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn10];
    
//    UIButton *btn7 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [btn7 setTitle:@"OAuth" forState:UIControlStateNormal];
//    btn7.titleLabel.font = [UIFont systemFontOfSize:14]; 
//    [btn7 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [btn7 setFrame:CGRectMake(10, 190, 145, 40)];
//    [btn7 addTarget:self action:@selector(doOAuth) forControlEvents:UIControlEventTouchUpInside];
//    [footView addSubview:btn7];
    
    [self.view addSubview:footView];
    [footView release];
    
    m_nsLastText = NSLocalizedString(@"TEXT_LAST_TEXT", @"完善的跨终端即时通讯能力，使得Mac可以与PC、手机、Pad等终端的QQ进行无缝沟通，让您的交流更畅快。 完善的跨终端即时通讯能力，使得Mac可以与PC、手机、Pad等终端的QQ进行无缝沟通，让您的交流更畅快。 ");
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.m_nsLastText = nil;
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (void)dealloc
{
    [m_nsLastText release];
    
    [super dealloc];
}

@end
