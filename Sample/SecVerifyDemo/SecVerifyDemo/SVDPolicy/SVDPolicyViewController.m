//
//  SVDPolicyViewController.m
//  SecVerifyDemo
//
//  Created by 李树志 on 2020/2/7.
//  Copyright © 2020 yoozoo. All rights reserved.
//

#import "SVDPolicyViewController.h"
#import "Masonry.h"
#import <MOBFoundation/MobSDK+Privacy.h>
#import "SVDPolicyWebViewController.h"

@interface SVDPolicyViewController ()<UITextViewDelegate>

// 弹窗内容容器View
@property(nonatomic, strong) UIView *contentView;
// 隐私条款title
@property(nonatomic, strong) UILabel *titleLabel;
// 隐私条款最近更新
@property(nonatomic, strong) UILabel *recentUpdateLabel;
// 隐私条款生效日期
@property(nonatomic, strong) UILabel *effectedLabel;
// 拒绝按钮
@property(nonatomic, strong) UIButton *rejectButton;
// 同意按钮
@property(nonatomic, strong) UIButton *acceptButton;
// 隐私条款内容
@property(nonatomic, strong) UITextView *contentTextView;

@end

@implementation SVDPolicyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
    
    [self setupUI];
    [self loadData];
}


- (void)setupUI {
    // 容器View
    UIView *contentView = [[UIView alloc] init];
    self.contentView = contentView;
    contentView.backgroundColor = [UIColor whiteColor];
    contentView.layer.cornerRadius = 17.0;
    contentView.layer.masksToBounds = YES;
    
    [self.view addSubview:contentView];
    
    
    // 隐私条款title
    UILabel *titleLabel = [[UILabel alloc] init];
    self.titleLabel = titleLabel;
    titleLabel.text = @"SecVerify Demo隐私条款";
    titleLabel.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:17];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [titleLabel sizeToFit];
    
    [self.contentView addSubview:titleLabel];
    
    // 最近更新
    UILabel *recentUpdateLabel = [[UILabel alloc] init];
    self.recentUpdateLabel = recentUpdateLabel;
    recentUpdateLabel.text = @"最近更新日期：2019年12月13日";
    recentUpdateLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:13];
    recentUpdateLabel.textColor = [UIColor colorWithWhite:0 alpha:0.45];
    recentUpdateLabel.textAlignment = NSTextAlignmentCenter;
    [recentUpdateLabel sizeToFit];
    
    [self.contentView addSubview:recentUpdateLabel];
    
    
    
    // 版本生效日期
    UILabel *effectedLabel = [[UILabel alloc] init];
    self.effectedLabel = effectedLabel;
    effectedLabel.text = @"版本生效日期：2020年02月07日";
    effectedLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:13];
    effectedLabel.textColor = [UIColor colorWithWhite:0 alpha:0.45];
    effectedLabel.textAlignment = NSTextAlignmentCenter;
    [effectedLabel sizeToFit];
    
    [self.contentView addSubview:effectedLabel];
    
    // 拒绝Button 232 233 232
    UIButton *rejectBtn = [[UIButton alloc] init];
    self.rejectButton = rejectBtn;
    rejectBtn.backgroundColor = [UIColor colorWithRed:232/255.0 green:233/255.0 blue:232/255.0 alpha:1.0];
    [rejectBtn setTitle:@"取消" forState:UIControlStateNormal];
    [rejectBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    rejectBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:15];
    rejectBtn.layer.cornerRadius = 20.0;
    rejectBtn.layer.masksToBounds = YES;
    [rejectBtn addTarget:self action:@selector(rejectButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview:rejectBtn];
    
    // 同意Button 253 92 8
    UIButton *acceptBtn = [[UIButton alloc] init];
    self.acceptButton = acceptBtn;
    acceptBtn.backgroundColor = [UIColor colorWithRed:253/255.0 green:92/255.0 blue:8/255.0 alpha:1.0];
    [acceptBtn setTitle:@"同意" forState:UIControlStateNormal];
    [acceptBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    acceptBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:15];
    acceptBtn.layer.cornerRadius = 20.0;
    acceptBtn.layer.masksToBounds = YES;
    [acceptBtn addTarget:self action:@selector(acceptButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:acceptBtn];
    
    
    // 隐私协议内容
    UITextView *contentTextView = [[UITextView alloc] init];
    self.contentTextView = contentTextView;
    contentTextView.backgroundColor = [UIColor whiteColor];
    contentTextView.delegate = self;
    contentTextView.editable = NO;
    contentTextView.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
    contentTextView.textColor = [UIColor blackColor];
    contentTextView.showsVerticalScrollIndicator = NO;
    contentTextView.showsHorizontalScrollIndicator = NO;
    
    [self.contentView addSubview:contentTextView];
    
    // 刷新布局
    [self refreshSubviewsLayoutWithSize:self.view.frame.size];
    
}


- (void)refreshSubviewsLayoutWithSize:(CGSize)viewSize
{
    CGFloat width = viewSize.width;
    CGFloat height = viewSize.height;
    BOOL isPortrait = height > width;
    
    [self.contentView mas_remakeConstraints:^(MASConstraintMaker *make) {
        if (isPortrait) {
            make.centerX.centerY.mas_equalTo(0);
            make.width.mas_equalTo(width * 0.8);
            make.height.mas_equalTo(height * 0.7);
        } else {
            make.centerX.centerY.mas_equalTo(0);
            make.width.mas_equalTo(width * 0.7);
            make.height.mas_equalTo(height * 0.9);
        }
    }];
    
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.mas_offset(20);
    }];
    
    [self.recentUpdateLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.titleLabel.mas_bottom).mas_offset(15);
    }];
    
    [self.effectedLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.recentUpdateLabel.mas_bottom).mas_offset(5);
    }];
    
    [self.rejectButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.contentView.mas_width).with.multipliedBy(0.4);
        make.height.mas_equalTo(40);
        make.bottom.mas_offset(-20);
        make.left.mas_equalTo(10);
    }];
    
    [self.acceptButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.contentView.mas_width).with.multipliedBy(0.4);
        make.height.mas_equalTo(40);
        make.bottom.mas_offset(-20);
        make.right.mas_equalTo(-10);
    }];
    
    [self.contentTextView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.effectedLabel.mas_bottom).offset(10);
        make.left.mas_offset(20);
        make.right.mas_offset(-20);
        make.bottom.equalTo(self.rejectButton.mas_top).offset(-20);
    }];
    
}



