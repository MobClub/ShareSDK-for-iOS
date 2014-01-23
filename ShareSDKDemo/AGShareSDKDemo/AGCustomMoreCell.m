//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import "AGCustomMoreCell.h"

@implementation AGCustomMoreCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        // Initialization code
        _indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [_indicatorView sizeToFit];
        [_indicatorView startAnimating];
        [self.contentView addSubview:_indicatorView];
        [_indicatorView release];
        
        _label = [[UILabel alloc] initWithFrame:CGRectZero];
        _label.font = [UIFont systemFontOfSize:16];
        _label.text = NSLocalizedString(@"TEXT_LOADING", @"加载中...");
        [_label sizeToFit];
        [self.contentView addSubview:_label];
        [_label release];
    }
    return self;
}

- (void)dealloc
{
    _indicatorView = nil;
    _label = nil;
    
    [super dealloc];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (!_indicatorView.isAnimating)
    {
        [_indicatorView startAnimating];
    }
    
    CGFloat left = (self.contentView.width - _indicatorView.width - _label.width) / 2;
    _indicatorView.frame = CGRectMake(left, (self.height - _indicatorView.height) / 2, _indicatorView.width, _indicatorView.height);
    _label.frame = CGRectMake(_indicatorView.right, (self.height - _label.height) / 2, _label.width, _label.height);
}

@end
