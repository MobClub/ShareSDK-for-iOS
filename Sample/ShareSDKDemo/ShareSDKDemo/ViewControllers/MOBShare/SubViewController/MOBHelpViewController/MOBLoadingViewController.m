//
//  MOBLoadingViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 17/3/22.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBLoadingViewController.h"


@interface MOBLoadingViewController ()
{
    IBOutlet UIButton *stopButton;
}

@end

@implementation MOBLoadingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)closeAct:(UIButton *)sender
{
    //关闭
    [self.session cancel];
}

- (void)hidden
{
    [UIView animateWithDuration:0.25 animations:^{
        self.view.alpha = 0;
    } completion:^(BOOL finished) {
        self.progressView.progress = 0;
        [self.view removeFromSuperview];
    }];
}

@end
