//
//  AGLeftSideViewController.h
//  AGShareSDKDemo
//
//  Created by 冯 鸿杰 on 13-1-30.
//  Copyright (c) 2013年 vimfung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGSectionView.h"

@class AGAppDelegate;

@interface AGLeftSideViewController : UIViewController <UITableViewDataSource,
                                                        UITableViewDelegate>
{
@private
    UITableView *_tableView;
    AGSectionView *_sectionView;
    
    AGAppDelegate *_appDelegate;
}

@end
