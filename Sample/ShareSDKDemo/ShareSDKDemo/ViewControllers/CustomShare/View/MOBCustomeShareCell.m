//
//  MOBCustomeShareCell.m
//  ShareSDKDemo
//
//  Created by cl on 2021/5/24.
//  Copyright © 2021 mob. All rights reserved.
//

#import "MOBCustomeShareCell.h"
@interface MOBCustomeShareCell()
@end
@implementation MOBCustomeShareCell

- (void)setup{
    
    UIViewModelWithArray(@[self,self.contentView])
    .backgroundColor(UIColorHexString(@"f7f7f9"));
    
    UILabelModelCreate()
    .addToSuperView(self)
    .assignTo(^(__kindof UIView * _Nonnull view) {
        _titleLabel = view;
    })
    .font(Font(PingFangSemibold, 16))
    .textAlignment(NSTextAlignmentCenter)
    .textColor(UIColorHexString(@"0B0B0B"))
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.top.mas_offset(10);
        make.left.mas_offset(15);
    });
    
    UITextFieldModelCreate()
    .addToSuperView(self.contentView)
    .placeholder(@"请输入文字")
    .clearButtonMode(UITextFieldViewModeWhileEditing)
    .assignTo(^(__kindof UIView * _Nonnull view) {
        _textField = view;
    })
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.left.mas_offset(15);
        make.right.mas_offset(-15);
        make.bottom.equalTo(self.contentView);
        make.top.equalTo(self.titleLabel.mas_bottom).mas_offset(10);
    });
    
    UIViewModelCreate()
    .addToSuperView(self.contentView)
    .backgroundColor(UIColor.grayColor)
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.left.right.bottom.mas_offset(0);
        make.height.mas_equalTo(0.5);
    });
}

- (void)setModel:(MOBCustomShareModel *)model{
    self.titleLabel.text = model.title;
    self.textField.placeholder = model.placeHolder;
    self.textField.tag = model.index;
}

@end
