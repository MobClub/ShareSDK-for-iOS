//
//  SSDKLabelChainModel.m
//  SSDKCategory
//
//  Created by maxl on 2018/12/27.
//  Copyright © 2018 mob. All rights reserved.
//

#import "SSDKLabelChainModel.h"
#import "UILabel+SSDKCategory.h"
#define SSDKCATEGORY_CHAIN_LABLE_IMPLEMENTATION(SSDKMethod,SSDKParaType) SSDKCATEGORY_CHAIN_VIEWCLASS_IMPLEMENTATION(SSDKMethod,SSDKParaType, SSDKLabelChainModel *,UILabel)
@implementation SSDKLabelChainModel

SSDKCATEGORY_CHAIN_LABLE_IMPLEMENTATION(text, NSString *);
SSDKCATEGORY_CHAIN_LABLE_IMPLEMENTATION(font, UIFont *);
SSDKCATEGORY_CHAIN_LABLE_IMPLEMENTATION(textColor, UIColor *);
SSDKCATEGORY_CHAIN_LABLE_IMPLEMENTATION(attributedText, NSAttributedString *);
SSDKCATEGORY_CHAIN_LABLE_IMPLEMENTATION(textAlignment, NSTextAlignment);
SSDKCATEGORY_CHAIN_LABLE_IMPLEMENTATION(numberOfLines, NSInteger);
SSDKCATEGORY_CHAIN_LABLE_IMPLEMENTATION(lineBreakMode, NSLineBreakMode);
SSDKCATEGORY_CHAIN_LABLE_IMPLEMENTATION(adjustsFontSizeToFitWidth, BOOL);
SSDKCATEGORY_CHAIN_LABLE_IMPLEMENTATION(baselineAdjustment, UIBaselineAdjustment);
SSDKCATEGORY_CHAIN_LABLE_IMPLEMENTATION(allowsDefaultTighteningForTruncation, BOOL);
SSDKCATEGORY_CHAIN_LABLE_IMPLEMENTATION(preferredMaxLayoutWidth, CGFloat);
SSDKCATEGORY_CHAIN_LABLE_IMPLEMENTATION(minimumScaleFactor, CGFloat);
- (CGSize (^)(CGSize))sizeWithLimitSize{
    return ^ (CGSize size){
        return [(UILabel *)self.view sizeWithLimitSize:size];
    };
}

- (CGSize (^)(void))sizeWithOutLimitSize{
    return ^ (){
        return [(UILabel *)self.view sizeWithoutLimitSize];
    };
}
@end

SSDKCATEGORY_VIEW_IMPLEMENTATION(UILabel, SSDKLabelChainModel)
#undef SSDKCATEGORY_CHAIN_LABLE_IMPLEMENTATION
