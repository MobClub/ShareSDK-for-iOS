//
//  MOBShareCommandDetailView.m
//  ShareSDKDemo
//
//  Created by cl on 2020/7/28.
//  Copyright © 2020 mob. All rights reserved.
//

#import "MOBShareCommandDetailView.h"
#import "MOBPolicyWebViewController.h"
@interface MOBShareCommandDetailView ()

@property (strong, nonatomic) UITapGestureRecognizer *tap;

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *detailLabel;

@property (nonatomic, strong) UIButton *detailButton;

@property (nonatomic, strong) UILabel *bottomLabel;

@property (nonatomic, strong) UILabel *jumpLabel;
//视频相关
@property (nonatomic, strong) UIImageView *videoCoverImg;

@property (nonatomic, strong) UIView *videoCoverView;

@property (nonatomic, strong) UIImageView *videoPlayImg;

@property (nonatomic, strong) NSDictionary *parameters;
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

//口令弹窗
- (void)showWithParams:(NSDictionary *)parameters{
    [[UIApplication sharedApplication].windows[0] addSubview:self];
    if(parameters){
        self.titleLabel.text = [NSString stringWithFormat:@"%@  给你分享了",[parameters valueForKey:@"shareAccount"]];
        self.detailLabel.text = [parameters valueForKey:@"shareTitle"];
        self.parameters = parameters;
    }
}

////视频弹窗
//- (void)showVideoDetailWithParams:(NSDictionary *)parameters{
//    [[UIApplication sharedApplication].windows[0] addSubview:self];
//    self.titleLabel.hidden = YES;
//    [self.contentView mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.centerY.mas_offset(0);
//        make.size.mas_offset(CGSizeMake(265, 275));
//    }];
//    [self.detailLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_offset(134);
//        make.left.mas_offset(21);
//        make.right.mas_offset(-21);
//    }];
//    [self.detailButton mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.mas_offset(-40);
//        make.centerX.mas_offset(0);
//        make.size.mas_offset(CGSizeMake(128, 40));
//    }];
//    [self videoCoverImg];
//    [self videoCoverView];
//    [self videoPlayImg];
//    self.videoCoverImg.image = [UIImage imageNamed:(nonnull NSString *)];
//}

- (void)shadowTouchAction{
    CGPoint point = [self.tap locationInView:self];
    point = [self.contentView.layer convertPoint:point fromLayer:self.layer];
    if (![self.contentView.layer containsPoint:point]) {
        [self removeView];
    }
}

- (void)detailAction{
    [self removeView];
    if(self.parameters && [self.parameters objectForKey:@"shareVideoUrl"]){
        NSURL *url = [NSURL URLWithString:[self.parameters objectForKey:@"shareVideoUrl"]];
        MOBPolicyWebViewController *webVC = [[MOBPolicyWebViewController alloc]init];
        webVC.extraInfo = [NSMutableDictionary dictionaryWithDictionary:@{@"url":url}];
        webVC.showType(SSDKControllerShowTypeNavigationVC).push();
    }else{

    }

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
            make.bottom.mas_offset(-40);
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

#pragma mark - 视频
- (UIImageView *)videoCoverImg {
    if(!_videoCoverImg){
        UIImageViewModelCreate()
        .addToSuperView(self.contentView)
        .cornerRadius(5)
        .masksToBounds(YES)
        .contentMode(UIViewContentModeScaleAspectFit)
        .assignTo(^(__kindof UIView * _Nonnull view) {
            _videoCoverImg = view;
        })
        .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
            make.centerX.mas_offset(0);
            make.top.mas_offset(24);
            make.width.mas_equalTo(156);
            make.height.mas_equalTo(100);
        });
    }
    return _videoCoverImg;
}

- (UIView *)videoCoverView {
    if(!_videoCoverView){
        UIViewModelCreate()
        .addToSuperView(self.videoCoverImg)
        .assignTo(^(__kindof UIView * _Nonnull view) {
            _videoCoverView = view;
        })
        .backgroundColor([UIColor colorWithWhite:0 alpha:0.4])
        .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
            make.edges.mas_offset(0);
        });
    }
    return _videoCoverView;;
}

- (UIImageView *)videoPlayImg {
    if(!_videoPlayImg){
        UIImageViewModelCreate()
        .addToSuperView(self.videoCoverView)
        .assignTo(^(__kindof UIView * _Nonnull view) {
            _videoPlayImg = view;
        })
        .image([UIImage imageNamed:@"play"])
        .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
            make.centerX.centerY.mas_offset(0);
            make.size.mas_equalTo(CGSizeMake(20, 22));
        });
    }
    return _videoPlayImg;;
}

@end
