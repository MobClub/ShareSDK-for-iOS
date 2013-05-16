//
//  AGCustomFriendsViewController.h
//  AGShareSDKDemo
//
//  Created by 冯 鸿杰 on 13-3-6.
//  Copyright (c) 2013年 vimfung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ShareSDK/ShareSDK.h>
#import <AGCommon/CMImageCacheManager.h>
#import <AGCommon/CMRefreshTableHeaderView.h>
#import "AGCustomFriendListViewToolbar.h"

@class AGAppDelegate;

/**
 *	@brief	自定义好友列表视图控制器
 */
@interface AGCustomFriendsViewController : UIViewController <UITableViewDataSource,
                                                             UITableViewDelegate,
                                                             CMRefreshTableHeaderDelegate>
{
@private
    UITableView *_tableView;
    CMRefreshTableHeaderView *_refreshHeaderView;
    AGCustomFriendListViewToolbar *_toolbar;
    
    NSMutableArray *_friendsArray;
    NSMutableArray *_selectedArray;
    ShareType _shareType;
    CMImageCacheManager *_imageCacheManager;
    BOOL _refreshData;
    BOOL _hasNext;
    BOOL _initialized;
    NSInteger _page;
    id _changeHandler;
    
    AGAppDelegate *_appDelegate;
}

/**
 *	@brief	初始化视图控制器
 *
 *	@param 	shareType 	分享类型
 *  @param  changeHandler   变更选中@用户列表事件处理器
 *
 *	@return	视图控制器
 */
- (id)initWithShareType:(ShareType)shareType changeHandler:(void(^)(NSArray *users, ShareType shareType))changeHandler;

@end
