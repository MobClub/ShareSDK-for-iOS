//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
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
