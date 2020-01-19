//
//  MOBShareContentCollectionViewCell.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/27.
//  Copyright © 2019 mob. All rights reserved.
//

#import "MOBShareContentCollectionViewCell.h"

@interface MOBShareContentCollectionViewCell ()

@property (nonatomic, strong) UILabel *label;

@property (nonatomic, strong) UIImageView *imageV;

@property (nonatomic, strong) UIView *shadowView;
@end

@implementation MOBShareContentCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup{

    UIImageViewModelCreate()
    .addToSuperView(self)
    .assignTo(^(__kindof UIView * _Nonnull view) {
        _imageV = view;
    })
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.centerX.equalTo(self);
        make.top.mas_offset(0);
        make.height.width.mas_equalTo(40);
    });
    
    UIViewModelCreate()
    .addToSuperView(self.imageV)
    .masksToBounds(YES)
    .cornerRadius(20)
    .assignTo(^(__kindof UIView * _Nonnull view) {
        _shadowView = view;
    })
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.edges.equalTo(self.imageV);
    });
    
    UILabelModelCreate()
    .addToSuperView(self)
    .adjustsFontSizeToFitWidth(YES)
    .textAlignment(NSTextAlignmentCenter)
    .assignTo(^(__kindof UIView * _Nonnull view) {
        _label = view;
    })
    .font(Font(PingFangReguler, 12))
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.top.equalTo(self.imageV.mas_bottom).offset(5);
        make.left.right.equalTo(self.contentView);
        make.bottom.lessThanOrEqualTo(self.contentView);
    });
    
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addGesture)]];
}



- (void)addGesture{
    [self.model share];
}

- (void)setModel:(MOBSharePlatformShareItemModel *)model{
    _model = model;
    MOBShareItemUI *item = model.platformModel.itemUI;
    self.label.text = item.name;
    self.imageV.image = item.image;
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    _shadowView.backgroundColor = UIColorHexAlpha(@"000000", 0.5);
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesEnded:touches withEvent:event];
    _shadowView.backgroundColor = UIColorHexAlpha(@"000000", 0);
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesCancelled:touches withEvent:event];
    _shadowView.backgroundColor = UIColorHexAlpha(@"000000", 0);
}
@end
