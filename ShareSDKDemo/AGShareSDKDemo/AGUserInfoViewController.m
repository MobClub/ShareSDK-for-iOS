//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.mob.com
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import "AGUserInfoViewController.h"
#import <AGCommon/UINavigationBar+Common.h>
#import <AGCommon/UIColor+Common.h>
#import <AGCommon/UIImage+Common.h>
#import <AGCommon/UIDevice+Common.h>
#import <AGCommon/NSString+Common.h>
#import "AGAppDelegate.h"

#define TABLE_CELL_ID @"tableCell"

@interface AGUserInfoViewController (Private)

- (void)loadImage:(NSString *)url;

- (void)showUserIcon:(UIImage *)icon;

/**
 *	@brief	填充新浪微博用户信息
 *
 *	@param 	userInfo 	用户信息
 */
- (void)fillSinaWeiboUser:(id<ISSPlatformUser>)userInfo;

/**
 *	@brief	填充腾讯微博用户信息
 *
 *	@param 	userInfo 	用户信息
 */
- (void)fillTecentWeiboUser:(id<ISSPlatformUser>)userInfo;

/**
 *	@brief	填充搜狐微博用户信息
 *
 *	@param 	userInfo 	用户信息
 */
- (void)fillSohuWeiboUser:(id<ISSPlatformUser>)userInfo;

/**
 *	@brief	填充网易微博用户信息
 *
 *	@param 	userInfo 	用户信息
 */
- (void)fill163WeiboUser:(id<ISSPlatformUser>)userInfo;

/**
 *	@brief	填充豆瓣社区用户信息
 *
 *	@param 	userInfo 	用户信息
 */
- (void)fillDouBanUser:(id<ISSPlatformUser>)userInfo;

/**
 *	@brief	填充QQ空间用户信息
 *
 *	@param 	userInfo 	用户信息
 */
- (void)fillQQSpaceUser:(id<ISSPlatformUser>)userInfo;

/**
 *	@brief	填充人人网用户信息
 *
 *	@param 	userInfo 	用户信息
 */
- (void)fillRenRenUser:(id<ISSPlatformUser>)userInfo;

/**
 *	@brief	填充开心网用户信息
 *
 *	@param 	userInfo 	用户信息
 */
- (void)fillKaiXinUser:(id<ISSPlatformUser>)userInfo;

/**
 *	@brief	填充Instapaper用户信息
 *
 *	@param 	userInfo 	用户信息
 */
- (void)fillInstapaperUser:(id<ISSPlatformUser>)userInfo;


@end

@implementation AGUserInfoViewController

- (id)initWithType:(ShareType)type;
{
    self = [super init];
    if (self)
    {
        _appDelegate = (AGAppDelegate *)[UIApplication sharedApplication].delegate;
        
        if ([[UIDevice currentDevice].systemVersion versionStringCompare:@"7.0"] != NSOrderedAscending)
        {
            //改写导航栏标题样式
            UILabel *label = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
            label.backgroundColor = [UIColor clearColor];
            label.textColor = [UIColor whiteColor];
            label.font = [UIFont boldSystemFontOfSize:18];
            [label sizeToFit];
            
            self.navigationItem.titleView = label;
        }
        
        self.title = NSLocalizedString(@"TEXT_USER_INFO", @"用户信息");
        
        UIButton *leftBtn = [[[UIButton alloc] init] autorelease];
        [leftBtn setBackgroundImage:[UIImage imageNamed:@"Common/NavigationButtonBG.png" bundleName:BUNDLE_NAME]
                           forState:UIControlStateNormal];
        [leftBtn setTitle:NSLocalizedString(@"TEXT_CANCEL", @"取消") forState:UIControlStateNormal];
        leftBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        leftBtn.frame = CGRectMake(0.0, 0.0, 53.0, 30.0);
        [leftBtn addTarget:self action:@selector(cancelButtonClickHandler:) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:leftBtn] autorelease];
        
        _infoDict = [[NSMutableDictionary alloc] init];
        
        _type = type;
        _flag = 0;
    }
    return self;
}

- (id)initWithType:(ShareType)type name:(NSString *)name paramType:(SSUserFieldType)paramType
{
    if (self = [super init])
    {
        _appDelegate = (AGAppDelegate *)[UIApplication sharedApplication].delegate;
        
        if ([[UIDevice currentDevice].systemVersion versionStringCompare:@"7.0"] != NSOrderedAscending)
        {
                        //改写导航栏标题样式
                        UILabel *label = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
            label.backgroundColor = [UIColor clearColor];
            label.textColor = [UIColor whiteColor];
            label.font = [UIFont boldSystemFontOfSize:18];
            [label sizeToFit];
            
            self.navigationItem.titleView = label;
        }
        
        self.title = NSLocalizedString(@"TEXT_USER_INFO", @"用户信息");
        
        UIButton *leftBtn = [[[UIButton alloc] init] autorelease];
        [leftBtn setBackgroundImage:[UIImage imageNamed:@"Common/NavigationButtonBG.png" bundleName:BUNDLE_NAME]
                           forState:UIControlStateNormal];
        [leftBtn setTitle:NSLocalizedString(@"TEXT_CANCEL", @"取消") forState:UIControlStateNormal];
        leftBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        leftBtn.frame = CGRectMake(0.0, 0.0, 53.0, 30.0);
        [leftBtn addTarget:self action:@selector(cancelButtonClickHandler:) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:leftBtn] autorelease];
        
        _infoDict = [[NSMutableDictionary alloc] init];
        _type = type;
        _paramType = paramType;
        _name = [name copy];
        _flag = 1;
    }
    return self;
}

- (void)dealloc
{
    SAFE_RELEASE(_infoDict);
    SAFE_RELEASE(_name);
    
    [super dealloc];
}

