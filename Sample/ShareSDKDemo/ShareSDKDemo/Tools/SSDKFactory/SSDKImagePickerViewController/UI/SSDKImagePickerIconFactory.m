//
//  SSDKImagePickerViewIconFactory.m
//  ShareSDKDemo
//
//  Created by PP on 2020/2/20.
//  Copyright © 2020 mob. All rights reserved.
//

#import "SSDKImagePickerIconFactory.h"
#import "SSDKCategory.h"

@implementation SSDKVideoIconView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        self.iconColor = [UIColor whiteColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [self.iconColor setFill];
    
    // Draw triangle
    UIBezierPath *trianglePath = [UIBezierPath bezierPath];
    [trianglePath moveToPoint:CGPointMake(CGRectGetMaxX(self.bounds), CGRectGetMinY(self.bounds))];
    [trianglePath addLineToPoint:CGPointMake(CGRectGetMaxX(self.bounds), CGRectGetMaxY(self.bounds))];
    [trianglePath addLineToPoint:CGPointMake(CGRectGetMaxX(self.bounds) - CGRectGetMidY(self.bounds), CGRectGetMidY(self.bounds))];
    [trianglePath closePath];
    [trianglePath fill];
    
    // Draw rounded square
    UIBezierPath *squarePath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(CGRectGetMinX(self.bounds), CGRectGetMinY(self.bounds), CGRectGetWidth(self.bounds) - CGRectGetMidY(self.bounds) - 1.0, CGRectGetHeight(self.bounds)) cornerRadius:2.0];
    [squarePath fill];
}
@end

@implementation SSDKSlomoIconView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        self.iconColor = [UIColor whiteColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [self.iconColor setStroke];
    
    CGFloat width = 2.2;
    CGRect insetRect = CGRectInset(rect, width / 2, width / 2);
    
    // Draw dashed circle
    UIBezierPath* circlePath = [UIBezierPath bezierPathWithOvalInRect:insetRect];
    circlePath.lineWidth = width;
    CGFloat ovalPattern[] = {0.75, 0.75};
    [circlePath setLineDash:ovalPattern count:2 phase:0];
    [circlePath stroke];
}

@end

@implementation SSDKCheckIconView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        self.borderWidth = 1.0;
        self.checkmarkLineWidth = 1.2;
        
        self.borderColor = [UIColor whiteColor];
        self.bodyColor = [UIColor colorWithRed:(20.0 / 255.0) green:(111.0 / 255.0) blue:(223.0 / 255.0) alpha:1.0];
        self.checkmarkColor = [UIColor whiteColor];
        
        // Set shadow
        self.layer.shadowColor = [[UIColor grayColor] CGColor];
        self.layer.shadowOffset = CGSizeMake(0, 0);
        self.layer.shadowOpacity = 0.6;
        self.layer.shadowRadius = 2.0;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    // Border
    [self.borderColor setStroke];
    CGRect frame = self.bounds;
    frame.origin.y+=1;
    frame.origin.x+=1;
    frame.size.height-=2;
    frame.size.width-=2;
    [[UIBezierPath bezierPathWithOvalInRect:frame] stroke];
    
    // Body
    
    // Checkmark
    UIBezierPath *checkmarkPath = [UIBezierPath bezierPath];
    checkmarkPath.lineWidth = self.checkmarkLineWidth;
    
    [checkmarkPath moveToPoint:CGPointMake(CGRectGetWidth(self.bounds) * (6.0 / 24.0), CGRectGetHeight(self.bounds) * (12.0 / 24.0))];
    [checkmarkPath addLineToPoint:CGPointMake(CGRectGetWidth(self.bounds) * (10.0 / 24.0), CGRectGetHeight(self.bounds) * (16.0 / 24.0))];
    [checkmarkPath addLineToPoint:CGPointMake(CGRectGetWidth(self.bounds) * (18.0 / 24.0), CGRectGetHeight(self.bounds) * (8.0 / 24.0))];
    
    [self.checkmarkColor setStroke];
    [checkmarkPath stroke];
}

@end

@interface SSDKImagePickerAuthorStatusView ()

@property (nonatomic, strong) UILabel * authorLabel;
@property (nonatomic, strong) UIButton *goSettingbutton;

@end
@implementation SSDKImagePickerAuthorStatusView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI{
    self.backgroundColor = [UIColor whiteColor];
    UILabelModelCreate()
    .text(@"相册授权关闭，如要继续使用功能，请开启相册权限")
    .textColor(UIColor.darkTextColor)
    .font(Font(PingFangReguler, 14))
    .addToSuperView(self)
    .textAlignment(NSTextAlignmentCenter)
    .numberOfLines(0)
    .assignTo(^(__kindof UIView * _Nonnull view) {
        _authorLabel = view;
    })
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self).offset(- (kDefaultNavigationBarHeight / 2 + 30));
        make.width.mas_equalTo(240 * SSDK_SCALE);
    });
    UIButtonModelCreate()
    .addTarget(self, @selector(goToSetting), UIControlEventTouchUpInside)
    .addToSuperView(self)
    .font(Font(PingFangReguler, 14))
    .text(@"前往设置", UIControlStateNormal)
    .textColor(UIColorHexString(@"FF7800"), UIControlStateNormal)
    .assignTo(^(__kindof UIView * _Nonnull view) {
        _goSettingbutton = view;
    })
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self.authorLabel.mas_bottom).offset(20);
        make.width.mas_equalTo(240 * SSDK_SCALE);
    });
    
}


- (void)goToSetting{
    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        if (@available(iOS 10.0, *)) {
            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {
                
            }];
        } else {
            [[UIApplication sharedApplication] openURL:url];
        }
    }
}

@end
