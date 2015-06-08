//
//  AuthViewContriller.h
//  ShareSDKWatchAppDemo
//
//  Created by 刘 靖煌 on 15/5/29.
//  Copyright (c) 2015年 游族网络MOB事业部. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"

/**
 *	@brief	授权视图控制器
 */
@interface AuthViewContriller : RootViewController<UITableViewDataSource, UITableViewDelegate>
{
@private
    UITableView *_tableView;
    NSMutableArray *_shareTypeArray;
}

@end
