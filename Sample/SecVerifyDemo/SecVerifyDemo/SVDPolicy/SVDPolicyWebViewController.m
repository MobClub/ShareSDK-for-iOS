//
//  SVDPolicyWebViewController.m
//  SecVerifyDemo
//
//  Created by 李树志 on 2020/2/7.
//  Copyright © 2020 yoozoo. All rights reserved.
//

#import "SVDPolicyWebViewController.h"
#import <WebKit/WebKit.h>
#import "Masonry.h"

@interface SVDPolicyWebViewController ()

@property(nonatomic, strong) WKWebView *webView;

@property(nonatomic, strong) UIButton *closeButton;

@end

@implementation SVDPolicyWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *closeBtn = [[UIButton alloc] init];
    self.closeButton = closeBtn;
    closeBtn.backgroundColor = [UIColor colorWithRed:253/255.0 green:92/255.0 blue:8/255.0 alpha:1.0];
    [closeBtn setTitle:@"关闭" forState:UIControlStateNormal];
    [closeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    closeBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:15];
    [closeBtn addTarget:self action:@selector(closeButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:closeBtn];
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(44);
        make.left.right.bottom.equalTo(self.view);
    }];
    
    
    
    self.webView = [[WKWebView alloc] init];
    self.webView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.bottom.equalTo(closeBtn.mas_top).offset(-15);
    }];
    [self.webView loadRequest:[NSURLRequest requestWithURL:self.policyURL]];
}


- (void)closeButtonClicked:(UIButton *)closeBtn {
    [self dismissViewControllerAnimated:NO completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
