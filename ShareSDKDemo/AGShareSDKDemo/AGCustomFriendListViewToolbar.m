//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import "AGCustomFriendListViewToolbar.h"
#import "AGCustomUserItemView.h"

#define ITEM_ID @"ITEM"

@implementation AGCustomFriendListViewToolbar

- (id)initWithFrame:(CGRect)frame
      selectedArray:(NSMutableArray *)selectedArray
  imageCacheManager:(CMImageCacheManager *)imageCacheManager
          shareType:(ShareType)shareType
   itemClickHandler:(void (^)(NSMutableDictionary *))itemClickHandler
    completeHandler:(void(^)())completeHandler
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _selectedArray = [selectedArray retain];
        _imageCacheManager = [imageCacheManager retain];
        _shareType = shareType;
        _itemClickHandler = [itemClickHandler copy];
        _completeHandler = [completeHandler copy];
        
        _bgView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"ToolbarBG.png"] stretchableImageWithLeftCapWidth:1 topCapHeight:27]];
        _bgView.frame = CGRectMake(0.0, 0.0, self.width, self.height);
        _bgView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        [self addSubview:_bgView];
        [_bgView release];
        
        _completeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_completeButton setTitle:NSLocalizedString(@"TEXT_COMPLETE", @"完成(0/20)") forState:UIControlStateNormal];
        _completeButton.titleLabel.font = [UIFont systemFontOfSize:13];
        [_completeButton sizeToFit];
        _completeButton.frame = CGRectMake(self.width - 70, (self.height - 30) / 2, 65, 30);
        [_completeButton setBackgroundImage:[[UIImage imageNamed:@"NavigationButtonBG.png"] stretchableImageWithLeftCapWidth:30 topCapHeight:15]
                                   forState:UIControlStateNormal];
        [_completeButton addTarget:self action:@selector(completeButtonClickHandler:) forControlEvents:UIControlEventTouchUpInside];
        _completeButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
        [self addSubview:_completeButton];
        
        _tableView = [[CMHTableView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.width - _completeButton.width - 8, self.height)];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.itemWidth = 40;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:_tableView];
        [_tableView release];
    }
    return self;
}

- (void)dealloc
{
    SAFE_RELEASE(_selectedArray);
    SAFE_RELEASE(_imageCacheManager);
    SAFE_RELEASE(_itemClickHandler);
    SAFE_RELEASE(_completeHandler);
    
    _completeButton = nil;
    _tableView = nil;
    
    [super dealloc];
}

- (void)reloadData
{
    [_completeButton setTitle:[NSString stringWithFormat:NSLocalizedString(@"TEXT_COMPLETE_2", @"完成(%d/20)"), [_selectedArray count]]
                     forState:UIControlStateNormal];
    [_tableView reloadData];
}

- (void)completeButtonClickHandler:(id)sender
{
    if (_completeHandler)
    {
        ((void(^)())_completeHandler)();
    }
}

#pragma mark - CMHTableViewDataSource

- (NSInteger)itemNumberOfTableView:(CMHTableView *)tableView
{
    return [_selectedArray count];
}

- (UIView<ICMHTableViewItem> *)tableView:(CMHTableView *)tableView itemForIndexPath:(NSIndexPath *)indexPath
{
    AGCustomUserItemView *itemView = (AGCustomUserItemView *)[tableView dequeueReusableItemWithIdentifier:ITEM_ID];
    if (itemView == nil)
    {
        itemView = [[[AGCustomUserItemView alloc] initWithReuseIdentifier:ITEM_ID
                                                        imageCacheManager:_imageCacheManager
                                                                shareType:_shareType
                                                             clickHandler:_itemClickHandler]
                    autorelease];
    }
    
    if (indexPath.row < [_selectedArray count])
    {
        itemView.userInfo = [_selectedArray objectAtIndex:indexPath.row];
    }
    
    return itemView;
}

@end
