//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.mob.com
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import "AGSinaWeiboUserInfoHeaderView.h"
#import <AGCommon/UIColor+Common.h>
#import <ShareSDK/ShareSDK.h>
#import "AGAppDelegate.h"
#import <SinaWeiboConnection/SSSinaWeiboUserInfoReader.h>

#define ICON_WIDTH 40.0
#define ICON_HEIGHT 40.0
#define ITEM_WIDTH 70
#define ITEM_HEIGHT 60
#define GENDER_ICON_WIDTH 16.0
#define GENDER_ICON_HEIGHT 16.0
#define VIP_ICON_WIDTH 17.0
#define VIP_ICON_HEIGHT 17.0
#define FOLLOW_BUTTON_WIDTH 100
#define FOLLOW_BUTTON_HEIGHT 30

#define TOP_PADDING 5.0
#define LEFT_PADDING 11.0
#define RIGHT_PADDING 11.0
#define HORIZONTAL_GAP 6.0
#define VERTICAL_GAP 6.0
#define ICON_HORIZONTAL_GAP 9.0
#define ICON_VETICAL_GAP 6.0

#define INFO_PANEL_HEIGHT 70

@implementation AGSinaWeiboUserInfoHeaderView

@synthesize friendsButton = _friendsButton;
@synthesize followerButton = _followerButton;
@synthesize infoButton = _infoButton;
@synthesize delegate = _delegate;

- (id)initWithFrame:(CGRect)frame imageCacheManager:(CMImageCacheManager *)imageCacheManager
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _imageCacheManager = imageCacheManager;
        
        _backgroundImageView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"SinaWeiboHeaderTopBG.png"] stretchableImageWithLeftCapWidth:3 topCapHeight:35]];
        _backgroundImageView.frame = CGRectMake(0.0, 0.0, self.width, _backgroundImageView.height);
        _backgroundImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [self addSubview:_backgroundImageView];
        [_backgroundImageView release];
        
        _iconImageView = [[CMImageView alloc] initWithFrame:CGRectMake(LEFT_PADDING, TOP_PADDING, ICON_WIDTH, ICON_HEIGHT)];
        _iconImageView.defaultImage = [UIImage imageNamed:@"defaultAvatar.png"];
        [self addSubview:_iconImageView];
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
        [self addSubview:_nameLabel];
        [_nameLabel release];
        
        _genderImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, GENDER_ICON_WIDTH, GENDER_ICON_HEIGHT)];
        [self addSubview:_genderImageView];
        [_genderImageView release];
        
        _locationLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _locationLabel.backgroundColor = [UIColor clearColor];
        _locationLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:_locationLabel];
        [_locationLabel release];
        
        _descLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _descLabel.backgroundColor = [UIColor clearColor];
        _descLabel.font = [UIFont systemFontOfSize:11];
        [self addSubview:_descLabel];
        [_descLabel release];
        
        _followButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_followButton];
        
        UIImage *buttonBGImage = [[UIImage imageNamed:@"SinaWeiboButtonBG"] stretchableImageWithLeftCapWidth:4 topCapHeight:30];
        
        _statusesButton = [[AGSinaWeiboSubtitleButton alloc] initWithFrame:CGRectMake(LEFT_PADDING, INFO_PANEL_HEIGHT + VERTICAL_GAP, ITEM_WIDTH, ITEM_HEIGHT)];
        _statusesButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
        [_statusesButton setTitle:@"0" forState:UIControlStateNormal];
        [_statusesButton setTitleColor:[UIColor colorWithRed:86/255.0 green:158/255.0 blue:218/255.0 alpha:1] forState:UIControlStateNormal];
        [_statusesButton setBackgroundImage:buttonBGImage forState:UIControlStateNormal];
        [_statusesButton setSubtitle:NSLocalizedString(@"TEXT_WEIBO", @"微博")];
        [self addSubview:_statusesButton];
        [_statusesButton release];
        
        _friendsButton = [[AGSinaWeiboSubtitleButton alloc] initWithFrame:CGRectMake(_statusesButton.right + HORIZONTAL_GAP, INFO_PANEL_HEIGHT + VERTICAL_GAP, ITEM_WIDTH, ITEM_HEIGHT)];
        _friendsButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
        [_friendsButton setTitle:@"0" forState:UIControlStateNormal];
        [_friendsButton setTitleColor:[UIColor colorWithRed:86/255.0 green:158/255.0 blue:218/255.0 alpha:1] forState:UIControlStateNormal];
        [_friendsButton setBackgroundImage:buttonBGImage forState:UIControlStateNormal];
        [_friendsButton setSubtitle:NSLocalizedString(@"TEXT_FOLLOW", @"关注")];
        [self addSubview:_friendsButton];
        [_friendsButton release];
        
        _followerButton = [[AGSinaWeiboSubtitleButton alloc] initWithFrame:CGRectMake(_friendsButton.right + HORIZONTAL_GAP, INFO_PANEL_HEIGHT + VERTICAL_GAP, ITEM_WIDTH, ITEM_HEIGHT)];
        _followerButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
        [_followerButton setTitle:@"0" forState:UIControlStateNormal];
        [_followerButton setTitleColor:[UIColor colorWithRed:86/255.0 green:158/255.0 blue:218/255.0 alpha:1] forState:UIControlStateNormal];
        [_followerButton setBackgroundImage:buttonBGImage forState:UIControlStateNormal];
        [_followerButton setSubtitle:NSLocalizedString(@"TEXT_FANS", @"粉丝")];
        [self addSubview:_followerButton];
        [_followerButton release];
        
        _infoButton = [[AGSinaWeiboInfoButton alloc] initWithFrame:CGRectMake(_followerButton.right + HORIZONTAL_GAP, INFO_PANEL_HEIGHT + VERTICAL_GAP, ITEM_WIDTH, ITEM_HEIGHT)];
        [_infoButton setTitle:NSLocalizedString(@"TEXT_DETAIL_INFO", @"详细资料") forState:UIControlStateNormal];
        [_infoButton setTitleColor:[UIColor colorWithRGB:0x666666] forState:UIControlStateNormal];
        [_infoButton setBackgroundImage:buttonBGImage forState:UIControlStateNormal];
        [self addSubview:_infoButton];
        [_infoButton release];
        
        _lineImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"SinaWeiboLine.jpg"]];
        _lineImageView.frame = CGRectMake((self.width - _lineImageView.width) / 2, _infoButton.bottom + VERTICAL_GAP, _lineImageView.width, _lineImageView.height);
        _lineImageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        [self addSubview:_lineImageView];
        [_lineImageView release];
    }
    return self;
}

