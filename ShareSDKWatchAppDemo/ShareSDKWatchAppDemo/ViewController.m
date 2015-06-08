//
//  ViewController.m
//  ShareSDKWatchAppDemo
//
//  Created by 刘 靖煌 on 15/5/15.
//  Copyright (c) 2015年 游族网络MOB事业部. All rights reserved.
//

#import "ViewController.h"
#import "AuthViewContriller.h"

@interface ViewController ()
{
    UILabel *_label;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 35)];
    [_label setText:@"可在菜单中的授权项给平台授权"];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.center = self.view.center;
    [self.view addSubview:_label];
}

@end
