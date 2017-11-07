//
//  MOBLoadingViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 17/3/22.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MOBLoadingViewController.h"
#import <ShareSDK/SSDKVideoUploadCenter.h>

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
    if(self.httpServiceModel != nil)
    {
        [[SSDKVideoUploadCenter shareInstance] closeWithModel:self.httpServiceModel];
    }
    [UIView animateWithDuration:0.25 animations:^{
        self.view.alpha = 0;
    } completion:^(BOOL finished) {
        self.progressView.progress = 0;
        [self.view removeFromSuperview];
    }];
}

- (IBAction)stopAct:(UIButton *)sender
{
    if(!sender.isSelected)
    {
        //暂停
        if(self.httpServiceModel != nil)
        {
            [[SSDKVideoUploadCenter shareInstance] stopWithModel:self.httpServiceModel];
        }
        [sender setTitle:@"继续" forState:UIControlStateNormal];
    }
    else
    {
        //续传
        if(self.httpServiceModel != nil)
        {
            [[SSDKVideoUploadCenter shareInstance] continueWithModel:self.httpServiceModel];
        }
        [sender setTitle:@"暂停" forState:UIControlStateNormal];
    }
    [sender setSelected:!sender.selected];
    
}
@end
