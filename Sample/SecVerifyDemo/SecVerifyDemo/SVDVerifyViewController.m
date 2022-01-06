//
//  SVDVerifyViewController.m
//  SecVerifyDemo
//
//  Created by lujh on 2019/5/31.
//  Copyright © 2019 lujh. All rights reserved.
//

#import "SVDVerifyViewController.h"
#import "SVDSuccessViewController.h"
#import "SVDSerive.h"
#import "FLAnimatedImage.h"

#import "Masonry.h"
#import "SVDDemoHelper.h"
#import "SVProgressHUD.h"
#import "SVDPolicyManager.h"
#import "SVDLoginViewController.h"
#import "SVDMobileAuthCommitCodeVC.h"

#import <SecVerify/SVSDKHyVerify.h>
#import <MOBFoundation/MobSDK+Privacy.h>

#import "CustomExample.h"
#import "SmallWindowExample.h"


@interface SVDVerifyViewController ()<SVSDKVerifyDelegate>

//自定义UI设置示例
@property (nonatomic,strong)id uiMakerExample;

//如需引用授权页vc对象，请使用weak弱引用
@property (nonatomic,weak)UIViewController * authPageVc;

@end

static BOOL showRealError = NO;
static BOOL showDealloc = NO;

@implementation SVDVerifyViewController

- (void)viewDidLoad{
    [super viewDidLoad];
        
    [self setupSubViews];

    //预取号
    [self startPreLogin];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    [MobSDK getPrivacyPolicy:@"1" language:@"zh" compeletion:^(NSDictionary * _Nullable data, NSError * _Nullable error) {
        
    }];
}


//static BOOL allowPermissionStatus = NO;
//#pragma mark - 隐私协议切换
//- (void)switchPrivacyClicked:(UIButton *)button
//{
//    allowPermissionStatus = !allowPermissionStatus;
//
//    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
//    [MobSDK uploadPrivacyPermissionStatus:allowPermissionStatus onResult:^(BOOL success) {
//        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
//
//    }];
//
//    _privacyBtn.backgroundColor = [UIColor redColor];
//}

#pragma mark - 预取号
- (void)startPreLogin{
    WeakSelf
    
    [SVSDKHyVerify setDebug:YES];
    [SVSDKHyVerify preLogin:^(NSDictionary * _Nullable resultDic, NSError * _Nullable error) {

        [weakSelf enableVerifyBtn:YES];

        if (!error){
            NSLog(@"### 预取号成功: %@", resultDic);
        }else{
            NSLog(@"### 预取号失败%@", error);
        }
    }];
    
}


