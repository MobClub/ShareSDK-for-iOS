//
//  SVDSuccessViewController.m
//  SecVerifyDemo
//
//  Created by lujh on 2019/5/31.
//  Copyright © 2019 lujh. All rights reserved.
//

#import "SVDSuccessViewController.h"
#import "Masonry.h"

@interface SVDSuccessViewController ()

/// 返回
@property (nonatomic, strong) UIButton *backButton;

/// 成功图片
@property (nonatomic, strong) UIImageView *successImageView;

/// 验证成功
@property (nonatomic, strong) UILabel *successLabel;

/// 手机图片
@property (nonatomic, strong) UIImageView *phoneImageView;

/// 完整手机号
@property (nonatomic, strong) UILabel *phoneNumberLabel;

/// 再次体验
@property (nonatomic, strong) UIButton *successButton;

@end

@implementation SVDSuccessViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        //默认为免密登录结果显示
        self.resultType = WithoutPWDLoginType;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupSubViews];
}

- (void)verifyAgain
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    if (self.error) {
        if(self.isShowRealError)
        {
            [self showAlert:self.error.userInfo[@"description"] message:[NSString stringWithFormat:@"%ld", (long)self.error.code]];
        }
        else if (self.resultType == WithoutPWDLoginType)
        {
            NSString *des = self.error.userInfo[@"description"];
            NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
            NSString *retStr = [[NSString alloc] initWithData:[des dataUsingEncoding:enc] encoding:enc];
            
            if(self.error.code == 170601)
            {
                [self showAlert:retStr message:nil];
            }
            else
            {
                [self showAlert:@"当前网络状态不稳定" message:nil];
            }
        } else if (self.resultType == MobileNumAuthType) {
            [self showAlert:@"本机认证失败" message:[[self.error userInfo] objectForKey:@"error"]];
        }
    }
}

- (void)setupSubViews
{
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setImage:[UIImage imageNamed:@"fh"] forState:UIControlStateNormal];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor colorWithRed:35/255.0 green:35/255.0 blue:38/255.0 alpha:1/1.0] forState:UIControlStateNormal];
    backButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:18];
    [backButton addTarget:self action:@selector(verifyAgain) forControlEvents:UIControlEventTouchUpInside];
    self.backButton = backButton;
    
    [self.view addSubview:backButton];
    
    // 成功Image
    UIImageView *imageV = [[UIImageView alloc] init];
    imageV.image = self.error == nil ? [UIImage imageNamed:@"cg"] : [UIImage imageNamed:@"shibai"];
    self.successImageView = imageV;
    
    [self.view addSubview:imageV];
    
    // 验证成功
    UILabel *successLabel = [[UILabel alloc] init];
    if (_resultType != MobileNumAuthType) {
        successLabel.text = self.error == nil ? @"登录成功" : @"登录失败";
    } else {
        successLabel.text = self.error == nil ? @"本机认证成功" : @"本机认证失败";
    }
    successLabel.textAlignment = NSTextAlignmentCenter;
    successLabel.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:28];
    successLabel.textColor = [UIColor colorWithRed:47/255.0 green:51/255.0 blue:51/255.0 alpha:1/1.0];
    [successLabel sizeToFit];
    self.successLabel = successLabel;
    
    [self.view addSubview:successLabel];
    
    // 完整手机号
    if ([self.phone isKindOfClass:[NSString class]] && self.phone.length > 0)
    {
        // 手机Image
        UIImageView *phoneImageV = [[UIImageView alloc] init];
        phoneImageV.image = [UIImage imageNamed:@"phone"];
        self.phoneImageView = phoneImageV;
        
        [self.view addSubview:phoneImageV];
        
        UILabel *phoneLabel = [[UILabel alloc] init];
        phoneLabel.text = self.phone;
        phoneLabel.textAlignment = NSTextAlignmentCenter;
        phoneLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:18];
        phoneLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:188/255.0 alpha:1/1.0];
        [phoneLabel sizeToFit];
        self.phoneNumberLabel = phoneLabel;
        
        [self.view addSubview:phoneLabel];
    }
    
    // 再次体验
    UIButton *successBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [successBtn setTitle:@"返回首页" forState:UIControlStateNormal];
    [successBtn addTarget:self action:@selector(verifyAgain) forControlEvents:UIControlEventTouchUpInside];
    [successBtn setBackgroundColor:[UIColor colorWithRed:0/255.0 green:182/255.0 blue:181/255.0 alpha:1/1.0]];
    successBtn.layer.cornerRadius = 7.0;
    successBtn.layer.masksToBounds = YES;
    self.successButton = successBtn;
    
    [self.view addSubview:successBtn];
    
    // 刷新布局
    [self refreshSubviewsLayoutWithSize:self.view.frame.size];
    
}

- (void)refreshSubviewsLayoutWithSize:(CGSize)viewSize
{
    CGFloat width = viewSize.width;
    CGFloat height = viewSize.height;
    BOOL isPortrait = height > width;
    
    [self.backButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        if (isPortrait) {
            make.top.mas_equalTo(SVD_StatusBarSafeBottomMargin + 10);
        } else {
            make.top.mas_equalTo(15);
        }
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(30);
        make.left.mas_equalTo(15);
        
        
    }];
    
    [self.successImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        if (isPortrait) {
            make.centerX.mas_equalTo(0);
            make.width.mas_equalTo(width * 0.4);
            make.height.mas_equalTo(width * 0.4 * 0.72);
            make.top.mas_equalTo(100);
        } else {
            make.centerX.mas_equalTo(0);
            make.width.mas_equalTo(height * 0.4);
            make.height.mas_equalTo(height * 0.4 * 0.72);
            make.top.mas_equalTo(30);
        }
    }];
    
    [self.successLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.successImageView.mas_bottom).mas_offset(15);
        make.centerX.mas_equalTo(0);
    }];
    
    if (self.phone.length > 0) {
        [self.phoneImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.successLabel.mas_bottom).mas_offset(15);
            make.left.equalTo(self.successLabel).offset(-5);
            make.width.mas_equalTo(12);
            make.height.mas_equalTo(20);
        }];
        
        [self.phoneNumberLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.phoneImageView.mas_right).offset(8);
            make.centerY.equalTo(self.phoneImageView);
        }];
    }
    
    
    [self.successButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        if (isPortrait) {
            make.width.mas_equalTo(width * 0.8);
        } else {
            make.width.mas_equalTo(height * 0.8);
        }
        if (self.error) {
            make.top.equalTo(self.successLabel.mas_bottom).mas_offset(50);
        } else {
            make.top.equalTo(self.phoneNumberLabel.mas_bottom).mas_offset(30);
        }
        
        make.height.mas_equalTo(50);
        make.centerX.mas_equalTo(0);
    }];
}




#pragma mark - 屏幕旋转
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    // 刷新布局
    [self refreshSubviewsLayoutWithSize:size];
}


#pragma mark - Private

- (void)showAlert:(NSString *)title message:(NSString *)message
{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:title
                                                                       message:message
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {
                                                              }];
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    });
}

@end