- (void)dealloc
{
    _delegate = nil;
    _imageCacheManager = nil;
    _iconImageView = nil;
    _genderImageView = nil;
    _nameLabel = nil;
    _descLabel = nil;
    _statusesButton = nil;
    _friendsButton = nil;
    _followerButton = nil;
    _infoButton = nil;
    _vipImageView = nil;
    _locationLabel = nil;
    _lineImageView = nil;
    
    [_iconImageLoader removeAllNotificationWithTarget:self];
    SAFE_RELEASE(_iconImageLoader);
    SAFE_RELEASE(_userInfo);
    
    [super dealloc];
}

- (void)setUserInfo:(id<ISSPlatformUser>)userInfo
{
    [userInfo retain];
    SAFE_RELEASE(_userInfo);
    _userInfo = userInfo;
    
    _needLayout = YES;
    [self setNeedsLayout];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (_needLayout)
    {
        _needLayout = NO;
        
        if ([_userInfo shareCount] > 10000)
        {
            [_statusesButton setTitle:[NSString stringWithFormat:NSLocalizedString(@"TEXT_TEN_THOUSAND", @"%d万"), [_userInfo shareCount] / 10000] forState:UIControlStateNormal];
        }
        else
        {
            [_statusesButton setTitle:[NSString stringWithFormat:@"%ld", (long)[_userInfo shareCount]] forState:UIControlStateNormal];
        }
        
        if ([_userInfo friendCount] > 10000)
        {
            [_friendsButton setTitle:[NSString stringWithFormat:NSLocalizedString(@"TEXT_TEN_THOUSAND", @"%d万"), [_userInfo friendCount] / 10000] forState:UIControlStateNormal];
        }
        else
        {
            [_friendsButton setTitle:[NSString stringWithFormat:@"%ld", (long)[_userInfo friendCount]] forState:UIControlStateNormal];
        }
        
        if ([_userInfo followerCount] > 10000)
        {
            [_followerButton setTitle:[NSString stringWithFormat:NSLocalizedString(@"TEXT_TEN_THOUSAND", @"%d万"), [_userInfo followerCount] / 10000] forState:UIControlStateNormal];
        }
        else
        {
            [_followerButton setTitle:[NSString stringWithFormat:@"%ld", (long)[_userInfo followerCount]] forState:UIControlStateNormal];
        }
        
        SSSinaWeiboUserInfoReader *userReader = [SSSinaWeiboUserInfoReader readerWithSourceData:[_userInfo sourceData]];
        
        
        [_iconImageLoader removeAllNotificationWithTarget:self];
        SAFE_RELEASE(_iconImageLoader);
        
        _iconImageLoader = [[_imageCacheManager getImage:[userReader avatarLarge] cornerRadius:5.0 size:_iconImageView.frame.size] retain];
        if (_iconImageLoader.state == ImageLoaderStateReady)
        {
            _iconImageView.image = _iconImageLoader.content;
        }
        else
        {
            _iconImageView.image = nil;
            [_iconImageLoader addNotificationWithName:NOTIF_IMAGE_LOAD_COMPLETE
                                               target:self
                                               action:@selector(iconLoadCompleteHandler:)];
            [_iconImageLoader addNotificationWithName:NOTIF_IMAGE_LOAD_ERROR
                                               target:self
                                               action:@selector(iconLoadErrorHandler:)];
        }
        
        _nameLabel.text = userReader.screenName;
        [_nameLabel sizeToFit];
        CGFloat nameLabelWidth = _nameLabel.width;
        if (nameLabelWidth + GENDER_ICON_WIDTH > self.width - _iconImageView.right - ICON_HORIZONTAL_GAP)
        {
            nameLabelWidth = self.width - _iconImageView.right - ICON_HORIZONTAL_GAP - GENDER_ICON_WIDTH;
        }
        _nameLabel.frame = CGRectMake(_iconImageView.right + ICON_HORIZONTAL_GAP,
                                      TOP_PADDING,
                                      nameLabelWidth,
                                      _nameLabel.height);
        
        if ([userReader.gender isEqualToString:@"m"])
        {
            _genderImageView.image = [UIImage imageNamed:@"MaleIcon.png"];
        }
        else if ([userReader.gender isEqualToString:@"f"])
        {
            _genderImageView.image = [UIImage imageNamed:@"FemaleIcon.png"];
        }
        else
        {
            _genderImageView.image = nil;
        }
        _genderImageView.frame = CGRectMake(_nameLabel.right, _nameLabel.top, GENDER_ICON_WIDTH, GENDER_ICON_HEIGHT);
        
        _locationLabel.text = userReader.location;
        [_locationLabel sizeToFit];
        CGFloat locationLabelWidth = _locationLabel.width;
        if (locationLabelWidth > self.width - _iconImageView.right - ICON_HORIZONTAL_GAP)
        {
            locationLabelWidth = self.width - _iconImageView.right - ICON_HORIZONTAL_GAP;
        }
        _locationLabel.frame = CGRectMake(_iconImageView.right + ICON_HORIZONTAL_GAP,
                                          _nameLabel.bottom,
                                          locationLabelWidth,
                                          _locationLabel.height);
        
        if (userReader.verified)
        {
            _descLabel.text = [NSString stringWithFormat:NSLocalizedString(@"TEXT_SINA_WEIBO_VERIFIED_1", @"新浪认证:%@"), userReader.verifiedReason];
            
            switch (userReader.verifiedType)
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
            _descLabel.text = [NSString stringWithFormat:NSLocalizedString(@"TEXT_PROFILE_1", @"简介:%@"), _userInfo.description];
            
            if (userReader.verifiedType == 220)
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
        [_descLabel sizeToFit];
        _descLabel.frame = CGRectMake(LEFT_PADDING, _iconImageView.bottom + ICON_VETICAL_GAP, self.width, _descLabel.height);
        
        id<ISSSinaWeiboApp> sinaApp = (id<ISSSinaWeiboApp>)[ShareSDK getClientWithType:ShareTypeSinaWeibo];
        if ([[_userInfo uid] isEqualToString:[[sinaApp currentUser] uid]])
        {
            _followButton.hidden = YES;
        }
        else
        {
            _followButton.hidden = NO;
            if (userReader.following)
            {
                [_followButton setBackgroundImage:[[UIImage imageNamed:@"FollowedButton.png"] stretchableImageWithLeftCapWidth:4 topCapHeight:0]
                                         forState:UIControlStateNormal];
                [_followButton setTitle:NSLocalizedString(@"TEXT_FOLLOWED", @"已关注") forState:UIControlStateNormal];
                [_followButton setTitleColor:[UIColor colorWithRGB:0x818080] forState:UIControlStateNormal];
                [_followButton setTitleShadowColor:[UIColor colorWithRGB:0x097600] forState:UIControlStateNormal];
                [_followButton removeTarget:self action:@selector(followButtonClickHandler:) forControlEvents:UIControlEventTouchUpInside];
            }
            else
            {
                [_followButton setBackgroundImage:[[UIImage imageNamed:@"FollowButton.png"] stretchableImageWithLeftCapWidth:4 topCapHeight:0]
                                         forState:UIControlStateNormal];
                [_followButton setTitle:NSLocalizedString(@"TEXT_ADD_FOLLOW", @"加关注")  forState:UIControlStateNormal];
                [_followButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                [_followButton setTitleShadowColor:[UIColor colorWithRGB:0x097600] forState:UIControlStateNormal];
                [_followButton addTarget:self action:@selector(followButtonClickHandler:) forControlEvents:UIControlEventTouchUpInside];
            }
            
            _followButton.frame = CGRectMake(self.width - RIGHT_PADDING - FOLLOW_BUTTON_WIDTH,
                                             _descLabel.top - VERTICAL_GAP - FOLLOW_BUTTON_HEIGHT,
                                             FOLLOW_BUTTON_WIDTH,
                                             FOLLOW_BUTTON_HEIGHT);
        }
    }
}

#pragma mark - Private

- (void)iconLoadCompleteHandler:(NSNotification *)notif
{
    _iconImageView.image = _iconImageLoader.content;
    
    [_iconImageLoader removeAllNotificationWithTarget:self];
    SAFE_RELEASE(_iconImageLoader);
}

- (void)iconLoadErrorHandler:(NSNotification *)notif
{
    [_iconImageLoader removeAllNotificationWithTarget:self];
    SAFE_RELEASE(_iconImageLoader);
}

- (void)followButtonClickHandler:(id)sender
{
    if (!_isFollowing)
    {
        _isFollowing = YES;
        
        AGAppDelegate *appDelegate = (AGAppDelegate *)[UIApplication sharedApplication].delegate;
        
        id<ISSAuthOptions> authOptions = [ShareSDK authOptionsWithAutoAuth:YES
                                                             allowCallback:YES
                                                             authViewStyle:SSAuthViewStyleFullScreenPopup
                                                              viewDelegate:nil
                                                   authManagerViewDelegate:appDelegate.viewDelegate];
        
                //在授权页面中添加关注官方微博
                [authOptions setFollowAccounts:[NSDictionary dictionaryWithObjectsAndKeys:
                                        [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                        SHARE_TYPE_NUMBER(ShareTypeSinaWeibo),
                                        [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                        SHARE_TYPE_NUMBER(ShareTypeTencentWeibo),
                                        nil]];
        
        [ShareSDK followUserWithType:ShareTypeSinaWeibo
                               field:_userInfo.uid
                           fieldType:SSUserFieldTypeUid
                         authOptions:authOptions
                        viewDelegate:nil
                              result:^(SSResponseState state, id<ISSPlatformUser> userInfo, id<ICMErrorInfo> error) {
                                  
                                  if (state == SSResponseStateSuccess)
                                  {
                                      if ([_delegate conformsToProtocol:@protocol(AGSinaWeiboUserInfoHeaderViewDelegate)] &&
                                          [_delegate respondsToSelector:@selector(headerViewOnAddFriend:)])
                                      {
                                          [_delegate headerViewOnAddFriend:self];
                                      }
                                  }
                                  else if (state == SSResponseStateFail)
                                  {
                                      UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                                                          message:[NSString stringWithFormat:NSLocalizedString(@"TEXT_FOLLOW_FAI", @"关注失败!%@"), [error errorDescription]]
                                                                                         delegate:nil
                                                                                cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                                                otherButtonTitles: nil];
                                      [alertView show];
                                      [alertView release];
                                  }
                                  
                                  _isFollowing = NO;
                              }];
    }
    
}

@end