#pragma mark - 拉起授权页 && 一键登录
- (void)loginClicked:(UIButton *)button {
    
    WeakSelf

    /**
     * 建议做防止快速点击处理
     */
     [button setEnabled:NO];
     dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [button setEnabled:YES];
     });
    
    //1.创建一个ui配置对象
    SVSDKHyUIConfigure * uiConfigure = [[SVSDKHyUIConfigure alloc]init];
    //2.设置currentViewController，必传！请传入当前vc或视图顶层vc，可使用此vc调系统present测试是否可以present其他vc
    uiConfigure.currentViewController = self;
    
    //3.可选。设置一些定制化属性。eg. 开发者手动控制关闭授权页
    uiConfigure.manualDismiss = @(YES);
    uiConfigure.navBarHidden = @(YES);
    
    /**
     * (可选)支持横竖屏切换
     * uiConfigure.shouldAutorotate = @(YES);
     * uiConfigure.preferredInterfaceOrientationForPresentation = @(UIInterfaceOrientationPortrait);
     * uiConfigure.supportedInterfaceOrientations = @(UIInterfaceOrientationMaskAll);
     */
    
    
    /**
     * 4.可选。设置代理，接收相关事件，自定义UI
     * [SVSDKHyVerify setDelegate:self];
     * 代理示例：通过代理接收ViewDidLoad事件，并自行设置控件约束或添加自定义控件
     * -(void)svVerifyAuthPageViewDidLoad:(UIViewController *)authVC userInfo:(SVSDKHyProtocolUserInfo*)userInfo{
     *   - 基本控件对象和相关信息在userInfo中
     *   - 可在此处设置基本控件的样式和布局、添加自定义控件等
     * }
     */
    

    if (button.tag == 10011) {
        // 自定义弹窗授权页(可选)
        uiConfigure.modalPresentationStyle = @(UIModalPresentationOverFullScreen);
        self.uiMakerExample = [[SmallWindowExample alloc]initWithTarget:self];
    } else {
        // 自定义授权页(可选)
        self.uiMakerExample = [[CustomExample alloc]initWithTarget:self];
    }
    
    //设置代理
    [SVSDKHyVerify setDelegate:self];
    
    //设置隐私协议示例
    [CustomExample setPrivacySettingExample:uiConfigure];
    
        
    //5.调用拉起授权页方法，传入uiConfigure
    [SVSDKHyVerify openAuthPageWithModel:uiConfigure openAuthPageListener:^(NSDictionary * _Nullable resultDic, NSError * _Nullable error) {
           
       /**
        * 建议做防止快速点击的处理：
        */
        dispatch_async(dispatch_get_main_queue(), ^{
           [button setEnabled:YES];
        });
        
        __strong typeof(weakSelf) strongSelf = weakSelf;

        if (error != nil ) {
            //拉起授权页失败
            
            /**
            * 获取token失败
            * 可以自定跳转其他页面
            * [self gotoSMSLogin];
            */
            if (showRealError) {
                [strongSelf showAlert:@"提示" message:error.userInfo ? error.userInfo.description : error.domain];
            }else{
                [strongSelf showAlert:@"提示" message:error.domain];
            }
            
        }else{
            //拉起授权页成功
        }
        
    } cancelAuthPageListener:nil oneKeyLoginListener:^(NSDictionary * _Nullable resultDic, NSError * _Nullable error) {
        //一键登录点击获取token回调：
        
        __strong typeof(weakSelf) strongSelf = weakSelf;

        //关闭页面。当uiConfigure.manualDismiss = @(YES)时需要手动调用此方法关闭。
        [SVSDKHyVerify finishLoginVcAnimated:YES Completion:^{
            NSLog(@"%s",__func__);
        }];
        
        //判断获取token是否成功
        if (error == nil) {
        
            /**
             * 获取token成功
             * 开始调用token置换手机号接口
             */
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [SVProgressHUD showWithStatus:@"加载中..."];
            });
            // 授权成功,获取完整手机号
            [SVDSerive verifyGetPhoneNumberWith:resultDic completion:^(NSError *error, NSString * _Nonnull phone) {
                NSLog(@"获取完整手机号 phone: %@ error: %@",phone, error);
                dispatch_async(dispatch_get_main_queue(), ^{
                    [SVProgressHUD dismiss];
                    // 界面跳转
                    SVDSuccessViewController *successVC = [[SVDSuccessViewController alloc] init];
                    successVC.phone = phone;
                    successVC.error = error;
                    [weakSelf.navigationController pushViewController:successVC animated:YES];
                });
            }];
            
        }else{
            
            if (showRealError) {
                [strongSelf showAlert:@"提示" message:error.userInfo ? error.userInfo.description : error.domain];
            }else{
                [strongSelf showAlert:@"提示" message:error.domain];
            }
            
            /**
             * 获取token失败
             * 可以自定跳转其他页面
             */
             
        }
        
        
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_global_queue(0, 0), ^{
            //对于需要多次拉起授权页登录的，此处预取号为下次拉起加速，通常情况下可以不需要此操作
            [SVSDKHyVerify preLogin:nil];
        });

    }];
    
}


#pragma mark - SVSDKVerifyDelegate
-(void)svVerifyAuthPageDealloc{
    //授权页释放
    NSLog(@"%s",__func__);
    if (showDealloc) {
        [SVProgressHUD showInfoWithStatus:[NSString stringWithFormat:@"%s",__func__]];
    }
}
-(void)svVerifyAuthPageViewWillTransition:(UIViewController *)authVC toSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator userInfo:(SVSDKHyProtocolUserInfo *)userInfo{
    //(可选)此处可以设置横竖屏切换
    if ([self.uiMakerExample respondsToSelector:@selector(authPageViewWillTransition:toSize:withTransitionCoordinator:userInfo:)]) {
        [self.uiMakerExample authPageViewWillTransition:authVC toSize:size withTransitionCoordinator:coordinator userInfo:userInfo];
    }
}
-(void)svVerifyAuthPageWillPresent:(UIViewController *)authVC userInfo:(SVSDKHyProtocolUserInfo *)userInfo{
    //(可选)此处可以自定义转场动画
    authVC.navigationController.transitioningDelegate = self.uiMakerExample;
}

