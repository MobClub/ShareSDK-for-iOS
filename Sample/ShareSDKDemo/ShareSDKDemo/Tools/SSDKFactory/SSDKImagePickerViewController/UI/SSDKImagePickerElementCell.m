//
//  SSDKImagePickerElementCell.m
//  ShareSDKDemo
//
//  Created by PP on 2020/2/19.
//  Copyright © 2020 mob. All rights reserved.
//

#import "SSDKImagePickerElementCell.h"
#import "SSDKImagePickerIconFactory.h"
#import "SSDKCategory.h"
@interface SSDKImagePickerIndicatorView : UIView

@property (nonatomic, strong) SSDKVideoIconView *videoView;

@property (nonatomic, strong) SSDKSlomoIconView *slomoView;


@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@property (nonatomic, strong) UILabel *time;

@property (nonatomic, strong) UILabel *gifLabel;

@end

@implementation SSDKImagePickerIndicatorView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self  =[super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}
- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    self.gradientLayer.frame = (CGRect){0,0,rect.size};
}

- (void)setModel:(PHAsset *)model{
    switch (model.ssdk_mediaType) {
        case SSDKImagePickerAseetMediaTypeGif:
            UIViewModelWithArray(@[self.videoView,self.time, self.slomoView])
            .hidden(YES);
            UIViewModelWithArray(@[self.gifLabel,self])
            .hidden(NO);
            break;
        case SSDKImagePickerAseetMediaTypeVideo:{
            if (model.mediaSubtypes & PHAssetMediaSubtypeVideoHighFrameRate) {
                self.videoView.hidden = YES;
                self.slomoView.hidden = NO;
            }
            else {
                self.slomoView.hidden = YES;
                self.videoView.hidden = NO;
            }
            unsigned long time = model.duration;
            unsigned long hour = (unsigned long)(time / 60.0 / 60.0);
            time %= 3600;
            unsigned long minutes = (unsigned long)(time / 60.0);
            time %= 60;
            unsigned long seconds = (unsigned long)ceil(time);
            NSString *timeString = nil;
            if (hour > 0) {
                timeString = [NSString stringWithFormat:@"%02lu:%02lu:%02lu",hour,minutes,seconds];
            }else{
                timeString = [NSString stringWithFormat:@"%02lu:%02lu",minutes,seconds];
            }
            self.time.text = timeString;
            UIViewModelWithArray(@[self.time, self])
            .hidden(NO);
            UIViewModelWithArray(@[self.gifLabel])
            .hidden(YES);
            
            if (model.mediaSubtypes & PHAssetMediaSubtypeVideoHighFrameRate) {
                self.videoView.hidden = YES;
                self.slomoView.hidden = NO;
            }
            else {
                self.slomoView.hidden = YES;
                self.videoView.hidden = NO;
            }
        }
            break;
        default:{
            self.hidden = YES;
        }
            break;
    }
}


- (void)setupUI{
    self.backgroundColor = [UIColor clearColor];
    
    CAGradientLayerModelCreate()
    .startPoint(CGPointMake(0, 0))
    .endPoint(CGPointMake(0, 1))
    .locations(@[@(0), @(1.0f)])
    .addToSuperLayer(self.layer)
    .colors(@[(__bridge id)SSDKRGBAlpha(0, 0, 0, 0).CGColor, (__bridge id)UIColor.blackColor.CGColor])
    .assignTo(^(__kindof CALayer * _Nonnull layer) {
        _gradientLayer = layer;
    });
    
    [SSDKVideoIconView new]
    .makeChain
    .addToSuperView(self)
    .hidden(YES)
    .assignTo(^(__kindof UIView * _Nonnull view) {
        _videoView = view;
    })
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.bottom.mas_offset(-10);
        make.left.mas_offset(10);
        make.height.mas_equalTo(8);
        make.width.mas_equalTo(14);
    });
    [SSDKSlomoIconView new]
    .makeChain
    .addToSuperView(self)
    .hidden(YES)
    .assignTo(^(__kindof UIView * _Nonnull view) {
        _slomoView = view;
    })
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.centerY.equalTo(self.videoView);
        make.left.mas_offset(10);
        make.height.mas_equalTo(12);
        make.width.mas_equalTo(12);
    });
    UILabelModelCreate()
    .addToSuperView(self)
    .hidden(YES)
    .textAlignment(NSTextAlignmentRight)
    .font(Font(SystemFont, 13))
    .textColor(UIColor.whiteColor)
    .assignTo(^(__kindof UIView * _Nonnull view) {
        _time = view;
    })
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.right.mas_offset(-10);
        make.left.equalTo(self.videoView.mas_right).offset(10);
        make.centerY.equalTo(self.videoView);
    });
    
    UILabelModelCreate()
    .addToSuperView(self)
    .textAlignment(NSTextAlignmentRight)
    .text(@"GIF")
    .hidden(YES)
    .font([UIFont boldSystemFontOfSize:14])
    .textColor(UIColor.whiteColor)
    .assignTo(^(__kindof UIView * _Nonnull view) {
        _gifLabel = view;
    })
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.left.mas_offset(10);
        make.centerY.equalTo(self.videoView);
    });
    
}

