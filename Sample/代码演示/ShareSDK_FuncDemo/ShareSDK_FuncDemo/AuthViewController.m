//
//  AuthViewController.m
//  CustomAuthView
//
//  Created by fenghj on 15/7/1.
//  Copyright (c) 2015年 mob. All rights reserved.
//

#import "AuthViewController.h"
#import <ShareSDK/ISSDKAuthView.h>
#import <ShareSDKExtension/ShareSDK+Extension.h>

@interface AuthViewController ()

/**
 *  授权视图
 */
@property (nonatomic, strong) UIView<ISSDKAuthView> *authView;

/**
 *  关注按钮
 */
@property (nonatomic, strong) UIButton *followBtn;

@end

@implementation AuthViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.authView.frame = self.view.bounds;
    self.authView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.authView];
    
    self.followBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.followBtn.backgroundColor = [UIColor grayColor];
    [self.followBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.followBtn setTitle:@"关注官博" forState:UIControlStateNormal];
    [self.followBtn setTitle:@"√关注官博" forState:UIControlStateSelected];
    self.followBtn.frame = CGRectMake(0.0, self.view.frame.size.height - 50, self.view.frame.size.width, 50);
    [self.view addSubview:self.followBtn];
    [self.followBtn addTarget:self action:@selector(followBtnClickHandler:) forControlEvents:UIControlEventTouchUpInside];
}

- (instancetype)initWithAuthView:(UIView<ISSDKAuthView> *)authView
{
    if (self = [super init])
    {
        self.title = @"自定义授权";
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelButtonClickHandler:)];
        
        __weak AuthViewController *theController = self;
        self.authView = authView;
        [self.authView onAuthStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
           
            //监听授权视图回调，可以在这个方法中实现一些操作，如像该例子中判断是否需要关注官博
            if (state == SSDKResponseStateSuccess)
            {
                //授权成功
                if (theController.followBtn.selected)
                {
                    //关注官博
                    SSDKUser *officalUser = [[SSDKUser alloc] init];
                    officalUser.nickname = @"ShareSDK";
                    
                    [ShareSDK addFriend:SSDKPlatformTypeSinaWeibo
                                   user:officalUser
                         onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error)
                     {
                        if (state == SSDKResponseStateSuccess)
                        {
                            NSLog(@"关注成功");
                        }
                    }];
                }
            }
            [theController dismissViewControllerAnimated:YES completion:^{}];
        }];
    }
    return self;
}

/**
 *  取消按钮点击
 *
 *  @param sender 事件对象
 */
- (void)cancelButtonClickHandler:(id)sender
{
    [self.authView cancel];
}

/**
 *  关注官博按钮点击
 *
 *  @param sender 事件对象
 */
- (void)followBtnClickHandler:(id)sender
{
    self.followBtn.selected = !self.followBtn.selected;
}

@end
