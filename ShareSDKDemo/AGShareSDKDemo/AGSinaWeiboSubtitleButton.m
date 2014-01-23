//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import "AGSinaWeiboSubtitleButton.h"
#import <AGCommon/UIColor+Common.h>

@implementation AGSinaWeiboSubtitleButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _subtitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _subtitleLabel.textColor = [UIColor colorWithRGB:0x666666];
        _subtitleLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:_subtitleLabel];
        [_subtitleLabel release];
    }
    return self;
}

- (void)dealloc
{
    _subtitleLabel = nil;
    
    [super dealloc];
}

- (void)setSubtitle:(NSString *)label
{
    _subtitleLabel.text = label;
    [self setNeedsLayout];
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_subtitleLabel sizeToFit];
    
    CGFloat top = (self.height - self.titleLabel.height - _subtitleLabel.height) / 2;
    
    self.titleLabel.frame = CGRectMake(self.titleLabel.left, top, self.titleLabel.width, self.titleLabel.height);
    _subtitleLabel.frame = CGRectMake((self.width - _subtitleLabel.width) / 2, self.titleLabel.bottom, _subtitleLabel.width, _subtitleLabel.height);
}

@end
