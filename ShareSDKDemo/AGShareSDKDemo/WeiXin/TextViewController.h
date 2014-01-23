//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
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
