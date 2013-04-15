//
//  ViewController.h
//  QQApiDemo
//
//  Created by Tencent on 12-5-7.
//  Copyright (c) 2012年 Tencent. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QQTextViewController.h"

@class AGAppDelegate;

@interface QQDemoViewController : UIViewController<UITableViewDataSource,
                                                   UITableViewDelegate,
                                                   UIImagePickerControllerDelegate,
                                                   UINavigationControllerDelegate,
                                                   QQTextViewControllerDelegate>
{
    UITableView *_featureListView;
    
    NSMutableArray* _featureNames;
    NSMutableArray* _featureNames2;
    NSMutableArray* _featureNames3;
    
    AGAppDelegate *_appDelegate;
}

@end
