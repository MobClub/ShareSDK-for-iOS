//
//  SSDKBaseLayerChainModel.h
//  SSDKCategory
//
//  Created by maxl on 2019/1/3.
//  Copyright © 2019 mob. All rights reserved.
//

#import "SSDKChainBaseModel.h"

#define SSDKCATEGORY_CHAIN_LAYERCLASS_IMPLEMENTATION(SSDKMethod,SSDKParaType, SSDKModelType, SSDKPropertyClass) SSDKCATEGORY_CHAIN_IMPLEMENTATION(SSDKMethod,SSDKParaType, SSDKModelType, SSDKPropertyClass)

#define SSDKCATEGORY_LAYER_IMPLEMENTATION(SSDKClass, modelType)\
@implementation SSDKClass (EXT)\
- (modelType *)makeChain{\
    return [[modelType alloc] initWithLayer:self modelClass:[SSDKClass class]];\
}\
@end
NS_ASSUME_NONNULL_BEGIN


typedef void(^SSDKAssignLayerLoad)(__kindof CALayer *layer);
@interface SSDKBaseLayerChainModel <__covariant  ObjectType> : SSDKChainBaseModel<  ObjectType>

- (instancetype)initWithLayer:(CALayer *)layer modelClass:(Class)modelClass;

@property (nonatomic, strong, readonly) __kindof CALayer * layer;

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ bounds) (CGRect bounds);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ position) (CGPoint position);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ zPosition) (CGFloat zPosition);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ anchorPoint) (CGPoint anchorPoint);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ anchorPointZ) (CGFloat anchorPointZ);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ transform) (CATransform3D transform);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ affineTransform) (CGAffineTransform affineTransform);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ frame) (CGRect frame);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ hidden) (BOOL hidden);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ doubleSided) (BOOL doubleSided);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ geometryFlipped) (BOOL geometryFlipped);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ removeFromSuperlayer) (void);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ addToSuperLayer) (CALayer * layer);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ insertSublayerBelow) (CALayer *layer, CALayer * below);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ insertSublayerIndex) (CALayer *layer, NSInteger index);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ insertSublayerAbove) (CALayer *layer, CALayer *above);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ relpaceSublayer) (CALayer *oldLayer, CALayer *newLayer);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ setToMask) (CALayer * toLayer);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ mask) (CALayer * maskLayer);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ masksToBounds) (BOOL masksToBounds);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ contents) (id contents);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ contentsRect) (CGRect contentsRect);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ contentsGravity) (CALayerContentsGravity contentsGravity);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ contentsScale) (CGFloat contentsScale);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ contentsCenter) (CGRect contentsCenter);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ contentsFormat) (CALayerContentsFormat contentsFormat) API_AVAILABLE(ios(10.0));
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ minificationFilter) (CALayerContentsFilter minificationFilter);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ magnificationFilter) (CALayerContentsFilter magnificationFilter);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ minificationFilterBias) (float minificationFilterBias);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ opaque) (BOOL opaque);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ needsDisplayOnBoundsChange) (BOOL needsDisplayOnBoundsChange);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ drawsAsynchronously) (BOOL drawsAsynchronously);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ edgeAntialiasingMask) (CAEdgeAntialiasingMask edgeAntialiasingMask);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ allowsEdgeAntialiasing) (BOOL allowsEdgeAntialiasing);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ backgroundColor) (CGColorRef backgroundColor);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ cornerRadius) (CGFloat cornerRadius);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ maskedCorners) (CACornerMask maskedCorners) API_AVAILABLE(ios(11.0));
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ borderWidth) (CGFloat borderWidth);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ borderColor) (CGColorRef borderColor);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ opacity) (float opacity);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ allowsGroupOpacity) (BOOL allowsGroupOpacity);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ compositingFilter) (id compositingFilter);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ filters) (NSArray* filters);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ backgroundFilters) (NSArray* backgroundFilters);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ shouldRasterize) (BOOL shouldRasterize);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ rasterizationScale) (CGFloat rasterizationScale);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ shadowColor) (CGColorRef shadowColor);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ shadowOpacity) (float shadowOpacity);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ shadowOffset) (CGSize shadowOffset);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ shadowRadius) (CGFloat shadowRadius);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ shadowPath) (CGPathRef shadowPath);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ actions) (NSDictionary<NSString *, id<CAAction>> * actions);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ addAnimation) (CAAnimation *animation, NSString *key);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ removeAnimation) (NSString * key);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ removeAllAnimation) (void);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ name) (NSString * name);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ delegate) (id <CALayerDelegate> delegate);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ style) (NSDictionary * style);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ assignTo) (SSDKAssignLayerLoad assignTo);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ shadow)(CGSize shadowOffset, CGFloat shadowRadius, UIColor *shadowColor, CGFloat shadowOpacity);

@end

NS_ASSUME_NONNULL_END
