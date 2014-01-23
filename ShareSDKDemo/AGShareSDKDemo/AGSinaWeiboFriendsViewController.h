//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <AGCommon/CMRefreshTableHeaderView.h>
#import <AGCommon/CMImageCacheManager.h>
#import <SinaWeiboConnection/SinaWeiboConnection.h>

/**
 *	@brief	Sina Weibo Frineds Type
 */
typedef enum
{
	AGSinaWeiboFriendsTypeFriend = 0, /**< 关注 */
	AGSinaWeiboFriendsTypeFollower = 1 /**< 粉丝 */
}AGSinaWeiboFriendsType;


@class AGAppDelegate;

@interface AGSinaWeiboFriendsViewController : UIViewController <UITableViewDataSource,
                                                                UITableViewDelegate,
                                                                CMRefreshTableHeaderDelegate>
{
@private
    UITableView *_tableView;
    CMRefreshTableHeaderView *_refreshHeaderView;
    
    NSMutableArray *_friendsArray;
    CMImageCacheManager *_imageCacheManager;
    BOOL _refreshData;
    BOOL _hasNext;
    BOOL _isGetting;
    NSInteger _page;
    id _changeHandler;
    
    AGAppDelegate *_appDelegate;
    AGSinaWeiboFriendsType _type;
    NSString *_userName;
}

/**
 *	@brief	Initialize Sina Weibo friend list view controller.
 *
 *	@param 	type 	Friend type.
 *  @param  user    User information.
 *  @param  imageCacheManager   Image cache manager.
 *
 *	@return	Friend list view controller.
 */
- (id)initWithType:(AGSinaWeiboFriendsType)type userName:(NSString *)userName imageCacheManager:(CMImageCacheManager *)imageCacheManager;


@end
