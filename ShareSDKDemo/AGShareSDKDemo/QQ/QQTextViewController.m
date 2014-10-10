//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.mob.com
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import "QQTextViewController.h"
#import <AGCommon/NSString+Common.h>
#import <Sharesdk/ShareSDK.h>

@implementation QQTextViewController

@synthesize delegate = _delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([[UIDevice currentDevice].systemVersion versionStringCompare:@"7.0"] != NSOrderedAscending)
    {
        [self setExtendedLayoutIncludesOpaqueBars:NO];
        [self setEdgesForExtendedLayout:SSRectEdgeBottom | SSRectEdgeLeft | SSRectEdgeRight];
    }
    
    self.title = NSLocalizedString(@"TEXT_EDIT_TEXT", @"编辑文本消息");
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGRect screenRect = [UIScreen mainScreen].bounds;
    CGRect textViewRect = CGRectMake(10, 10, screenRect.size.width - 10 * 2, 150);
    CGRect textLenLabelRect = CGRectMake(screenRect.size.width - 230, 130, 200, 30);
    
    _textView = [[UITextView alloc]initWithFrame:textViewRect];
	_textView.clipsToBounds = YES;
    _textView.text = NSLocalizedString(@"TEXT_QQ_TEXT", @"你见，或者不见我\
                                       我就在那里\
                                       不悲不喜\
                                       你念，或者不念我\
                                       情就在那里\
                                       不来不去\
                                       你爱，或者不爱我\
                                       爱就在那里\
                                       不增不减\
                                       你跟，或者不跟我\
                                       我的手就在你手里\
                                       不舍不弃\
                                       来我的怀里\
                                       或者\
                                       让我住进你的心里\
                                       默然相爱\
                                       寂静欢喜");
	_textView.font = [UIFont systemFontOfSize:16];
	_textView.textAlignment = UITextAlignmentLeft;
	_textView.contentOffset = CGPointMake(0, 10);
	_textView.autocapitalizationType = UITextAutocapitalizationTypeNone;
	_textView.autocorrectionType = UITextAutocorrectionTypeYes;
	_textView.scrollEnabled = YES;
	_textView.scrollsToTop = YES;
	_textView.showsHorizontalScrollIndicator = YES;
	_textView.enablesReturnKeyAutomatically = YES;
    _textView.returnKeyType = UIReturnKeyDone;
	_textView.delegate = self;
    
	[self.view addSubview:_textView];
	[_textView becomeFirstResponder];
    
    _textLenLabel = [[UILabel alloc] initWithFrame:textLenLabelRect];
    _textLenLabel.text = @"0";
    _textLenLabel.textAlignment = UITextAlignmentRight;
    _textLenLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_textLenLabel];
    
    _textLenLabel.text = [NSString stringWithFormat:@"%ld", (unsigned long)[_textView.text length]];
    
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"TEXT_COMPLETE_3", @"完成") style:UIBarButtonItemStyleDone target:self action:@selector(doneAction:)] autorelease];
    self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"TEXT_BACK", @"返回") style:UIBarButtonItemStyleDone target:self action:@selector(backAction:)] autorelease];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    [_textView release];
    [_textLenLabel release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)textViewDidChange:(UITextView *)textView
{
	NSUInteger len = [textView.text length];
	_textLenLabel.text = [NSString stringWithFormat:@"%ld", (unsigned long)len];
}

- (void)doneAction:(id)sender
{    
    if(_delegate)
    {
        [_delegate onTextViewDone:_textView.text];
    }
}

- (void)backAction:(id)sender
{
    if(_delegate)
    {
        [_delegate onTextViewCancel];
    }
}

@end
