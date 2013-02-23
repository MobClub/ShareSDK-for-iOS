//
//  RespForWeChatViewController.h
//  SDKSample
//
//  Created by Tencent on 12-4-9.
//  Copyright (c) 2012年 Tencent. All rights reserved.
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