-(void)svVerifyAuthPageViewDidLoad:(UIViewController *)authVC userInfo:(SVSDKHyProtocolUserInfo *)userInfo{
    
    //(可选)记录当前的授权页vc对象，请使用❗️弱引用
    self.authPageVc = authVC;
    
    //⚠️由于本demo工程有多个UI样式，故将自定义示例代码移到了对应的uiMakerExample中，实际可直接在此处设置
    
    //自定义授权页UI
    [self.uiMakerExample setupAuthPageCustomStyle:authVC userInfo:userInfo];
}


#pragma mark - 本机号校验
- (void)mobileAuthBtnClicked:(UIButton *)btn {
    NSLog(@"用户开始本机认证");
    NSLog(@"开始请求本机认证Token, 开始时间: %02f", [[NSDate date] timeIntervalSince1970]);
    
    __weak typeof(self) weakSelf = self;
    [SVSDKHyVerify mobileAuth:^(NSDictionary * _Nullable resultDic, NSError * _Nullable error) {
        NSLog(@"请求本机认证Token完成, 结束时间: %02f", [[NSDate date] timeIntervalSince1970]);
        if (resultDic
            && [resultDic isKindOfClass:[NSDictionary class]]
            && !error) {
            NSLog(@"请求本机认证Token成功 \nResult: %@", resultDic);
            dispatch_async(dispatch_get_main_queue(), ^{
                SVDMobileAuthCommitCodeVC *codeVc = [[SVDMobileAuthCommitCodeVC alloc] initWithTokenInfo:resultDic result:^(NSDictionary *dict, NSError *error) {
                    SVDSuccessViewController *success = [[SVDSuccessViewController alloc] init];
                    
                    if (!error
                        && [[dict objectForKey:@"phoneNum"] length]) {
                        success.phone = [dict objectForKey:@"phoneNum"];
                    }
                    success.error = error;
                    success.resultType = MobileNumAuthType;
                    
                    [weakSelf.navigationController pushViewController:success animated:YES];
                }];

                [weakSelf.navigationController presentViewController:codeVc animated:YES completion:nil];
            });
        } else {
            NSLog(@"请求本机认证Token失败 Error: %@", error);
            [weakSelf showAlert:@"请求本机认证Token失败" message:error.description];
        }
    }];
}


#pragma mark - 自定义授权页按钮点击事件
// 点击自定义返回
- (void)customBackAction:(UIButton *)button{
    //关闭登录视图
    [SVSDKHyVerify finishLoginVcAnimated:YES Completion:^{
        NSLog(@"点击自定义返回...");
    }];
}

// 自定义授权页上微信按钮点击事件
- (void)weixinLoginAction:(UIButton *)button{
    //关闭登录视图
    [SVSDKHyVerify finishLoginVcAnimated:YES Completion:^{
        NSLog(@"点击微信登录...");
    }];
}

// 自定义授权页上账号按钮点击事件
- (void)usernameLoginAction:(UIButton *)button{
    
    WeakSelf
    // 使用授权页push一个账号密码的VC
    dispatch_async(dispatch_get_main_queue(), ^{
        SVDLoginViewController *vc = [SVDLoginViewController new];
        vc.loginButtonClickedBlock = ^(UIButton * _Nonnull button) {
            // 账号密码登陆页面点击登陆事件回调
            //关闭登录视图
            [SVSDKHyVerify finishLoginVcAnimated:YES Completion:^{
                [SVProgressHUD showWithStatus:@"加载中..."];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1.0), dispatch_get_main_queue(), ^{
                    [SVProgressHUD dismiss];
                    // 界面跳转
                    SVDSuccessViewController *successVC = [[SVDSuccessViewController alloc] init];
                    successVC.phone = @"admin";
                    [weakSelf.navigationController pushViewController:successVC animated:YES];
                });
            }];
        };
        [weakSelf.authPageVc.navigationController pushViewController:vc animated:YES];
    });
}


