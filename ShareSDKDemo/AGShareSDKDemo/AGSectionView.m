//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.mob.com
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import "AGSectionView.h"
#import <AGCommon/UIColor+Common.h>

@implementation AGSectionView

@synthesize titleLabel = _titleLabel;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        UIImageView *bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"IndexSep.png"]];
        bgImageView.frame = CGRectMake(0.0, 0.0, self.width, self.height);
        bgImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:bgImageView];
        [bgImageView release];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 0.0, self.width - 20.0, self.height)];
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textColor = [UIColor colorWithRGB:0xc9beaa];
        [self addSubview:_titleLabel];
        [_titleLabel release];
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    _titleLabel.frame = CGRectMake(10.0, 0.0, self.width - 20.0, self.height);
}

@end
