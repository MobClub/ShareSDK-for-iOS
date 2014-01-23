//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
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
