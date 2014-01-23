//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <SinaWeiboConnection/SinaWeiboConnection.h>
#import "AGSinaWeiboUserDescItemCell.h"
#import "AGSinaWeiboUserInfoItemCell.h"
#import <SinaWeiboConnection/SSSinaWeiboUserInfoReader.h>

/**
 *	@brief	User Detail Information View Controller.
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
 *	@brief	Initialized user detail information view controller.
 *
 *	@param 	user 	User information.
 *
 *	@return	User detail information view controller
 */
- (id)initWithUser:(SSSinaWeiboUserInfoReader *)user;

/**
 *	@brief	Initialized user detail information view controller.
 *
 *	@param 	userName 	User name.
 *
 *	@return	User detail information view controller.
 */
- (id)initWithUserName:(NSString *)userName;


@end
