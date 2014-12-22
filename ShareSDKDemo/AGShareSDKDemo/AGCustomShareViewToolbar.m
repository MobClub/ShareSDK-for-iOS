//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.mob.com
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import "AGCustomShareViewToolbar.h"
#import "AGCustomShareItemView.h"
#import <ShareSDK/ShareSDK.h>
#import <AGCommon/UIImage+Common.h>
#import <AGCommon/UIColor+Common.h>
#import "AGAppDelegate.h"

#define ITEM_ID @"item"

@implementation AGCustomShareViewToolbar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _appDelegate = (AGAppDelegate *)[UIApplication sharedApplication].delegate;
        
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        
        _textLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _textLabel.backgroundColor = [UIColor clearColor];
        _textLabel.textColor = [UIColor colorWithRGB:0xd2d2d2];
        _textLabel.text = NSLocalizedString(@"TEXT_SHARE_TO", @"分享到:");
        _textLabel.font = [UIFont boldSystemFontOfSize:12];
        [_textLabel sizeToFit];
        _textLabel.frame = CGRectMake(3.0, 0.0, _textLabel.width + 3, self.height);
        _textLabel.contentMode = UIViewContentModeCenter;
        [self addSubview:_textLabel];
        [_textLabel release];
        
        _tableView = [[CMHTableView alloc] initWithFrame:CGRectMake(_textLabel.right, 0.0, self.width - _textLabel.right, self.height)];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.itemWidth = 40;
        _tableView.showsHorizontalScrollIndicator = NO;
        [self addSubview:_tableView];
        [_tableView release];
        
        _oneKeyShareListArray = [[NSMutableArray alloc] initWithObjects:
                                 [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  SHARE_TYPE_NUMBER(ShareTypeSinaWeibo),
                                  @"type",
                                  [NSNumber numberWithBool:NO],
                                  @"selected",
                                  nil],
                                 [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  SHARE_TYPE_NUMBER(ShareTypeTencentWeibo),
                                  @"type",
                                  [NSNumber numberWithBool:NO],
                                  @"selected",
                                  nil],
//                                 [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                                  SHARE_TYPE_NUMBER(ShareType163Weibo),
//                                  @"type",
//                                  [NSNumber numberWithBool:NO],
//                                  @"selected",
//                                  nil],
//                                 [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                                  SHARE_TYPE_NUMBER(ShareTypeSohuWeibo),
//                                  @"type",
//                                  [NSNumber numberWithBool:NO],
//                                  @"selected",
//                                  nil],
                                 [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  SHARE_TYPE_NUMBER(ShareTypeFacebook),
                                  @"type",
                                  [NSNumber numberWithBool:NO],
                                  @"selected",
                                  nil],
                                 [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  SHARE_TYPE_NUMBER(ShareTypeTwitter),
                                  @"type",
                                  [NSNumber numberWithBool:NO],
                                  @"selected",
                                  nil],
                                 [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  SHARE_TYPE_NUMBER(ShareTypeRenren),
                                  @"type",
                                  [NSNumber numberWithBool:NO],
                                  @"selected",
                                  nil],
                                 [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  SHARE_TYPE_NUMBER(ShareTypeKaixin),
                                  @"type",
                                  [NSNumber numberWithBool:NO],
                                  @"selected",
                                  nil],
                                 [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  SHARE_TYPE_NUMBER(ShareTypeDouBan),
                                  @"type",
                                  [NSNumber numberWithBool:NO],
                                  @"selected",
                                  nil],
                                 [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  SHARE_TYPE_NUMBER(ShareTypeEvernote),
                                  @"type",
                                  [NSNumber numberWithBool:NO],
                                  @"selected",
                                  nil],
                                 [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  SHARE_TYPE_NUMBER(ShareTypeLinkedIn),
                                  @"type",
                                  [NSNumber numberWithBool:NO],
                                  @"selected",
                                  nil],
                                 [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  SHARE_TYPE_NUMBER(ShareTypePocket),
                                  @"type",
                                  [NSNumber numberWithBool:NO],
                                  @"selected",
                                  nil],
                                 [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  SHARE_TYPE_NUMBER(ShareTypeInstapaper),
                                  @"type",
                                  [NSNumber numberWithBool:NO],
                                  @"selected",
                                  nil],
                                 [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  SHARE_TYPE_NUMBER(ShareTypeYouDaoNote),
                                  @"type",
                                  [NSNumber numberWithBool:NO],
                                  @"selected",
                                  nil],
                                 [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  SHARE_TYPE_NUMBER(ShareTypeSohuKan),
                                  @"type",
                                  [NSNumber numberWithBool:NO],
                                  @"selected",
                                  nil],
                                 nil];
        
        
        
    }
    return self;
}

