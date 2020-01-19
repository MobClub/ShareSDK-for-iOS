//
//  UIView+SSDKategory.m
//  SSDKCategory
//
//  Created by maxl on 2018/12/18.
//  Copyright © 2018 mob. All rights reserved.
//

#import "UIView+SSDKCategory.h"

@implementation UIView (SSDKCategory)

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)top {
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - self.frame.size.height;
    self.frame = frame;
}

- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)left {
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - self.frame.size.width;
    self.frame = frame;
}

- (void)removeAllSubViews{
    while (self.subviews.count > 0) {
        [[self.subviews firstObject] removeFromSuperview];
    }
}

- (UIViewController *)viewController{
    id nextResponder = [self nextResponder];
    UIView *view = self;
    while (![nextResponder isKindOfClass:[UIViewController class]]) {
        view = view.superview;
        nextResponder = [view nextResponder];
    }
    return nextResponder;
}
- (UINavigationController *)navigationController{
    id nextResponder = self;
    while (nextResponder) {
        if ([nextResponder isKindOfClass:[UIViewController class]] && [nextResponder navigationController] != nil) {
            nextResponder = [nextResponder navigationController];
            break;
        }
        nextResponder = [nextResponder nextResponder];
    }
    return nextResponder;
}

- (CGFloat)visibleAlpha{
    if ([self isKindOfClass:[UIWindow class]]) {
        if (self.hidden) return 0;
        return self.alpha;
    }
    if (!self.window) return 0;
    CGFloat alpha = 1;
    UIView *v = self;
    while (v) {
        if (v.hidden) {
            alpha = 0;
            break;
        }
        alpha *= v.alpha;
        v = v.superview;
    }
    return alpha;
}

- (UIImage *)snapshotImage{
    UIGraphicsBeginImageContextWithOptions(self.size, self.opaque > 0, 0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *snap = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snap;
}

- (UIImage *)snapshotImageAfterScreenUpdates:(BOOL)afterUpdates{
    if (![self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
        return [self snapshotImage];
    }
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque > 0, 0);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:afterUpdates];
    UIImage *snap = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snap;
}


- (NSData *)snapshotPDF{
    CGRect bounds = self.bounds;
    NSMutableData *data = [NSMutableData data];
    CGDataConsumerRef consumer = CGDataConsumerCreateWithCFData((__bridge CFMutableDataRef)data);
    CGContextRef context = CGPDFContextCreate(consumer, &bounds, NULL);
    CGDataConsumerRelease(consumer);
    if (!context) return nil;
    CGPDFContextBeginPage(context, NULL);
    CGContextTranslateCTM(context, 0, bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    [self.layer renderInContext:context];
    CGPDFContextEndPage(context);
    CGPDFContextClose(context);
    CGContextRelease(context);
    return data;
}

#pragma mark - convert -
- (CGPoint)convertPointTo:(CGPoint)point :(UIView *)view{
    UIView *myView = self;
    CGPoint endPoint;
    if (!view) {
        if ([myView isKindOfClass:[UIWindow class]]) {
            endPoint = [((UIWindow *)myView) convertPoint:point toWindow:nil];
        } else {
            endPoint = [myView convertPoint:point toView:nil];
        }
    }
    
    UIWindow *from = [myView isKindOfClass:[UIWindow class]] ? (id)myView : myView.window;
    UIWindow *to = [view isKindOfClass:[UIWindow class]] ? (id)view : view.window;
    if ((!from || !to) || (from == to)) return [myView convertPoint:point toView:view];
    point = [myView convertPoint:point toView:from];
    point = [to convertPoint:point fromWindow:from];
    endPoint = [view convertPoint:point fromView:to];
    return endPoint;
}
- (CGPoint)convertPointFrom:(CGPoint)point :(UIView *)view{
    CGPoint endPoint;
    UIView *myView = self;
    if (!view) {
        if ([myView isKindOfClass:[UIWindow class]]) {
            endPoint = [(UIWindow *)myView convertPoint:point fromWindow:nil];
        }else{
            endPoint = [myView convertPoint:point fromView:nil];
        }
    }else{
        UIWindow *from = [view isKindOfClass:[UIWindow class]] ? (id)view : view.window;
        UIWindow *to = [myView isKindOfClass:[UIWindow class]] ? (id)myView : myView.window;
        if ((!from || !to) || (from == to)) return [myView convertPoint:point fromView:view];
        point = [from convertPoint:point fromView:view];
        point = [to convertPoint:point fromWindow:from];
        endPoint = [myView convertPoint:point fromView:to];
    }
    return endPoint;
}
- (CGRect)convertRectTo:(CGRect)rect :(UIView *)view{
    UIView *myView = self;
    CGRect toRect;
    if (!view) {
        if ([myView isKindOfClass:[UIWindow class]]) {
            toRect = [((UIWindow *)myView) convertRect:rect toWindow:nil];
        } else {
            toRect = [myView convertRect:rect toView:nil];
        }
    }
    
    UIWindow *from = [myView isKindOfClass:[UIWindow class]] ? (id)myView : myView.window;
    UIWindow *to = [view isKindOfClass:[UIWindow class]] ? (id)view : view.window;
    if (!from || !to) return [myView convertRect:rect toView:view];
    if (from == to) return [myView convertRect:rect toView:view];
    rect = [myView convertRect:rect toView:from];
    rect = [to convertRect:rect fromWindow:from];
    toRect = [view convertRect:rect fromView:to];
    return toRect;
}
- (CGRect)convertRectFrom:(CGRect)rect :(UIView *)view{
    CGRect fromRect;
    UIView *myView = self;
    if (!view) {
        if ([myView isKindOfClass:[UIWindow class]]) {
            fromRect = [((UIWindow *)myView) convertRect:rect fromWindow:nil];
        } else {
            fromRect = [myView convertRect:rect fromView:nil];
        }
    }
    
    UIWindow *from = [view isKindOfClass:[UIWindow class]] ? (id)view : view.window;
    UIWindow *to = [myView isKindOfClass:[UIWindow class]] ? (id)myView : myView.window;
    if ((!from || !to) || (from == to)) return [myView convertRect:rect fromView:view];
    rect = [from convertRect:rect fromView:view];
    rect = [to convertRect:rect fromWindow:from];
    fromRect = [myView convertRect:rect fromView:to];
    return fromRect;
}

#pragma mark - draw -
- (CAShapeLayer *)setCornerRadiusAngle:(UIRectCorner)corner cornerSize:(CGSize)size{
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corner cornerRadii:size];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = bezierPath.CGPath;
    return layer;
}

- (CALayer *)setLayerShadow:(UIColor*)color offset:(CGSize)offset radius:(CGFloat)radius {
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOffset = offset;
    self.layer.shadowRadius = radius;
    self.layer.shadowOpacity = 1;
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
    return self.layer;
}

- (CALayer *)setLayerShadow:(UIColor *)color offset:(CGSize)offset radius:(CGFloat)radius cornerRadius:(CGFloat)cornerRadius backgroundColor:(UIColor *)backgroundColor{
    [self setLayerShadow:color offset:offset radius:radius];
    if (cornerRadius > 0) {
        self.layer.masksToBounds = NO;
        self.layer.cornerRadius = cornerRadius;
    }
    if (backgroundColor) {
        self.layer.backgroundColor = backgroundColor.CGColor;
    }
    return self.layer;
}
@end
