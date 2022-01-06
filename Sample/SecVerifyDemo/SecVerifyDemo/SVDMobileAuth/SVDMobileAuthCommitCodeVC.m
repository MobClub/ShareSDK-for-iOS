//
//  SMSDemoCommitCodeVC.m
//  SMSSDKDemo
//
//  Created by hower on 2020/1/2.
//  Copyright © 2020 youzu. All rights reserved.
//

#import "SVDMobileAuthCommitCodeVC.h"

#import "SVDDemoHelper.h"
#import "SVProgressHUD.h"

//#import <SecVerify/SecVerify.h>
#import <SecVerify/SVSDKHyVerify.h>

#define KSMSDNeedMoveMaxHeight 570
#define SVDDemoStatusBarHeight [UIApplication sharedApplication].statusBarFrame.size.height

@interface SVDMobileAuthCommitCodeVC ()<UITextFieldDelegate>
{
    CGFloat _needMoveHeight;
}

//背景图
@property (nonatomic, strong) UIView *bgView;

//区号背景视图
@property (nonatomic, strong) UIView *zoneSelectBar;
//地区
@property (nonatomic, strong) UILabel *countryZoneLbl;
//地区横线
@property (nonatomic, strong) UILabel *zoneLineLbl;
//手机号背景视图
@property (nonatomic, strong) UIView *phoneEditView;
//手机号标题
@property (nonatomic, strong) UILabel *phoneTitleLbl;
//手机号标题
@property (nonatomic, strong) UITextField *phoneTf;
//地区横线
@property (nonatomic, strong) UILabel *phoneLineLbl;

//验证按钮
@property (nonatomic, strong) UIButton *verifyBtn;

@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *zone;

@property (nonatomic, strong) UIButton *backBtn;

//号码top
@property (nonatomic, strong) NSLayoutConstraint *phoneTopConstraint;

//result
@property (nonatomic, copy) SMSDCommitCodeResultHanler result;

@property (nonatomic, copy) NSDictionary *tokenInfo;

@end

@implementation SVDMobileAuthCommitCodeVC

- (instancetype)initWithTokenInfo:(NSDictionary *)tokenInfo result:(SMSDCommitCodeResultHanler)result {
    if (self = [super init]) {
        self.result = result;
        self.tokenInfo = tokenInfo;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //默认短信验证
    [self registerKeyboradNotification];
    
    [self loadCustomView];
    [self loadCustomLayout];
    
    if(_phoneTf.text.length > 0)
    {
        _verifyBtn.enabled= YES;
    }
    else
    {
        _verifyBtn.enabled= NO;
    }
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
}


- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
     self.phoneTf.delegate = nil;
     [[NSNotificationCenter defaultCenter] removeObserver:self];
}



#pragma mark - 键盘通知
- (void)registerKeyboradNotification
{
    if(self.view.frame.size.height < KSMSDNeedMoveMaxHeight)
    {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                     selector:@selector(keyboardWillHide:)
                                                         name:UIKeyboardWillHideNotification
                                                       object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardWillShow:)
                                                     name:UIKeyboardWillShowNotification
                                                   object:nil];
    }
    
}


- (void)keyboardWillShow:(NSNotification *)notification
{
    CGFloat maxTextFieldY = self.bgView.frame.origin.y;
    if(fabs(maxTextFieldY) < _needMoveHeight)
    {
        [UIView animateWithDuration:0.3 animations:^{
            CGRect viewFrame = self.view.frame;
            viewFrame.origin.y = - self->_needMoveHeight;
            self.bgView.frame = viewFrame;
        }];
    }
}

- (void)keyboardWillHide:(NSNotification *)notification
{
    [UIView animateWithDuration:0.3 animations:^{
        CGRect viewFrame = self.view.frame;
        viewFrame.origin.y = 0;
        self.bgView.frame = viewFrame;
    }];
}


