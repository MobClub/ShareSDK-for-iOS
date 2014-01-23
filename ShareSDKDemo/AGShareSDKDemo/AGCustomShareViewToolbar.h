//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <AGCommon/CMHTableView.h>

@class AGAppDelegate;

/**
 *	@brief	Custom Share View Toolbar.
 */
@interface AGCustomShareViewToolbar : UIView <CMHTableViewDataSource,
                                              CMHTableViewDelegate>
{
@private
    CMHTableView *_tableView;
    UILabel *_textLabel;
    
    NSMutableArray *_oneKeyShareListArray;
    AGAppDelegate *_appDelegate;
}

/**
 *	@brief	Get selected platform type list.
 *
 *	@return	Selected platofm type list.
 */
- (NSArray *)selectedClients;


@end
