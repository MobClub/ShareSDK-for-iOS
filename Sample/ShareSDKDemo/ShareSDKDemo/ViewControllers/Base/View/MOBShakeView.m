//
//  MOBShakeView.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/15.
//  Copyright © 2019 mob. All rights reserved.
//

#import "MOBShakeView.h"

@implementation MOBShakeView

- (void)setup{
    self.makeChain
    .backgroundColor(UIColorHexAlpha(@"000000", 0.8))
    .cornerRadius(8)
    .shadow(CGSizeMake(0,2), 8, SSDKRGBAlpha(0,0,0,0.3), 2);
    
    UIImageView *imageView =
    UIImageViewModelCreate()
    .image(UIImageNamed(@"pop_icon_shake"))
    .addToSuperView(self)
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.height.mas_equalTo(57);
        make.width.mas_equalTo(60);
        make.top.mas_offset(28);
        make.centerX.equalTo(self);
    }).view;
    
    __block  UILabel *label = nil;
    
    UILabelModelCreate()
    .text(@"摇动下您的手机")
    .textColor(UIColor.whiteColor)
    .font(Font(PingFangReguler, 14))
    .assignTo(^(__kindof UIView * _Nonnull view) {
        label = view;
    })
    .addToSuperView(self)
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.left.mas_offset(43);
        make.right.mas_offset(-43);
        make.top.equalTo(imageView.mas_bottom).offset(20);
    });
    
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(label.mas_bottom).mas_offset(20);
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
