//
//  SSDKChainDefine.h
//  SSDKCategory
//
//  Created by maxl on 2018/12/31.
//  Copyright © 2018 mob. All rights reserved.
//

#ifndef SSDKChainDefine_h
#define SSDKChainDefine_h
#import <UIKit/UIKit.h>
#import <objc/message.h>


#define SSDKTansactionDisableActions(...)\
[CATransaction begin];\
[CATransaction setDisableActions:YES];\
__VA_ARGS__\
[CATransaction commit];

#define SSDKCATEGORY_CHAIN_PROPERTY @property (nonatomic, copy, readonly)

#define SSDKCATEGORY_STRONG_PROPERTY @property (nonatomic, strong, readonly)

#define SSDKCATEGORY_CHAIN_IMPLEMENTATION(SSDKMethod,SSDKParaType, SSDKProperty, SSDKModelType, SSDKPropertyClass)\
- (SSDKModelType  _Nonnull (^)(SSDKParaType))SSDKMethod {\
return ^ (SSDKParaType SSDKMethod){\
    ((SSDKPropertyClass *)self.SSDKProperty).SSDKMethod = SSDKMethod;\
    return self;\
};\
}


#define SSDKCATEGORY_EXINTERFACE(SSDKClass, ModelType)\
static inline SSDKClass *SSDKClass##Create(void){\
return [SSDKClass new];\
}\
static inline ModelType *SSDKClass##ModelCreate(void){\
return ((id (*)(id, SEL))objc_msgSend)([SSDKClass new],sel_registerName("makeChain"));\
}\
SSDKCATEGORY_EXINTERFACE_(SSDKClass, ModelType)

#define SSDKCATEGORY_EXINTERFACE_(SSDKClass, ModelType)\
@interface SSDKClass(EXT)\
SSDKCATEGORY_CHAIN_PROPERTY ModelType * makeChain;\
@end
#endif /* SSDKChainDefine_h */