- (void)setTitle:(NSString *)title
{
    [super setTitle:title];
    
    if ([[UIDevice currentDevice].systemVersion versionStringCompare:@"7.0"] != NSOrderedAscending)
    {
        ((UILabel *)self.navigationItem.titleView).text = title;
        [(UILabel *)self.navigationItem.titleView sizeToFit];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([[UIDevice currentDevice].systemVersion versionStringCompare:@"7.0"] != NSOrderedAscending)
    {
        [self setExtendedLayoutIncludesOpaqueBars:NO];
        [self setEdgesForExtendedLayout:SSRectEdgeBottom | SSRectEdgeLeft | SSRectEdgeRight];
    }
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavigationBarBG.png"]];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.width, self.view.height) style:UITableViewStyleGrouped];
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _tableView.backgroundColor = [UIColor colorWithRGB:0xe1e0de];
    _tableView.backgroundView = nil;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [_tableView release];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self layoutView:self.interfaceOrientation];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (!_initialized)
    {
        _initialized = YES;
        
        id<ISSAuthOptions> authOptions = [ShareSDK authOptionsWithAutoAuth:YES
                                                             allowCallback:YES
                                                             authViewStyle:SSAuthViewStyleFullScreenPopup
                                                              viewDelegate:nil
                                                   authManagerViewDelegate:_appDelegate.viewDelegate];
        
                //在授权页面中添加关注官方微博
                [authOptions setFollowAccounts:[NSDictionary dictionaryWithObjectsAndKeys:
                                        [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                        SHARE_TYPE_NUMBER(ShareTypeSinaWeibo),
                                        [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                        SHARE_TYPE_NUMBER(ShareTypeTencentWeibo),
                                        nil]];
        
        if (_flag == 0)
        {
            [ShareSDK getUserInfoWithType:_type
                              authOptions:authOptions
                                   result:^(BOOL result, id<ISSPlatformUser> userInfo, id<ICMErrorInfo> error) {
                                       
                                       if (result)
                                       {
                                           [_infoDict removeAllObjects];
                                           
                                           if ([userInfo profileImage])
                                           {
                                               [NSThread detachNewThreadSelector:@selector(loadImage:)
                                                                        toTarget:self
                                                                      withObject:[userInfo profileImage]];
                                           }
                                           
                                           switch (_type)
                                           {
                                               case ShareTypeSinaWeibo:
                                                                                                      //新浪微博
                                                                                                      [self fillSinaWeiboUser:userInfo];
                                                   break;
                                               case ShareTypeTencentWeibo:
                                                                                                      //腾讯微博
                                                                                                      [self fillTecentWeiboUser:userInfo];
                                                   break;
                                               case ShareTypeSohuWeibo:
                                                                                                      //搜狐微博
                                                                                                      [self fillSohuWeiboUser:userInfo];
                                                   break;
                                               case ShareType163Weibo:
                                                                                                      //网易微博
                                                                                                      [self fill163WeiboUser:userInfo];
                                                   break;
                                               case ShareTypeDouBan:
                                                                                                      //豆瓣社区
                                                                                                      [self fillDouBanUser:userInfo];
                                                   break;
                                               case ShareTypeQQSpace:
                                                                                                      //QQ空间
                                                                                                      [self fillQQSpaceUser:userInfo];
                                                   break;
                                               case ShareTypeRenren:
                                                                                                      //人人网
                                                                                                      [self fillRenRenUser:userInfo];
                                                   break;
                                               case ShareTypeKaixin:
                                                                                                      //开心网
                                                                                                      [self fillKaiXinUser:userInfo];
                                                   break;
                                               case ShareTypeInstapaper:
                                                                                                      //Instapaper
                                                                                                      [self fillInstapaperUser:userInfo];
                                                   break;
                                               case ShareTypeFacebook:
                                                                                                      //Facebook
                                                                                                      [self fillFacebookUser:userInfo];
                                                   break;
                                               case ShareTypeTwitter:
                                                                                                      //Twitter
                                                                                                      [self fillTwitterUser:userInfo];
                                                   break;
                                               case ShareTypeYouDaoNote:
                                                                                                      //有道云笔记
                                                                                                      [self fillYouDaoNoteUser:userInfo];
                                                   break;
                                               case ShareTypeSohuKan:
                                                                                                      //搜狐随身看
                                                                                                      [self fillSohuKanUser:userInfo];
                                                   break;
                                                case ShareTypeLinkedIn:
                                                                                                      //LinkedIn
                                                                                                      [self fillLinkedInUser:userInfo];
                                                   break;
                                                case ShareTypeGooglePlus:
                                                                                                      //Google+
                                                                                                      [self fillGooglePlusUser:userInfo];
                                                   break;
                                               default:
                                                   break;
                                           }
                                           
                                           [_tableView reloadData];
                                       }
                                       else
                                       {
                                           UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                                                               message:error.errorDescription
                                                                                              delegate:nil
                                                                                     cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                                                     otherButtonTitles: nil];
                                           [alertView show];
                                           [alertView release];
                                       }
                                   }];
        }
        else
        {
            [ShareSDK getUserInfoWithType:_type
                                    field:_name
                                fieldType:_paramType
                              authOptions:authOptions
                                   result:^(BOOL result, id<ISSPlatformUser> userInfo, id<ICMErrorInfo> error) {
                                       
                                       if (result)
                                       {
                                           [_infoDict removeAllObjects];
                                           
                                           if ([userInfo profileImage])
                                           {
                                               [NSThread detachNewThreadSelector:@selector(loadImage:)
                                                                        toTarget:self
                                                                      withObject:[userInfo profileImage]];
                                           }
                                           
                                           switch (_type)
                                           {
                                               case ShareTypeSinaWeibo:
                                                                                                      //新浪微博
                                                                                                      [self fillSinaWeiboUser:userInfo];
                                                   break;
                                               case ShareTypeTencentWeibo:
                                                                                                      //腾讯微博
                                                                                                      [self fillTecentWeiboUser:userInfo];
                                                   break;
                                               case ShareTypeSohuWeibo:
                                                                                                      //搜狐微博
                                                                                                      [self fillSohuWeiboUser:userInfo];
                                                   break;
                                               case ShareType163Weibo:
                                                                                                      //网易微博
                                                                                                      [self fill163WeiboUser:userInfo];
                                                   break;
                                               case ShareTypeDouBan:
                                                                                                      //豆瓣社区
                                                                                                      [self fillDouBanUser:userInfo];
                                                   break;
                                               case ShareTypeQQSpace:
                                                                                                      //QQ空间
                                                                                                      [self fillQQSpaceUser:userInfo];
                                                   break;
                                               case ShareTypeRenren:
                                                                                                      //人人网
                                                                                                      [self fillRenRenUser:userInfo];
                                                   break;
                                               case ShareTypeKaixin:
                                                                                                      //开心网
                                                                                                      [self fillKaiXinUser:userInfo];
                                                   break;
                                               case ShareTypeInstapaper:
                                                                                                      //Instapaper
                                                                                                      [self fillInstapaperUser:userInfo];
                                                   break;
                                               case ShareTypeFacebook:
                                                                                                      //Facebook
                                                                                                      [self fillFacebookUser:userInfo];
                                                   break;
                                               case ShareTypeTwitter:
                                                                                                      //Twitter
                                                                                                      [self fillTwitterUser:userInfo];
                                                   break;
                                               case ShareTypeYouDaoNote:
                                                                                                      //有道云笔记
                                                                                                      [self fillYouDaoNoteUser:userInfo];
                                                   break;
                                               case ShareTypeSohuKan:
                                                                                                      //搜狐随身看
                                                                                                      [self fillSohuKanUser:userInfo];
                                                   break;
                                               case ShareTypeLinkedIn:
                                                                                                      //LinkedIn
                                                                                                      [self fillLinkedInUser:userInfo];
                                                   break;
                                               case ShareTypeGooglePlus:
                                                                                                      //Google+
                                                                                                      [self fillGooglePlusUser:userInfo];
                                                   break;
                                               default:
                                                   break;
                                           }
                                           
                                           [_tableView reloadData];
                                       }
                                       else
                                       {
                                           UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")
                                                                                               message:error.errorDescription
                                                                                              delegate:nil
                                                                                     cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了")
                                                                                     otherButtonTitles: nil];
                                           [alertView show];
                                           [alertView release];
                                       }
                                   }];
        }
    }
}

