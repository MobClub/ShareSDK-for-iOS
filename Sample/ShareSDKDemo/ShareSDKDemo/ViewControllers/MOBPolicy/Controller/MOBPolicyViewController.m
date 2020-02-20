//
//  MOBPolicyViewController.m
//  ShareSDKDemo
//
//  Created by maxl on 2020/1/14.
//  Copyright © 2020 mob. All rights reserved.
//

#import "MOBPolicyViewController.h"
#import <MOBFoundation/MOBFoundation.h>
#import "MOBPolicyWebViewController.h"
#import <MOBFoundation/MobSDK+Privacy.h>
@interface MOBPolicyViewController ()<UITextViewDelegate>

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, strong) UIButton * cancelButton;

@property (nonatomic, strong) UIButton * confirmButton;

@property (nonatomic, strong) UITextView *contentTextView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *recentUpdateDate;

@property (nonatomic, strong) UILabel *effectDate;

@end

@implementation MOBPolicyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
    [self setupUI];
    [self loadData];
    
    // Do any additional setup after loading the view.
}




- (void)setupUI{
    
    UIViewModelCreate()
    .backgroundColor([UIColor whiteColor])
    .addToSuperView(self.view)
    .cornerRadius(17)
    .assignTo(^(__kindof UIView * _Nonnull view) {
        _contentView = view;
    });
    
    UILabelModelCreate()
    .multiple(3)
    .assignToObjects(^(NSArray<UILabel *> * _Nonnull objs) {
        _titleLabel = objs[0];
        _recentUpdateDate = objs[1];
        _effectDate = objs[2];
    })
    .addToSuperView(self.contentView)
    .textAlignment(NSTextAlignmentCenter)
    .part_first()
    .font(Font(PingFangSemibold, 17))
    .textColor(UIColorHexString(@"000000"))
    .text(@"ShareSDK Demo隐私条款")
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.centerX.equalTo(self.contentView);
        make.top.mas_offset(20);
        make.left.mas_offset(15);
        make.right.mas_offset(-15);
    })
    .part_range(NSMakeRange(1, 2))
    .font(Font(PingFangLight, 13))
    .textColor(UIColorHexAlpha(@"000000", 0.45))
    .textAlignment(NSTextAlignmentCenter)
    .part_sencond()
    .text(@"最近更新日期：2019年12月13日")
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.titleLabel.mas_bottom).mas_offset(15);
        make.left.mas_offset(15);
        make.right.mas_offset(-15);
    })
    .part_third()
    .text(@"版本生效日期：2019年12月20日")
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.recentUpdateDate.mas_bottom).mas_offset(1);
        make.left.mas_offset(15);
        make.right.mas_offset(-15);
    });
    
    UIButtonModelCreate()
    .multiple(2)
    .font(Font(PingFangReguler, 15))
    .cornerRadius(20)
    .masksToBounds(YES)
    .addToSuperView(self.contentView)
    .part_first()
    .textColor(UIColorHexString(@"000000"), UIControlStateNormal)
    .backgroundColor(UIColorHexString(@"#ECECEC"))
    .addTarget(self, @selector(cancelClick), UIControlEventTouchUpInside)
    .text(@"取消", UIControlStateNormal)
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.width.mas_equalTo(128);
        make.height.mas_equalTo(40);
        make.bottom.mas_offset(-20);
        make.right.equalTo(self.contentView.mas_centerX).offset(-9.5);
    })
    .part_sencond()
    .textColor(UIColorHexString(@"ffffff"), UIControlStateNormal)
    .backgroundColor(UIColorHexString(@"#FF7800"))
    .addTarget(self, @selector(confirmClick), UIControlEventTouchUpInside)
    .text(@"同意", UIControlStateNormal)
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.width.mas_equalTo(128);
        make.height.mas_equalTo(40);
        make.bottom.mas_offset(-20);
        make.left.equalTo(self.contentView.mas_centerX).offset(9.5);
    })
    .assignToObjects(^(NSArray<UIButton *> * _Nonnull objs) {
        _cancelButton = objs[0];
        _confirmButton = objs[1];
    });
    
    UITextViewModelCreate()
    .textColor(UIColorHexString(@"000000"))
    .font(Font(PingFangReguler, 14))
    .addToSuperView(self.contentView)
    .delegate(self)
    .editable(NO)
    .assignTo(^(__kindof UIView * _Nonnull view) {
        _contentTextView = view;
    })
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.top.equalTo(self.effectDate.mas_bottom).offset(10);
        make.left.mas_offset(20);
        make.right.mas_offset(-20);
        make.bottom.equalTo(self.cancelButton.mas_top).offset(-20);
    });
    
}

- (void)viewSafeAreaInsetsChanged:(UIEdgeInsets)edges{
    [self.contentView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(30 + edges.left);
        make.right.mas_offset(-30 - edges.right);
        make.top.mas_offset(100 + edges.top);
        make.bottom.mas_offset(- 120 - edges.bottom);
    }];
}

- (void)loadData{
    
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:@"    欢迎您使用MobTech提供的演示DEMO，ShareSDK为开发者提供的社交分享SDK，支持微信、抖音、QQ、微博、Facebook、Twitter等全球40+主流社交平台账号内的一键分享、第三方登录授权以及闭环分享服务，不仅极大地方便了您的终端用户的服务体验，更为您实时了解终端用户的分享数、回流数、意向分享等数据进行了统计分析。为了对您的闭环分享功能进行来源追溯并帮助您更精细化运营，我们将依据MobTech的《隐私政策》来帮助你了解我们需要收集哪些数据。\n\n\n详情点击:" attributes:@{
        NSFontAttributeName :Font(PingFangReguler, 13),
        NSForegroundColorAttributeName:UIColorHexString(@"000000")
    }];
    
    _contentTextView.linkTextAttributes = @{NSForegroundColorAttributeName:UIColorHexString(@"FF7800")};
    SSDKWEAK
    [MobSDK getPrivacyPolicy:@"1" compeletion:^(NSDictionary * _Nullable data, NSError * _Nullable error) {
        
        NSString *linkText = data[@"content"]?:@"";
        NSString *urlDescription = @"《MobService隐私条款》";
        [attribute appendAttributedString:[[NSAttributedString alloc] initWithString:urlDescription attributes:@{
            NSFontAttributeName :Font(PingFangReguler, 13),NSLinkAttributeName:linkText}]];
        weakSelf.contentTextView.attributedText = attribute;
    }];
}


- (void)cancelClick{
    if (self.policyStaus) {
        self.policyStaus(NO);
    }
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)confirmClick{
    if (self.policyStaus) {
        self.policyStaus(YES);
    }
    [self dismissViewControllerAnimated:NO completion:nil];
}

#pragma mark - UITextViewDelegate -

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange{
    MOBPolicyWebViewController *vc = [MOBPolicyWebViewController new];
    vc.title = @"《MobTech隐私政策》";
    vc.extraInfo[@"url"] = URL;
    vc.showAnimated(YES).push();
    return NO;
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
