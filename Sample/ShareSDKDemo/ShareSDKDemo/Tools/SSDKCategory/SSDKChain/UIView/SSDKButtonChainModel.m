//
//  SSDKButtonChainModel.m
//  SSDKCategory
//
//  Created by maxl on 2018/12/27.
//  Copyright © 2018 mob. All rights reserved.
//

#import "SSDKButtonChainModel.h"

#define SSDKCATEGORY_CHAIN_BUTTON_IMPLEMENTATION(SSDKMethod,SSDKParaType) SSDKCATEGORY_CHAIN_VIEWCLASS_IMPLEMENTATION(SSDKMethod,SSDKParaType, SSDKButtonChainModel *,UIButton)

#define SSDKCATEGORY_CHAIN_BUTTONLABEL_IMPLEMENTATION(SSDKMethod,SSDKParaType)\
- (SSDKButtonChainModel * (^)(SSDKParaType SSDKMethod))SSDKMethod    \
{   \
    return ^ (SSDKParaType SSDKMethod) {    \
        ((UIButton *)self.view).titleLabel.SSDKMethod = SSDKMethod;   \
        return self;    \
    };\
}
@implementation SSDKButtonChainModel

SSDKCATEGORY_CHAIN_BUTTON_IMPLEMENTATION(contentEdgeInsets, UIEdgeInsets)

SSDKCATEGORY_CHAIN_BUTTON_IMPLEMENTATION(titleEdgeInsets, UIEdgeInsets)

SSDKCATEGORY_CHAIN_BUTTON_IMPLEMENTATION(imageEdgeInsets, UIEdgeInsets)

SSDKCATEGORY_CHAIN_BUTTON_IMPLEMENTATION(adjustsImageWhenHighlighted, BOOL)

SSDKCATEGORY_CHAIN_BUTTON_IMPLEMENTATION(showsTouchWhenHighlighted, BOOL)

SSDKCATEGORY_CHAIN_BUTTON_IMPLEMENTATION(adjustsImageWhenDisabled, BOOL)

SSDKCATEGORY_CHAIN_BUTTON_IMPLEMENTATION(reversesTitleShadowWhenHighlighted, BOOL)

SSDKCATEGORY_CHAIN_BUTTONLABEL_IMPLEMENTATION(textAlignment, NSTextAlignment)
SSDKCATEGORY_CHAIN_BUTTONLABEL_IMPLEMENTATION(numberOfLines, NSInteger)
SSDKCATEGORY_CHAIN_BUTTONLABEL_IMPLEMENTATION(lineBreakMode, NSLineBreakMode)
SSDKCATEGORY_CHAIN_BUTTONLABEL_IMPLEMENTATION(adjustsFontSizeToFitWidth, BOOL)
SSDKCATEGORY_CHAIN_BUTTONLABEL_IMPLEMENTATION(baselineAdjustment, UIBaselineAdjustment)

- (SSDKButtonChainModel * _Nonnull (^)(UIImage * _Nonnull, UIControlState))image{
    return ^ (UIImage *image, UIControlState state){
        [self enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj) {
            [obj setImage:image forState:state];
        }];
        return self;
    };
}

- (SSDKButtonChainModel * _Nonnull (^)(NSString * _Nonnull, UIControlState))text{
    return ^ (NSString *text, UIControlState state){
        [self enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj) {
            [obj setTitle:text forState:state];
        }];
        return self;
    };
}

- (SSDKButtonChainModel * _Nonnull (^)(UIImage * _Nonnull, UIControlState))backgroundImage{
    return ^ (UIImage *image, UIControlState state){
        [self enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj) {
            [obj setBackgroundImage:image forState:state];
        }];
        return self;
    };
}

- (SSDKButtonChainModel * _Nonnull (^)(NSAttributedString * _Nonnull, UIControlState))attributedTitle{
    return ^ (NSAttributedString *title, UIControlState state){
        [self enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj) {
            [obj setAttributedTitle:title forState:state];
        }];
        return self;
    };
}

- (SSDKButtonChainModel * _Nonnull (^)(UIFont * _Nonnull))font{
    return ^ (UIFont *font){
        
        [self enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj) {
            obj.titleLabel.font = font;
        }];
        return self;
    };
}

- (SSDKButtonChainModel * _Nonnull (^)(UIColor * _Nonnull, UIControlState))textColor{
    return ^ (UIColor *color, UIControlState state){
        [self enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj) {
            [obj setTitleColor:color forState:state];
        }];
        return self;
    };
}

- (SSDKButtonChainModel * _Nonnull (^)(UIColor * _Nonnull, UIControlState))titleShadow{
    return ^ (UIColor *color, UIControlState state){
        [self enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj) {
             [(UIButton *)obj setTitleShadowColor:color forState:state];
        }];
        return self;
    };
}

- (SSDKButtonChainModel * _Nonnull (^)(SSDKButtonImageDirection, CGFloat))imageDirection{
    return ^ (SSDKButtonImageDirection direction, CGFloat space){
        [self enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj) {
            [obj imageDirection:direction space:space];
        }];
        return self;
    };
}
- (SSDKButtonChainModel * _Nonnull (^)(SSDKButtonImageTitleBlock _Nonnull))imageAndTitle{
    return ^ (SSDKButtonImageTitleBlock block){
        if (block) {
            [self enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj) {
                block(obj.imageView,obj.titleLabel);
            }];
            
        }
        return self;
    };
}
@end
SSDKCATEGORY_VIEW_IMPLEMENTATION(UIButton, SSDKButtonChainModel)
#undef SSDKCATEGORY_CHAIN_BUTTON_IMPLEMENTATION
#undef SSDKCATEGORY_CHAIN_BUTTONLABEL_IMPLEMENTATION
