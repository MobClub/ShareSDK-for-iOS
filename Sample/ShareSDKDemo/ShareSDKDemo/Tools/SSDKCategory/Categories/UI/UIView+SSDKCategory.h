//
//  UIView+SSDKategory.h
//  SSDKCategory
//
//  Created by maxl on 2018/12/18.
//  Copyright © 2018 mob. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (SSDKCategory)

@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat right;

- (void)removeAllSubViews;

- (UIViewController *)viewController;

//接收响应事件的NavigationController
- (UINavigationController *)navigationController;


- (CGFloat)visibleAlpha;

- (UIImage *)snapshotImage;

- (UIImage *)snapshotImageAfterScreenUpdates:(BOOL)afterUpdates;

- (NSData *)snapshotPDF;

#pragma mark - convert -

- (CGPoint)convertPointTo:(CGPoint)point :(UIView *)view;

- (CGPoint)convertPointFrom:(CGPoint)point :(UIView *)view;

- (CGRect)convertRectTo:(CGRect)rect :(UIView *)view;

- (CGRect)convertRectFrom:(CGRect)rect :(UIView *)view;

#pragma mark - draw -
- (CAShapeLayer *)setCornerRadiusAngle:(UIRectCorner)corner cornerSize:(CGSize)size;

- (CALayer *)setLayerShadow:(UIColor*)color offset:(CGSize)offset radius:(CGFloat)radius;

- (CALayer *)setLayerShadow:(UIColor*)color offset:(CGSize)offset radius:(CGFloat)radius cornerRadius:(CGFloat)cornerRadius backgroundColor:(UIColor *)backgroundColor;



@end

NS_ASSUME_NONNULL_END
