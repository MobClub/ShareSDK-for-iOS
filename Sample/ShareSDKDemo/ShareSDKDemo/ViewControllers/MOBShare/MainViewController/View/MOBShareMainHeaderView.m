//
//  MOBShareMainHeaderView.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/9.
//  Copyright © 2019 mob. All rights reserved.
//

#import "MOBShareMainHeaderView.h"
#import "MOBRollLabel.h"

@interface MOBShareMainHeaderView ()

@property (nonatomic, strong) MOBRollLabel *rollLabel;

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@end

@implementation MOBShareMainHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup{
    self.backgroundColor = [UIColor whiteColor];
    [self imageView];
    [self rollLabel];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(15, (self.height - 18)/2, 42, 18);
    CGFloat x = CGRectGetMaxX(self.imageView.frame);
    self.rollLabel.frame = CGRectMake(x + 10, 0, self.width - x - 10, self.height);
    self.gradientLayer.makeChain.frame(CGRectMake(self.width - 60, 0, 60, self.height))
    .bounds(CGRectMake(0, 0, 60, self.height));
}

- (void)setText:(NSString *)text{
    [self layoutIfNeeded];
    self.rollLabel.text = text;
}

- (UIImageView *)imageView{
    if (!_imageView) {
        UIImageViewModelCreate()
        .image(UIImageNamed(@"home_tag_announcement"))
        .addToSuperView(self)
        .assignTo(^(__kindof UIView * _Nonnull view) {
            _imageView = view;
        });
    }
    return _imageView;
}


- (MOBRollLabel *)rollLabel{
    if (!_rollLabel) {
        SSDKWEAK
        
        [[MOBRollLabel alloc] initWithFrame:CGRectZero font:Font(SystemFont, 15) textColor:UIColorHexString(@"77828E")]
        .makeChain
        .assignTo(^(__kindof UIView * _Nonnull view) {
            _rollLabel = view;
            _rollLabel.autoStart = YES;
            _rollLabel.rollSpeed = 0.2;
            _rollLabel.backgroundColor = [UIColor clearColor];
        })
        .addToSuperView(self)
        .addGestureBlock(^(id  _Nonnull gesture) {
            if (weakSelf.rollClick) {
                weakSelf.rollClick();
            }
        });
        [_rollLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    }
    return _rollLabel;
}


- (CAGradientLayer *)gradientLayer{
    if (!_gradientLayer) {
        CAGradientLayerModelCreate()
        .endPoint(CGPointMake(1, 0.5))
        .startPoint(CGPointMake(0, 0.5))
        .locations(@[@(0), @(1.0f)])
        .addToSuperLayer(self.layer)
        .colors(@[(__bridge id)SSDKRGBAlpha(254, 254, 254, 0).CGColor, (__bridge id)SSDKRGBAlpha(254, 254, 254, 1).CGColor])
        .assignTo(^(__kindof CALayer * _Nonnull layer) {
            _gradientLayer = layer;
        });
    }
    return _gradientLayer;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