- (void)dealloc
{
    _tableView.dataSource = nil;
    _tableView.delegate = nil;
    _tableView = nil;
    
    SAFE_RELEASE(_oneKeyShareListArray);
    SAFE_RELEASE(_textLabel);
    
    [super dealloc];
}

- (NSArray *)selectedClients
{
    NSMutableArray *clients = [NSMutableArray array];
    
    for (int i = 0; i < [_oneKeyShareListArray count]; i++)
    {
        NSDictionary *item = [_oneKeyShareListArray objectAtIndex:i];
        if ([[item objectForKey:@"selected"] boolValue])
        {
            [clients addObject:[item objectForKey:@"type"]];
        }
    }
    
    return clients;
}

#pragma mark - CMHTableViewDataSource

- (NSInteger)itemNumberOfTableView:(CMHTableView *)tableView
{
    return [_oneKeyShareListArray count];
}

- (UIView<ICMHTableViewItem> *)tableView:(CMHTableView *)tableView itemForIndexPath:(NSIndexPath *)indexPath
{
    AGCustomShareItemView *itemView = (AGCustomShareItemView *)[tableView dequeueReusableItemWithIdentifier:ITEM_ID];
    if (itemView == nil)
    {
        itemView = [[[AGCustomShareItemView alloc] initWithReuseIdentifier:ITEM_ID
                                                              clickHandler:^(NSIndexPath *indexPath) {
                                                                  if (indexPath.row < [_oneKeyShareListArray count])
                                                                  {
                                                                      NSMutableDictionary *item = [_oneKeyShareListArray objectAtIndex:indexPath.row];
                                                                      ShareType shareType = (ShareType)[[item objectForKey:@"type"] integerValue];
                                                                      
                                                                      if ([ShareSDK hasAuthorizedWithType:shareType])
                                                                      {
                                                                          BOOL selected = ! [[item objectForKey:@"selected"] boolValue];
                                                                          [item setObject:[NSNumber numberWithBool:selected] forKey:@"selected"];
                                                                          [_tableView reloadData];
                                                                      }
                                                                      else
                                                                      {
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
                                                                          
                                                                          [ShareSDK getUserInfoWithType:shareType
                                                                                            authOptions:authOptions
                                                                                                 result:^(BOOL result, id<ISSPlatformUser> userInfo, id<ICMErrorInfo> error) {
                                                                                                     
                                                                                                     if (result)
                                                                                                     {
                                                                                                         [item setObject:[NSNumber numberWithBool:YES] forKey:@"selected"];
                                                                                                         [_tableView reloadData];
                                                                                                     }
                                                                                                     else
                                                                                                     {
                                                                                                         if ([error errorCode] != -103)
                                                                                                         {
                                                                                                             UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"TEXT_TIPS", @"提示")  message:NSLocalizedString(@"TEXT_BING_FAI", @"绑定失败!")  delegate:nil cancelButtonTitle:NSLocalizedString(@"TEXT_KNOW", @"知道了") otherButtonTitles:nil];
                                                                                                             [alertView show];
                                                                                                             [alertView release];
                                                                                                         }
                                                                                                     }
                                                                                                 }];
                                                                      }
                                                                  }
                                                              }] autorelease];
    }
    
    if (indexPath.row < [_oneKeyShareListArray count])
    {
        NSDictionary *item = [_oneKeyShareListArray objectAtIndex:indexPath.row];
        UIImage *icon = [ShareSDK getClientIconWithType:(ShareType)[[item objectForKey:@"type"] integerValue]];
        itemView.iconImageView.image = icon;
        
        if ([[item objectForKey:@"selected"] boolValue])
        {
            itemView.iconImageView.alpha = 1;
        }
        else
        {
            itemView.iconImageView.alpha = 0.3;
        }
    }
    
    return itemView;
}

@end
