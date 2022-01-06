//
//  SSDKBaseLayerChainModel.m
//  SSDKCategory
//
//  Created by maxl on 2019/1/3.
//  Copyright © 2019 mob. All rights reserved.
//

#import "SSDKBaseLayerChainModel.h"
#import "SSDKChainBaseModel+SSDKPrivate.h"
#define SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(SSDKMethod,SSDKParaType) SSDKCATEGORY_CHAIN_LAYERCLASS_IMPLEMENTATION(SSDKMethod,SSDKParaType, id, CALayer)

@implementation SSDKBaseLayerChainModel

- (instancetype)initWithLayer:(CALayer *)layer modelClass:(nonnull Class)modelClass{
    if (self = [super initWithModelObject:layer modelClass:modelClass]) {
        
    }
    return self;
}

SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(bounds, CGRect)
SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(frame, CGRect)
SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(position, CGPoint)
SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(anchorPoint, CGPoint)
SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(zPosition, CGFloat)
SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(anchorPointZ, CGFloat)
SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(rasterizationScale, CGFloat)
SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(transform, CATransform3D)
SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(affineTransform, CGAffineTransform)
SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(hidden, BOOL)
SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(doubleSided, BOOL)
SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(geometryFlipped, BOOL)
SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(masksToBounds, BOOL)
SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(mask, CALayer *)
SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(contents, id)
SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(contentsRect, CGRect)
SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(contentsGravity, CALayerContentsGravity)
SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(contentsScale, CGFloat)
SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(contentsCenter, CGRect)
SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(contentsFormat, CALayerContentsFormat)
SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(minificationFilter, CALayerContentsFilter)
SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(magnificationFilter, CALayerContentsFilter)
SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(minificationFilterBias, float)
SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(opaque, BOOL)
SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(needsDisplayOnBoundsChange, BOOL)
SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(drawsAsynchronously, BOOL)
SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(edgeAntialiasingMask, CAEdgeAntialiasingMask)
SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(allowsEdgeAntialiasing, BOOL)
SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(backgroundColor, CGColorRef)
SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(cornerRadius, CGFloat)
SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(maskedCorners, CACornerMask)
SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(borderWidth, CGFloat)
SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(borderColor, CGColorRef)
SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(opacity, float)
SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(allowsGroupOpacity, BOOL)
SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(compositingFilter, id)
SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(filters, NSArray*)
SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(backgroundFilters, NSArray*)
SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(shouldRasterize, BOOL)
SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(shadowColor, CGColorRef)
SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(shadowOpacity, float)
SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(shadowOffset, CGSize)
SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(shadowRadius, CGFloat)
SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(shadowPath, CGPathRef)
SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(name, NSString *)
SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(delegate, id <CALayerDelegate>)
SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION(style, NSDictionary *)

- (id  _Nonnull (^)( NSDictionary<NSString *,id<CAAction>>  * _Nonnull))actions{
    return ^ (NSDictionary<NSString *,id<CAAction>> * dic){
        [self enumerateObjectsUsingBlock:^(CALayer * _Nonnull obj) {
            obj.actions = dic;
        }];
        return self;
    };
}

- (id (^)(CGSize shadowOffset, CGFloat shadowRadius, UIColor *shadowColor, CGFloat shadowOpacity))shadow
{
    return ^ id (CGSize shadowOffset, CGFloat shadowRadius, UIColor *shadowColor, CGFloat shadowOpacity) {
        [self enumerateObjectsUsingBlock:^(CALayer * _Nonnull obj) {
            [obj setShadowOffset:shadowOffset];
            [obj setShadowRadius:shadowRadius];
            [obj setShadowColor:shadowColor.CGColor];
            [obj setShadowOpacity:shadowOpacity];
        }];
        
        return self;
    };
}

- (id  _Nonnull (^)(void))removeFromSuperlayer{
    return ^(){
        [self enumerateObjectsUsingBlock:^(CALayer * _Nonnull obj) {
            [obj removeFromSuperlayer];
        }];
        return self;
    };
}

- (id  _Nonnull (^)(CALayer * _Nonnull))addToSuperLayer{
    return ^ (CALayer *layer){
        [self enumerateObjectsUsingBlock:^(CALayer * _Nonnull obj) {
            [layer addSublayer:obj];
        }];
        return self;
    };
}

- (id  _Nonnull (^)(CALayer * _Nonnull, CALayer * _Nonnull))insertSublayerBelow{
    return ^ (CALayer *layer, CALayer *belowLayer){
        [self.layer insertSublayer:layer below:belowLayer];
        return self;
    };
}

- (id  _Nonnull (^)(CALayer * _Nonnull, CALayer * _Nonnull))insertSublayerAbove{
    return ^ (CALayer *layer, CALayer *above){
        [self.layer insertSublayer:layer above:above];
        return self;
    };
}

- (id  _Nonnull (^)(CALayer * _Nonnull, NSInteger))insertSublayerIndex{
    return ^ (CALayer *layer, NSInteger index){
        [self.layer insertSublayer:layer atIndex:(unsigned)index];
        return self;
    };
}

- (id  _Nonnull (^)(CALayer * _Nonnull, CALayer * _Nonnull))relpaceSublayer{
    return ^ (CALayer *oldLayer, CALayer *newLayer){
        [self enumerateObjectsUsingBlock:^(CALayer * _Nonnull obj) {
            [obj replaceSublayer:oldLayer with:newLayer];
        }];
        return self;
    };
}

- (id  _Nonnull (^)(CALayer * _Nonnull))setToMask{
    return ^ (CALayer *layer){
        [self enumerateObjectsUsingBlock:^(CALayer *  _Nonnull obj) {
            layer.mask = obj;
        }];
        return self;
    };
}

- (id  _Nonnull (^)(CAAnimation * _Nonnull, NSString * _Nonnull))addAnimation{
    return ^ (CAAnimation *ani, NSString *key){
        if (ani && key) {
            [self enumerateObjectsUsingBlock:^(id  _Nonnull obj) {
                [obj addAnimation:ani forKey:key];
            }];
        }
        return self;
    };
}

- (id  _Nonnull (^)(NSString * _Nonnull))removeAnimation{
    return ^ (NSString *key){
        if (key) {
            [self enumerateObjectsUsingBlock:^(id  _Nonnull obj) {
                [obj removeAnimationForKey:key];
            }];
        }
        return self;
    };
}

- (id  _Nonnull (^)(void))removeAllAnimation{
    return ^ (){
        [self enumerateObjectsUsingBlock:^(id  _Nonnull obj) {
            [obj removeAllAnimations];
        }];
        return self;
    };
}

- (id  _Nonnull (^)(SSDKAssignLayerLoad _Nonnull))assignTo{
    return ^ (void (^assignTo)(id layer)){
        if (assignTo) {
            assignTo(self.layer);
        }
        assignTo = nil;
        return self;
    };
}

- (CALayer *)layer{
    return self.effectiveObjects.firstObject;
}

@end
#undef SSDKCATEGORY_CHAIN_BASELAYER_IMPLEMENTATION
