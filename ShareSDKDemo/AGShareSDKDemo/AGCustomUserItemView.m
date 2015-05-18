//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.mob.com
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import "AGCustomUserItemView.h"

#define ICON_WIDTH 30.0
#define ICON_HEIGHT 30.0

@implementation AGCustomUserItemView

@synthesize userInfo = _userInfo;

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier
            imageCacheManager:(CMImageCacheManager *)imageCacheManager
                    shareType:(ShareType)shareType
                 clickHandler:(void(^)(NSMutableDictionary *userInfo))clickHandler
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        
        _shareType = shareType;
        _imageCacheManager = [imageCacheManager retain];
        _clickHandler = [clickHandler copy];
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake((self.width - ICON_WIDTH) / 2,
                                                                       (self.height - ICON_HEIGHT) / 2,
                                                                       ICON_WIDTH,
                                                                       ICON_HEIGHT)];
        _iconImageView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
        [self addSubview:_iconImageView];
        [_iconImageView release];
        
        _maskImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"UserIconBG.png"]];
        _maskImageView.frame = _iconImageView.frame;
        _maskImageView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
        [self addSubview:_maskImageView];
        [_maskImageView release];
    }
    return self;
}

- (void)dealloc
{
    [_loader removeAllNotificationWithTarget:self];
    SAFE_RELEASE(_loader);
    
    SAFE_RELEASE(_userInfo);
    SAFE_RELEASE(_imageCacheManager);
    SAFE_RELEASE(_clickHandler);
    _iconImageView = nil;
    
    [super dealloc];
}

- (void)setUserInfo:(NSMutableDictionary *)userInfo
{
    [userInfo retain];
    SAFE_RELEASE(_userInfo);
    _userInfo = userInfo;
    
    _iconImageView.image = nil;
    
    _needLayout = YES;
    [self setNeedsLayout];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (_needLayout)
    {
        _needLayout = NO;
        
        NSString *icon = nil;
        switch (_shareType)
        {
            case ShareTypeSinaWeibo:
            {
                id value = [_userInfo objectForKey:@"avatar_large"];
                if ([value isKindOfClass:[NSString class]])
                {
                    icon = value;
                }
                break;
            }
            case ShareTypeTencentWeibo:
            {
                id value = [_userInfo objectForKey:@"head"];
                if ([value isKindOfClass:[NSString class]] && ![value isEqualToString:@""])
                {
                    icon = [NSString stringWithFormat:@"%@/120", value];
                }
                break;
            }
            case ShareTypeTwitter:
            {
                id value = [_userInfo objectForKey:@"profile_image_url"];
                if ([value isKindOfClass:[NSString class]])
                {
                    icon = value;
                }
                break;
            }
            default:
                break;
        }
        
        [_loader removeAllNotificationWithTarget:self];
        SAFE_RELEASE(_loader);
        
        _loader = [[_imageCacheManager getImage:icon cornerRadius:5.0 size:_iconImageView.frame.size] retain];
        if (_loader.state == ImageLoaderStateReady)
        {
            _iconImageView.image = _loader.content;
        }
        else
        {
            [_loader addNotificationWithName:NOTIF_IMAGE_LOAD_COMPLETE
                                      target:self
                                      action:@selector(iconLoadCompleteHandler:)];
            [_loader addNotificationWithName:NOTIF_IMAGE_LOAD_ERROR
                                      target:self
                                      action:@selector(iconLoadErrorHandler:)];
        }
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    
    if (_clickHandler)
    {
        ((void(^)(NSDictionary *userInfo))_clickHandler)(_userInfo);
    }
}

#pragma mark - Private

- (void)iconLoadCompleteHandler:(NSNotification *)notif
{
    _iconImageView.image = _loader.content;
    
    [_loader removeAllNotificationWithTarget:self];
    SAFE_RELEASE(_loader);
}

- (void)iconLoadErrorHandler:(NSNotification *)notif
{
    [_loader removeAllNotificationWithTarget:self];
    SAFE_RELEASE(_loader);
}

@end
