//
//  SSDKButtonChainModel.h
//  SSDKCategory
//
//  Created by maxl on 2018/12/27.
//  Copyright © 2018 mob. All rights reserved.
//

#import "SSDKBaseControlChainModel.h"
#import "UIButton+SSDKCategory.h"
NS_ASSUME_NONNULL_BEGIN
typedef void(^SSDKButtonImageTitleBlock)(UIImageView *imageView, UILabel *title);
@class SSDKButtonChainModel;
@interface SSDKButtonChainModel : SSDKBaseControlChainModel<SSDKButtonChainModel *>

SSDKCATEGORY_CHAIN_PROPERTY SSDKButtonChainModel *(^ contentEdgeInsets)(UIEdgeInsets contentEdgeInsets);

SSDKCATEGORY_CHAIN_PROPERTY SSDKButtonChainModel *(^ titleEdgeInsets)(UIEdgeInsets titleEdgeInsets);

SSDKCATEGORY_CHAIN_PROPERTY SSDKButtonChainModel *(^ imageEdgeInsets)(UIEdgeInsets imageEdgeInsets);

SSDKCATEGORY_CHAIN_PROPERTY SSDKButtonChainModel *(^ adjustsImageWhenHighlighted) (BOOL adjustsImageWhenHighlighted);

SSDKCATEGORY_CHAIN_PROPERTY SSDKButtonChainModel *(^ showsTouchWhenHighlighted) (BOOL showsTouchWhenHighlighted);

SSDKCATEGORY_CHAIN_PROPERTY SSDKButtonChainModel *(^ adjustsImageWhenDisabled) (BOOL adjustsImageWhenDisabled);

SSDKCATEGORY_CHAIN_PROPERTY SSDKButtonChainModel *(^ reversesTitleShadowWhenHighlighted) (BOOL reversesTitleShadowWhenHighlighted);

SSDKCATEGORY_CHAIN_PROPERTY SSDKButtonChainModel *(^ image) (UIImage *image, UIControlState state);

SSDKCATEGORY_CHAIN_PROPERTY SSDKButtonChainModel *(^ text) (NSString *title, UIControlState state);

SSDKCATEGORY_CHAIN_PROPERTY SSDKButtonChainModel *(^ textColor) (UIColor *color, UIControlState state);

SSDKCATEGORY_CHAIN_PROPERTY SSDKButtonChainModel * (^ backgroundImage) (UIImage *image, UIControlState state);

SSDKCATEGORY_CHAIN_PROPERTY SSDKButtonChainModel *(^ attributedTitle) (NSAttributedString *title, UIControlState state);

SSDKCATEGORY_CHAIN_PROPERTY SSDKButtonChainModel *(^ titleShadow) (UIColor *color, UIControlState state);

SSDKCATEGORY_CHAIN_PROPERTY SSDKButtonChainModel *(^ font) (UIFont *font);

SSDKCATEGORY_CHAIN_PROPERTY SSDKButtonChainModel *(^ textAlignment)(NSTextAlignment textAlignment);
SSDKCATEGORY_CHAIN_PROPERTY SSDKButtonChainModel *(^ numberOfLines)(NSInteger numberOfLines);
SSDKCATEGORY_CHAIN_PROPERTY SSDKButtonChainModel *(^ lineBreakMode)(NSLineBreakMode lineBreakMode);
SSDKCATEGORY_CHAIN_PROPERTY SSDKButtonChainModel *(^ adjustsFontSizeToFitWidth)(BOOL adjustsFontSizeToFitWidth);
SSDKCATEGORY_CHAIN_PROPERTY SSDKButtonChainModel *(^ baselineAdjustment)(UIBaselineAdjustment baselineAdjustment);


SSDKCATEGORY_CHAIN_PROPERTY SSDKButtonChainModel * (^ imageDirection) (SSDKButtonImageDirection imageDirection, CGFloat space);

SSDKCATEGORY_CHAIN_PROPERTY SSDKButtonChainModel *(^ imageAndTitle)(SSDKButtonImageTitleBlock block);
@end


static inline UIButton *UIButtonCreateWithType(UIButtonType buttonType){
    return [UIButton buttonWithType:buttonType];
}
SSDKCATEGORY_EXINTERFACE(UIButton, SSDKButtonChainModel)
NS_ASSUME_NONNULL_END