#pragma mark - 键盘方法
- (CGFloat)minKeyboardY:(NSNotification *)notification
{
    NSDictionary *infoDict = [notification userInfo];
    NSValue *value = [infoDict objectForKey:UIKeyboardFrameBeginUserInfoKey];
    CGRect keyboardFrame = [value CGRectValue];
    
    return ([UIScreen mainScreen].bounds.size.height - keyboardFrame.size.height);
}

- (void)configBack
{
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setImage:[UIImage imageNamed:@"login_icon_back"] forState:UIControlStateNormal];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    backButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:18];
    [backButton addTarget:self action:@selector(dismiss:) forControlEvents:UIControlEventTouchUpInside];
    self.backBtn = backButton;
    
    [self.bgView addSubview:backButton];
}

- (void)dismiss:(UIButton *)btn
{
    [self dismissViewControllerAnimated:YES completion:nil];
}



//加载视图
-(void)loadCustomView
{
    self.view.backgroundColor = SVDDemoRGBA(74,159,163, 1);

    self.bgView =
    ({
        UIView *bgView = [[UIView alloc] init];
        [self.view addSubview:bgView];
        
        bgView;
    });
    
    self.bgView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    [self configBack];
    
    self.zoneSelectBar =
    ({
        UIView *zoneSelectBar = [[UIView alloc] init];
        
        self.countryZoneLbl =
        ({
            UILabel *countryLabel = [[UILabel alloc] init];
            countryLabel.text = [NSString stringWithFormat:@"%@    %@",[SVDDemoHelper currentCountryName],[SVDDemoHelper currentZone]];
            //[SMSSDKUIHelper currentCountryName];
            countryLabel.textColor = [UIColor whiteColor];
            countryLabel.textAlignment = NSTextAlignmentLeft;
            countryLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
            [zoneSelectBar addSubview:countryLabel];
            countryLabel;
        });
        
        _zone = [SVDDemoHelper currentZone];
        if([_zone containsString:@"+"])
        {
            _zone = [_zone stringByReplacingOccurrencesOfString:@"+" withString:@""];
        }
        
        
        self.zoneLineLbl =
        ({
            UILabel *lbl = [[UILabel alloc] init];
            lbl.backgroundColor = [UIColor colorWithRed:143/255.0 green:203/255.0 blue:205/255.0 alpha:1];
            [zoneSelectBar addSubview:lbl];
            lbl;
        });
        
        [self.bgView addSubview:zoneSelectBar];
        
        if([SVDDemoHelper currentCountryName] && [SVDDemoHelper currentZone])
        {
            NSString *secdemo_country = [[NSUserDefaults standardUserDefaults] objectForKey:@"secdemo_country"];
            NSString *secdemo_zone = [[NSUserDefaults standardUserDefaults] objectForKey:@"secdemo_zone"];
            if(!secdemo_zone && !secdemo_country)
            {
               
                [[NSUserDefaults standardUserDefaults] setObject:[SVDDemoHelper currentCountryName] forKey:@"secdemo_country"];
                [[NSUserDefaults standardUserDefaults] setObject:[SVDDemoHelper currentZone] forKey:@"secdemo_zone"];
                [[NSUserDefaults standardUserDefaults] synchronize];
            }

        }

        
        zoneSelectBar ;
    });
    
    
    self.phoneEditView =
    ({
        UIView *editView = [[UIView alloc] init];
        
        self.phoneTitleLbl =
        ({
            UILabel *lbl = [[UILabel alloc] init];
            lbl.text = @"手机号";
            lbl.textAlignment = NSTextAlignmentLeft;
            lbl.textColor = [UIColor colorWithRed:143/255.0 green:203/255.0 blue:205/255.0 alpha:1];
            lbl.font = [UIFont fontWithName:@"Helvetica" size:18];
            [editView addSubview:lbl];
            lbl;
        });
        
        
        self.phoneTf =
        ({
            UITextField *textFiled = [[UITextField alloc] init];
            textFiled.textColor = [UIColor whiteColor];
//            textFiled.placeholder = SMSDemoLocalized(@"phonecode");
            textFiled.keyboardType = UIKeyboardTypePhonePad;
            textFiled.clearButtonMode = UITextFieldViewModeWhileEditing;
            textFiled.font = [UIFont fontWithName:@"Helvetica" size:14];
            textFiled.delegate = self;
            [editView addSubview:textFiled];
            textFiled;
            
        });
        
        self.phoneLineLbl =
        ({
            UILabel *lbl = [[UILabel alloc] init];
            lbl.backgroundColor = [UIColor colorWithRed:143/255.0 green:203/255.0 blue:205/255.0 alpha:1];
            [editView addSubview:lbl];
            lbl;
        });
        [self.bgView addSubview:editView];

        editView;
    });
    
    self.verifyBtn =
    ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [btn setTitle:@"验证" forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor whiteColor]];
        btn.layer.cornerRadius = 4;
        [btn setTitleColor:[UIColor colorWithRed:88/255.0 green:179/255.0 blue:181/255.0 alpha:1] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];

        btn.layer.cornerRadius = 20;
        btn.layer.masksToBounds = YES;
        [btn addTarget:self action:@selector(verify:) forControlEvents:UIControlEventTouchUpInside];
        [self.bgView addSubview:btn];
        btn;
    });
    
}


