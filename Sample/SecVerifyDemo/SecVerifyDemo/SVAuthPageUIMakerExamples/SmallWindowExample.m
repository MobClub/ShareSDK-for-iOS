//
//  SmallWindowExample.m
//  SecVerifyDemo
//
//  Created by TanXiang on 2020/11/27.
//  Copyright © 2020 yoozoo. All rights reserved.
//

#import "SmallWindowExample.h"
#import "Masonry.h"
#import "SVDDemoHelper.h"
#import <UIKit/UIKit.h>
@interface SmallWindowExample()<UIViewControllerTransitioningDelegate,UIViewControllerAnimatedTransitioning>
@property (nonatomic,weak)id target;//绑定自定义按钮点击事件的target

@property (nonatomic,weak)UIViewController * authPageVC;//是present还是dismiss
@property (nonatomic,assign)BOOL isPresentAnimation;//是present还是dismiss

@end

@implementation SmallWindowExample

- (instancetype)initWithTarget:(id)target{
    self = [super init];
    if (self) {
        _target = target;
    }
    return self;
}


//自定义授权页面
-(void)setupAuthPageCustomStyle:(UIViewController *)authVC userInfo:(SVSDKHyProtocolUserInfo *)userInfo{
    
    self.authPageVC = authVC;
    
    //授权页view
    UIView * authPageView = authVC.view;

    UIButton * backButton = userInfo.backButton;//自带的backButton，在navBar上

    UIButton * loginButton = userInfo.loginButton;
    UIImageView * logoImageView  = userInfo.logoImageView;
    UILabel  * phoneLabel = userInfo.phoneLabel;
    UIButton * checkBox  = userInfo.checkBox;
    UITextView * privacyTextView = userInfo.privacyTextView;
    UILabel  * sloganLabel = userInfo.sloganLabel;
    
    /*******授权页logo*******/
    logoImageView.image = [UIImage imageNamed:@"icon_m"];

    /*******授权页logo*******/
    phoneLabel.textColor = [UIColor blackColor];
    phoneLabel.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:21];;
    phoneLabel.textAlignment = NSTextAlignmentCenter;

    /*******复选框*******/
    //未选中时的图片
    [checkBox setImage:[UIImage imageNamed:@"uncheck"] forState:(UIControlStateNormal)];
    //选中时的图片
    [checkBox setImage:[UIImage imageNamed:@"checked"] forState:(UIControlStateSelected)];

    /*******登陆按钮设置*******/
    [loginButton setTitle:@"一键登录" forState:(UIControlStateNormal)];
    [loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginButton setBackgroundColor:[UIColor colorWithRed:0/255.0 green:182/255.0 blue:181/255.0 alpha:1/1.0]];
    loginButton.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    loginButton.layer.cornerRadius = 5;

    /*******运营商品牌标签*******/
    sloganLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
    sloganLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:188/255.0 alpha:1/1.0];
    sloganLabel.textAlignment = NSTextAlignmentCenter;
    
    
    //1.授权页背景设为透明或半透明，作为弹窗的背景蒙层
    authPageView.backgroundColor = UIColor.clearColor;
