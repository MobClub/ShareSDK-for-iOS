//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "AGSinaWeiboUserInfoHeaderView.h"
#import "AGSinaWeiboStatusCell.h"
#import <AGCommon/CMImageCacheManager.h>
#import <AGCommon/CMRefreshTableHeaderView.h>

@class AGAppDelegate;

@interface AGSinaWeiboListViewController : UIViewController <UITableViewDataSource,
                                                             UITableViewDelegate,
                                                             CMRefreshTableHeaderDelegate,
                                                             AGSinaWeiboStatusCellDelegate,
                                                             AGSinaWeiboUserInfoHeaderViewDelegate>
{
@private
    BOOL _initialized;
    AGAppDelegate *_appDelegate;
    CMImageCacheManager *_imageCacheManager;
    NSMutableArray *_statusArray;
    NSMutableDictionary *_heightDict;
    id<ISSPlatformUser> _user;
    BOOL _hasNext;
    NSInteger _page;
    BOOL _isGetting;
    BOOL _refreshData;
    
    UITableView *_statusesTableView;
    AGSinaWeiboUserInfoHeaderView *_headerView;
    AGSinaWeiboStatusCell *_statusCell;
    CMRefreshTableHeaderView *_refreshTableHeaderView;
}

@end
