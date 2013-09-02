//
//  AGCustomShareViewToolbar.m
//  AGShareSDKDemo
//
//  Created by 冯 鸿杰 on 13-3-5.
//  Copyright (c) 2013年 vimfung. All rights reserved.
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
        _textLabel.text = @"分享到:";
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
                                 [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  SHARE_TYPE_NUMBER(ShareTypeQQSpace),
                                  @"type",
                                  [NSNumber numberWithBool:NO],
                                  @"selected",
                                  nil],
                                 [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  SHARE_TYPE_NUMBER(ShareType163Weibo),
                                  @"type",
                                  [NSNumber numberWithBool:NO],
                                  @"selected",
                                  nil],
                                 [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  SHARE_TYPE_NUMBER(ShareTypeSohuWeibo),
                                  @"type",
                                  [NSNumber numberWithBool:NO],
                                  @"selected",
                                  nil],
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
                                                                      ShareType shareType = [[item objectForKey:@"type"] integerValue];
                                                                      
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
                                                                                                 result:^(BOOL result, id<ISSUserInfo> userInfo, id<ICMErrorInfo> error) {
                                                                                                     if (result)
                                                                                                     {
                                                                                                         [item setObject:[NSNumber numberWithBool:YES] forKey:@"selected"];
                                                                                                         [_tableView reloadData];
                                                                                                     }
                                                                                                     else
                                                                                                     {
                                                                                                         if ([error errorCode] != -103)
                                                                                                         {
                                                                                                             UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"绑定失败!" delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil];
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
        UIImage *icon = [ShareSDK getClientIconWithType:[[item objectForKey:@"type"] integerValue]];
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