//加载布局
-(void)loadCustomLayout
{
    self.zoneSelectBar.translatesAutoresizingMaskIntoConstraints = NO;
    self.countryZoneLbl.translatesAutoresizingMaskIntoConstraints = NO;
    self.zoneLineLbl.translatesAutoresizingMaskIntoConstraints = NO;

    self.phoneEditView.translatesAutoresizingMaskIntoConstraints = NO;
    self.phoneTf.translatesAutoresizingMaskIntoConstraints = NO;
    self.phoneLineLbl.translatesAutoresizingMaskIntoConstraints = NO;
    self.phoneTitleLbl.translatesAutoresizingMaskIntoConstraints = NO;

    self.verifyBtn.translatesAutoresizingMaskIntoConstraints = NO;
    self.backBtn.translatesAutoresizingMaskIntoConstraints = NO;


    UIView *bgView = self.bgView;
    float topOffset = 44+20 + SVDDemoStatusBarHeight;
    
    // back button
    {
        NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self.backBtn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:bgView attribute:NSLayoutAttributeTop multiplier:1.0 constant:(SVD_StatusBarSafeBottomMargin + 10)];
        
        NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self.backBtn attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:bgView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:15];
        
        NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:self.backBtn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50];
        
        NSLayoutConstraint *heigtConstraint = [NSLayoutConstraint constraintWithItem:self.backBtn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:30];
        
        [bgView addConstraint:topConstraint];
        [bgView addConstraint:leftConstraint];
        [bgView addConstraint:widthConstraint];
        [self.backBtn addConstraint:heigtConstraint];
    }
    
    //zone bg
    {
           NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self.zoneSelectBar attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:bgView attribute:NSLayoutAttributeTop multiplier:1.0 constant:(topOffset + 80)];
           
           NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self.zoneSelectBar attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:bgView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:10];
           
           
           NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:self.zoneSelectBar attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:bgView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-10];
           
           NSLayoutConstraint *heigtConstraint = [NSLayoutConstraint constraintWithItem:self.zoneSelectBar attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:40];
           
           [bgView addConstraint:topConstraint];
           [bgView addConstraint:leftConstraint];
           [bgView addConstraint:rightConstraint];
           [self.zoneSelectBar addConstraint:heigtConstraint];

       }
    
    //zones
    {
        NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self.countryZoneLbl attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.zoneSelectBar attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];

        NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self.countryZoneLbl attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.zoneSelectBar attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];


        NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:self.countryZoneLbl attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.zoneSelectBar attribute:NSLayoutAttributeRight multiplier:1.0 constant:-30];

        NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:self.countryZoneLbl attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.zoneSelectBar attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];

        [self.zoneSelectBar addConstraint:topConstraint];
        [self.zoneSelectBar addConstraint:leftConstraint];
        [self.zoneSelectBar addConstraint:rightConstraint];
        [self.zoneSelectBar addConstraint:bottomConstraint];

    }
    
    //zoneline
    {
        NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:self.zoneLineLbl attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.zoneSelectBar attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-0.5];
        
        NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self.zoneLineLbl attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.zoneSelectBar attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
        
        
        NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:self.zoneLineLbl attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.zoneSelectBar attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
        
        NSLayoutConstraint *heigtConstraint = [NSLayoutConstraint constraintWithItem:self.zoneLineLbl attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:0.5];
        
        [self.zoneSelectBar addConstraint:bottomConstraint];
        [self.zoneSelectBar addConstraint:leftConstraint];
        [self.zoneSelectBar addConstraint:rightConstraint];
        [self.zoneLineLbl addConstraint:heigtConstraint];
        
    }
