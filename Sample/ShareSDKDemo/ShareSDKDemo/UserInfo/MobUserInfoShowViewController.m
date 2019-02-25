//
//  MobUserInfoShowViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 2017/5/12.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MobUserInfoShowViewController.h"
#import <MOBFoundation/MOBFoundation.h>
#import "UIImage+KaImage.h"

@interface MobUserInfoShowViewController ()
{
    IBOutlet UITextView *myTextView;
    IBOutlet UIView *mainView;
    UIVisualEffectView * effectView;
    IBOutlet UIButton *copyButton;
    IBOutlet UIButton *clearButon;
    SSDKPlatformType platformType;
    IBOutlet NSLayoutConstraint *mainViewAspect;
}

@end

@implementation MobUserInfoShowViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [mainView.layer setMasksToBounds:YES];
    [mainView.layer setCornerRadius:10];
    UIBlurEffect * blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    effectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    effectView.frame = [UIScreen mainScreen].bounds;
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAct)];
    [effectView addGestureRecognizer:tapGestureRecognizer];
    [self.view insertSubview:effectView atIndex:0];
    copyButton.layer.masksToBounds = YES;
    copyButton.layer.cornerRadius = 15;
    [copyButton setBackgroundImage:[UIImage getImageWithColor:[MOBFColor colorWithRGB:0x00b2ff]] forState:UIControlStateNormal];
    clearButon.layer.masksToBounds = YES;
    clearButon.layer.cornerRadius = 15;
    [clearButon setBackgroundImage:[UIImage getImageWithColor:[UIColor lightGrayColor]] forState:UIControlStateNormal];
    if([MOBFDevice isPad])
    {
        [mainView removeConstraint:mainViewAspect];
        [mainView addConstraint:[NSLayoutConstraint constraintWithItem:mainView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:mainView attribute:NSLayoutAttributeHeight multiplier:1 constant:0]];
    }
}

- (IBAction)copyAct:(id)sender
{
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = myTextView.text;
    [self tapAct];
}

- (IBAction)clearAct:(id)sender
{
    [ShareSDK cancelAuthorize:platformType result:^(NSError *error) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"AuthInfoUPData" object:nil userInfo:nil];
        [self tapAct];
    }];
}

- (void)tapAct
{
    [UIView animateWithDuration:0.15 animations:^{
        self.view.alpha = 0;
    }completion:^(BOOL finished) {
        myTextView.text = @"";
        [self.view removeFromSuperview];
    }];
}

- (void)setUserInfo:(SSDKUser *)userInfo
{
    platformType = userInfo.platformType;
    myTextView.contentOffset = CGPointZero;
    myTextView.text = userInfo.dictionaryValue.debugDescription;
    [UIView animateWithDuration:0.15 animations:^{
        self.view.alpha = 1;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
