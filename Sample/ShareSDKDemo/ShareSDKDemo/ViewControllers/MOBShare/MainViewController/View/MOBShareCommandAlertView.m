//
//  MOBShareCommandAlertView.m
//  ShareSDKDemo
//
//  Created by yoozoo on 2020/7/28.
//  Copyright © 2020 mob. All rights reserved.
//

#import "MOBShareCommandAlertView.h"
#import "MOBCommandShareContentView.h"
#import <ShareSDKUI/ShareSDKUI.h>
#import "MOBShareExample.h"

@interface MOBShareCommandAlertView ()

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, strong) UILabel *contentLabel;

@property (nonatomic, strong) UIView *hudView;

@property (nonatomic, strong) UILabel *hudLabel;

@property (strong, nonatomic) MOBCommandShareContentView *shareContentView;

@end

@implementation MOBShareCommandAlertView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup{
    self.backgroundColor = [UIColor whiteColor];
    self.layer.cornerRadius = 12;
    [self titleLabel];
    [self contentView];
    [self contentLabel];
}

- (void)showWithCommand:(NSString *)command modelView:(UIView *)modelView{
    self.contentLabel.text = command;
    
    [self _showActionSheet:command modelView:modelView];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSUInteger count = [UIApplication sharedApplication].windows.count;
            [[UIApplication sharedApplication].windows[count-1] addSubview:self];
            [[UIApplication sharedApplication].windows[count-1] addSubview:self.hudLabel];
            [[UIApplication sharedApplication].windows[count-1] bringSubviewToFront:self.hudLabel];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.hudLabel removeFromSuperview];
    });
}


- (void)_showActionSheet:(NSString *)command modelView:(UIView *)modelView{
    NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
    [shareParams SSDKSetupShareParamsByText:command
                                         images:nil
                                            url:nil
                                          title:SHARESDKDEMO_TITLE
                                           type:SSDKContentTypeText];
        
    SSUIShareSheetConfiguration *config = [[SSUIShareSheetConfiguration alloc] init];
    [ShareSDK showShareActionSheet:modelView
                           customItems:nil
                           shareParams:shareParams
                    sheetConfiguration:config
                        onStateChanged:^(SSDKResponseState state,
                                         SSDKPlatformType platformType,
                                         NSDictionary *userData,
                                         SSDKContentEntity *contentEntity,
                                         NSError *error,
                                         BOOL end)
     {
        [[MOBShareExample defaultExample] sharePlatType:platformType userData:userData state:state error:error];
        [self removeFromSuperview];
    }];
}


- (UILabel *)titleLabel{
    if (!_titleLabel) {
        UILabelModelCreate()
        .addToSuperView(self)
        .assignTo(^(__kindof UIView * _Nonnull view) {
            _titleLabel = view;
        })
        .text(@"口令已复制")
        .font(Font(PingFangSemibold, 16))
        .textAlignment(NSTextAlignmentCenter)
        .textColor(UIColorHexString(@"0B0B0B"))
        .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
            make.centerX.mas_offset(0);
            make.top.mas_offset(15);
        });
    }
    return _titleLabel;
}

- (UIView *)contentView{
    if (!_contentView) {
        UIViewModelCreate()
        .addToSuperView(self)
        .backgroundColor(UIColorHexString(@"F5F5F5"))
        .assignTo(^(__kindof UIView * _Nonnull view) {
            _contentView = view;
        })
        .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
            make.top.mas_offset(53);
            make.bottom.mas_offset(-25);
            make.left.mas_offset(19);
            make.right.mas_offset(-19);
        });
    }
    return _contentView;
}

- (UILabel *)contentLabel{
    if (!_contentLabel) {
        UILabelModelCreate()
        .addToSuperView(self.contentView)
        .assignTo(^(__kindof UIView * _Nonnull view) {
            _contentLabel = view;
        })
        .numberOfLines(0)
        .font(Font(PingFangReguler, 14))
        .textAlignment(NSTextAlignmentCenter)
        .textColor(UIColorHexString(@"030303"))
        .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
            make.top.mas_offset(15);
            make.bottom.mas_offset(-15);
            make.left.mas_offset(5);
            make.right.mas_offset(-5);
        });
    }
    return _contentLabel;
}

- (UILabel *)hudLabel{
    if (!_hudLabel) {
        NSUInteger count = [UIApplication sharedApplication].windows.count;
        UILabelModelCreate()
        .addToSuperView([UIApplication sharedApplication].windows[count-1])
        .text(@"内容已复制，快去粘贴给好友吧~")
        .font(Font(PingFangMedium, 14))
        .textAlignment(NSTextAlignmentCenter)
        .textColor(UIColor.whiteColor)
        .backgroundColor(UIColorHexAlpha(@"000000", 0.8))
        .assignTo(^(__kindof UIView * _Nonnull view) {
            _hudLabel = view;
        })
        .cornerRadius(8)
        .masksToBounds(YES)
        .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
            make.centerY.mas_offset(0).offset(-100);
            make.width.mas_offset(230);
            make.height.mas_offset(42);
            make.centerX.mas_offset(0);
        });
    }
    return _hudLabel;
}

@end
