//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.mob.com
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import "AGSinaWeiboStatusCell.h"
#import <AGCommon/UIColor+Common.h>
#import <AGCommon/NSDate+Common.h>
#import <AGCommon/CMRegexKitLite.h>

#define ICON_WIDTH 35.0
#define ICON_HEIGHT 35.0
#define IMAGE_WIDTH 75.0
#define IMaGE_HEIGHT 75.0
#define VIP_ICON_WIDTH 17.0
#define VIP_ICON_HEIGHT 17.0

#define LEFT_PADDING 8.0
#define RIGHT_PADDING 8.0
#define TOP_PADDING 5.0
#define BOTTOM_PADDING 5.0
#define HORIZONTAL_GAP 10.0
#define VERTICAL_GAP 8.0

@implementation AGSinaWeiboStatusCell

@synthesize status = _status;
@synthesize delegate = _delegate;
@synthesize cellHeight = _cellHeight;

- (id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)reuseIdentifier
  imageCacheManager:(CMImageCacheManager *)imageCacheManager
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _imageCacheManager = imageCacheManager;
        
        _iconImageView = [[CMImageView alloc] initWithFrame:CGRectMake(LEFT_PADDING, TOP_PADDING, ICON_WIDTH, ICON_HEIGHT)];
        _iconImageView.defaultImage = [UIImage imageNamed:@"defaultAvatar.png"];
        [self.contentView addSubview:_iconImageView];
        [_iconImageView release];
        
        _vipImageView = [[UIImageView alloc] initWithFrame:CGRectMake(_iconImageView.right - VIP_ICON_WIDTH * 2 /3,
                                                                      _iconImageView.bottom - VIP_ICON_HEIGHT * 2 / 3,
                                                                      VIP_ICON_WIDTH,
                                                                      VIP_ICON_HEIGHT)];
        [self addSubview:_vipImageView];
        [_vipImageView release];
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _nameLabel.backgroundColor = [UIColor clearColor];
        _nameLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_nameLabel];
        [_nameLabel release];
        
        _contentLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _contentLabel.backgroundColor = [UIColor clearColor];
        _contentLabel.font = [UIFont systemFontOfSize:15];
        _contentLabel.numberOfLines = 0;
        [self.contentView addSubview:_contentLabel];
        [_contentLabel release];
        
        _pubDateLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _pubDateLabel.backgroundColor = [UIColor clearColor];
        _pubDateLabel.font = [UIFont systemFontOfSize:8];
        _pubDateLabel.textColor = [UIColor colorWithRGB:0x999999];
        [self.contentView addSubview:_pubDateLabel];
        [_pubDateLabel release];
        
        _sourceLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _sourceLabel.backgroundColor = [UIColor clearColor];
        _sourceLabel.font = [UIFont systemFontOfSize:10];
        _sourceLabel.textColor = [UIColor colorWithRGB:0x999999];
        [self.contentView addSubview:_sourceLabel];
        [_sourceLabel release];
        
        _commentLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _commentLabel.backgroundColor = [UIColor clearColor];
        _commentLabel.font = [UIFont systemFontOfSize:10];
        _commentLabel.textColor = [UIColor colorWithRGB:0x999999];
        [self.contentView addSubview:_commentLabel];
        [_commentLabel release];
        
        _splitLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _splitLabel.text = @"|";
        _splitLabel.backgroundColor = [UIColor clearColor];
        _splitLabel.font = [UIFont systemFontOfSize:10];
        _splitLabel.textColor = [UIColor colorWithRGB:0x999999];
        [_splitLabel sizeToFit];
        [self.contentView addSubview:_splitLabel];
        [_splitLabel release];
        
        _replyLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _replyLabel.backgroundColor = [UIColor clearColor];
        _replyLabel.font = [UIFont systemFontOfSize:10];
        _replyLabel.textColor = [UIColor colorWithRGB:0x999999];
        [self.contentView addSubview:_replyLabel];
        [_replyLabel release];
        
        _lineImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"SinaWeiboLine.jpg"]];
        [self.contentView addSubview:_lineImageView];
        [_lineImageView release];
    }
    return self;
}

- (void)dealloc
{
    _delegate = nil;
    _imageCacheManager = nil;
    _contentLabel = nil;
    _pubDateLabel = nil;
    _sourceLabel = nil;
    _commentLabel = nil;
    _splitLabel = nil;
    _replyLabel = nil;
    _picImageView = nil;
    _refContentView = nil;
    _nameLabel = nil;
    _lineImageView = nil;
    
    [_iconLoader removeAllNotificationWithTarget:self];
    SAFE_RELEASE(_iconLoader);
    [_picLoader removeAllNotificationWithTarget:self];
    SAFE_RELEASE(_picLoader);
    SAFE_RELEASE(_status);
    
    [super dealloc];
}