- (void)cancelButtonClickHandler:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

-(BOOL)shouldAutorotate
{
        //iOS6下旋屏方法
        return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
        //iOS6下旋屏方法
        return SSInterfaceOrientationMaskAll;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self layoutView:toInterfaceOrientation];
}

#pragma mark - Private

- (void)fillSinaWeiboUser:(id<ISSPlatformUser>)userInfo
{
    NSArray *keys = [[userInfo sourceData] allKeys];
    for (int i = 0; i < [keys count]; i++)
    {
        NSString *keyName = [keys objectAtIndex:i];
        id value = [[userInfo sourceData] objectForKey:keyName];
        if (![value isKindOfClass:[NSString class]])
        {
            if ([value respondsToSelector:@selector(stringValue)])
            {
                value = [value stringValue];
            }
            else
            {
                value = @"";
            }
        }
        
        if ([keyName isEqualToString:@"id"])
        {
            [_infoDict setObject:value forKey:@"UID"];
        }
        else if([keyName isEqualToString:@"idstr"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_UID_STR", @"字符串型UID")];
        }
        else if([keyName isEqualToString:@"screen_name"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_NICKNAME", @"用户昵称")];
        }
        else if([keyName isEqualToString:@"name"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_SCREEN_NAME", @"显示名称")];
        }
        else if([keyName isEqualToString:@"province"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_PROVINCE_ID", @"省级ID")];
        }
        else if([keyName isEqualToString:@"city"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_CITY_ID", @"城市ID")];
        }
        else if([keyName isEqualToString:@"location"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_LOCATION", @"所在地")];
        }
        else if([keyName isEqualToString:@"description"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_DESCRIPTION", @"个人描述")];
        }
        else if([keyName isEqualToString:@"url"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_BLOG_URL", @"博客地址")];
        }
        else if([keyName isEqualToString:@"profile_image_url"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_AVATAR_URL", @"头像地址")];
        }
        else if([keyName isEqualToString:@"profile_url"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_WEIBO_URL", @"微博统一URL地址")];
        }
        else if([keyName isEqualToString:@"domain"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_CUSTOM_DOMAIN", @"个性化域名")];
        }
        else if([keyName isEqualToString:@"weihao"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_WEIHAO", @"微号")];
        }
        else if([keyName isEqualToString:@"gender"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_GENDER", @"性别")];
        }
        else if([keyName isEqualToString:@"followers_count"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_FANS_COUNT", @"粉丝数")];
        }
        else if([keyName isEqualToString:@"friends_count"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_FOLLOW_COUNT", @"关注数")];
        }
        else if([keyName isEqualToString:@"statuses_count"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_WEIBO_COUNT", @"微博数")];
        }
        else if([keyName isEqualToString:@"favourites_count"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_FAV_COUNT", @"收藏数")];
        }
        else if([keyName isEqualToString:@"created_at"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_REG_TIME", @"注册时间")];
        }
        else if([keyName isEqualToString:@"following"])
        {
            [_infoDict setObject:value forKey:@"following"];
        }
        else if([keyName isEqualToString:@"allow_all_act_msg"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_ALLOW_SEND_LETTER", @"是否允许给我发私信")];
        }
        else if([keyName isEqualToString:@"geo_enabled"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_ALLOW_GEO", @"是否允许标识地理位置")];
        }
        else if([keyName isEqualToString:@"verified"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_IS_WEIBO_VERIFIED_USER", @"是否是微博认证用户")];
        }
        else if([keyName isEqualToString:@"verified_type"])
        {
            [_infoDict setObject:value forKey:@"verified_type"];
        }
        else if([keyName isEqualToString:@"remark"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_REMARK", @"备注信息")];
        }
        else if([keyName isEqualToString:@"allow_all_comment"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_ALLOW_COMMENT_STATUS", @"是否允许对我的微博进行评论")];
        }
        else if([keyName isEqualToString:@"avatar_large"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_LARGE_AVATAR_URL", @"大头像地址")];
        }
        else if([keyName isEqualToString:@"verified_reason"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_VERIFIED_REASON", @"认证原因")];
        }
        else if([keyName isEqualToString:@"follow_me"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_FOLLOW_ME", @"是否关注我")];
        }
        else if([keyName isEqualToString:@"online_status"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_ONLINE_STATUS", @"在线状态")];
        }
        else if([keyName isEqualToString:@"bi_followers_count"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_BI_FOLLOWER_COUNT", @"互粉数")];
        }
        else if([keyName isEqualToString:@"lang"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_LANG", @"语言版本")];
        }
    }
}

- (void)fillTecentWeiboUser:(id<ISSPlatformUser>)userInfo
{
    NSArray *keys = [[userInfo sourceData] allKeys];
    for (int i = 0; i < [keys count]; i++)
    {
        NSString *keyName = [keys objectAtIndex:i];
        id value = [[userInfo sourceData] objectForKey:keyName];
        if (![value isKindOfClass:[NSString class]])
        {
            if ([value respondsToSelector:@selector(stringValue)])
            {
                value = [value stringValue];
            }
            else
            {
                value = @"";
            }
        }
        
        if ([keyName isEqualToString:@"birth_day"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_BIRTH_DAY", @"出生天")];
        }
        else if ([keyName isEqualToString:@"birth_month"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_BIRTH_MONTH", @"出生月")];
        }
        else if ([keyName isEqualToString:@"birth_year"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_BIRTH_YEAR", @"出生年")];
        }
        else if ([keyName isEqualToString:@"city_code"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_CITY_ID", @"城市id")];
        }
        else if ([keyName isEqualToString:@"country_code"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_COUNTRY_ID", @"国家id")];
        }
        else if ([keyName isEqualToString:@"fansnum"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_FANS_COUNT_2", @"听众数")];
        }
        else if ([keyName isEqualToString:@"favnum"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_FAV_COUNT", @"收藏数")];
        }
        else if ([keyName isEqualToString:@"head"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_AVATAR_URL", @"头像url")];
        }
        else if ([keyName isEqualToString:@"homecity_code"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_HOMETOWN_CITY_ID", @"家乡所在城市id")];
        }
        else if ([keyName isEqualToString:@"homecountry_code"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_HOMETOWN_COUNTRY_ID", @"家乡所在国家id")];
        }
        else if ([keyName isEqualToString:@"homepage"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_PERSONAL_HOMEPAGE", @"个人主页")];
        }
        else if ([keyName isEqualToString:@"homeprovince_code"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_HOMETOWN_PROVINCE_ID", @"家乡所在省id")];
        }
        else if ([keyName isEqualToString:@"hometown_code"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_HOMETOWN_ID", @"家乡所在城镇id")];
        }
        else if ([keyName isEqualToString:@"idolnum"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_IDOL_COUNT", @"收听的人数")];
        }
        else if ([keyName isEqualToString:@"industry_code"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_INDUSTRY_ID", @"行业id")];
        }
        else if ([keyName isEqualToString:@"introduction"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_INTRODUCATION", @"个人介绍")];
        }
        else if ([keyName isEqualToString:@"isent"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_IS_ENT", @"是否企业机构")];
        }
        else if ([keyName isEqualToString:@"ismyblack"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_CUR_USER_IN_BLACK_LIST", @"是否在当前用户的黑名单中")];
        }
        else if ([keyName isEqualToString:@"ismyfans"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_IS_MY_FANS", @"是否是当前用户的听众")];
        }
        else if ([keyName isEqualToString:@"ismyidol"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_IS_MY_IDOL", @"是否是当前用户的偶像")];
        }
        else if ([keyName isEqualToString:@"isrealname"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_IS_REAL_NAME", @"是否实名认证")];
        }
        else if ([keyName isEqualToString:@"isvip"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_IS_VIP", @"是否认证用户")];
        }
        else if ([keyName isEqualToString:@"location"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_LOCATION", @"所在地")];
        }
        else if ([keyName isEqualToString:@"mutual_fans_num"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_MUTUAL_FANS_NUM", @"互听好友数")];
        }
        else if ([keyName isEqualToString:@"name"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_NAME", @"用户帐户名")];
        }
        else if ([keyName isEqualToString:@"nick"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_NICKNAME", @"用户昵称")];
        }
        else if ([keyName isEqualToString:@"openid"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_OPEN_ID", @"用户唯一id")];
        }
        else if ([keyName isEqualToString:@"province_code"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_PROVINCE_ID", @"地区id")];
        }
        else if ([keyName isEqualToString:@"regtime"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_REG_TIME", @"注册时间")];
        }
        else if ([keyName isEqualToString:@"send_private_flag"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_SEND_LETTER", @"是否允许所有人给当前用户发私信")];
        }
        else if ([keyName isEqualToString:@"sex"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_GENDER", @"用户性别")];
        }
        else if ([keyName isEqualToString:@"tweetnum"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_TWEET_NUM", @"发表的微博数")];
        }
        else if ([keyName isEqualToString:@"verifyinfo"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_VERIFIED_INFO", @"认证信息")];
        }
        else if ([keyName isEqualToString:@"exp"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_EXP", @"经验值")];
        }
        else if ([keyName isEqualToString:@"level"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_LEVEL", @"微博等级")];
        }
    }
}

- (void)fillSohuWeiboUser:(id<ISSPlatformUser>)userInfo
{
    NSArray *keys = [[userInfo sourceData] allKeys];
    for (int i = 0; i < [keys count]; i++)
    {
        NSString *keyName = [keys objectAtIndex:i];
        id value = [[userInfo sourceData] objectForKey:keyName];
        if (![value isKindOfClass:[NSString class]])
        {
            if ([value respondsToSelector:@selector(stringValue)])
            {
                value = [value stringValue];
            }
            else
            {
                value = @"";
            }
        }
        
        if ([keyName isEqualToString:@"id"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_USER_ID", @"用户ID")];
        }
        else if ([keyName isEqualToString:@"screen_name"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_NICKNAME_2", @"昵称")];
        }
        else if ([keyName isEqualToString:@"name"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_NAME", @"姓名")];
        }
        else if ([keyName isEqualToString:@"location"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_LOCATION", @"地区")];
        }
        else if ([keyName isEqualToString:@"description"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_PROFILE", @"个人简介")];
        }
        else if ([keyName isEqualToString:@"url"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_PERSONAL_HOMEPAGE", @"个人主页")];
        }
        else if ([keyName isEqualToString:@"profile_image_url"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_AVATAR", @"用户头像")];
        }
        else if ([keyName isEqualToString:@"protected"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_PROTECTED", @"勿扰")];
        }
        else if ([keyName isEqualToString:@"followers_count"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_FANS_COUNT", @"粉丝数")];
        }
        else if ([keyName isEqualToString:@"profile_background_color"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_PROFILE_BACKGROUND_COLOR", @"背景颜色")];
        }
        else if ([keyName isEqualToString:@"profile_text_color"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_PROFILE_TEXT_COLOR", @"文字颜色")];
        }
        else if ([keyName isEqualToString:@"profile_link_color"])
        {
            [_infoDict setObject:value forKey:@"profile_link_color"];
        }
        else if ([keyName isEqualToString:@"profile_sidebar_fill_color"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_PROFILE_SIDEBAR_FILL_COLOR", @"侧栏颜色")];
        }
        else if ([keyName isEqualToString:@"profile_sidebar_border_color"])
        {
            [_infoDict setObject:value forKey:@"profile_sidebar_border_color"];
        }
        else if ([keyName isEqualToString:@"friends_count"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_FOLLOW_COUNT", @"关注数")];
        }
        else if ([keyName isEqualToString:@"created_at"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_CREATED_AT", @"创建时间")];
        }
        else if ([keyName isEqualToString:@"favourites_count"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_FAV_COUNT", @"收藏数")];
        }
        else if ([keyName isEqualToString:@"utc_offset"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_UTC_OFFSET", @"偏移值")];
        }
        else if ([keyName isEqualToString:@"time_zone"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_TIME_ZONE", @"时区")];
        }
        else if ([keyName isEqualToString:@"profile_background_image_url"])
        {
            [_infoDict setObject:value forKey:@"profile_background_image_url"];
        }
        else if ([keyName isEqualToString:@"notifications"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_NOTIFICATIONS", @"通知")];
        }
        else if ([keyName isEqualToString:@"geo_enabled"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_GEO_ENABLED", @"是否支持地理位置")];
        }
        else if ([keyName isEqualToString:@"statuses_count"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_STATUS_COUNT", @"微博数")];
        }
        else if ([keyName isEqualToString:@"following"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_FOLLOWING", @"是否关注")];
        }
        else if ([keyName isEqualToString:@"verified"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_VERIFIED", @"是否认证")];
        }
        else if ([keyName isEqualToString:@"lang"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_LANG", @"语言")];
        }
        else if ([keyName isEqualToString:@"contributors_enabled"])
        {
            [_infoDict setObject:value forKey:@"contributors_enabled"];
        }
    }
}

- (void)fill163WeiboUser:(id<ISSPlatformUser>)userInfo
{
    NSArray *keys = [[userInfo sourceData] allKeys];
    for (int i = 0; i < [keys count]; i++)
    {
        NSString *keyName = [keys objectAtIndex:i];
        id value = [[userInfo sourceData] objectForKey:keyName];
        if (![value isKindOfClass:[NSString class]])
        {
            if ([value respondsToSelector:@selector(stringValue)])
            {
                value = [value stringValue];
            }
            else
            {
                value = @"";
            }
        }
        
        if ([keyName isEqualToString:@"columnIdNameWithCounts"])
        {
            [_infoDict setObject:value forKey:@"columnIdNameWithCounts"];
        }
        else if ([keyName isEqualToString:@"created_at"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_REG_TIME", @"注册时间")];
        }
        else if ([keyName isEqualToString:@"darenRec"])
        {
            [_infoDict setObject:value forKey:@"darenRec"];
        }
        else if ([keyName isEqualToString:@"description"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_DESCRIPTION", @"用户描述")];
        }
        else if ([keyName isEqualToString:@"email"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_MAIL_ADDR", @"邮箱地址")];
        }
        else if ([keyName isEqualToString:@"favourites_count"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_FAV_COUNT", @"收藏数")];
        }
        else if ([keyName isEqualToString:@"followers_count"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_FANS_COUNT", @"被关注数")];
        }
        else if ([keyName isEqualToString:@"friends_count"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_FOLLOW_COUNT", @"关注数")];
        }
        else if ([keyName isEqualToString:@"gender"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_GENDER", @"性别")];
        }
        else if ([keyName isEqualToString:@"geo_enable"])
        {
            [_infoDict setObject:value forKey:@"geo_enable"];
        }
        else if ([keyName isEqualToString:@"icorp"])
        {
            [_infoDict setObject:value forKey:@"icorp"];
        }
        else if ([keyName isEqualToString:@"id"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_USER_ID", @"用户ID")];
        }
        else if ([keyName isEqualToString:@"location"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_LOCATION", @"用户地址")];
        }
        else if ([keyName isEqualToString:@"name"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_NAME", @"用户名称")];
        }
        else if ([keyName isEqualToString:@"profile_image_url"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_AVATAR_URL", @"用户头像URL")];
        }
        else if ([keyName isEqualToString:@"realName"])
        {
            [_infoDict setObject:value forKey:@"realName"];
        }
        else if ([keyName isEqualToString:@"screen_name"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_SCREEN_NAME", @"个性网址")];
        }
        else if ([keyName isEqualToString:@"statuses_count"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_STATUS_COUNT", @"发微博数")];
        }
        else if ([keyName isEqualToString:@"sysTag"])
        {
            [_infoDict setObject:value forKey:@"sysTag"];
        }
        else if ([keyName isEqualToString:@"url"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_BLOG_URL", @"个人博客地址")];
        }
        else if ([keyName isEqualToString:@"userTag"])
        {
            [_infoDict setObject:value forKey:@"userTag"];
        }
        else if ([keyName isEqualToString:@"verified"])
        {
            [_infoDict setObject:value forKey:@"verified"];
        }
    }
}

- (void)fillDouBanUser:(id<ISSPlatformUser>)userInfo
{
    NSArray *keys = [[userInfo sourceData] allKeys];
    for (int i = 0; i < [keys count]; i++)
    {
        NSString *keyName = [keys objectAtIndex:i];
        id value = [[userInfo sourceData] objectForKey:keyName];
        if (![value isKindOfClass:[NSString class]])
        {
            if ([value respondsToSelector:@selector(stringValue)])
            {
                value = [value stringValue];
            }
            else
            {
                value = @"";
            }
        }
        
        if ([keyName isEqualToString:@"desc"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_DESCRIPTION", @"描述")];
        }
        else if ([keyName isEqualToString:@"alt"])
        {
            [_infoDict setObject:value forKey:@"alt"];
        }
        else if ([keyName isEqualToString:@"avatar"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_AVATAR_URL", @"头像小图")];
        }
        else if ([keyName isEqualToString:@"created"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_REG_TIME", @"注册时间")];
        }
        else if ([keyName isEqualToString:@"loc_id"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_CITY_ID", @"城市id")];
        }
        else if ([keyName isEqualToString:@"loc_name"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_LOCATION", @"所在地全称")];
        }
        else if ([keyName isEqualToString:@"name"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_NICKNAME", @"用户昵称")];
        }
        else if ([keyName isEqualToString:@"signature"])
        {
            [_infoDict setObject:value forKey:@"signature"];
        }
        else if ([keyName isEqualToString:@"id"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_USER_ID", @"用户ID")];
        }
        else if ([keyName isEqualToString:@"large_avatar"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_LARGE_AVATAR_URL", @"大头像")];
        }
        else if ([keyName isEqualToString:@"screen_name"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_SCREEN_NAME", @"用户名号")];
        }
        else if ([keyName isEqualToString:@"small_avatar"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_SMALL_AVATAR_URL", @"小头像")];
        }
        else if ([keyName isEqualToString:@"type"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_TYPE", @"类型")];
        }
        else if ([keyName isEqualToString:@"uid"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_USER_ID", @"用户ID")];
        }
    }
}

- (void)fillQQSpaceUser:(id<ISSPlatformUser>)userInfo
{
    NSArray *keys = [[userInfo sourceData] allKeys];
    for (int i = 0; i < [keys count]; i++)
    {
        NSString *keyName = [keys objectAtIndex:i];
        id value = [[userInfo sourceData] objectForKey:keyName];
        if (![value isKindOfClass:[NSString class]])
        {
            if ([value respondsToSelector:@selector(stringValue)])
            {
                value = [value stringValue];
            }
            else
            {
                value = @"";
            }
        }
        
        if ([keyName isEqualToString:@"figureurl"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_FIGURE_URL", @"30×30头像URL")];
        }
        else if ([keyName isEqualToString:@"figureurl_1"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_FIGURE_URL_1", @"50×50头像URL")];
        }
        else if ([keyName isEqualToString:@"figureurl_2"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_FIGURE_URL_2", @"100×100头像URL")];
        }
        else if ([keyName isEqualToString:@"gender"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_GENDER", @"性别")];
        }
        else if ([keyName isEqualToString:@"is_yellow_year_vip"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_IS_YELLOW_YEAR_VIP", @"是否为年费黄钻用户")];
        }
        else if ([keyName isEqualToString:@"level"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_YELLOW_LEVEL", @"黄钻等级")];
        }
        else if ([keyName isEqualToString:@"nickname"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_NICKNAME", @"昵称")];
        }
        else if ([keyName isEqualToString:@"vip"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_YELLOW_VIP", @"是否为黄钻用户")];
        }
    }
}

- (void)fillRenRenUser:(id<ISSPlatformUser>)userInfo
{
    NSArray *keys = [[userInfo sourceData] allKeys];
    for (int i = 0; i < [keys count]; i++)
    {
        NSString *keyName = [keys objectAtIndex:i];
        id value = [[userInfo sourceData] objectForKey:keyName];
        if (![value isKindOfClass:[NSString class]])
        {
            if ([value respondsToSelector:@selector(stringValue)])
            {
                value = [value stringValue];
            }
            else
            {
                value = @"";
            }
        }
        
        if ([keyName isEqualToString:@"uid"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_USER_ID", @"用户id")];
        }
        else if ([keyName isEqualToString:@"name"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_NICKNAME", @"用户名")];
        }
        else if ([keyName isEqualToString:@"sex"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_GENDER", @"性别")];
        }
        else if ([keyName isEqualToString:@"star"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_IS_STAR", @"是否为星级用户")];
        }
        else if ([keyName isEqualToString:@"zidou"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_IS_VIP", @"是否为vip用户")];
        }
        else if ([keyName isEqualToString:@"vip"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_VIP_LEVEL", @"vip用户等级")];
        }
        else if ([keyName isEqualToString:@"birthday"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_BIRTHDAY", @"出生时间")];
        }
        else if ([keyName isEqualToString:@"email_hash"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_EMAIL_HASH", @"经过验证的email的信息")];
        }
        else if ([keyName isEqualToString:@"tinyurl"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_TINY_AVATAR_URL", @"头像链接 50*50")];
        }
        else if ([keyName isEqualToString:@"headurl"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_HEAD_AVATAR_URL", @"头像链接 100*100")];
        }
        else if ([keyName isEqualToString:@"mainurl"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_MAIN_AVATAR_URL", @"头像链接 200*200")];
        }
    }
}

- (void)fillKaiXinUser:(id<ISSPlatformUser>)userInfo
{
    NSArray *keys = [[userInfo sourceData] allKeys];
    for (int i = 0; i < [keys count]; i++)
    {
        NSString *keyName = [keys objectAtIndex:i];
        id value = [[userInfo sourceData] objectForKey:keyName];
        if (![value isKindOfClass:[NSString class]])
        {
            if ([value respondsToSelector:@selector(stringValue)])
            {
                value = [value stringValue];
            }
            else
            {
                value = @"";
            }
        }
        
        if ([keyName isEqualToString:@"uid"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_USER_ID", @"用户ID")];
        }
        else if ([keyName isEqualToString:@"name"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_NICKNAME", @"用户名")];
        }
        else if ([keyName isEqualToString:@"gender"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_GENDER", @"性别")];
        }
        else if ([keyName isEqualToString:@"hometown"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_HOMETOWN", @"家乡")];
        }
        else if ([keyName isEqualToString:@"city"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_LOCATION", @"现居住地")];
        }
        else if ([keyName isEqualToString:@"status"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_STATUS", @"状态")];
        }
        else if ([keyName isEqualToString:@"logo120"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_AVATAR_120", @"头像120 x 120")];
        }
        else if ([keyName isEqualToString:@"logo50"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_AVATAR_50", @"头像50 x 50")];
        }
        else if ([keyName isEqualToString:@"birthday"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_BIRTHDAY", @"生日")];
        }
        else if ([keyName isEqualToString:@"bodyform"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_BODY_FORM", @"体型")];
        }
        else if ([keyName isEqualToString:@"blood"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_BLOOD", @"血型")];
        }
        else if ([keyName isEqualToString:@"marriage"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_MARRIAGE", @"婚姻状态")];
        }
        else if ([keyName isEqualToString:@"trainwith"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_TRAIN_WITH", @"希望结交")];
        }
        else if ([keyName isEqualToString:@"interest"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_INTEREST", @"兴趣爱好")];
        }
        else if ([keyName isEqualToString:@"favbook"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_FAV_BOOK", @"喜欢的书籍")];
        }
        else if ([keyName isEqualToString:@"favmovie"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_FAV_MOVIE", @"喜欢的电影")];
        }
        else if ([keyName isEqualToString:@"favtv"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_FAV_TV", @"喜欢的电视剧")];
        }
        else if ([keyName isEqualToString:@"idol"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_IDOL", @"偶像")];
        }
        else if ([keyName isEqualToString:@"motto"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_MOTTO", @"座右铭")];
        }
        else if ([keyName isEqualToString:@"wishlist"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_WISH_LIST", @"愿望列表")];
        }
        else if ([keyName isEqualToString:@"intro"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_INTRODUCATION", @"介绍")];
        }
        else if ([keyName isEqualToString:@"isStar"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_IS_PUBLISH", @"是否公共主页")];
        }
        else if ([keyName isEqualToString:@"pinyin"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_PINYIN", @"姓名拼音")];
        }
        else if ([keyName isEqualToString:@"online"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_ONLINE", @"是否在线")];
        }
    }
}

- (void)fillInstapaperUser:(id<ISSPlatformUser>)userInfo
{
    NSArray *keys = [[userInfo sourceData] allKeys];
    for (int i = 0; i < [keys count]; i++)
    {
        NSString *keyName = [keys objectAtIndex:i];
        id value = [[userInfo sourceData] objectForKey:keyName];
        if (![value isKindOfClass:[NSString class]])
        {
            if ([value respondsToSelector:@selector(stringValue)])
            {
                value = [value stringValue];
            }
            else
            {
                value = @"";
            }
        }
        
        if ([keyName isEqualToString:@"user_id"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_USER_ID", @"用户ID")];
        }
        else if ([keyName isEqualToString:@"username"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_USER_NAME", @"用户名")];
        }
        else if ([keyName isEqualToString:@"subscription_is_active"])
        {
            [_infoDict setObject:value forKey:@"subscription_is_active"];
        }
    }
}

- (void)fillFacebookUser:(id<ISSPlatformUser>)userInfo
{
    NSArray *keys = [[userInfo sourceData] allKeys];
    for (int i = 0; i < [keys count]; i++)
    {
        NSString *keyName = [keys objectAtIndex:i];
        id value = [[userInfo sourceData] objectForKey:keyName];
        if (![value isKindOfClass:[NSString class]])
        {
            if ([value respondsToSelector:@selector(stringValue)])
            {
                value = [value stringValue];
            }
            else
            {
                value = @"";
            }
        }
        
        if ([keyName isEqualToString:@"birthday"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_BIRTHDAY", @"生日")];
        }
        else if ([keyName isEqualToString:@"email"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_MAIL_ADDR", @"邮箱")];
        }
        else if ([keyName isEqualToString:@"gender"])
        {
            [_infoDict setObject:value forKey:NSLocalizedString(@"TEXT_GENDER", @"性别")];
        }
        else if ([keyName isEqualToString:@"first_name"])
        {
            [_infoDict setObject:value forKey:keyName];
        }
        else if ([keyName isEqualToString:@"id"])
        {
            [_infoDict setObject:value forKey:keyName];
        }
        else if ([keyName isEqualToString:@"installed"])
        {
            [_infoDict setObject:value forKey:keyName];
        }
        else if ([keyName isEqualToString:@"last_name"])
        {
            [_infoDict setObject:value forKey:keyName];
        }
        else if ([keyName isEqualToString:@"link"])
        {
            [_infoDict setObject:value forKey:keyName];
        }
        else if ([keyName isEqualToString:@"locale"])
        {
            [_infoDict setObject:value forKey:keyName];
        }
        else if ([keyName isEqualToString:@"name"])
        {
            [_infoDict setObject:value forKey:keyName];
        }
        else if ([keyName isEqualToString:@"third_party_id"])
        {
            [_infoDict setObject:value forKey:keyName];
        }
        else if ([keyName isEqualToString:@"timezone"])
        {
            [_infoDict setObject:value forKey:keyName];
        }
        else if ([keyName isEqualToString:@"updated_time"])
        {
            [_infoDict setObject:value forKey:keyName];
        }
        else if ([keyName isEqualToString:@"username"])
        {
            [_infoDict setObject:value forKey:keyName];
        }
        else if ([keyName isEqualToString:@"verified"])
        {
            [_infoDict setObject:value forKey:keyName];
        }
    }
}

- (void)fillTwitterUser:(id<ISSPlatformUser>)userInfo
{
    NSArray *keys = [[userInfo sourceData] allKeys];
    for (int i = 0; i < [keys count]; i++)
    {
        NSString *keyName = [keys objectAtIndex:i];
        id value = [[userInfo sourceData] objectForKey:keyName];
        if (![value isKindOfClass:[NSString class]])
        {
            if ([value respondsToSelector:@selector(stringValue)])
            {
                value = [value stringValue];
            }
            else
            {
                value = @"";
            }
        }
        
        [_infoDict setObject:value forKey:keyName];
    }
}

- (void)fillYouDaoNoteUser:(id<ISSPlatformUser>)userInfo
{
    NSArray *keys = [[userInfo sourceData] allKeys];
    for (int i = 0; i < [keys count]; i++)
    {
        NSString *keyName = [keys objectAtIndex:i];
        id value = [[userInfo sourceData] objectForKey:keyName];
        if (![value isKindOfClass:[NSString class]])
        {
            if ([value respondsToSelector:@selector(stringValue)])
            {
                value = [value stringValue];
            }
            else
            {
                value = @"";
            }
        }
        
        [_infoDict setObject:value forKey:keyName];
    }
}

- (void)fillSohuKanUser:(id<ISSPlatformUser>)userInfo
{
    NSArray *keys = [[userInfo sourceData] allKeys];
    for (int i = 0; i < [keys count]; i++)
    {
        NSString *keyName = [keys objectAtIndex:i];
        id value = [[userInfo sourceData] objectForKey:keyName];
        if (![value isKindOfClass:[NSString class]])
        {
            if ([value respondsToSelector:@selector(stringValue)])
            {
                value = [value stringValue];
            }
            else
            {
                value = @"";
            }
        }
        
        [_infoDict setObject:value forKey:keyName];
    }
}

- (void)fillLinkedInUser:(id<ISSPlatformUser>)userInfo
{
    NSArray *keys = [[userInfo sourceData] allKeys];
    for (int i = 0; i < [keys count]; i++)
    {
        NSString *keyName = [keys objectAtIndex:i];
        id value = [[userInfo sourceData] objectForKey:keyName];
        if (![value isKindOfClass:[NSString class]])
        {
            if ([value respondsToSelector:@selector(stringValue)])
            {
                value = [value stringValue];
            }
            else
            {
                value = @"";
            }
        }
        
        [_infoDict setObject:value forKey:keyName];
    }
}

- (void)fillGooglePlusUser:(id<ISSPlatformUser>)userInfo
{
    NSArray *keys = [[userInfo sourceData] allKeys];
    for (int i = 0; i < [keys count]; i++)
    {
        NSString *keyName = [keys objectAtIndex:i];
        id value = [[userInfo sourceData] objectForKey:keyName];
        if (![value isKindOfClass:[NSString class]])
        {
            if ([value respondsToSelector:@selector(stringValue)])
            {
                value = [value stringValue];
            }
            else
            {
                value = @"";
            }
        }
        
        [_infoDict setObject:value forKey:keyName];
    }
}

- (void)loadImage:(NSString *)url
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:url]]];
    [self performSelectorOnMainThread:@selector(showUserIcon:) withObject:image waitUntilDone:NO];
    
    [pool release];
}

- (void)showUserIcon:(UIImage *)icon
{
    if (icon)
    {
        UIImageView *imageView = [[[UIImageView alloc] initWithImage:icon] autorelease];
        imageView.frame = CGRectMake(0.0, 0.0, _tableView.width, imageView.height * _tableView.width / imageView.width);
        _tableView.tableHeaderView = imageView;
    }
}

- (void)layoutPortrait
{
    UIButton *btn = (UIButton *)self.navigationItem.leftBarButtonItem.customView;
    btn.frame = CGRectMake(btn.left, btn.top, 55.0, 32.0);
    [btn setBackgroundImage:[UIImage imageNamed:@"Common/NavigationButtonBG.png"
                                     bundleName:BUNDLE_NAME]
                   forState:UIControlStateNormal];
    
    if ([UIDevice currentDevice].isPad)
    {
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"iPadNavigationBarBG.png"]];
    }
    else
    {
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"iPhoneNavigationBarBG.png"]];
    }

    UIImageView *imageView = [[(UIImageView *)_tableView.tableHeaderView retain] autorelease];
    _tableView.tableHeaderView = nil;
    imageView.frame = CGRectMake(0.0, 0.0, [UIScreen mainScreen].bounds.size.width, imageView.height * [UIScreen mainScreen].bounds.size.width / imageView.width);
    _tableView.tableHeaderView = imageView;
}

- (void)layoutLandscape
{
    if (![UIDevice currentDevice].isPad)
    {
        //iPhone
        UIButton *btn = (UIButton *)self.navigationItem.leftBarButtonItem.customView;
        btn.frame = CGRectMake(btn.left, btn.top, 48.0, 24.0);
        [btn setBackgroundImage:[UIImage imageNamed:@"Common_Landscape/NavigationButtonBG.png"
                                         bundleName:BUNDLE_NAME]
                       forState:UIControlStateNormal];
        
        if ([[UIDevice currentDevice] isPhone5])
        {
            [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"iPhoneLandscapeNavigationBarBG-568h.png"]];
        }
        else
        {
            [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"iPhoneLandscapeNavigationBarBG.png"]];
        }
    }
    else
    {
        UIButton *btn = (UIButton *)self.navigationItem.leftBarButtonItem.customView;
        btn.frame = CGRectMake(btn.left, btn.top, 55.0, 32.0);
        [btn setBackgroundImage:[UIImage imageNamed:@"Common/NavigationButtonBG.png"
                                         bundleName:BUNDLE_NAME]
                       forState:UIControlStateNormal];
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"iPadLandscapeNavigationBarBG.png"]];
    }
    
    
    
    UIImageView *imageView = [[(UIImageView *)_tableView.tableHeaderView retain] autorelease];
    _tableView.tableHeaderView = nil;
    imageView.frame = CGRectMake(0.0, 0.0, [UIScreen mainScreen].bounds.size.height, imageView.height * [UIScreen mainScreen].bounds.size.height / imageView.width);
    _tableView.tableHeaderView = imageView;
}

- (void)layoutView:(UIInterfaceOrientation)orientation
{
    if (UIInterfaceOrientationIsLandscape(orientation))
    {
        [self layoutLandscape];
    }
    else
    {
        [self layoutPortrait];
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[_infoDict allKeys] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TABLE_CELL_ID];
    if (cell == nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:TABLE_CELL_ID] autorelease];
    }
    
    if (indexPath.row < [[_infoDict allKeys] count])
    {
        NSString *keyName = [[_infoDict allKeys] objectAtIndex:indexPath.row];
        cell.textLabel.text = keyName;
        cell.detailTextLabel.text = [_infoDict objectForKey:keyName];
    }
    
    return cell;
}

@end
