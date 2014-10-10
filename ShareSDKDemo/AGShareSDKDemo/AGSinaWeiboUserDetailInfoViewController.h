//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.mob.com
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <SinaWeiboConnection/SinaWeiboConnection.h>
#import "AGSinaWeiboUserDescItemCell.h"
#import "AGSinaWeiboUserInfoItemCell.h"
#import <SinaWeiboConnection/SSSinaWeiboUserInfoReader.h>

/**
 *	@brief	用户详细信息视图控制器
 */
@interface AGSinaWeiboUserDetailInfoViewController : UIViewController <UITableViewDataSource,
                                                                       UITableViewDelegate>
{
@private
    UITableView *_tableView;
    AGSinaWeiboUserDescItemCell *_descCell;
    AGSinaWeiboUserInfoItemCell *_infoCell;
    
    SSSinaWeiboUserInfoReader *_user;
    NSString *_userName;
    NSMutableArray *_rowInfoArray;
}

/**
 *	@brief	初始化用户详细资料视图控制器
 *
 *	@param 	user 	用户信息
 *
 *	@return	详细资料视图控制器
 */
- (id)initWithUser:(SSSinaWeiboUserInfoReader *)user;

/**
 *	@brief	初始化用户详细资料视图控制器
 *
 *	@param 	userName 	用户名称
 *
 *	@return	详细资料视图控制器
 */
- (id)initWithUserName:(NSString *)userName;


@end
