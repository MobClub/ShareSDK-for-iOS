//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.mob.com
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
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
