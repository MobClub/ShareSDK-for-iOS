//
//  SSDKBaseControlChainModel.m
//  SSDKCategory
//
//  Created by maxl on 2019/1/15.
//  Copyright © 2019 mob. All rights reserved.
//

#import "SSDKBaseControlChainModel.h"
#import "UIControl+SSDKCategory.h"
#define SSDKCATEGORY_CHAIN_CONTROL_IMPLEMENTATION(SSDKMethod,SSDKParaType) SSDKCATEGORY_CHAIN_VIEWCLASS_IMPLEMENTATION(SSDKMethod,SSDKParaType, id ,UIControl)
@implementation SSDKBaseControlChainModel
SSDKCATEGORY_CHAIN_CONTROL_IMPLEMENTATION(enabled, BOOL)
SSDKCATEGORY_CHAIN_CONTROL_IMPLEMENTATION(selected, BOOL)
SSDKCATEGORY_CHAIN_CONTROL_IMPLEMENTATION(highlighted, BOOL)
SSDKCATEGORY_CHAIN_CONTROL_IMPLEMENTATION(contentVerticalAlignment, UIControlContentVerticalAlignment)
SSDKCATEGORY_CHAIN_CONTROL_IMPLEMENTATION(contentHorizontalAlignment, UIControlContentHorizontalAlignment)

- (id  _Nonnull (^)(id _Nonnull, SEL _Nonnull, UIControlEvents))addTarget{
    return ^ (id target, SEL action, UIControlEvents events){
        [self enumerateObjectsUsingBlock:^(UIControl * _Nonnull obj) {
            [obj addTarget:target action:action forControlEvents:events];
        }];
        return self;
    };
}
- ( id  _Nonnull (^)(id _Nonnull, SEL _Nonnull, UIControlEvents))setTarget{
    return ^ (id target, SEL action, UIControlEvents events){
        [self enumerateObjectsUsingBlock:^(UIControl * _Nonnull obj) {
             [obj setTarget:target eventAction:action forControlEvents:events];
        }];
       
        return self;
    };
}
- (id  _Nonnull (^)(SSDKTargetActionBlock _Nonnull, UIControlEvents))addTargetBlock{
    return ^ (controlTargeAction block, UIControlEvents events){
        [self enumerateObjectsUsingBlock:^(UIControl * _Nonnull obj) {
            [obj addEventBlock:block forEvents:events];
        }];
        return self;
    };
}
- (id  _Nonnull (^)(SSDKTargetActionBlock _Nonnull, UIControlEvents))setTargetBlock{
    return ^ (controlTargeAction block, UIControlEvents events){
        [self enumerateObjectsUsingBlock:^(UIControl * _Nonnull obj) {
            [obj setEventBlock:block forEvents:events];
        }];
        return self;
    };
}

- ( id  _Nonnull (^)(id _Nonnull, SEL _Nonnull, UIControlEvents))removeTarget{
    return ^ (id target, SEL action, UIControlEvents events){
        [self enumerateObjectsUsingBlock:^(UIControl * _Nonnull obj) {
            [obj removeTarget:target action:action forControlEvents:events];
        }];
        return self;
    };
}
- ( id  _Nonnull (^)(void))removeAllTarget{
    return ^ (){
        [self enumerateObjectsUsingBlock:^(UIControl * _Nonnull obj) {
            [obj removeAllEvents];
        }];
        
        return self;
    };
}
- ( id  _Nonnull (^)(UIControlEvents))removeAllTargetBlock{
    return ^ (UIControlEvents events){
        [self enumerateObjectsUsingBlock:^(UIControl * _Nonnull obj) {
            [obj removeAllEventBlocksForEvents:events];            
        }];
        return self;
    };
}
@end
#undef SSDKCATEGORY_CHAIN_CONTROL_IMPLEMENTATION
