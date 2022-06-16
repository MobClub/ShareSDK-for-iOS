//
//  CALayer+SSDKChain.m
//  SSDKCategory
//
//  Created by maxl on 2019/1/4.
//  Copyright © 2019 mob. All rights reserved.
//

#import "CALayer+SSDKChain.h"
#define SSDKCATEGORY_ADDSUBLAYER(method, ModelClass, LayerClass)\
- (ModelClass * _Nonnull (^)(void))method{\
return ^ (){\
LayerClass *layer = [LayerClass layer];\
ModelClass *chainModel = [[ModelClass alloc] initWithLayer:layer modelClass:[LayerClass class]];\
[self addSublayer:layer];\
return chainModel;\
};\
}
@implementation CALayer (SSDKChain)
SSDKCATEGORY_ADDSUBLAYER(addLayer, SSDKLayerChainModel, CALayer)
SSDKCATEGORY_ADDSUBLAYER(addShaperLayer, SSDKShaperLayerChainModel, CAShapeLayer)
SSDKCATEGORY_ADDSUBLAYER(addEmiiterLayer, SSDKEmiiterLayerChainModel, CAEmitterLayer)
SSDKCATEGORY_ADDSUBLAYER(addScrollLayer, SSDKScrollLayerChainModel, CAScrollLayer)
SSDKCATEGORY_ADDSUBLAYER(addTextLayer, SSDKTextLayerChainModel, CATextLayer)
SSDKCATEGORY_ADDSUBLAYER(addTiledLayer, SSDKTiledLayerChainModel, CATiledLayer)
SSDKCATEGORY_ADDSUBLAYER(addTransFormLayer, SSDKTransFormLayerChainModel, CATransformLayer)
SSDKCATEGORY_ADDSUBLAYER(addGradientLayer, SSDKGradientLayerChainModel, CAGradientLayer)
SSDKCATEGORY_ADDSUBLAYER(addReplicatorLayer, SSDKReplicatorLayerChainModel, CAReplicatorLayer)
@end
#undef SSDKCATEGORY_ADDSUBLAYER
