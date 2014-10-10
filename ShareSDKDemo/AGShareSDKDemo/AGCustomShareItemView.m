//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.mob.com
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import "AGCustomShareItemView.h"

#define ICON_WIDTH 30.0
#define ICON_HEIGHT 30.0

@implementation AGCustomShareItemView

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier clickHandler:(void(^)(NSIndexPath *indexPath))clickHandler
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self)
    {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake((self.width - ICON_WIDTH) / 2, (self.height - ICON_HEIGHT) / 2, ICON_WIDTH, ICON_HEIGHT)];
        _iconImageView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
        [self addSubview:_iconImageView];
        [_iconImageView release];
        
        _clickHandler = [clickHandler copy];
    }
    return self;
}

- (void)dealloc
{
    _iconImageView = nil;
    
    SAFE_RELEASE(_clickHandler);
    
    [super dealloc];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    
    if (_clickHandler)
    {
        ((void(^)(NSIndexPath *indexPath))_clickHandler)(self.indexPath);
    }
}

@end
