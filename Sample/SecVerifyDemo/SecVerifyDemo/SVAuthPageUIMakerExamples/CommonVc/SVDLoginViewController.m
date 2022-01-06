//
//  SVDLoginViewController.m
//  SecVerifyDemo
//
//  Created by Sands_Lee on 2020/4/2.
//  Copyright © 2020 yoozoo. All rights reserved.
//

#import "SVDLoginViewController.h"
#import "Masonry.h"
#import "SVProgressHUD.h"
#import <SecVerify/SVSDKHyVerify.h>
#import "SVDSuccessViewController.h"

@interface SVDLoginViewController ()

@property (nonatomic, assign) BOOL isIPhone5;

/// 返回按钮
@property (nonatomic, strong) UIButton *backButton;

/// logo按钮
@property (nonatomic, strong) UIButton *logoButton;

/// 秒验Title Label
@property (nonatomic, strong) UILabel *secVerifyTitleLabel;

/// 秒验 slogan Label
@property (nonatomic, strong) UILabel *secVerifySloganLabel;

/// 账号输入
@property (nonatomic, strong) UIView *usernameView;

/// 密码输入
@property (nonatomic, strong) UIView *passwordView;

/// 登陆
@property (nonatomic, strong) UIButton *loginButton;

/// 其他方式 Label
@property (nonatomic, strong) UILabel *otherLoginLabel;

/// wx
@property (nonatomic, strong) UIButton *wxLoginButton;

@end

@implementation SVDLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.isIPhone5 = [UIScreen mainScreen].bounds.size.width == 320 && [UIScreen mainScreen].bounds.size.height == 568;
    
    [self setupSubViews];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

#pragma mark - actions

// 返回
- (void)backButtonClicked:(UIButton *)button {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)loginClicked:(UIButton *)button {
    if (self.loginButtonClickedBlock) {
        self.loginButtonClickedBlock(button);
    }
}

// 微信
- (void)weixinLoginAction {
    [SVSDKHyVerify finishLoginVcAnimated:YES Completion:^{
        NSLog(@"微信登陆...");
    }];
}




#pragma mark - Setup SubViews
- (void)setupSubViews
{
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setImage:[UIImage imageNamed:@"fh"] forState:UIControlStateNormal];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor colorWithRed:35/255.0 green:35/255.0 blue:38/255.0 alpha:1/1.0] forState:UIControlStateNormal];
    backButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:18];
    [backButton addTarget:self action:@selector(backButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.backButton = backButton;
    
    [self.view addSubview:backButton];
    
    // 头部
    [self setupHeaderViews];
    
    // 账号
    self.usernameView = [self inputViewWithIcon:@"zh-input" text:@"admain" password:NO];
    [self.view addSubview:self.usernameView];
    
    // 密码
    self.passwordView = [self inputViewWithIcon:@"mm" text:@"admain" password:YES];
    [self.view addSubview:self.passwordView];
    
    // 登陆
    UIButton *loginBtn = [[UIButton alloc] init];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setBackgroundColor:[UIColor colorWithRed:0/255.0 green:182/255.0 blue:181/255.0 alpha:1/1.0]];
    loginBtn.layer.cornerRadius = 7;
    loginBtn.layer.masksToBounds = YES;
    [loginBtn addTarget:self action:@selector(loginClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.loginButton = loginBtn;
    
    [self.view addSubview:loginBtn];
    
    
    // 底部
    [self setupBottomViews];
    
    // 布局子视图
    [self refreshSubviewsLayoutWithSize:self.view.frame.size];
}

// 头部视图
- (void)setupHeaderViews {
    
    // logo
    UIButton *logoBtn = [[UIButton alloc] init];
    [logoBtn setBackgroundImage:[UIImage imageNamed:@"icon_m"] forState:UIControlStateNormal];
    self.logoButton = logoBtn;
    
    [self.view addSubview:logoBtn];
    
    // 秒验 title
    UILabel *svTitleL = [[UILabel alloc] init];
    svTitleL.text = @"秒验";
    svTitleL.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:38];
    svTitleL.textColor = [UIColor colorWithRed:34/255.0 green:33/255.0 blue:37/255.0 alpha:1/1.0];
    [svTitleL sizeToFit];
    self.secVerifyTitleLabel = svTitleL;
    
    [self.view addSubview:svTitleL];
    
    // 秒验 slogan
    UILabel *svSloganL = [[UILabel alloc] init];
    svSloganL.text = @"让用户不再等待";
    svSloganL.font = [UIFont fontWithName:@"PingFangSC-Regular" size:20];
    svSloganL.textColor = [UIColor colorWithRed:34/255.0 green:33/255.0 blue:37/255.0 alpha:1/1.0];
    [svSloganL sizeToFit];
    self.secVerifySloganLabel = svSloganL;
    
    [self.view addSubview:svSloganL];
}

// 底部视图
- (void)setupBottomViews {
    
    UILabel *mLbl = [[UILabel alloc] init];
    self.otherLoginLabel = mLbl;
    mLbl.textAlignment = NSTextAlignmentCenter;
    mLbl.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
    mLbl.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:188/255.0 alpha:1/1.0];
    mLbl.text = @"其他方式登录";
    [mLbl sizeToFit];
    [self.view addSubview:mLbl];
    
    UIButton *wxBtn = [[UIButton alloc] init];
    [wxBtn setBackgroundImage:[UIImage imageNamed:@"wc"] forState:UIControlStateNormal];
    [wxBtn addTarget:self action:@selector(weixinLoginAction) forControlEvents:UIControlEventTouchUpInside];
    self.wxLoginButton = wxBtn;
    [self.view addSubview:wxBtn];
    
}


