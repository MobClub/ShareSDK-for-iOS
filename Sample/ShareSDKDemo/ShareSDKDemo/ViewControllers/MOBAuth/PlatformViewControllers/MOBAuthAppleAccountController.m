//
//  MOBAuthorAppleViewController.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/10/29.
//  Copyright © 2019 mob. All rights reserved.
//

#import "MOBAuthAppleAccountController.h"
#import <ShareSDK/ShareSDK.h>
#import <AppleAccountConnector/AppleAccountConnector.h>
@interface MOBAuthAppleAccountController ()
{
    UITextField *t1;
    UITextField *t2;
}
@end

@implementation MOBAuthAppleAccountController
- (instancetype)init
{
    self = [super init];
    if (self) {
//        self.view.translatesAutoresizingMaskIntoConstraints = NO;
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
    self.title = @"Apple登录";
    
    [AppleAccountConnector addObserve:self isFirstAddCallBack:NO forAppleAccountLoginStateHandler:^(SSDKAppleAccountState state, SSDKUser * _Nonnull user, NSError * _Nonnull error) {
        NSLog(@"%@", user.rawData);
    }];
    
    // Do any additional setup after loading the view.
}

- (void)setupUI{
    
    id v ;
    if (@available(iOS 11.0, *)) {
        t1 = [self createTextFiledByContentType:UITextContentTypeUsername];
        t2 = v = [self createTextFiledByContentType:UITextContentTypePassword];
        UIButton *appleLogin = [UIButton buttonWithType:UIButtonTypeCustom];
        appleLogin.translatesAutoresizingMaskIntoConstraints = NO;
        [appleLogin setTitle:@"Apple登录" forState:UIControlStateNormal];
        [appleLogin addTarget:self action:@selector(appleLogin) forControlEvents:UIControlEventTouchUpInside];
        [appleLogin setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self.view addSubview:appleLogin];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:appleLogin attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:10]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:appleLogin attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:v attribute:NSLayoutAttributeBottom multiplier:1 constant:80]];
        [appleLogin addConstraint:[NSLayoutConstraint constraintWithItem:appleLogin attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:kNilOptions multiplier:1 constant:40]];
        [appleLogin addConstraint:[NSLayoutConstraint constraintWithItem:appleLogin attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:kNilOptions multiplier:1 constant:200]];
    }
    
}

- (__kindof UIView *)createTextFiledByContentType:(UITextContentType)contentType{
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    textField.textContentType = contentType;
    textField.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    textField.layer.shadowOffset = CGSizeMake(0, 0);
    textField.layer.shadowOpacity = 0.45;
    textField.layer.backgroundColor = [UIColor whiteColor].CGColor;
   
    
    textField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 40)];
    textField.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:textField];
    textField.translatesAutoresizingMaskIntoConstraints = NO;
    CGFloat floa = 0;
    if (@available(iOS 11.0, *)) {
        BOOL isUserName = [contentType isEqualToString:UITextContentTypeUsername];
        floa = isUserName?30:-30;
        textField.placeholder = isUserName?@"请输入账户":@"请输入密码";
    
    }
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:textField attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:floa]];
    [textField addConstraint:[NSLayoutConstraint constraintWithItem:textField attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:kNilOptions multiplier:1 constant:40]];
    [textField addConstraint:[NSLayoutConstraint constraintWithItem:textField attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:kNilOptions multiplier:1 constant:200]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:textField attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    return textField;
}


- (void)appleLogin{
    if (t1.text.length == 0 && t2.text.length == 0) {
        [ShareSDK authorize:SSDKPlatformTypeAppleAccount settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
            
        }];
    }else{
        
    }
        
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}

@end
