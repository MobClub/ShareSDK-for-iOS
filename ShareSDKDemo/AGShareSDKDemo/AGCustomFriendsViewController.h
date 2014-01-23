//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <ShareSDK/ShareSDK.h>
#import <AGCommon/CMImageCacheManager.h>
#import <AGCommon/CMRefreshTableHeaderView.h>
#import "AGCustomFriendListViewToolbar.h"

@class AGAppDelegate;

/**
 *	@brief	Custom Friends View Controller.
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
 *	@brief	Initialize view controller.
 *
 *	@param 	shareType 	Platform type.
 *  @param  changeHandler   Change selected mention user lists events
 *
 *	@return	View controller.
 */
- (id)initWithShareType:(ShareType)shareType changeHandler:(void(^)(NSArray *users, ShareType shareType))changeHandler;

@end
