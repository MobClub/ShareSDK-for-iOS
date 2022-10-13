//
//  MOBAuthItemTableViewCell.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/15.
//  Copyright © 2019 mob. All rights reserved.
//

#import "MOBAuthItemTableViewCell.h"


@interface MOBAuthItemTableViewCell ()

@property (nonatomic, strong) UIImageView *imageV;

@property (nonatomic, strong) UILabel *name;

@property (nonatomic, strong) UIButton *authButton;

@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) UIButton *revokeButton;
@property (nonatomic, strong) CAGradientLayer *revokeGradientLayer;


@end

@implementation MOBAuthItemTableViewCell

- (void)setup{
    
    UIImageViewModelCreate()
    .addToSuperView(self.contentView)
    .assignTo(^(__kindof UIView * _Nonnull view) {
        _imageV = view;
    })
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.left.mas_offset(15);
        make.height.width.mas_equalTo(38);
        make.centerY.equalTo(self.contentView);
    });
    
    UILabelModelCreate()
    .addToSuperView(self.contentView)
    .font(Font(PingFangLight, 14))
    .textColor(UIColorHexString(@"464646"))
    .assignTo(^(__kindof UIView * _Nonnull view) {
        _name = view;
    })
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.left.equalTo(self.imageV.mas_right).offset(17);
        make.centerY.equalTo(self.contentView);
    });
    
    UIButtonModelCreate()
    .addToSuperView(self.contentView)
    .cornerRadius(14)
    .masksToBounds(YES)
    .font(Font(PingFangReguler, 14))
    .addTarget(self, @selector(authorSelected:), UIControlEventTouchUpInside)
    .assignTo(^(__kindof UIView * _Nonnull view) {
        _authButton = view;
    })
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.right.mas_offset(-22);
        make.height.mas_equalTo(28);
        make.width.mas_equalTo(75);
        make.centerY.equalTo(self.contentView);
    });
    
    UIButtonModelCreate()
    .addToSuperView(self.contentView)
    .cornerRadius(14)
    .masksToBounds(YES)
    .font(Font(PingFangReguler, 14))
    .addTarget(self, @selector(revokeSelected:), UIControlEventTouchUpInside)
    .assignTo(^(__kindof UIView * _Nonnull view) {
        _revokeButton = view;
    })
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.right.mas_offset(-22);
        make.height.mas_equalTo(28);
        make.width.mas_equalTo(75);
        make.centerY.equalTo(self.contentView);
    });
    _revokeButton.hidden = YES;
    
    UIViewModelCreate()
    .addToSuperView(self.contentView)
    .backgroundColor(UIColorHexString(@"#D6D9DD"))
    .assignTo(^(__kindof UIView * _Nonnull view) {
        _line = view;
    })
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.left.equalTo(_name.mas_left);
        make.bottom.right.equalTo(self.contentView);
        make.height.mas_equalTo(0.5);
    });
    
    CAGradientLayerModelCreate().endPoint(CGPointMake(0, 0))
    .startPoint(CGPointMake(1, 1))
    .colors(@[(__bridge id)SSDKRGBAlpha(9,146,242,1).CGColor, (__bridge id)SSDKRGBAlpha(72, 172, 242, 1).CGColor])
    .locations(@[@(0), @(1.0f)])
    .assignTo(^(__kindof CALayer * _Nonnull layer) {
        _gradientLayer = layer;
    })
    .cornerRadius(14)
    .addToSuperLayer(self.authButton.layer)
    .hidden(YES);
    [self.authButton.layer insertSublayer:_gradientLayer above:self.authButton.imageView.layer];
    
    
    CAGradientLayerModelCreate().endPoint(CGPointMake(0, 0))
    .startPoint(CGPointMake(1, 1))
    .colors(@[(__bridge id)SSDKRGBAlpha(9,146,242,1).CGColor, (__bridge id)SSDKRGBAlpha(72, 172, 242, 1).CGColor])
    .locations(@[@(0), @(1.0f)])
    .assignTo(^(__kindof CALayer * _Nonnull layer) {
        _revokeGradientLayer = layer;
    })
    .cornerRadius(14)
    .addToSuperLayer(self.revokeButton.layer)
    .hidden(YES);
    [self.revokeButton.layer insertSublayer:_revokeGradientLayer above:self.revokeButton.imageView.layer];
    
}


