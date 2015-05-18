//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.mob.com
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "TextViewController.h"
#import <AGCommon/NSString+Common.h>

#define TABLECELLLEFTMARGIN 10
#define TABLECELLRIGHTMARGIN 5
#define COLLABELWIDTH  50
#define COLLABELWIDTHLONG  80
#define TEXTFIELDWIDTH   (screenRect.size.width - TEXTFIELDLEFTMARGIN * 2)
#define TEXTFIELDLEFTMARGIN 10
#define TEXTFIELDTOPMARGIN 10
#define TEXTFIELDHEIGHT 148
#define TEXTVIEWCONTENTINSETTOP 6
#define TEXTVIEWCONTENTINSETBOTTOM 6

@implementation TextViewController

@synthesize m_delegate;
@synthesize m_nsLastText;
@synthesize type = _type;

-(void) updateWordCount:(NSUInteger)wordCount {
	m_wordCountLabel.text = [NSString stringWithFormat:@"%ld", (unsigned long)wordCount];
}
- (void)textViewDidChange:(UITextView *)textView {
	NSUInteger words = [textView.text length];
	[self updateWordCount:words];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
//	if ([text isEqualToString:@"\n"]) {
//			[self.navigationController popViewControllerAnimated:YES];
//		return NO;
//	}
	return YES;
}

-(void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}

-(void)initTextView{
	CGRect screenRect = [UIScreen mainScreen].bounds;
	CGRect descriptionRect = CGRectMake(TEXTFIELDLEFTMARGIN, TEXTFIELDTOPMARGIN, TEXTFIELDWIDTH, TEXTFIELDHEIGHT);
	m_textView = [[[UITextView alloc]initWithFrame:descriptionRect] autorelease];
	//m_textView.borderStyle = UITextBorderStyleRoundedRect;
	m_textView.layer.cornerRadius = 5.0;
	m_textView.clipsToBounds = YES;
    m_textView.text = m_nsLastText;
	m_textView.font = [UIFont systemFontOfSize:16];
	m_textView.textAlignment = UITextAlignmentLeft;
	descriptionRect.size.height = m_textView.contentSize.height;
	m_textView.frame = descriptionRect;
	m_textView.contentOffset = CGPointMake(0, 10);
	m_textView.autocapitalizationType = UITextAutocapitalizationTypeNone;
	m_textView.autocorrectionType = UITextAutocorrectionTypeYes;
	m_textView.scrollEnabled = YES;
	m_textView.scrollsToTop = YES;
	m_textView.showsHorizontalScrollIndicator = YES;
	m_textView.enablesReturnKeyAutomatically = YES; 	
	
	UIEdgeInsets edgeInset = UIEdgeInsetsMake(-TEXTVIEWCONTENTINSETTOP,0,-TEXTVIEWCONTENTINSETBOTTOM,0);
	UIEdgeInsets edgeInsetIndicator = UIEdgeInsetsMake(-TEXTVIEWCONTENTINSETTOP,0,-TEXTVIEWCONTENTINSETBOTTOM,0);
	m_textView.contentInset = edgeInset;
	m_textView.scrollIndicatorInsets = edgeInsetIndicator;
	[m_textView setReturnKeyType: UIReturnKeyDefault];
	m_textView.delegate = self;
    
	[self.view addSubview:m_textView];
	[m_textView becomeFirstResponder];
	
	CGRect wordCountRect = CGRectMake(descriptionRect.origin.x+descriptionRect.size.width-70, descriptionRect.origin.y+descriptionRect.size.height-32, 64, 32);
	m_wordCountLabel = [[[UILabel alloc] initWithFrame:wordCountRect] autorelease];
	m_wordCountLabel.backgroundColor = [UIColor clearColor];
	m_wordCountLabel.textAlignment = UITextAlignmentRight;
	[self.view addSubview:m_wordCountLabel];
	[self textViewDidChange:m_textView];
}

- (void)OnDone {
    [m_delegate onCompleteText:m_textView.text type:_type];
}

- (void)OnBack {
    [m_delegate onCancelText];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([[UIDevice currentDevice].systemVersion versionStringCompare:@"7.0"] != NSOrderedAscending)
    {
        [self setExtendedLayoutIncludesOpaqueBars:NO];
        [self setEdgesForExtendedLayout:SSRectEdgeBottom | SSRectEdgeLeft | SSRectEdgeRight];
    }
	
	self.title = NSLocalizedString(@"TEXT_EDIT_TEXT", @"编辑消息");
    self.view.backgroundColor = [UIColor whiteColor];
	
	[self initTextView];
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"TEXT_COMPLETE", @"完成") style:UIBarButtonItemStyleDone target:self action:@selector(OnDone)] autorelease];
    self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"TEXT_BACK", @"返回") style:UIBarButtonItemStyleDone target:self action:@selector(OnBack)] autorelease];
}

- (void)dealloc {
    self.m_nsLastText = nil;
    
    [super dealloc];
}


@end
