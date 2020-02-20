//
//  SSDKCommonNavigationBar.m
//  mob
//
//  Created by maxl on 2018/12/20.
//  Copyright © 2018 mob. All rights reserved.
//

#import "SSDKCommonNavigationBar.h"

@interface SSDKCommonNavigationBar()
{
    CGFloat _lineHeight;
}

@property (nonatomic, strong) NSArray * buttonClass;
@property (nonatomic, strong) UIView * leftView;
@property (nonatomic, strong) UIView * rightView;
@property (nonatomic, strong) NSMutableDictionary * statusDic;
@property (nonatomic, assign) NSInteger  currentTag;
@end

@implementation SSDKCommonNavigationBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup{
    _lineHeight = 0.5;
    _currentTag = -999;
    self.backgroundColor = [UIColor whiteColor];
    if ([_delegate respondsToSelector:@selector(navigationClick:)]) {
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(naviTap)]];
    }
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_offset(0);
        make.height.mas_equalTo(_lineHeight);
    }];
}

- (void)naviTap{
    [_delegate navigationClick:self];
}

- (NSMutableDictionary *)statusDic{
    if (!_statusDic) {
        _statusDic = [NSMutableDictionary dictionary];
    }
    return _statusDic;
}



- (void)setDelegate:(id<SSDKCommonNavigationBarDelegate>)delegate{
    if (!delegate) return;
    _delegate = delegate;
    if ([_delegate respondsToSelector:@selector(buttonClasses)]) {
        self.buttonClass = [delegate buttonClasses];
    }else{
        self.buttonClass = @[@"",@"",@""];
    }
}

- (UIButton *)leftButton{
    if (!_leftButton && _delegate) {
        _leftButton = [[self getButtonClassIndex:0] buttonWithType:UIButtonTypeCustom];
        _leftButton.makeChain
        .textColor(UIColorHexString(@"666666"), UIControlStateNormal)
        .font([UIFont PingFangSCRegularAndSize:17])
        .userInteractionEnabled(NO)
        .addToSuperView(self.leftView)
        .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
            make.left.mas_offset(15);
            make.centerY.equalTo(self.leftView);
            make.right.mas_offset(-20);
        });
        [_leftButton setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    }
    return _leftButton;
}

- (UIView *)leftView{
    if (!_leftView) {
        _leftView = [UIView new];
        _leftView.makeChain
        .addToSuperView(self)
        .addGesture([[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(leftViewTap)])
        .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
            make.left.mas_offset(0);
            make.bottom.mas_offset(-_lineHeight);
            make.top.mas_offset(kStatusBarHeight);
            make.width.lessThanOrEqualTo(@(100));
        });
     
    }
    return _leftView;
}

- (void)leftViewTap{
    if ([_delegate respondsToSelector:@selector(leftButtonTap:)]) {
        [_delegate leftButtonTap:_leftButton];
    }
}

- (UIButton *)middleButton{
    if (!_middleButton) {
        _middleButton = [[self getButtonClassIndex:1] buttonWithType:UIButtonTypeCustom];
        _middleButton.makeChain
        .font([UIFont PingFangSCRegularAndSize:17])
        .textColor(UIColorHexString(@"1a1d1e"), UIControlStateNormal)
        .addToSuperView(self)
        .addTarget(self, @selector(middleButtonTap), UIControlEventTouchUpInside)
        .lineBreakMode(NSLineBreakByWordWrapping)
        .numberOfLines(1)
        .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
            make.centerX.equalTo(self);
            make.width.lessThanOrEqualTo(@([UIScreen mainScreen].bounds.size.width - 200 *SSDK_SCALE));
            make.top.mas_offset(kStatusBarHeight);
            make.bottom.mas_offset(-_lineHeight);
        });
    }
    return _middleButton;
}


- (void)middleButtonTap{
    if ([_delegate respondsToSelector:@selector(middleButtonTap:)]) {
        [_delegate middleButtonTap:_middleButton];
    }
}

- (UIButton *)rightButton{
    if (!_rightButton && _delegate) {
        _rightButton = [[self getButtonClassIndex:2] buttonWithType:UIButtonTypeCustom];
        _rightButton.makeChain
        .textColor(UIColorHexString(@"474747"), UIControlStateNormal)
        .font([UIFont PingFangSCRegularAndSize:17])
        .userInteractionEnabled(NO)
        .addToSuperView(self.rightView)
        .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
            make.left.mas_offset(20);
            make.centerY.equalTo(self.rightView);
            make.right.mas_offset(-15);
        });
        [_rightButton setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    }
    return _rightButton;
}

- (UIView *)rightView{
    if (!_rightView) {
        _rightView = [UIView new];
        _rightView.makeChain
        .addToSuperView(self)
        .addGesture([[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rightViewTap)])
        .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
            make.right.mas_offset(0);
            make.bottom.mas_offset(-_lineHeight);
            make.top.mas_offset(kStatusBarHeight);
            make.width.lessThanOrEqualTo(@(100 *SSDK_SCALE));
        });
        
    }
    return _rightView;
}

- (void)rightViewTap{
    if ([_delegate respondsToSelector:@selector(rightButtonTap:)]) {
        [_delegate rightButtonTap:_rightButton];
    }
}

- (Class)getButtonClassIndex:(NSInteger)index{
    if (_buttonClass.count <= index || index < 0) return [UIButton class];
    
    NSString *clas = _buttonClass[index];
    Class class;
    if (clas.length == 0) {
        class = [UIButton class];
    }else{
        class = NSClassFromString(clas);
        if (!class || ![class isKindOfClass:[UIButton class]]) {
            class = [UIButton class];
        }
    }
    return class;
}

- (UIView *)line{
    if (!_line) {
        _line = [UIView new].makeChain
        .backgroundColor(UIColorHexString(@"dbdbdb"))
        .addToSuperView(self).view;
    }
    return _line;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    UIView *hitView = [super hitTest:point withEvent:event];
    if ([_delegate respondsToSelector:@selector(navigationEventsShoulSSDKass)]) {
        if ([_delegate navigationEventsShoulSSDKass]) {
            if (hitView == self) {
                return nil;
            }
        }
    }
    return hitView;
}

- (void)setTag:(NSInteger)tag{
    if (self.currentTag == tag) return;
    nav_Block block = _statusDic[@(tag)];
    if (block) {
        self.currentTag = tag;
        block(self);
    }
}

- (void)setupTag:(NSInteger)tag WithBlock:(nav_Block)block{
    if (block) {
        [_statusDic setObject:block forKey:@(tag)];
    }else{
        [_statusDic removeObjectForKey:@(tag)];
    }
}


- (void)resetLayout:(UIEdgeInsets)edge{
    
    [_line mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(edge.left);
        make.right.mas_offset(-edge.right);
    }];
    [_middleButton mas_updateConstraints:^(MASConstraintMaker *make) {
       make.top.mas_offset(kStatusBarHeight);
    }];
    [_leftView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(kStatusBarHeight);
        make.left.mas_offset(edge.left);
    }];
    [_rightView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(kStatusBarHeight);
        make.right.mas_offset(-edge.right);
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
