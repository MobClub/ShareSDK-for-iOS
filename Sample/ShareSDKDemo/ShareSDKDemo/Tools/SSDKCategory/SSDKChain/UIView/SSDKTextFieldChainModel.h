//
//  SSDKTextFieldChainModel.h
//  SSDKCategory
//
//  Created by maxl on 2018/12/27.
//  Copyright © 2018 mob. All rights reserved.
//

#import "SSDKBaseControlChainModel.h"
NS_ASSUME_NONNULL_BEGIN

@class SSDKTextFieldChainModel;
@interface SSDKTextFieldChainModel : SSDKBaseControlChainModel<SSDKTextFieldChainModel*>

SSDKCATEGORY_CHAIN_PROPERTY SSDKTextFieldChainModel *(^ text)(NSString *text);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextFieldChainModel *(^ attributedText)(NSAttributedString *attributedText);

SSDKCATEGORY_CHAIN_PROPERTY SSDKTextFieldChainModel *(^ font)(UIFont *font);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextFieldChainModel *(^ textColor)(UIColor *textColor);

SSDKCATEGORY_CHAIN_PROPERTY SSDKTextFieldChainModel *(^ textAlignment)(NSTextAlignment textAlignment);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextFieldChainModel *(^ borderStyle)(UITextBorderStyle borderStyle);

SSDKCATEGORY_CHAIN_PROPERTY SSDKTextFieldChainModel *(^ defaultTextAttributes)(NSDictionary *defaultTextAttributes);

SSDKCATEGORY_CHAIN_PROPERTY SSDKTextFieldChainModel *(^ placeholder)(NSString *placeholder);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextFieldChainModel *(^ attributedPlaceholder)(NSAttributedString *attributedPlaceholder);

SSDKCATEGORY_CHAIN_PROPERTY SSDKTextFieldChainModel *(^ clearsOnBeginEditing)(BOOL clearsOnBeginEditing);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextFieldChainModel *(^ adjustsFontSizeToFitWidth)(BOOL adjustsFontSizeToFitWidth);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextFieldChainModel *(^ minimumFontSize)(CGFloat minimumFontSize);

SSDKCATEGORY_CHAIN_PROPERTY SSDKTextFieldChainModel *(^ delegate)(id<UITextFieldDelegate> delegate);

SSDKCATEGORY_CHAIN_PROPERTY SSDKTextFieldChainModel *(^ background)(UIImage *background);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextFieldChainModel *(^ disabledBackground)(UIImage *disabledBackground);

SSDKCATEGORY_CHAIN_PROPERTY SSDKTextFieldChainModel *(^ allowsEditingTextAttributes)(BOOL allowsEditingTextAttributes);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextFieldChainModel *(^ typingAttributes)(NSDictionary *typingAttributes);

SSDKCATEGORY_CHAIN_PROPERTY SSDKTextFieldChainModel *(^ clearButtonMode)(UITextFieldViewMode clearButtonMode);

SSDKCATEGORY_CHAIN_PROPERTY SSDKTextFieldChainModel *(^ leftView)(UIView *leftView);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextFieldChainModel *(^ leftViewMode)(UITextFieldViewMode leftViewMode);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextFieldChainModel *(^ rightView)(UIView *rightView);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextFieldChainModel *(^ rightViewMode)(UITextFieldViewMode rightViewMode);

SSDKCATEGORY_CHAIN_PROPERTY SSDKTextFieldChainModel *(^ limitLength) (NSUInteger limitLength);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextFieldChainModel *(^ inputView)(UIView *inputView);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextFieldChainModel *(^ inputAccessoryView)(UIView *inputAccessoryView);

SSDKCATEGORY_CHAIN_PROPERTY SSDKTextFieldChainModel *(^ placeholderFont)(UIFont *font);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextFieldChainModel *(^ placeholderColor)(UIColor *color);

#pragma mark - UITextInputTraits -
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextFieldChainModel *(^ autocapitalizationType)(UITextAutocapitalizationType autocapitalizationType);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextFieldChainModel *(^ autocorrectionType)(UITextAutocorrectionType autocorrectionType);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextFieldChainModel *(^ spellCheckingType)(UITextSpellCheckingType spellCheckingType);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextFieldChainModel *(^ keyboardType)(UIKeyboardType keyboardType);

SSDKCATEGORY_CHAIN_PROPERTY SSDKTextFieldChainModel *(^ keyboardAppearance)(UIKeyboardAppearance keyboardAppearance);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextFieldChainModel *(^ returnKeyType)(UIReturnKeyType returnKeyType);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextFieldChainModel *(^ enablesReturnKeyAutomatically)(BOOL enablesReturnKeyAutomatically);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextFieldChainModel *(^ secureTextEntry)(BOOL secureTextEntry);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextFieldChainModel *(^ textContentType)(UITextContentType textContentType) API_AVAILABLE(ios(10.0));

@end

SSDKCATEGORY_EXINTERFACE(UITextField, SSDKTextFieldChainModel)
NS_ASSUME_NONNULL_END
