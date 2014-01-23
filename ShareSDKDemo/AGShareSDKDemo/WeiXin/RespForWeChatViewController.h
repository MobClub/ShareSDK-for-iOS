//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "TextViewController.h"

@protocol RespForWeChatViewDelegate <NSObject>
- (void) RespTextContent:(NSString*)nsText;
- (void) RespAppContent;
- (void) RespImageContent;
- (void) RespNewsContent ; 
- (void) RespMusicContent ; 
- (void) RespVideoContent ; 
- (void) RespNonGifContent;
- (void) RespGifContent ;
@end

@interface RespForWeChatViewController : UIViewController <TextViewControllerDelegate>
{
    NSString* m_nsLastText;
}

@property (nonatomic, assign) id<RespForWeChatViewDelegate> delegate;
@property (nonatomic, retain) NSString* m_nsLastText;

@end