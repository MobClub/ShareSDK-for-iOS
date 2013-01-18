//
//  TextViewController.mm
//  MicroMessenger
//
//  Created by Tencent on 12-3-21.
//  Copyright 2012 Tecent. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "TextViewController.h"

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
    [m_delegate onCompleteText:m_textView.text];
}

- (void)OnBack {
    [m_delegate onCancelText];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.title = @"编辑消息";
    self.view.backgroundColor = [UIColor whiteColor];
	
	[self initTextView];
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(OnDone)] autorelease];
    self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(OnBack)] autorelease];
}

- (void)dealloc {
    self.m_nsLastText = nil;
    
    [super dealloc];
}


@end