- (void)rejectButtonClicked:(UIButton *)rejectBtn {
    if (self.policyAcceptedStatus) {
        self.policyAcceptedStatus(NO);
    }
    
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)acceptButtonClicked:(UIButton *)acceptBtn {
    if (self.policyAcceptedStatus) {
        self.policyAcceptedStatus(YES);
    }
    
    [self dismissViewControllerAnimated:NO completion:nil];
}


- (void)loadData {
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:@"    欢迎您使用MobTech提供的演示DEMO，秒验秒验是一款帮助开发者实现一键验证功能的产品，从根源上降低企业验证成本，有效提高拉新转化率，降低因验证带来的流失率，3秒完成手机号验证。我们将依据MobTech的《隐私政策》来帮助你了解我们需要收集哪些数据。\n\n\n详情点击:" attributes:@{
        NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size:13],
        NSForegroundColorAttributeName: [UIColor blackColor]
    }];
    
    // FF7800
    self.contentTextView.linkTextAttributes = @{
        NSForegroundColorAttributeName: [UIColor colorWithRed:233/255.0 green:120/255.0 blue:0 alpha:1.0]
    };
    __weak typeof(self) weakSelf = self;
    [MobSDK getPrivacyPolicy:@"1"
                    language:@"cn"
                 compeletion:^(NSDictionary * _Nullable data, NSError * _Nullable error) {
        NSString *linkText = data[@"content"]?:@"";
        NSString *urlDescription = @"《MobService隐私条款》";
        [attribute appendAttributedString:[[NSAttributedString alloc] initWithString:urlDescription attributes:@{
            NSFontAttributeName :[UIFont fontWithName:@"PingFangSC-Regular" size:13],NSLinkAttributeName:linkText}]];
        weakSelf.contentTextView.attributedText = attribute;
    }];
}


#pragma mark - UITextViewDelegate

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange
{
    SVDPolicyWebViewController *webVC = [[SVDPolicyWebViewController alloc] init];
    webVC.policyURL = URL;
    webVC.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:webVC animated:NO completion:nil];
    return NO;
}


#pragma mark - 屏幕旋转
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [self refreshSubviewsLayoutWithSize:size];
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
