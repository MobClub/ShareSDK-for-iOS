//
//  SSDKLabelChainModel.h
//  SSDKCategory
//
//  Created by maxl on 2018/12/27.
//  Copyright © 2018 mob. All rights reserved.
//

#import "SSDKBaseViewChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class SSDKLabelChainModel;
@interface SSDKLabelChainModel : SSDKBaseViewChainModel<SSDKLabelChainModel *>

SSDKCATEGORY_CHAIN_PROPERTY SSDKLabelChainModel *(^ text)(NSString *text);
SSDKCATEGORY_CHAIN_PROPERTY SSDKLabelChainModel *(^ font)(UIFont *font);
SSDKCATEGORY_CHAIN_PROPERTY SSDKLabelChainModel *(^ textColor)(UIColor *textColor);
SSDKCATEGORY_CHAIN_PROPERTY SSDKLabelChainModel *(^ attributedText)(NSAttributedString *attributedText);
SSDKCATEGORY_CHAIN_PROPERTY SSDKLabelChainModel *(^ textAlignment)(NSTextAlignment textAlignment);
SSDKCATEGORY_CHAIN_PROPERTY SSDKLabelChainModel *(^ numberOfLines)(NSInteger numberOfLines);
SSDKCATEGORY_CHAIN_PROPERTY SSDKLabelChainModel *(^ lineBreakMode)(NSLineBreakMode lineBreakMode);
SSDKCATEGORY_CHAIN_PROPERTY SSDKLabelChainModel *(^ adjustsFontSizeToFitWidth)(BOOL adjustsFontSizeToFitWidth);
SSDKCATEGORY_CHAIN_PROPERTY SSDKLabelChainModel *(^ baselineAdjustment)(UIBaselineAdjustment baselineAdjustment);
SSDKCATEGORY_CHAIN_PROPERTY SSDKLabelChainModel *(^ allowsDefaultTighteningForTruncation)(BOOL allowsDefaultTighteningForTruncation) API_AVAILABLE(ios(9.0));
SSDKCATEGORY_CHAIN_PROPERTY SSDKLabelChainModel *(^ minimumScaleFactor)(CGFloat minimumScaleFactor);
SSDKCATEGORY_CHAIN_PROPERTY SSDKLabelChainModel *(^ preferredMaxLayoutWidth)(CGFloat preferredMaxLayoutWidth);

SSDKCATEGORY_CHAIN_PROPERTY CGSize (^ sizeWithLimitSize) (CGSize limitSize);

SSDKCATEGORY_CHAIN_PROPERTY CGSize (^ sizeWithOutLimitSize) (void);

@end

SSDKCATEGORY_EXINTERFACE(UILabel, SSDKLabelChainModel)
NS_ASSUME_NONNULL_END