-  (void)setModel:(MOBAuthItemModel *)model{
    _model = model;
    MOBShareItemUI *ui = model.itemUI;
    self.imageV.image = ui.image;
    self.name.text = ui.name;
    
    SSDKWEAK
    model.handler = ^(MOBAuthStatus authorStatus) {
        SSDKSTRONG
        if (!self) return;
        if(authorStatus == MOBAuthStatusAuthored)
        {
            //模拟上传token,code到服务端，获取accesstoken,refreshtoken,id_token等信息,存储，用于revoke接口使用
            
        }
        switch (authorStatus) {
            case MOBAuthStatusUnAuthor:
            {
                self.authButton.makeChain
                .borderColor(UIColorHexString(@"FF7800").CGColor)
                .borderWidth(1)
                .textColor(UIColorHexString(@"FF7800"), UIControlStateNormal)
                .text(@"授权", UIControlStateNormal)
                .backgroundColor([UIColor whiteColor]);
            }
                break;
            case MOBAuthStatusAuthoring:
            {
                self.authButton.makeChain
                .borderColor(UIColorHexString(@"FF7800").CGColor)
                .borderWidth(1)
                .textColor(UIColorHexString(@"FF7800"), UIControlStateNormal)
                .text(@"授权中", UIControlStateNormal)
                .backgroundColor([UIColor whiteColor]);
            }
                break;
            case MOBAuthStatusUserInfoing:{
                self.authButton.makeChain
                .borderColor(UIColorHexString(@"ffffff").CGColor)
                .borderWidth(1)
                .textColor(UIColorHexString(@"ffffff"), UIControlStateNormal)
                .text(@"获取用户信息中", UIControlStateNormal);
            }
            case MOBAuthStatusAuthored:{
                self.authButton.makeChain
                .borderColor(UIColorHexString(@"ffffff").CGColor)
                .borderWidth(1)
                .textColor(UIColorHexString(@"ffffff"), UIControlStateNormal)
                .text(@"查看用户信息", UIControlStateNormal);
                
                self.revokeButton.makeChain
                .borderColor(UIColorHexString(@"ffffff").CGColor)
                .borderWidth(1)
                .textColor(UIColorHexString(@"ffffff"), UIControlStateNormal)
                .text(@"撤销用户", UIControlStateNormal);
            }
                break;
            default:
                break;
        }
        BOOL isAuthored = authorStatus == MOBAuthStatusAuthored || authorStatus == MOBAuthStatusUserInfoing;
        
        self.gradientLayer.hidden = !isAuthored;
        self.revokeGradientLayer.hidden = !isAuthored;

        if(model.model.platformType == SSDKPlatformTypeAppleAccount && [self.authButton.titleLabel.text containsString:@"用户"])
        {
            [self.authButton mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(isAuthored?110:75);
                make.centerY.equalTo(self.contentView).mas_offset(-20);
            }];
            [self.revokeButton mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(isAuthored?110:75);
                make.centerY.equalTo(self.contentView).mas_offset(20);
            }];
            _revokeButton.hidden = NO;
        }
        else
        {
            _revokeButton.hidden = YES;
            [self.authButton mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(isAuthored?110:75);
                make.centerY.equalTo(self.contentView);
            }];
        }

        [self.authButton layoutIfNeeded];
        [self.revokeButton layoutIfNeeded];

        SSDKTansactionDisableActions(
        self.gradientLayer.frame = self.authButton.bounds;
        self.revokeGradientLayer.frame = self.revokeButton.bounds;
        )
    };
    [model changeView];
}

- (void)authorSelected:(UIButton *)button{
    [self.model author];
}

- (void)revokeSelected:(UIButton *)button{
    [self.model revokeUser];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
