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

#define SSDKCATEGORY_CHAIN_IMPLEMENTATION(SSDKMethod,SSDKParaType, SSDKModelType, SSDKPropertyClass)\
- (SSDKModelType  _Nonnull (^)(SSDKParaType))SSDKMethod {\
return ^ (SSDKParaType SSDKMethod){\
NSArray *array = self.effectiveObjects.copy;\
for (SSDKPropertyClass * obj in array) {\
    obj.SSDKMethod = SSDKMethod;\
}\
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
static inline ModelType *SSDKClass##NameCreate(NSString *className){\
Class clas = NSClassFromString(className);\
if ([clas isKindOfClass:[SSDKClass class]]) {\
return [clas new];\
}\
return nil;\
}\
static inline ModelType *SSDKClass##NameModelCreate(NSString *className){\
return ((id (*)(id, SEL))objc_msgSend)( SSDKClass##NameCreate(className),sel_registerName("makeChain"));\
}\
SSDKCATEGORY_EXINTERFACE_(SSDKClass, ModelType)\
static inline ModelType * SSDKClass##ModelWithArray(NSArray <SSDKClass *>*objects)\
{\
    return ((id (*)(id, SEL,id,id))objc_msgSend)([ModelType alloc],sel_registerName("initWithModelObjects:modelClass:"),objects,[SSDKClass class]);\
}

#define SSDKCATEGORY_EXINTERFACE_(SSDKClass, ModelType)\
@interface SSDKClass(EXT)\
SSDKCATEGORY_CHAIN_PROPERTY ModelType * makeChain;\
@end

#endif /* SSDKChainDefine_h */
