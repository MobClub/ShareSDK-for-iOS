//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.mob.com
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import "AGSinaWeiboRefContentView.h"

#define PADDING_TOP 12.0
#define PADDING_LEFT 8.0
#define PADDING_RIGHT 8.0
#define PADDING_BOTTOM 8.0
#define VERTICAL_GAP 4.0

#define IMAGE_WIDTH 75
#define IMAGE_HEIGHT 75

@implementation AGSinaWeiboRefContentView

@synthesize status = _status;
@synthesize delegate = _delegate;

- (id)initWithFrame:(CGRect)frame imageCacheManager:(CMImageCacheManager *)imageCacheManager;
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _imageCacheManager = imageCacheManager;
        
        _backgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"SinaWeiboRetweetBG.png"] stretchableImageWithLeftCapWidth:26 topCapHeight:10]];
        _backgroundView.frame = self.bounds;
        _backgroundView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        [self addSubview:_backgroundView];
        [_backgroundView release];
        
        _contentLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _contentLabel.backgroundColor = [UIColor clearColor];
        _contentLabel.font = [UIFont systemFontOfSize:15];
        _contentLabel.numberOfLines = 0;
        [self addSubview:_contentLabel];
        [_contentLabel release];
    }
    return self;
}

- (void)dealloc
{
    _imageCacheManager = nil;
    _backgroundView = nil;
    _contentLabel = nil;
    _imageView = nil;
    _delegate = nil;
    
    [_imageLoader removeAllNotificationWithTarget:self];
    SAFE_RELEASE(_imageLoader);
    SAFE_RELEASE(_status);
    
    [super dealloc];
}

- (void)setStatus:(SSSinaWeiboStatusInfoReader *)status
{
    [status retain];
    SAFE_RELEASE(_status);
    _status = status;
    
    [_imageLoader removeAllNotificationWithTarget:self];
    SAFE_RELEASE(_imageLoader);
    
    _contentLabel.text = _status.text;
    _contentLabel.frame = [_contentLabel textRectForBounds:CGRectMake(PADDING_LEFT, PADDING_TOP, self.width - PADDING_LEFT - PADDING_RIGHT, MAXFLOAT)
                                    limitedToNumberOfLines:0];
    
    CGFloat height = _contentLabel.bottom;
    
    if (status.thumbnailPic)
    {
        if (_imageView == nil)
        {
            _imageView = [[CMImageView alloc] initWithFrame:CGRectMake(PADDING_LEFT, _contentLabel.bottom + VERTICAL_GAP, IMAGE_WIDTH, IMAGE_HEIGHT)];
            [self addSubview:_imageView];
            [_imageView release];
            [_imageView addTarget:self action:@selector(picClickHandler:) forControlEvents:UIControlEventTouchUpInside];
        }
        
        _imageView.frame = CGRectMake(PADDING_LEFT, _contentLabel.bottom + VERTICAL_GAP, IMAGE_WIDTH, IMAGE_HEIGHT);
        _imageView.hidden = NO;
        
        _imageLoader = [[_imageCacheManager getImage:status.thumbnailPic] retain];
        if (_imageLoader.state == ImageLoaderStateReady)
        {
            _imageView.image = _imageLoader.content;
        }
        else
        {
            [_imageLoader addNotificationWithName:NOTIF_IMAGE_LOAD_COMPLETE
                                           target:self
                                           action:@selector(imageLoadCompleteHanlder:)];
            [_imageLoader addNotificationWithName:NOTIF_IMAGE_LOAD_ERROR
                                           target:self
                                           action:@selector(imageLoadErrorHandler:)];
        }
        
        height = _imageView.bottom;
    }
    else
    {
        _imageView.hidden = YES;
    }
    
    height += PADDING_BOTTOM;
    
        //调整视图尺寸
        self.frame = CGRectMake(self.left, self.top, self.width, height);
}

#pragma mark - Private

- (void)imageLoadCompleteHanlder:(NSNotification *)notif
{
    _imageView.image = _imageLoader.content;
    
    [_imageLoader removeAllNotificationWithTarget:self];
    SAFE_RELEASE(_imageLoader);
}

- (void)imageLoadErrorHandler:(NSNotification *)notif
{
    [_imageLoader removeAllNotificationWithTarget:self];
    SAFE_RELEASE(_imageLoader);
}


- (void)picClickHandler:(id)sender
{
    if ([_delegate conformsToProtocol:@protocol(AGSinaWeiboRefContentViewDelegate)] &&
        [_delegate respondsToSelector:@selector(contentView:showPic:)])
    {
        [_delegate contentView:self showPic:_status.originalPic];
    }
}

@end