//    self.zoneSelectBar.backgroundColor = [UIColor lightTextColor];
//    self.phoneEditView.backgroundColor = [UIColor yellowColor];
    
    //phone bg
    {
           NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self.phoneEditView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.zoneSelectBar attribute:NSLayoutAttributeBottom multiplier:1.0 constant:1];
           
           NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self.phoneEditView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:bgView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:10];
           
           
           NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:self.phoneEditView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:bgView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-10];
           
           NSLayoutConstraint *heigtConstraint = [NSLayoutConstraint constraintWithItem:self.phoneEditView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:72];
           
           [bgView addConstraint:topConstraint];
           [bgView addConstraint:leftConstraint];
           [bgView addConstraint:rightConstraint];
           [self.phoneEditView addConstraint:heigtConstraint];

        
       }
    
    //phone title
    {
//           NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self.phoneTitleLbl attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.phoneEditView attribute:NSLayoutAttributeTop multiplier:1.0 constant:15];

        NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self.phoneTitleLbl attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.phoneEditView attribute:NSLayoutAttributeTop multiplier:1.0 constant:40];

        
           NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self.phoneTitleLbl attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.phoneEditView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
           
           
           NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:self.phoneTitleLbl attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.phoneEditView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-100];
           
           NSLayoutConstraint *heigtConstraint = [NSLayoutConstraint constraintWithItem:self.phoneTitleLbl attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:20];
           
           [self.phoneEditView addConstraint:topConstraint];
           [self.phoneEditView addConstraint:leftConstraint];
           [self.phoneEditView addConstraint:rightConstraint];
           [self.phoneTitleLbl addConstraint:heigtConstraint];

        _phoneTopConstraint = topConstraint;
       }
    
    //phone tf
    {
        NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self.phoneTf attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.phoneEditView attribute:NSLayoutAttributeTop multiplier:1.0 constant:32];

        NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self.phoneTf attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.phoneEditView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];


        NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:self.phoneTf attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.phoneEditView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-30];

        NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:self.phoneTf attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.phoneEditView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];

        [self.phoneEditView addConstraint:topConstraint];
        [self.phoneEditView addConstraint:leftConstraint];
        [self.phoneEditView addConstraint:rightConstraint];
        [self.phoneEditView addConstraint:bottomConstraint];

    }
    
    
    //phone line
    {
           NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:self.phoneLineLbl attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.phoneEditView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-0.5];
           
           NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self.phoneLineLbl attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.phoneEditView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
           
           
           NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:self.phoneLineLbl attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.phoneEditView attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
           
           NSLayoutConstraint *heigtConstraint = [NSLayoutConstraint constraintWithItem:self.phoneLineLbl attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:0.5];
           
           [self.phoneEditView addConstraint:bottomConstraint];
           [self.phoneEditView addConstraint:leftConstraint];
           [self.phoneEditView addConstraint:rightConstraint];
           [self.phoneLineLbl addConstraint:heigtConstraint];

       }
    
    {
        NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self.verifyBtn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.phoneEditView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:30];

        NSLayoutConstraint *centerConstraint = [NSLayoutConstraint constraintWithItem:self.verifyBtn attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:bgView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
        
        NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:self.verifyBtn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:bgView attribute:NSLayoutAttributeWidth multiplier:0.7 constant:0];


        NSLayoutConstraint *heigtConstraint = [NSLayoutConstraint constraintWithItem:self.verifyBtn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:45];


        [bgView addConstraint:centerConstraint];
        [bgView addConstraint:topConstraint];
        [bgView addConstraint:widthConstraint];
        [self.verifyBtn addConstraint:heigtConstraint];
    }
    
}

