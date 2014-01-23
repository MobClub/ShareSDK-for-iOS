//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "TextViewController.h"
#import "WXApiObject.h"

@class AGAppDelegate;

@protocol sendMsgToWeChatViewDelegate <NSObject>
- (void) sendTextContent:(NSString*)nsText;
- (void) sendAppContent;
- (void) sendImageContent;
- (void) sendNewsContent ; 
- (void) sendMusicContent ; 
- (void) sendVideoContent ; 
- (void) sendNonGifContent;
- (void) sendGifContent;
- (void) doAuth;
- (void) changeScene:(NSInteger)scene;
@end

@interface WeChatViewController : UIViewController < TextViewControllerDelegate >
{
    NSString* m_nsLastText;
    UIViewController *_parentController;
    AGAppDelegate *_appDelegate;
}

@property (nonatomic, assign) id<sendMsgToWeChatViewDelegate> delegate;
@property (nonatomic, retain) NSString* m_nsLastText;
@property (nonatomic, assign) UIViewController *parentController;

@end
