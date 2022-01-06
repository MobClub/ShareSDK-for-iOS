//
//  MOBSharePlatformTableViewCell.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/15.
//  Copyright © 2019 mob. All rights reserved.
//

#import "MOBSharePlatformTableViewCell.h"

@interface MOBSharePlatformTableViewCell ()

@property (nonatomic, strong) UIImageView *imageV;

@property (nonatomic, strong) UILabel *name;

@end

@implementation MOBSharePlatformTableViewCell


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
    
    UIImageViewModelCreate()
    .addToSuperView(self.contentView)
    .image(UIImageNamed(@"list_icon_arrow"))
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.right.mas_offset(-22);
        
        make.centerY.equalTo(self.contentView);
    });
    
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
}

- (void)setModel:(MOBPlatformBaseModel *)model{
    _model = model;
    self.imageV.image = model.itemUI.image;
    self.name.text = model.itemUI.name;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