-(void)verify:(UIButton*)btn
{
    [self.phoneTf resignFirstResponder];

    NSString *phoneNum = self.phoneTf.text;
    if (![self isMobileNumberOnly:phoneNum]) { // 不是合法手机号
        [SVProgressHUD showErrorWithStatus:@"手机号非法!"];
        return;
    }

    if (!self.tokenInfo
        || ![self.tokenInfo isKindOfClass:[NSDictionary class]]
        || ![self.tokenInfo count]
        || [[self.tokenInfo allKeys] count] != 3) {
        [self showAlert:@"本机认证Token信息错误" message:@"请检查本机认证Token信息"];
        return;
    }
    
    _phone = phoneNum;
    
    [SVProgressHUD show];
    __weak typeof(self) weakSelf = self;
    
    [SVSDKHyVerify mobileAuthWith:_phone token:self.tokenInfo timeOut:5 completion:^(NSDictionary * _Nullable result, NSError * _Nullable error) {
        [SVProgressHUD dismiss];
        [weakSelf dismissViewControllerAnimated:YES completion:^{
            if (weakSelf.result) {
                
                weakSelf.result(@{@"phoneNum": phoneNum, @"result": @(error == nil)}, error);
            }
        }];
    }];
}

#pragma mark - UITextFieldDelegate



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];

    [self.phoneTf resignFirstResponder];

    if(self.phoneTf.text.length == 0)
    {
        _phoneTopConstraint.constant = 40;
        _phoneTitleLbl.font = [UIFont systemFontOfSize:18];
    }
    else
    {
        _phoneTopConstraint.constant = 15;
        _phoneTitleLbl.font = [UIFont systemFontOfSize:14];
    }
    [self updateViewConstraints];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if(self.view.frame.size.height < KSMSDNeedMoveMaxHeight)
    {
        _needMoveHeight = 120;
    }
    
    if(textField == self.phoneTf)
    {
        _phoneTopConstraint.constant = 15;
        _phoneTitleLbl.font = [UIFont systemFontOfSize:14];
        [self updateViewConstraints];
    }
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    _verifyBtn.enabled= NO;
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *lastStr = textField.text;
    if(string && string.length > 0)
    {
        lastStr = [lastStr stringByAppendingString:string];
    }
    else
    {
        NSInteger len = textField.text.length;
        lastStr = [lastStr substringToIndex:(len - range.length)];
    }
    
    if(textField == self.phoneTf)
    {
        if ([lastStr length] > 0) {
            _verifyBtn.enabled = YES;
        } else {
            _verifyBtn.enabled = NO;
        }
        //限制输入
        if(lastStr && lastStr.length > 11)
        {
            return NO;
        }
    }

    return YES;
}

- (BOOL)isMobileNumberOnly:(NSString *)mobileNum
{

    NSString * MOBILE = @"^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[0-9])\\d{8}$";

    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];

    if ([regextestmobile evaluateWithObject:mobileNum] == YES)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

- (void)showAlert:(NSString *)title message:(NSString *)message
{
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:title
                                                                       message:message
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {
            [weakSelf.navigationController popViewControllerAnimated:YES];
                                                              }];
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    });
}

@end