#pragma mark - Setup SubViews
//设置当前页面样式，和秒验逻辑无关
- (void)setupSubViews{
   
    BOOL isSmallScreen = ([UIScreen mainScreen].bounds.size.width <= 414 || [UIScreen mainScreen].bounds.size.height <= 414) && ![SVDDemoHelper isPhoneX];

    // bg image view
    UIImageView *bgImageV = [[UIImageView alloc] init];
    bgImageV.contentMode = UIViewContentModeScaleToFill;
    bgImageV.image = [UIImage imageNamed:@"bg_my"];
    bgImageV.userInteractionEnabled = YES;
    
    // logo
    UIButton *logoBtn = [[UIButton alloc] init];
    [logoBtn setBackgroundImage:[UIImage imageNamed:@"icon_w"] forState:UIControlStateNormal];
    [logoBtn setBackgroundImage:[self createImageWithColor:[UIColor redColor] withSize:CGSizeMake(1, 1)] forState:UIControlStateSelected];
    [logoBtn addTarget:self action:@selector(logoButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [bgImageV addSubview:logoBtn];
    
    // 秒验 title
    UILabel *svTitleL = [[UILabel alloc] init];
    svTitleL.text = @"秒验";
    svTitleL.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:[UIScreen mainScreen].bounds.size.width > 375 ? 62 : 48];
    svTitleL.textColor = [UIColor whiteColor];
    [svTitleL sizeToFit];
    
    [bgImageV addSubview:svTitleL];
    
    // 秒验 slogan
    UILabel *svSloganL = [[UILabel alloc] init];
    svSloganL.text = @"让用户不再等待";
    svSloganL.font = [UIFont fontWithName:@"PingFangSC-Regular" size:28];
    svSloganL.textColor = [UIColor whiteColor];
    [svSloganL sizeToFit];
    
    [bgImageV addSubview:svSloganL];
    
    // GIF Image View
    NSString *gifPath = [[NSBundle mainBundle] pathForResource:@"SVDemo" ofType:@"gif"];
    FLAnimatedImage *image = [FLAnimatedImage animatedImageWithGIFData:[NSData dataWithContentsOfFile:gifPath]];
    FLAnimatedImageView *imageView = [[FLAnimatedImageView alloc] init];
    imageView.animatedImage = image;
    imageView.contentMode = UIViewContentModeScaleToFill;
//    imageView.backgroundColor = [UIColor redColor];
    
    [bgImageV addSubview:imageView];
    
    [self.view addSubview:bgImageV];
    
    UIView *containerV = [[UIView alloc] init];
    containerV.backgroundColor = [UIColor whiteColor];
    containerV.layer.cornerRadius = 15;
    containerV.layer.masksToBounds = YES;
    [self.view addSubview:containerV];
    
    UIButton *fullScreenLoginBtn = [[UIButton alloc] init];
    fullScreenLoginBtn.tag = 10010;
    [fullScreenLoginBtn setTitle:@"一键登录（全屏）" forState:UIControlStateNormal];
    [fullScreenLoginBtn setBackgroundImage:[self createImageWithColor:[UIColor colorWithRed:0/255.0 green:182/255.0 blue:181/255.0 alpha:1/1.0] withSize:CGSizeMake([UIScreen mainScreen].bounds.size.width * 0.7, 48) withRadius:7] forState:UIControlStateNormal];
    [fullScreenLoginBtn setBackgroundImage:[self createImageWithColor:[UIColor colorWithRed:182/255.0 green:182/255.0 blue:181/255.0 alpha:1/1.0] withSize:CGSizeMake([UIScreen mainScreen].bounds.size.width * 0.7, 48) withRadius:7] forState:UIControlStateDisabled];
    fullScreenLoginBtn.enabled = NO;
    [fullScreenLoginBtn addTarget:self action:@selector(loginClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:fullScreenLoginBtn];
    
    UIButton *alertLoginBtn = [[UIButton alloc] init];
    alertLoginBtn.tag = 10011;
    [alertLoginBtn setTitle:@"一键登录（弹窗）" forState:UIControlStateNormal];
    [alertLoginBtn setBackgroundImage:[self createImageWithColor:[UIColor colorWithRed:0/255.0 green:182/255.0 blue:181/255.0 alpha:1/1.0] withSize:CGSizeMake([UIScreen mainScreen].bounds.size.width * 0.7, 48) withRadius:7] forState:UIControlStateNormal];
    [alertLoginBtn setBackgroundImage:[self createImageWithColor:[UIColor colorWithRed:182/255.0 green:182/255.0 blue:181/255.0 alpha:1/1.0] withSize:CGSizeMake([UIScreen mainScreen].bounds.size.width * 0.7, 48) withRadius:7] forState:UIControlStateDisabled];
    alertLoginBtn.enabled = NO;
    [alertLoginBtn addTarget:self action:@selector(loginClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:alertLoginBtn];
    
    UIButton *maButton = [[UIButton alloc] init];
    maButton.tag = 10012;
    [maButton setTitle:@"本机认证" forState:UIControlStateNormal];
    [maButton setBackgroundImage:[self createImageWithColor:[UIColor colorWithRed:0/255.0 green:182/255.0 blue:181/255.0 alpha:1/1.0]
                                                   withSize:CGSizeMake([UIScreen mainScreen].bounds.size.width * 0.7, 48)
                                                 withRadius:7]
                        forState:UIControlStateNormal];
    [maButton setBackgroundImage:[self createImageWithColor:[UIColor colorWithRed:182/255.0 green:182/255.0 blue:181/255.0 alpha:1/1.0]
                                                   withSize:CGSizeMake([UIScreen mainScreen].bounds.size.width * 0.7, 48)
                                                 withRadius:7]
                        forState:UIControlStateDisabled];
    maButton.enabled = YES;
    [maButton addTarget:self action:@selector(mobileAuthBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:maButton];
    
    UILabel *versionL = [[UILabel alloc] init];
    versionL.text = [NSString stringWithFormat:@"版本号 %@", [SVSDKHyVerify sdkVersion]];
    versionL.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
    versionL.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:188/255.0 alpha:1/1.0];
    [versionL sizeToFit];
    [self.view addSubview:versionL];
    
    
//    _privacyBtn = [[UIButton alloc] init];
//    [_privacyBtn addTarget:self action:@selector(switchPrivacyClicked:) forControlEvents:UIControlEventTouchUpInside];
//
//    [self.view addSubview:_privacyBtn];
    
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = self.view.bounds.size.height;

    [bgImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(width);
        make.height.mas_equalTo(height * 0.6);
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(0);
    }];

    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(isSmallScreen ? (width * 0.82) : (width * 0.9));
        make.height.mas_equalTo(isSmallScreen ? (width * 0.82 * 0.75) : (width * 0.9 * 0.8));
        make.centerX.mas_equalTo(25);
        make.bottom.mas_equalTo(-10);
    }];

    [svSloganL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.bottom.equalTo(imageView.mas_top).offset(-15);
    }];


    [logoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(isSmallScreen ? 54 : 64);
        make.leading.equalTo(svSloganL.mas_leading).offset(15);
        make.top.mas_equalTo(SVD_TabbarSafeBottomMargin + (isSmallScreen ? 24 : 54));
    }];

    [svTitleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(logoBtn);
        make.left.equalTo(logoBtn.mas_right).offset(10);
    }];


    [containerV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(width);
        make.height.mas_equalTo(height * 0.43);
        make.bottom.mas_equalTo(0);
        make.centerX.mas_equalTo(0);
    }];

    [versionL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(- SVD_TabbarSafeBottomMargin);
        make.centerX.mas_equalTo(0);
    }];

    [alertLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(versionL.mas_top).offset(isSmallScreen ? -30 : -50);
        make.width.mas_equalTo(width * 0.7);
        make.height.mas_equalTo(36);
        make.centerX.mas_equalTo(0);
    }];


    [fullScreenLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(alertLoginBtn.mas_top).offset(isSmallScreen ? -40 : -60);
        make.width.mas_equalTo(width * 0.7);
        make.height.mas_equalTo(40);
        make.centerX.mas_equalTo(0);
    }];

    [maButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(fullScreenLoginBtn.mas_top).offset(isSmallScreen ? -40 : -60);
        make.width.mas_equalTo(width * 0.7);
        make.height.mas_equalTo(40);
        make.centerX.mas_equalTo(0);
    }];
}

