//
//  AGCustomShareViewToolbar.h
//  AGShareSDKDemo
//
//  Created by 冯 鸿杰 on 13-3-5.
//  Copyright (c) 2013年 vimfung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AGCommon/CMHTableView.h>

@class AGAppDelegate;

/**
 *	@brief	自定义分享视图工具栏
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
 *	@brief	获取选中分享平台列表
 *
 *	@return	选中分享平台列表
 */
- (NSArray *)selectedClients;


@end