- (void)setStatus:(SSSinaWeiboStatusInfoReader *)status
{
    [status retain];
    SAFE_RELEASE(_status);
    _status = status;
    
    _needLayout = YES;
    [self setNeedsLayout];
}

- (CGFloat)layoutThatStaus:(SSSinaWeiboStatusInfoReader *)status isCalCellHeight:(BOOL)isCalCellHeight
{
    CGFloat height = 0;
    
    [_iconLoader removeAllNotificationWithTarget:self];
    SAFE_RELEASE(_iconLoader);
    [_picLoader removeAllNotificationWithTarget:self];
    SAFE_RELEASE(_picLoader);
    
        //头像
        _iconLoader = [[_imageCacheManager getImage:status.user.avatarLarge cornerRadius:5.0 size:_iconImageView.frame.size] retain];
    if (_iconLoader.state == ImageLoaderStateReady)
    {
        _iconImageView.image = _iconLoader.content;
    }
    else
    {
        [_iconLoader addNotificationWithName:NOTIF_IMAGE_LOAD_COMPLETE
                                      target:self
                                      action:@selector(iconLoadCompleteHandler:)];
        [_iconLoader addNotificationWithName:NOTIF_IMAGE_LOAD_ERROR
                                      target:self
                                      action:@selector(iconLoadErrorHandler:)];
    }
    
        //认证类型
        if (status.user.verified)
    {
        
        switch (status.user.verifiedType)
        {
            case 0:
                                //个人认证
                                _vipImageView.image = [UIImage imageNamed:@"Vip.png"];
                _vipImageView.hidden = NO;
                break;
            case 5:
            case 2:
            case 3:
                                //企业认证
                                _vipImageView.image = [UIImage imageNamed:@"EnterpriseVip.png"];
                _vipImageView.hidden = NO;
                break;
            default:
                _vipImageView.hidden = YES;
                break;
        }
    }
    else
    {
        if (status.user.verifiedType == 220)
        {
                        //达人
                        _vipImageView.image = [UIImage imageNamed:@"Grassroot.png"];
            _vipImageView.hidden = NO;
        }
        else
        {
            _vipImageView.hidden = YES;
        }
    }
    
        //发布时间
        NSDate *date = [NSDate dateByStringFormat:@"EEE MMM dd HH:mm:ss zzz yyyy"
                                   dateString:status.createdAt
                                       locale:[[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"] autorelease]];
    _pubDateLabel.text = [NSDate stringByStringFormat:@"yy-MM-dd" data:date];
    [_pubDateLabel sizeToFit];
    _pubDateLabel.frame = CGRectMake(self.width - RIGHT_PADDING - _pubDateLabel.width, TOP_PADDING, _pubDateLabel.width, _pubDateLabel.height);
    
    CGFloat left = _iconImageView.right + HORIZONTAL_GAP;
    
        //发布人名称
        _nameLabel.text = status.user.name;
    [_nameLabel sizeToFit];
    CGFloat nameLabelWidth = _nameLabel.width;
    if (nameLabelWidth > _pubDateLabel.left - left)
    {
        nameLabelWidth = _pubDateLabel.left - left;
    }
    _nameLabel.frame = CGRectMake(left, TOP_PADDING, nameLabelWidth, _nameLabel.height);
    
    _contentLabel.text = status.text;
    _contentLabel.frame = [_contentLabel textRectForBounds:CGRectMake(left, _nameLabel.bottom, self.width - left - RIGHT_PADDING, MAXFLOAT)
                                    limitedToNumberOfLines:0];
    
    if (_iconImageView.bottom > _contentLabel.bottom)
    {
        height = _iconImageView.bottom;
    }
    else
    {
        height = _contentLabel.bottom;
    }
    
        //判断是否转发
        if (status.retweetedStatus)
    {
        _picImageView.hidden = YES;
        
        if (_refContentView == nil)
        {
            _refContentView = [[AGSinaWeiboRefContentView alloc] initWithFrame:CGRectMake(left, height + VERTICAL_GAP, self.width - left - RIGHT_PADDING, 0) imageCacheManager:_imageCacheManager];
            _refContentView.delegate = self;
            [self.contentView addSubview:_refContentView];
            [_refContentView release];
        }
        _refContentView.frame = CGRectMake(left, height + VERTICAL_GAP, self.width - left - RIGHT_PADDING, 0);
        _refContentView.hidden = NO;
        _refContentView.status = status.retweetedStatus;
        
        height = _refContentView.bottom;
    }
    else
    {
        _refContentView.hidden = YES;
        
                //判断是否有图片
                if (status.thumbnailPic)
        {
                        //获取图片显示
                        if (_picImageView == nil)
            {
                _picImageView = [[CMImageView alloc] initWithFrame:CGRectMake(left, height + VERTICAL_GAP, IMAGE_WIDTH, IMaGE_HEIGHT)];
                [self.contentView addSubview:_picImageView];
                [_picImageView release];
                [_picImageView addTarget:self action:@selector(picClickHandler:) forControlEvents:UIControlEventTouchUpInside];
            }
            _picImageView.hidden = NO;
            _picImageView.frame = CGRectMake(left, height + VERTICAL_GAP, IMAGE_WIDTH, IMaGE_HEIGHT);
            
            _picLoader = [[_imageCacheManager getImage:status.thumbnailPic] retain];
            if (_picLoader.state == ImageLoaderStateReady)
            {
                _picImageView.image = _picLoader.content;
            }
            else
            {
                [_picLoader addNotificationWithName:NOTIF_IMAGE_LOAD_COMPLETE
                                             target:self
                                             action:@selector(picLoadCompleteHandler:)];
                [_picLoader addNotificationWithName:NOTIF_IMAGE_LOAD_ERROR
                                             target:self
                                             action:@selector(picLoadErrorHandler:)];
            }
            
            height = _picImageView.bottom;
        }
        else
        {
            _picImageView.hidden = YES;
        }
    }
    
        //来源
        NSString *source = [status.source stringByReplacingOccurrencesOfRegex:@"<a[^>]*>(.*)</a>"
                                                               usingBlock:^NSString *(NSInteger captureCount, NSString *const *capturedStrings, const NSRange *capturedRanges, volatile BOOL *const stop) {
                                                                   if (captureCount > 1)
                                                                   {
                                                                       return capturedStrings[1];
                                                                   }
                                                                   
                                                                   return NSLocalizedString(@"TEXT_UNKNOWN_APP", @"未知应用");
                                                               }];
    _sourceLabel.text = [NSString stringWithFormat:NSLocalizedString(@"TEXT_SOURCE", @"来自 %@"), source];
    [_sourceLabel sizeToFit];
    _sourceLabel.frame = CGRectMake(left, height + VERTICAL_GAP, _sourceLabel.width, _sourceLabel.height);
    
        //评论
        _commentLabel.text = [NSString stringWithFormat:NSLocalizedString(@"TEXT_COMMENT", @"评论:%d"), status.commentsCount];
    [_commentLabel sizeToFit];
    _commentLabel.frame = CGRectMake(self.width - RIGHT_PADDING - _commentLabel.width, height + VERTICAL_GAP, _commentLabel.width, _commentLabel.height);
    
        //分隔线
        _splitLabel.frame = CGRectMake(_commentLabel.left - _splitLabel.width, _commentLabel.top, _splitLabel.width, _splitLabel.height);
    
        //转发
        _replyLabel.text = [NSString stringWithFormat:NSLocalizedString(@"TEXT_REPOSE", @"转发:%d"), status.repostsCount];
    [_replyLabel sizeToFit];
    _replyLabel.frame = CGRectMake(_splitLabel.left - _replyLabel.width, _commentLabel.top, _replyLabel.width, _replyLabel.height);
    
    height = _sourceLabel.bottom;
    
        //分隔线
        _lineImageView.frame = CGRectMake((self.width - _lineImageView.width) / 2, height + BOTTOM_PADDING, _lineImageView.width, _lineImageView.height);
    height = _lineImageView.bottom;
    
    return height;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (_needLayout)
    {
        _needLayout = NO;
        
        _cellHeight = [self layoutThatStaus:_status isCalCellHeight:NO];
    }
}

#pragma mark - Private

- (void)iconLoadCompleteHandler:(NSNotification *)notif
{
    _iconImageView.image = _iconLoader.content;
    
    [_iconLoader removeAllNotificationWithTarget:self];
    SAFE_RELEASE(_iconLoader);
}

- (void)iconLoadErrorHandler:(NSNotification *)notif
{
    [_iconLoader removeAllNotificationWithTarget:self];
    SAFE_RELEASE(_iconLoader);
}

- (void)picLoadCompleteHandler:(NSNotification *)notif
{
    _picImageView.image = _picLoader.content;
    
    [_iconLoader removeAllNotificationWithTarget:self];
    SAFE_RELEASE(_iconLoader);
}

- (void)picLoadErrorHandler:(NSNotification *)notif
{
    [_iconLoader removeAllNotificationWithTarget:self];
    SAFE_RELEASE(_iconLoader);
}

- (void)picClickHandler:(id)sender
{
    if ([_delegate conformsToProtocol:@protocol(AGSinaWeiboStatusCellDelegate)] &&
        [_delegate respondsToSelector:@selector(cell:onShowPic:)])
    {
        [_delegate cell:self onShowPic:_status.originalPic];
    }
}

#pragma mark - AGSinaWeiboRefContentViewDelegate

- (void)contentView:(AGSinaWeiboRefContentView *)contentView showPic:(NSString *)imageUrl
{
    if ([_delegate conformsToProtocol:@protocol(AGSinaWeiboStatusCellDelegate)] &&
        [_delegate respondsToSelector:@selector(cell:onShowPic:)])
    {
        [_delegate cell:self onShowPic:imageUrl];
    }
}

@end
