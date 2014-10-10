//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.mob.com
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
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