//
//  MOBPolicyWebViewController.m
//  ShareSDKDemo
//
//  Created by maxl on 2020/1/17.
//  Copyright © 2020 mob. All rights reserved.
//

#import "MOBPolicyWebViewController.h"

@import WebKit;
@interface MOBPolicyWebViewController ()

@property (nonatomic, strong) WKWebView *webView;

@end

@implementation MOBPolicyWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WKWebViewModelCreate()
    .addToSuperView(self.view)
    .assignTo(^(__kindof UIView * _Nonnull view) {
        _webView = view;
    })
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.top.equalTo(self.navigationBar.mas_bottom);
        make.left.right.bottom.equalTo(self.view);
    });
    [_webView loadRequest:[NSURLRequest requestWithURL:self.extraInfo[@"url"]]];
    // Do any additional setup after loading the view.
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
