//
//  MOBShareCommandDetailView.m
//  ShareSDKDemo
//
//  Created by cl on 2020/7/28.
//  Copyright © 2020 mob. All rights reserved.
//

#import "MOBShareCommandDetailView.h"
#import "MOBAboutMobLinkViewController.h"

@interface MOBShareCommandDetailView ()

@property (strong, nonatomic) UITapGestureRecognizer *tap;

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *detailLabel;

@property (nonatomic, strong) UIButton *detailButton;

@property (nonatomic, strong) UILabel *bottomLabel;

@property (nonatomic, strong) UILabel *jumpLabel;

@end

@implementation MOBShareCommandDetailView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup{
    self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.3];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(shadowTouchAction)];
    self.tap = tap;
    [self addGestureRecognizer:tap];
    [self contentView];
    [self titleLabel];
    [self detailLabel];
    [self detailButton];
    [self.detailButton addTarget:self action:@selector(detailAction) forControlEvents:UIControlEventTouchUpInside];
    [self bottomLabel];
    [self jumpLabel];
}

- (void)showWithParams:(NSDictionary *)parameters{
    [[UIApplication sharedApplication].windows[0] addSubview:self];
    if(parameters){
        self.titleLabel.text = [NSString stringWithFormat:@"%@  给你分享了",[parameters valueForKey:@"account"]];
        self.detailLabel.text = [parameters valueForKey:@"detail"];
    }
}

- (void)shadowTouchAction{
    CGPoint point = [self.tap locationInView:self];
    point = [self.contentView.layer convertPoint:point fromLayer:self.layer];
    if (![self.contentView.layer containsPoint:point]) {
        [self removeView];
    }
}

- (void)detailAction{
    [self removeView];
    MOBAboutMobLinkViewController *vc = [MOBAboutMobLinkViewController new];
    vc.showType(SSDKControllerShowTypeNavigationVC).push();
}

- (void)removeView{
    [self removeFromSuperview];
}

- (UIView *)contentView{
    if (!_contentView) {
        UIViewModelCreate()
        .addToSuperView(self)
        .backgroundColor(UIColor.whiteColor)
        .cornerRadius(12)
        .assignTo(^(__kindof UIView * _Nonnull view) {
            _contentView = view;
        })
        .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
            make.centerX.centerY.mas_offset(0);
            make.size.mas_offset(CGSizeMake(315, 226));
        });
    }
    return _contentView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        UILabelModelCreate()
        .addToSuperView(self.contentView)
        .font(Font(PingFangReguler, 14))
        .textAlignment(NSTextAlignmentLeft)
        .textColor(UIColor.blackColor)
        .assignTo(^(__kindof UIView * _Nonnull view) {
            _titleLabel = view;
        })
        .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
            make.top.mas_offset(30);
            make.left.mas_offset(20);
        });
    }
    return _titleLabel;
}

- (UILabel *)detailLabel{
    if (!_detailLabel) {
        UILabelModelCreate()
        .addToSuperView(self.contentView)
        .numberOfLines(2)
        .font(Font(PingFangSemibold, 16))
        .textAlignment(NSTextAlignmentCenter)
        .textColor(UIColor.blackColor)
        .assignTo(^(__kindof UIView * _Nonnull view) {
            _detailLabel = view;
        })
        .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
            make.top.mas_offset(66);
            make.left.mas_offset(45);
            make.right.mas_offset(-45);
        });
    }
    return _detailLabel;
}

- (UIButton *)detailButton{
    if (!_detailButton) {
        UIButtonModelCreate()
        .addToSuperView(self.contentView)
        .font(Font(PingFangMedium, 14))
        .text(@"查看详情", UIControlStateNormal)
        .textColor(UIColor.whiteColor, UIControlStateNormal)
        .backgroundColor(UIColorHexString(@"FF7800"))
        .cornerRadius(20)
        .assignTo(^(__kindof UIView * _Nonnull view) {
            _detailButton = view;
        })
        .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
            make.top.mas_offset(133);
            make.centerX.mas_offset(0);
            make.size.mas_offset(CGSizeMake(128, 40));
        });
    }
    return _detailButton;
}

- (UILabel *)bottomLabel{
    if (!_bottomLabel) {
        UILabelModelCreate()
        .addToSuperView(self.contentView)
        .font(Font(PingFangReguler, 12))
        .textAlignment(NSTextAlignmentCenter)
        .textColor(UIColor.blackColor)
        .text(@"这不是我复制的口令，")
        .assignTo(^(__kindof UIView * _Nonnull view) {
            _bottomLabel = view;
        })
        .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
            make.bottom.mas_offset(-15);
            make.centerX.mas_offset(0);
        });
    }
    return _bottomLabel;
}

- (UILabel *)jumpLabel{
    if (!_jumpLabel) {
        __weak typeof(self) weakSelf = self;
        UILabelModelCreate()
        .addToSuperView(self.contentView)
        .userInteractionEnabled(YES)
        .addGestureBlock(^(id  _Nonnull gesture) {
            [weakSelf removeView];
        })
        .font(Font(PingFangReguler, 12))
        .textAlignment(NSTextAlignmentCenter)
        .textColor(UIColorHexString(@"FF7800"))
        .attributedText([[NSAttributedString alloc] initWithString:@"跳过" attributes:@{NSUnderlineStyleAttributeName : [NSNumber numberWithInteger:NSUnderlineStyleSingle], NSUnderlineColorAttributeName : [UIColor redColor]}])
        .assignTo(^(__kindof UIView * _Nonnull view) {
            _jumpLabel = view;
        })
        .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
            make.left.equalTo(self.bottomLabel.mas_right).mas_offset(0);
            make.centerY.equalTo(self.bottomLabel.mas_centerY).mas_offset(0);
        });
    }
    return _jumpLabel;
}

@end
