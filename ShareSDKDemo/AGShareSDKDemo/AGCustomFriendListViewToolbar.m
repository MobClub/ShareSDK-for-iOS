//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.mob.com
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
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
