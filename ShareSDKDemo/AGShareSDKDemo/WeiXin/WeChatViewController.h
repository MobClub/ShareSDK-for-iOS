//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.mob.com
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
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
