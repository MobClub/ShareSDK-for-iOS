//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.mob.com
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import "AGShareButton.h"
#import <AGCommon/UIColor+Common.h>

#define MIN_WIDTH 55.0
#define MIN_HEIGHT 32.0

@implementation AGShareButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self setTitleShadowColor:[UIColor colorWithRGB:0x6e0000] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageNamed:@"ShareButtonBG.png"] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    }
    return self;
}

- (void)sizeToFit
{
    [super sizeToFit];
    
    CGRect rect = self.frame;
    if (rect.size.width < MIN_WIDTH)
    {
        rect.size.width = MIN_WIDTH;
    }
    if (rect.size.height < MIN_HEIGHT)
    {
        rect.size.height = MIN_HEIGHT;
    }
    self.frame = rect;
}

@end
