//
//  SVVerifyAuthPageMakerExample.m
//  SecVerifyDemo
//
//  Created by TanXiang on 2020/11/27.
//  Copyright © 2020 yoozoo. All rights reserved.
//

#import "CustomExample.h"
#import "Masonry.h"
#import "SVDDemoHelper.h"
@interface CustomExample()
{
    //可选，记录自定义控件，横竖屏旋转是重新布局
    UIView * _customBackButton;
    UIView * _bottomView;
    UILabel * _mLbl;
    UIButton * _wxBtn;
    UIButton * _zhBtn;

}

@property (nonatomic,weak)id target;//绑定自定义按钮点击事件的target


@end

@implementation CustomExample

- (instancetype)initWithTarget:(id)target{
    self = [super init];
    if (self) {
        _target = target;
    }
    return self;
}



//自定义授权页面
-(void)setupAuthPageCustomStyle:(UIViewController *)authVC userInfo:(SVSDKHyProtocolUserInfo *)userInfo{
    
    //授权页view
    UIView * authPageView = authVC.view;
    
    authPageView.backgroundColor = UIColor.whiteColor;

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
    phoneLabel.font = [UIFont boldSystemFontOfSize:20];
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
    sloganLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:11];
    sloganLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:188/255.0 alpha:1/1.0];
    sloganLabel.textAlignment = NSTextAlignmentCenter;
    
    
    /*******添加自定义控件******/
    // 自定义返回按钮
    UIButton *customBackButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [customBackButton setImage:[UIImage imageNamed:@"fh"] forState:UIControlStateNormal];
    [customBackButton setTitle:@"返回" forState:UIControlStateNormal];
    [customBackButton setTitleColor:[UIColor colorWithRed:35/255.0 green:35/255.0 blue:38/255.0 alpha:1/1.0] forState:UIControlStateNormal];
    customBackButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:18];
    [customBackButton addTarget:self.target action:@selector(customBackAction:) forControlEvents:UIControlEventTouchUpInside];
    [authPageView addSubview:customBackButton];
    _customBackButton = customBackButton;
    
    UIView *bottomView = [[UIView alloc] init];
    [authPageView addSubview:bottomView];
    _bottomView = bottomView;
    
    UILabel *mLbl = [[UILabel alloc] init];
    mLbl.textAlignment = NSTextAlignmentCenter;
    mLbl.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
    mLbl.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:188/255.0 alpha:1/1.0];
    mLbl.text = @"其他方式登录";
    [mLbl sizeToFit];
    _mLbl = mLbl;

    [bottomView addSubview:mLbl];

    UIButton *wxBtn = [[UIButton alloc] init];
    [wxBtn setBackgroundImage:[UIImage imageNamed:@"wc"] forState:UIControlStateNormal];
    [wxBtn addTarget:self.target action:@selector(weixinLoginAction:) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:wxBtn];
    _wxBtn = wxBtn;
    
    UIButton *zhBtn = [[UIButton alloc] init];
    [zhBtn setBackgroundImage:[UIImage imageNamed:@"zh"] forState:UIControlStateNormal];
    [zhBtn addTarget:self.target action:@selector(usernameLoginAction:) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:zhBtn];
    _zhBtn = zhBtn;

//    //布局
//    [self tryLayoutSubViews_Portrait:authVC userInfo:userInfo];
    
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    if (orientation == UIInterfaceOrientationPortrait || orientation == UIInterfaceOrientationPortraitUpsideDown) {
        //布局_竖屏
        [self tryLayoutSubViews_Portrait:authVC userInfo:userInfo];
    }else{
       //布局_竖屏
       [self tryLayoutSubViews_Landscape:authVC userInfo:userInfo];
    }
    
}