// 创建输入框
- (UIView *)inputViewWithIcon:(NSString *)iconName text:(NSString *)text password:(BOOL)isPassword {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor colorWithRed:246/255.0 green:245/255.0 blue:250/255.0 alpha:1/1.0];
    view.layer.cornerRadius = 7;
    view.layer.masksToBounds = YES;
    
    CGFloat margin = self.isIPhone5 ? 5 : 10;
    UIImageView *iconImageV = [[UIImageView alloc] initWithFrame:CGRectMake(margin, margin, 23, 28)];
    iconImageV.image = [UIImage imageNamed:iconName];
    [view addSubview:iconImageV];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(margin + 23 + 15, margin, 200, 28)];
    textField.placeholder = isPassword ? @"password" : @"username";
    textField.text = text;
    textField.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
    textField.textColor = [UIColor colorWithRed:34/255.0 green:33/255.0 blue:37/255.0 alpha:1/1.0];
    textField.returnKeyType = UIReturnKeyDone;
    if (isPassword) {
        textField.secureTextEntry = YES;
    }
    
    [view addSubview:textField];
    
    return view;
}


#pragma mark - 刷新布局
- (void)refreshSubviewsLayoutWithSize:(CGSize)viewSize
{
    CGFloat width = viewSize.width;
    CGFloat height = viewSize.height;
    BOOL isPortrait = height > width;
    
    [self.backButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        if (isPortrait) {
            make.top.mas_equalTo(SVD_StatusBarSafeBottomMargin + 10);
        } else {
            make.top.mas_equalTo(25);
        }
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(30);
        make.left.mas_equalTo(15);
    }];
    
    [self.logoButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_centerX).offset(-20);
        if (isPortrait) {
            make.width.height.mas_equalTo(width > 320 ? 54 : 44);
            make.top.mas_equalTo(self.isIPhone5 ? 74 : 154);
        } else {
            make.width.height.mas_equalTo(height > 320 ? 54 : 44);
            make.top.mas_equalTo(24);
        }
    }];
    
    [self.secVerifyTitleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.logoButton);
        make.left.equalTo(self.logoButton.mas_right).offset(10);
    }];
    
    [self.secVerifySloganLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.equalTo(self.logoButton.mas_bottom).offset(5);
//        if (isPortrait) {
//        } else {
//            make.top.mas_equalTo(120);
//            make.centerX.mas_equalTo(0);
//        }
    }];
    
    [self.usernameView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.height.mas_equalTo(self.isIPhone5 ? 38 : 48);
        make.width.mas_equalTo(isPortrait ? width * 0.7 : height * 0.7);
        make.top.equalTo(self.secVerifySloganLabel.mas_bottom).offset(isPortrait ? 50 : 10);
    }];
    
    [self.passwordView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.height.mas_equalTo(self.isIPhone5 ? 38 : 48);
        make.width.mas_equalTo(isPortrait ? width * 0.7 : height * 0.7);
        make.top.equalTo(self.usernameView.mas_bottom).offset(isPortrait ? 30 : 10);
    }];
    
    [self.loginButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.height.mas_equalTo(self.isIPhone5 ? 38 : 48);
        make.width.mas_equalTo(isPortrait ? width * 0.7 : height * 0.7);
        make.top.equalTo(self.passwordView.mas_bottom).offset(isPortrait ? 30 : 10);
    }];
    
    
    
    [self.wxLoginButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        if (isPortrait) {
            make.bottom.mas_equalTo(- SVD_TabbarSafeBottomMargin - 10);
            make.width.height.mas_equalTo(48);
        } else {
            make.bottom.mas_equalTo(-15);
            make.width.height.mas_equalTo(38);
        }
    }];
    
    
    [self.otherLoginLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.bottom.equalTo(self.wxLoginButton.mas_top).offset(isPortrait ? -15 : -5);
//        if (isPortrait) {
//        } else {
//            make.bottom.equalTo(self.alertLoginButton.mas_top).offset(-20);
//            make.width.mas_equalTo(height * 0.7);
//            make.height.mas_equalTo(48);
//            make.centerX.mas_equalTo(0);
//        }
    }];
    
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    // 刷新布局
    [self refreshSubviewsLayoutWithSize:size];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}



@end
