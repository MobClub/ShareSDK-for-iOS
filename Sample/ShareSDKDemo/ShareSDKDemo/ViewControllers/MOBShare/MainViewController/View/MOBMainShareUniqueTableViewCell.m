//
//  MOBMainShareUniqueTableViewCell.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/11.
//  Copyright © 2019 mob. All rights reserved.
//

#import "MOBMainShareUniqueTableViewCell.h"


@interface MOBMainShareUniqueTableViewCell ()

@property (nonatomic, strong) UIImageView *backImagev;

@property (nonatomic, strong) UIImageView *imagev;

@property (nonatomic, strong) UILabel *title;

@property (nonatomic, strong) UILabel *introduct;

@property (nonatomic, strong) UIButton *openButton;

@property (nonatomic, strong) CAGradientLayer *grandLayer;


@end

@implementation MOBMainShareUniqueTableViewCell

- (void)setup{
    
    UIImageViewModelCreate()
    .addToSuperView(self.contentView)
    .assignTo(^(__kindof UIView * _Nonnull view) {
        _backImagev = view;
    })
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.left.mas_offset(15);
        make.right.mas_offset(-15);
        make.top.bottom.equalTo(self.contentView);
    });
    
    UIImageViewModelCreate()
    .addToSuperView(self.contentView)
    .assignTo(^(__kindof UIView * _Nonnull view) {
        _imagev = view;
    })
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.left.mas_offset(30);
        make.height.width.mas_equalTo(30);
        make.centerY.equalTo(self.contentView);
    });
    
    UIButtonModelCreate()
    .addToSuperView(self.contentView)
    .font(Font_Scale(PingFangLight, 11))
    .numberOfLines(2)
    .text(@"立即前往", UIControlStateNormal)
    .addTarget(self, @selector(openButtonClick), UIControlEventTouchUpInside)
    .assignTo(^(__kindof UIView * _Nonnull view) {
        _openButton = view;
    })
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.right.equalTo(self.backImagev.mas_right).offset(-15);
        make.centerY.equalTo(self.backImagev);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(80);
    });
    
    UILabelModelCreate()
    .addToSuperView(self.contentView)
    .font(Font_Scale(PingFangMedium, 14))
    .textColor(UIColorHexString(@"FFFFFF"))
    .numberOfLines(1)
    .assignTo(^(__kindof UIView * _Nonnull view) {
        _title = view;
    })
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.left.equalTo(self.imagev.mas_right).mas_offset(16);
        make.right.equalTo(self.openButton.mas_left).offset(-10);
        make.top.equalTo(self.imagev).offset(-3);
    });
    
    CAGradientLayerModelCreate()
    .startPoint(CGPointMake(0.5, 0.99))
    .endPoint(CGPointMake(0.5, 0.5))
    .addToSuperLayer(self.openButton.layer)
    .backgroundColor([UIColor whiteColor].CGColor)
    .cornerRadius(15)
    .shadowOpacity(2)
    .shadowRadius(4)
    .shadowOffset(CGSizeMake(0, 2))
    .shadowColor(SSDKRGB(0, 185, 99).CGColor)
    .assignTo(^(__kindof CALayer * _Nonnull layer) {
        _grandLayer = layer;
    })
    .locations(@[@(0), @(1.0f)]);
    
    [self.openButton.layer insertSublayer:_grandLayer above:self.openButton.imageView.layer];
    
    UILabelModelCreate()
    .addToSuperView(self.contentView)
    .font(Font_Scale(PingFangLight, 11))
    .textColor(UIColorHexString(@"FFFFFF"))
    .numberOfLines(2)
    .assignTo(^(__kindof UIView * _Nonnull view) {
        _introduct = view;
    })
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.left.equalTo(self.imagev.mas_right).mas_offset(16);
        make.right.equalTo(self.openButton.mas_left).offset(-10);
        make.top.equalTo(self.title.mas_bottom).offset(3);
    });
    
}


- (void)layoutSubviews{
    [super layoutSubviews];
    self.grandLayer.frame = self.openButton.bounds;
}

- (void)setData:(MobSharePlatformStyleModel *)data{
    _data = data;
    data.view = self;
    switch (data.platStyle) {
        case MobSharePlatformStyleContent:{
            [self.openButton setTitleColor:UIColorHexString(@"FC992F") forState:UIControlStateNormal];
            self.grandLayer.makeChain.colors(@[(__bridge id)UIColorHexString(@"FFE8C9").CGColor, (__bridge id)UIColorHexString(@"#FFFFFF").CGColor])
            .shadowColor(SSDKRGB(242, 128, 0).CGColor);
            
            break;
        }
        case MobSharePlatformStylePlatform:
            [self.openButton setTitleColor:UIColorHexString(@"#08C171") forState:UIControlStateNormal];
            self.grandLayer.makeChain.colors( @[(__bridge id)UIColorHexString(@"#C9FFDF").CGColor, (__bridge id)UIColorHexString(@"#FFFFFF").CGColor])
            .shadowColor(SSDKRGBAlpha(0, 185, 99, 1).CGColor);
            break;
        default:
            break;
    }
    self.backImagev.image = UIImageNamed(data.backgroundImage);
    self.imagev.image = UIImageNamed(data.image);
    self.title.text = data.name;
    self.introduct.text = data.introduction;
}

- (void)openButtonClick{
    if (self.data.handle) {
        self.data.handle(self.data);
    }
}

@end
