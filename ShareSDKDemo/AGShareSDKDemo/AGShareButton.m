//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
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
