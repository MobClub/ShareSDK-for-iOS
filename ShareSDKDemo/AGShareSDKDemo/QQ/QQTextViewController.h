//
//  TextViewController.h
//  QQApiDemo
//
//  Created by Tencent on 12-5-16.
//  Copyright 2012年 Tencent. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol QQTextViewControllerDelegate
- (void)onTextViewCancel;
- (void)onTextViewDone:(NSString*)text;
@end

@interface QQTextViewController : UIViewController<UITextViewDelegate>
{
    UITextView* _textView;
    UILabel*    _textLenLabel;
    id<QQTextViewControllerDelegate> _delegate;
}

@property (nonatomic, assign) id<QQTextViewControllerDelegate> delegate;

@end