//authPageView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];

    //2.创建一个自定义view用作授权窗口view
    UIView * alertBgView = [[UIView alloc]init];
    alertBgView.tag = 2647236426;
    [authPageView addSubview:alertBgView];
    alertBgView.backgroundColor = [UIColor whiteColor];
    alertBgView.layer.cornerRadius = 10;
    alertBgView.clipsToBounds = YES;
        
    [authPageView sendSubviewToBack:alertBgView];
    
    //添加一个自定义关闭按钮，可以添加到自定义窗口alertBgView，也可以添加到authPageView
    UIButton * backButtonCustom = [[UIButton alloc]init];
    [backButtonCustom addTarget:self.target action:@selector(customBackAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [backButtonCustom setImage:[UIImage imageNamed:@"close-1"] forState:(UIControlStateNormal)];
    [authPageView addSubview:backButtonCustom];
    [backButtonCustom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(alertBgView).offset(-15);
        make.top.mas_equalTo(alertBgView).offset(8);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(40);
    }];
        
    [alertBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(authPageView);
        make.height.mas_equalTo(372);
    }];
    
    
    float topHeight = 35.0;//realScreenHeight * 0.15;
    [logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(-40);
        make.width.height.mas_equalTo(60);
        make.top.mas_equalTo(alertBgView).offset(topHeight);
    }];
    
    UILabel *mLbl = [[UILabel alloc] init];
    mLbl.textAlignment = NSTextAlignmentCenter;
    mLbl.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:32];
    mLbl.textColor = [UIColor blackColor];
    mLbl.text = @"秒验";
    [mLbl sizeToFit];
    [authPageView addSubview:mLbl];
    [mLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(logoImageView.mas_right).offset(5);
        make.centerY.mas_equalTo(logoImageView);
    }];
    
    [phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(logoImageView.mas_bottom).offset(20);
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(authPageView).multipliedBy(0.8);
        make.height.mas_equalTo(30);
    }];
    [sloganLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(authPageView).multipliedBy(0.8);
        make.height.mas_equalTo(30);
        make.top.mas_equalTo(phoneLabel.mas_bottom).offset(5);
    }];
    [loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(authPageView).multipliedBy(0.8);
        make.height.mas_equalTo(48);
        make.top.mas_equalTo(sloganLabel.mas_bottom).offset(10);
    }];
    
    [privacyTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-20);
        make.right.mas_equalTo(loginButton);
        make.height.mas_greaterThanOrEqualTo(50);
    }];
    [checkBox mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(loginButton).offset(-10);
        make.right.mas_equalTo(privacyTextView.mas_left).offset(10);
        make.width.height.mas_equalTo(40);
        make.centerY.mas_equalTo(privacyTextView).offset(-16);
    }];
    
}




#pragma mark - UIViewControllerTransitioningDelegate
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    self.isPresentAnimation = YES;
    return self;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    self.isPresentAnimation = NO;
    return self;
}

#pragma mark - UIViewControllerAnimatedTransitioning
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.3;
}

#define SV_ScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define SV_ScreenHeight ([UIScreen mainScreen].bounds.size.height)

// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    UIColor *bgColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];

    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView* toView = nil;
    UIView* fromView = nil;
    UIView* transView = nil;
    UIView* contentBgView = nil;
    
    if ([transitionContext respondsToSelector:@selector(viewForKey:)]) {
        fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    } else {
        fromView = fromViewController.view;
        toView = toViewController.view;
    }
    
    toView.frame = transitionContext.containerView.frame;

    
    contentBgView = self.authPageVC.view;
    
    //(谁将要出现 谁就在最上面)
    if (self.isPresentAnimation) {
        transView = toView;
        transView.backgroundColor = bgColor;
        [[transitionContext containerView] addSubview:toView];
    }else {
        transView = fromView;
        transView.backgroundColor = bgColor;
        [[transitionContext containerView] insertSubview:toView belowSubview:fromView];
    }
    
    CGRect rawFrame = contentBgView.frame;
    // 如果已经显示了，不需要再次修改Frame
    if (contentBgView && self.isPresentAnimation)
    {
        contentBgView.frame = CGRectMake(rawFrame.origin.x,
                                         SV_ScreenHeight,
                                         rawFrame.size.width,
                                         rawFrame.size.height);
    }
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0
         usingSpringWithDamping:1
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveEaseOut animations:^{
        if(!self.isPresentAnimation)
        {
            transView.alpha = 0.0;
        }
        
        if (contentBgView)
        {
            contentBgView.frame = CGRectMake(rawFrame.origin.x,
                                             self.isPresentAnimation ? rawFrame.origin.y : SV_ScreenHeight,
                                             rawFrame.size.width,
                                             rawFrame.size.height);
        }
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}


@end
