//
//  TextViewController.h
//  MicroMessenger
//
//  Created by Tencent on 12-3-21.
//  Copyright 2012 Tecent. All rights reserved.
//

#import <ShareSDK/ShareSDK.h>

@protocol TextViewControllerDelegate
-(void) onCancelText;
-(void) onCompleteText:(NSString*)nsText type:(ShareType)type;
@end

@interface TextViewController : UIViewController<UITextViewDelegate> {
	UITextView *m_textView;
	id<TextViewControllerDelegate> m_delegate;
	UILabel* m_wordCountLabel;
    NSString* m_nsLastText;
    ShareType _type;
}

@property (nonatomic,assign) id<TextViewControllerDelegate> m_delegate;
@property (nonatomic,retain) NSString* m_nsLastText;
@property (nonatomic) ShareType type;

@end