#pragma mark - 布局(适配竖屏)
//布局(适配竖屏)
-(void)tryLayoutSubViews_Portrait:(UIViewController *)authVC userInfo:(SVSDKHyProtocolUserInfo *)userInfo{
    //授权页view
    UIView * authPageView = authVC.view;
    
    authPageView.backgroundColor = UIColor.whiteColor;

    UIButton * backButton = userInfo.backButton;//自带的backButton，在navBar上

    UIButton * loginButton = userInfo.loginButton;
    UIImageView * logoImageView  = userInfo.logoImageView;
    UILabel  * phoneLabel = userInfo.phoneLabel;
    UIButton * checkBox  = userInfo.checkBox;
    UITextView * privacyTextView = userInfo.privacyTextView;
    UILabel  * sloganLabel = userInfo.sloganLabel;
    
    UIView * customBackButton = _customBackButton;
    UIView * bottomView = _bottomView;
    UILabel * mLbl = _mLbl;
    UIButton * wxBtn = _wxBtn;
    UIButton * zhBtn = _zhBtn;
    
//😀自定义控件和授权页基本控件可以放一起统一布局
    
    //竖屏
    [logoImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.width.height.mas_equalTo(80);
        make.top.mas_equalTo(SVD_ScreenHeight * 0.15);
    }];
    [phoneLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(logoImageView.mas_bottom).offset(30);
        make.centerX.mas_equalTo(0);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(SVD_ScreenWidth * 0.8);
    }];
    [sloganLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(phoneLabel.mas_bottom).offset(10);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(SVD_ScreenWidth * 0.8);
        make.centerX.mas_equalTo(0);
    }];
    [loginButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(sloganLabel.mas_bottom).offset(20);
        make.height.mas_equalTo(48);
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(SVD_ScreenWidth * 0.8);
    }];
    [privacyTextView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(loginButton.mas_bottom).offset(20);
        make.right.mas_equalTo(loginButton);
        make.height.mas_greaterThanOrEqualTo(50);
    }];
    [checkBox mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(loginButton).offset(-10);
        make.right.mas_equalTo(privacyTextView.mas_left).offset(10);
        make.width.height.mas_equalTo(40);
        make.centerY.mas_equalTo(privacyTextView).offset(-16);
    }];
    
    CGFloat topOffset = 20;
    float height = [SVDDemoHelper isPhoneX]?(115+36.0):115;

    [customBackButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(50);
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(34);
    }];
    
    // bottomView
    [bottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(- SVD_TabbarSafeBottomMargin - 10);
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(SVD_ScreenWidth);
        make.height.mas_equalTo(height);
    }];

    [mLbl mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.centerX.mas_equalTo(0);
    }];

    [wxBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(mLbl.mas_bottom).offset(topOffset);
        make.centerX.mas_equalTo(-50);
        make.width.height.mas_equalTo(48);
    }];

    [zhBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(wxBtn);
        make.centerX.mas_equalTo(50);
        make.width.height.mas_equalTo(48);
    }];
}



#pragma mark - 可选，适配横竖屏
-(void)authPageViewWillTransition:(UIViewController *)authVC toSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator userInfo:(SVSDKHyProtocolUserInfo *)userInfo{
    
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
            if (orientation == UIInterfaceOrientationPortrait || orientation == UIInterfaceOrientationPortraitUpsideDown) {
                //布局_竖屏
                [self tryLayoutSubViews_Portrait:authVC userInfo:userInfo];
            }else{
               //布局_竖屏
               [self tryLayoutSubViews_Landscape:authVC userInfo:userInfo];
            }
        });
    } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        
    }];
    
}

-(void)tryLayoutSubViews_Landscape:(UIViewController *)authVC userInfo:(SVSDKHyProtocolUserInfo *)userInfo{
    
    //授权页view
    UIView * authPageView = authVC.view;
    
    authPageView.backgroundColor = UIColor.whiteColor;

    UIButton * backButton = userInfo.backButton;//自带的backButton，在navBar上

    UIButton * loginButton = userInfo.loginButton;
    UIImageView * logoImageView  = userInfo.logoImageView;
    UILabel  * phoneLabel = userInfo.phoneLabel;
    UIButton * checkBox  = userInfo.checkBox;
    UITextView * privacyTextView = userInfo.privacyTextView;
    UILabel  * sloganLabel = userInfo.sloganLabel;
    
    UIView * customBackButton = _customBackButton;
    UIView * bottomView = _bottomView;
    UILabel * mLbl = _mLbl;
    UIButton * wxBtn = _wxBtn;
    UIButton * zhBtn = _zhBtn;
    
    // 横屏布局
    
    //横屏
    [logoImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.width.height.mas_equalTo(70);
        make.top.mas_equalTo(30);
    }];
    [phoneLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(logoImageView.mas_bottom).offset(10);
        make.centerX.mas_equalTo(0);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(SVD_ScreenHeight * 0.8);
    }];
    [sloganLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(phoneLabel.mas_bottom).offset(0);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(SVD_ScreenHeight * 0.8);
        make.centerX.mas_equalTo(0);
    }];
    [loginButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(sloganLabel.mas_bottom).offset(10);
        make.height.mas_equalTo(48);
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(SVD_ScreenHeight * 0.8);
    }];
    [privacyTextView mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        if (@available(iOS 11.0, *)) {
            make.bottom.mas_equalTo(authPageView.mas_safeAreaLayoutGuideBottom);
        } else {
            make.bottom.mas_equalTo(authPageView.mas_bottom).offset(-20);
        }
        
        make.right.mas_equalTo(loginButton);
        make.height.mas_greaterThanOrEqualTo(50);
    }];
    [checkBox mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(loginButton).offset(-10);
        make.right.mas_equalTo(privacyTextView.mas_left).offset(10);
        make.width.height.mas_equalTo(40);
        make.centerY.mas_equalTo(privacyTextView).offset(-16);
    }];
    

    [customBackButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(50);
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(15);
    }];
    
    // bottomView
    [bottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(privacyTextView.mas_top);
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(SVD_ScreenWidth);
        make.height.mas_equalTo(70+mLbl.bounds.size.height);
    }];

    [mLbl mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(wxBtn.mas_top).offset(-10);
        make.centerX.mas_equalTo(0);
    }];

    [wxBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-10);
        make.centerX.mas_equalTo(-50);
        make.width.height.mas_equalTo(48);
    }];

    [zhBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(wxBtn);
        make.centerX.mas_equalTo(50);
        make.width.height.mas_equalTo(48);
    }];
    
    
}


