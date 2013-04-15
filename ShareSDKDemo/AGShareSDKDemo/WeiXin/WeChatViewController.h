//
//  ViewController.h
//  ApiClient
//
//  Created by Tencent on 12-2-27.
//  Copyright (c) 2012年 Tencent. All rights reserved.
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