- (void)enableVerifyBtn:(BOOL)enable{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        UIButton * fullScreenLoginButton = [self.view viewWithTag:10010];
        UIButton * alertLoginButton = [self.view viewWithTag:10011];
        fullScreenLoginButton.enabled = enable;
        alertLoginButton.enabled = enable;
        
    });
}
- (void)logoButtonClicked:(UIButton *)button{
    button.selected = !button.isSelected;
    showRealError = button.isSelected;
    showDealloc = button.isSelected;
}

#pragma mark - Private

- (void)showAlert:(NSString *)title message:(NSString *)message{
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

- (UIImage *)createImageWithColor:(UIColor *)color withSize:(CGSize)size{
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

/// 使用颜色创建带圆角的图片
/// @param color 颜色
/// @param size 大小
/// @param radius 圆角
- (UIImage *)createImageWithColor:(UIColor *)color withSize:(CGSize)size withRadius:(CGFloat)radius{
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用Core Graphics设置圆角以避免离屏渲染
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)];
    CGContextAddPath(context, path.CGPath);
    CGContextClip(context);
    // 设置context颜色
    CGContextSetFillColorWithColor(context, color.CGColor);
    // 填充context
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}


- (void)dealloc{
    NSLog(@"===> %s", __func__);
}

@end
