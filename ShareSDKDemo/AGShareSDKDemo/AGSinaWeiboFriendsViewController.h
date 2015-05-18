//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.mob.com
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <AGCommon/CMRefreshTableHeaderView.h>
#import <AGCommon/CMImageCacheManager.h>
#import <SinaWeiboConnection/SinaWeiboConnection.h>

/**
 *	@brief	新浪微博好友类型
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
 *	@brief	初始化新浪微博好友列表视图控制器
 *
 *	@param 	type 	好友类型
 *  @param  user    用户信息
 *  @param  imageCacheManager   图片缓存管理器
 *  
 *	@return	好友列表视图控制器
 */
- (id)initWithType:(AGSinaWeiboFriendsType)type userName:(NSString *)userName imageCacheManager:(CMImageCacheManager *)imageCacheManager;


@end
