//
//  SSDKBaseViewChainModel.h
//  SSDKCategory
//
//  Created by maxl on 2018/12/26.
//  Copyright © 2018 mob. All rights reserved.
//

#import "SSDKChainBaseModel.h"


#define SSDKCATEGORY_CHAIN_VIEWCLASS_IMPLEMENTATION(SSDKMethod,SSDKParaType, SSDKModelType, SSDKPropertyClass) SSDKCATEGORY_CHAIN_IMPLEMENTATION(SSDKMethod,SSDKParaType, SSDKModelType, SSDKPropertyClass)


#define SSDKCATEGORY_VIEW_IMPLEMENTATION(SSDKClass, modelType)\
@interface modelType(EffectiveEXT)\
@property (nonatomic, strong, readonly) NSMutableArray <SSDKClass *>* effectiveObjects;\
@end\
@implementation SSDKClass (EXT)\
- (modelType *)makeChain{\
    return [[modelType alloc] initWithTag:self.tag andView:self modelClass:[SSDKClass class]];\
}\
@end


NS_ASSUME_NONNULL_BEGIN


typedef void(^SSDKAssignViewLoad)(__kindof UIView *view);

@interface SSDKBaseViewChainModel <__covariant  ObjectType> : SSDKChainBaseModel<ObjectType>

- (instancetype)initWithTag:(NSInteger)tag andView:(UIView *)view modelClass:(Class)modelClass;

@property (nonatomic, assign, readonly) NSInteger tag;

@property (nonatomic, strong, readonly) __kindof UIView *view;

@property (nonatomic, assign, readonly) Class viewClass;

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ bounds) (CGRect frame);
#pragma mark - frame -
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ frame) (CGRect frame);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ origin) (CGPoint origin);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ x) (CGFloat x);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ y) (CGFloat y);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ size) (CGSize size);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ width) (CGFloat width);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ height) (CGFloat height);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ center) (CGPoint center);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ centerX) (CGFloat centerX);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ centerY) (CGFloat centerY);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ top) (CGFloat top);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ left) (CGFloat left);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ bottom) (CGFloat bottom);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ right) (CGFloat right);


SSDKCATEGORY_CHAIN_PROPERTY CGFloat (^ visibleAlpha) (void);

SSDKCATEGORY_CHAIN_PROPERTY CGRect (^ convertRectTo) (CGRect rect, UIView * toView);

SSDKCATEGORY_CHAIN_PROPERTY CGRect (^ convertRectFrom) (CGRect rect, UIView * toView);

SSDKCATEGORY_CHAIN_PROPERTY CGPoint (^ convertPointTo) (CGPoint point, UIView * toView);

SSDKCATEGORY_CHAIN_PROPERTY CGPoint (^ convertPointFrom) (CGPoint point, UIView * toView);

SSDKCATEGORY_CHAIN_PROPERTY UIView *(^ viewWithTag) (NSInteger tag);

#pragma mark - show -

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ backgroundColor) (UIColor *backgroundColor);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ tintColor) (UIColor *tintColor);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ alpha) (CGFloat alpha);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ hidden) (BOOL hidden);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ clipsToBounds) (BOOL clipsToBounds);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ opaque) (BOOL opaque);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ userInteractionEnabled) (BOOL userInteractionEnabled);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ multipleTouchEnabled) (BOOL multipleTouchEnabled);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ endEditing) (BOOL endEditing);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ contentMode) (UIViewContentMode contentMode);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ transform) (CGAffineTransform transform);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ autoresizingMask) (UIViewAutoresizing autoresizingMask);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ autoresizesSubviews) (BOOL autoresizesSubviews);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ makeTag) (NSInteger tag);

#pragma mark - control -

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ addToSuperView) (UIView *superView);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ addSubView) (UIView *subView);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ addGesture) (UIGestureRecognizer *gesture);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ addGestureBlock) (void (^ gestureBlock) (id gesture));


SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ removeGesture) (UIGestureRecognizer *gesture);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ addGestureWithTag) (UIGestureRecognizer *gesture, NSString *tag);

@property (nonatomic, strong, readonly) UIGestureRecognizer * (^ getGestureByTag) (NSString * tag);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ removeGestureByTag) (NSString *tag);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ bringSubViewToFront) (UIView *view);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ sendSubViewToBack) (UIView *view);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ exchangeSubView) (UIView *front, UIView *backView);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ exchangeSubviewWithIndex) (NSInteger front, NSInteger back);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ insertSubViewBelow) (UIView* below, UIView * above);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ insertSubViewAbove) (UIView* above, UIView * below);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ insertSubViewIndex) (UIView* above, NSInteger index);


#pragma mark - layer -

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ shouldRasterize)(BOOL shouldRasterize);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ layerOpacity)(float layerOpacity);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ layerBackGroundColor)(UIColor * backgroundColor);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ layerOpaque)(BOOL opaque);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ rasterizationScale)(CGFloat rasterizationScale);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ masksToBounds)(BOOL masksToBounds);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ cornerRadius)(CGFloat cornerRadius);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ border)(CGFloat borderWidth, UIColor *borderColor);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ borderWidth)(CGFloat borderWidth);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ borderColor)(CGColorRef borderColor);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ zPosition)(CGFloat zPosition);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ anchorPoint)(CGPoint anchorPoint);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ shadow)(CGSize shadowOffset, CGFloat shadowRadius, UIColor *shadowColor, CGFloat shadowOpacity);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ shadowColor)(CGColorRef shadowColor);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ shadowOpacity)(CGFloat shadowOpacity);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ shadowOffset)(CGSize shadowOffset);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ shadowRadius)(CGFloat shadowRadius);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ layerTransform)(CATransform3D transform);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ shadowPath) (CGPathRef shadowPath);

#pragma mark - method -



SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ assignTo)(SSDKAssignViewLoad assignTo);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ sizeToFit) (void);
SSDKCATEGORY_CHAIN_PROPERTY CGSize (^ sizeToFitSize) (CGSize size);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ removeFormSuperView) (void);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ layoutIfNeeded) (void);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ setNeedsLayout) (void);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ setNeedsDisplay) (void);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ setNeedsDisplayRect) (CGRect rect);

@end

NS_ASSUME_NONNULL_END
