//
//  AGCustomAtPlatListViewController.h
//  AGShareSDKDemo
//
//  Created by 冯 鸿杰 on 13-3-5.
//  Copyright (c) 2013年 vimfung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ShareSDK/ShareSDK.h>

@interface AGCustomAtPlatListViewController : UIViewController <UITableViewDataSource,
                                                                UITableViewDelegate>
{
@private
    UITableView *_tableView;
    id _changeHandler;
    id _cancelHandler;
    
    BOOL _isCancelButtonClick;
}

/**
 *	@brief	初始化视图控制器
 *
 *  @param  changeHandler   变更事件
 *  @param  cancelHandler   取消事件
 *
 *	@return	视图控制器
 */
- (id)initWithChangeHandler:(void(^)(NSArray *users, ShareType shareType))changeHandler
              cancelHandler:(void(^)())cancelHandler;


@end