@end

@interface SSDKImagePickerElementCell ()

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) SSDKCheckIconView *checkView;

@property (nonatomic, strong) SSDKImagePickerIndicatorView *viewIndicator;

@property (nonatomic, strong) UILabel *numberLabel;

@property (nonatomic, strong) UIView *coverView;

@end

@implementation SSDKImagePickerElementCell

- (void)setup{
    
    UIImageViewModelCreate()
    .addToSuperView(self.contentView)
    .clipsToBounds(YES)
    .contentMode(UIViewContentModeScaleAspectFill)
    .assignTo(^(__kindof UIView * _Nonnull view) {
        _imageView = view;
    })
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.edges.mas_equalTo(0);
    });
    
    UIViewModelCreate()
    .addToSuperView(self.contentView)
    .hidden(YES)
    .backgroundColor([UIColor colorWithWhite:0 alpha:0.3])
    .assignTo(^(__kindof UIView * _Nonnull view) {
        _coverView = view;
    })
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.edges.mas_equalTo(0);
    });
    
    [SSDKCheckIconView new]
    .makeChain
    .addToSuperView(self.contentView)
    .addGesture([[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)])
    .assignTo(^(__kindof UIView * _Nonnull view) {
        _checkView = view;
    })
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.top.mas_offset(10);
        make.right.mas_offset(-10);
        make.height.width.mas_equalTo(24);
    });
    
    
    UIViewModelCreate()
    .addGesture([[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)])
    .addToSuperView(self.contentView)
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.top.mas_offset(0);
        make.right.mas_offset(0);
        make.height.width.mas_equalTo(40);
    });
    
    UILabelModelCreate()
    .addToSuperView(self.contentView)
    .font(Font(PingFangReguler, 17))
    .textAlignment(NSTextAlignmentCenter)
    .textColor(UIColor.whiteColor)
    .masksToBounds(YES)
    .cornerRadius(12)
    .hidden(YES)
    .backgroundColor(UIColorHexString(@"FF7800"))
    .assignTo(^(__kindof UIView * _Nonnull view) {
        _numberLabel = view;
    })
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.top.mas_offset(10);
        make.right.mas_offset(-10);
        make.height.width.mas_equalTo(24);
    });
    
    
    
    [SSDKImagePickerIndicatorView new]
    .makeChain
    .addToSuperView(self.contentView)
    .hidden(YES)
    .assignTo(^(__kindof UIView * _Nonnull view) {
        _viewIndicator = view;
    })
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.bottom.left.right.equalTo(self.contentView);
        make.height.equalTo(self.contentView).multipliedBy(0.5);
    });
    
}

- (void)click{
    self.model.choose = !self.model.choose;
}

- (void)setModel:(PHAsset *)model{
    _model = model;
    [self.viewIndicator setModel:model];
    [self setNumberLabelCount];
    __weak typeof(self)weakSelf = self;
    model.chooseBlock = ^(PHAsset * _Nonnull element) {
        [weakSelf setNumberLabelCount];
    };
    [model getImage:^(UIImage * _Nonnull image, PHAsset * _Nonnull model) {
        if (weakSelf.model == model) {
            weakSelf.imageView.image = image;
        }
    } size:self.frame.size];
}

- (void)setNumberLabelCount{
    if (self.model.chooseIndex != -1) {
        self.numberLabel.hidden = NO;
        BOOL needAnimated =  self.numberLabel.text.length == 0;
        self.numberLabel.text = [NSString stringWithFormat:@"%lu",(long)self.model.chooseIndex + 1];
        self.checkView.hidden = YES;
        if (needAnimated) {
            [self showOscillatoryAnimationWithLayer:self.numberLabel.layer];
        }
    }else{
        self.numberLabel.hidden = YES;
        self.checkView.hidden = NO;
        self.numberLabel.text = nil;
    }
    [UIView animateWithDuration:0.1 animations:^{
        self.coverView.hidden = !self.model.choose;
    }];
}

- (void)showOscillatoryAnimationWithLayer:(CALayer *)layer{
    NSNumber *animationScale1 = @(1.15);
    NSNumber *animationScale2 = @(0.92);
    
    [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut animations:^{
        [layer setValue:animationScale1 forKeyPath:@"transform.scale"];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut animations:^{
            [layer setValue:animationScale2 forKeyPath:@"transform.scale"];
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut animations:^{
                [layer setValue:@(1.0) forKeyPath:@"transform.scale"];
            } completion:nil];
        }];
    }];
}

@end
