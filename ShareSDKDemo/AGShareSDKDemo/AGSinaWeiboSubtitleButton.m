//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.mob.com
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
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
