//
//  MobUserInfoShowViewController.m
//  ShareSDKDemo
//
//  Created by youzu on 2017/5/12.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "MobUserInfoShowViewController.h"
#import <MOBFoundation/MOBFoundation.h>

@interface MobUserInfoShowViewController ()
{
    UIView *mainView;
    UIVisualEffectView * effectView;
    UIButton *copyButton;
    UIButton *clearButon;
    SSDKPlatformType platformType;
    NSLayoutConstraint *mainViewAspect;
}

@property (nonatomic, strong) UITextView *myTextView;


@end

@implementation MobUserInfoShowViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIViewModelCreate()
    .addToSuperView(self.view)
    .cornerRadius(10)
    .masksToBounds(YES)
    .backgroundColor(UIColor.whiteColor)
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.center.equalTo(self.view);
        make.left.mas_offset(50);
        make.right.mas_offset(-50);
        make.height.mas_offset(421 * SSDK_SCALE);
    })
    .assignTo(^(__kindof UIView * _Nonnull view) {
        mainView = view;
    });
    
    
    UIBlurEffect * blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    
    UIVisualEffectViewModelCreate()
    .effect(blurEffect)
    .addToSuperView(self.view)
    .addGesture([[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAct)])
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.edges.mas_equalTo(0);
    })
    .assignTo(^(__kindof UIView * _Nonnull view) {
        effectView = view;
    });
    
    [self.view insertSubview:effectView atIndex:0];
    self.myTextView.makeChain.addToSuperView(mainView)
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(13, 15, 66, 15));
    });
    
    
    UIButtonModelCreate()
    .masksToBounds(YES)
    .cornerRadius(15)
    .addToSuperView(mainView)
    .font(Font(PingFangReguler, 14))
    .textColor(UIColor.whiteColor, UIControlStateNormal)
    .text(@"复制", UIControlStateNormal)
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.left.equalTo(mainView.mas_centerX).offset(6.5);
        make.bottom.mas_offset(-12);
        make.width.mas_equalTo(90);
        make.height.mas_equalTo(30);
    })
    .assignTo(^(__kindof UIView * _Nonnull view) {
        copyButton = view;
    })
    .backgroundImage([UIImage imageWithColor:UIColorHexString(@"0x00b2ff")], UIControlStateNormal)
    .addTarget(self, @selector(copyAct:), UIControlEventTouchUpInside);
    
    UIButtonModelCreate()
    .masksToBounds(YES)
    .cornerRadius(15)
    .font(Font(PingFangReguler, 14))
    .addToSuperView(mainView)
    .textColor(UIColor.whiteColor, UIControlStateNormal)
    .text(@"清除信息", UIControlStateNormal)
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        
        make.right.equalTo(mainView.mas_centerX).offset(-6.5);
        make.bottom.mas_offset(-12);
        make.width.mas_equalTo(90);
        make.height.mas_equalTo(30);
    })
    .assignTo(^(__kindof UIView * _Nonnull view) {
        clearButon = view;
    })
    .backgroundImage([UIImage imageWithColor:[UIColor lightGrayColor]], UIControlStateNormal)
    .addTarget(self, @selector(clearAct:), UIControlEventTouchUpInside);
    
    UIButtonModelCreate()
    .masksToBounds(YES)
    .cornerRadius(18.5)
    .borderColor([UIColor whiteColor].CGColor)
    .borderWidth(1)
    .addToSuperView(self.view)
    .image(UIImageNamed(@"closeButton"), UIControlStateNormal)
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.top.equalTo(mainView.mas_bottom).offset(58);
        make.centerX.equalTo(mainView);
        make.width.height.mas_equalTo(37);
    })
    .assignTo(^(__kindof UIView * _Nonnull view) {
        clearButon = view;
    })
    .backgroundImage([UIImage imageWithColor:[UIColor lightGrayColor]], UIControlStateNormal)
    .addTarget(self, @selector(tapAct), UIControlEventTouchUpInside);
}

- (UITextView *)myTextView{
    if (!_myTextView ) {
        UITextViewModelCreate()
        .editable(NO)
        .font(Font(PingFangReguler, 12))
        .textColor(UIColorHexString(@"707070"))
        .assignTo(^(__kindof UIView * _Nonnull view) {
            _myTextView = view;
        });
    }
    return _myTextView;

}


- (void)copyAct:(id)sender
{
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = self.myTextView.text;
    [self tapAct];
}

- (void)clearAct:(id)sender
{
    [ShareSDK cancelAuthorize:platformType result:^(NSError *error) {
        if (self.isCancelAuth) {
            self.isCancelAuth();
        }
        [self tapAct];
    }];
}

- (void)tapAct
{
    [UIView animateWithDuration:0.15 animations:^{
        self.view.alpha = 0;
    }completion:^(BOOL finished) {
        self.myTextView.text = @"";
        [self dismissViewControllerAnimated:NO completion:nil];
    }];
}



- (void)setUserInfo:(SSDKUser *)userInfo
{
    platformType = userInfo.platformType;
    self.myTextView.contentOffset = CGPointZero;
    self.myTextView.text = [userInfo.dictionaryValue jsonPrettyString];
    if (self.myTextView.text.length == 0) {
        self.myTextView.text = [userInfo.dictionaryValue debugDescription];
    }

    [UIView animateWithDuration:0.15 animations:^{
        self.view.alpha = 1;
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
