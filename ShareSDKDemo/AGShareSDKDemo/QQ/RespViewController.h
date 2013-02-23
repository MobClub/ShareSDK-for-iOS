//
//  RespViewController.h
//  QQApiDemo
//
//  Created by Tencent on 12-5-7.
//  Copyright 2012年 Tencent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RespViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    UITableView *_featureListView;
    
    NSMutableArray* _featureNames;
}

@end
