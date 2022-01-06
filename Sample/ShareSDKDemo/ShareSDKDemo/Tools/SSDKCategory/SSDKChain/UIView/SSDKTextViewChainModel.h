//
//  SSDKTextViewChainModel.h
//  SSDKCategory
//
//  Created by maxl on 2018/12/27.
//  Copyright © 2018 mob. All rights reserved.
//

#import "SSDKBaseScrollViewChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class SSDKTextViewChainModel;
@interface SSDKTextViewChainModel : SSDKBaseScrollViewChainModel<SSDKTextViewChainModel *>

SSDKCATEGORY_CHAIN_PROPERTY SSDKTextViewChainModel *(^ delegate)(id<UITextViewDelegate> delegate);

SSDKCATEGORY_CHAIN_PROPERTY SSDKTextViewChainModel *(^ text)(NSString *text);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextViewChainModel *(^ font)(UIFont *font);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextViewChainModel *(^ textColor)(UIColor *textColor);

SSDKCATEGORY_CHAIN_PROPERTY SSDKTextViewChainModel *(^ textAlignment)(NSTextAlignment textAlignment);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextViewChainModel *(^ selectedRange)(NSRange numberOfLines);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextViewChainModel *(^ editable)(BOOL editable);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextViewChainModel *(^ selectable)(BOOL selectable);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextViewChainModel *(^ dataDetectorTypes)(UIDataDetectorTypes dataDetectorTypes);


SSDKCATEGORY_CHAIN_PROPERTY SSDKTextViewChainModel *(^ allowsEditingTextAttributes)(BOOL allowsEditingTextAttributes);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextViewChainModel *(^ attributedText)(NSAttributedString *attributedText);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextViewChainModel *(^ typingAttributes)(NSDictionary *typingAttributes);

SSDKCATEGORY_CHAIN_PROPERTY SSDKTextViewChainModel *(^ clearsOnInsertion)(BOOL clearsOnInsertion);

SSDKCATEGORY_CHAIN_PROPERTY SSDKTextViewChainModel *(^ textContainerInset)(UIEdgeInsets textContainerInset);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextViewChainModel *(^ linkTextAttributes)(NSDictionary *linkTextAttributes);
#pragma mark - UITextInputTraits -
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextViewChainModel *(^ autocapitalizationType)(UITextAutocapitalizationType autocapitalizationType);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextViewChainModel *(^ autocorrectionType)(UITextAutocorrectionType autocorrectionType);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextViewChainModel *(^ spellCheckingType)(UITextSpellCheckingType spellCheckingType);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextViewChainModel *(^ keyboardType)(UIKeyboardType keyboardType);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextViewChainModel *(^ keyboardAppearance)(UIKeyboardAppearance keyboardAppearance);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextViewChainModel *(^ returnKeyType)(UIReturnKeyType returnKeyType);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextViewChainModel *(^ enablesReturnKeyAutomatically)(BOOL enablesReturnKeyAutomatically);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextViewChainModel *(^ secureTextEntry)(BOOL secureTextEntry);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextViewChainModel *(^ textContentType)(UITextContentType textContentType) API_AVAILABLE(ios(10));
@end

SSDKCATEGORY_EXINTERFACE(UITextView, SSDKTextViewChainModel)
NS_ASSUME_NONNULL_END