//隐私协议设置示例
+(void)setPrivacySettingExample:(SVSDKHyUIConfigure *)uiConfigure{
    
    //显示效果： 登录即代表同意《中国xx认证服务条款》和Mob服务协议、百度服务协议并授权秒验获取本机号码
    
    UIColor * baseTextColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:188/255.0 alpha:1/1.0];
    UIColor * privacyTextColor = [UIColor colorWithRed:0/255.0 green:182/255.0 blue:181/255.0 alpha:1/1.0];
    UIFont * commonFont = [UIFont fontWithName:@"PingFangSC-Regular" size:11];
    
    //文字拼接
    uiConfigure.privacySettings = @[({
        SVSDKHyPrivacyText * text_des_0 = [SVSDKHyPrivacyText new];
        text_des_0.text = @"登录即代表同意";
        text_des_0.textColor = baseTextColor;
        text_des_0.textFont = commonFont;
        text_des_0;
    }),({
        //运营商协议占位
        SVSDKHyPrivacyText * text_operator = [SVSDKHyPrivacyText new];
        text_operator.isOperatorPlaceHolder = YES;//设为YES，SDK内部将自动填充上运营商协议文字和链接
        text_operator.operatorAddMarks = YES;//运营商协议加书名号
        text_operator.textColor = privacyTextColor;
        text_operator.textFont = commonFont;
        text_operator;
    }),({
        SVSDKHyPrivacyText * text_des_1 = [SVSDKHyPrivacyText new];
        text_des_1.text = @"和";
        text_des_1.textColor = baseTextColor;
        text_des_1.textFont = commonFont;
        text_des_1;
    }),({
        SVSDKHyPrivacyText * text_myPrivacy0 = [SVSDKHyPrivacyText new];
        text_myPrivacy0.text = @"Mob服务协议";
        text_myPrivacy0.textLinkString = @"http://www.mob.com/policy/zh";
        text_myPrivacy0.textColor =privacyTextColor;
        text_myPrivacy0.textFont = commonFont;
        text_myPrivacy0;
    }),({
        SVSDKHyPrivacyText * text_des_2 = [SVSDKHyPrivacyText new];
        text_des_2.text = @"、";
        text_des_2.textColor = baseTextColor;
        text_des_2.textFont = commonFont;
        text_des_2;
    }),({
        SVSDKHyPrivacyText * text_myPrivacy1 = [SVSDKHyPrivacyText new];
        text_myPrivacy1.text = @"百度服务协议";
        text_myPrivacy1.textLinkString = @"http://www.baidu.com";
        text_myPrivacy1.textColor =privacyTextColor;
        text_myPrivacy1.textFont = commonFont;
        text_myPrivacy1;
    }),({
        NSString * appName = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
        if (appName == nil) {
            appName = @"秒验Demo";
        }
        SVSDKHyPrivacyText * text_des_3 = [SVSDKHyPrivacyText new];
        text_des_3.text = [NSString stringWithFormat:@"并授权%@获取本机号码",appName];
        text_des_3.textColor = baseTextColor;
        text_des_3.textFont = commonFont;
        text_des_3;
    })];;
    
    
    //居中
    uiConfigure.privacyTextAlignment = @(NSTextAlignmentCenter);
    //行距
    uiConfigure.privacyLineSpacing = @(4);
}

@end
