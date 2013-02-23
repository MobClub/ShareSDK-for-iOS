//
//  AGSectionView.m
//  AGShareSDKDemo
//
//  Created by 冯 鸿杰 on 13-1-30.
//  Copyright (c) 2013年 vimfung. All rights reserved.
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
