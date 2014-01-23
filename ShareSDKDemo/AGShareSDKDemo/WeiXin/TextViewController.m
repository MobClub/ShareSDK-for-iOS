//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
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

-(void) updateWordCount:(int)wordCount {
	m_wordCountLabel.text = [NSString stringWithFormat:@"%d", wordCount];
}
- (void)textViewDidChange:(UITextView *)textView {
	int words = [textView.text length];
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
