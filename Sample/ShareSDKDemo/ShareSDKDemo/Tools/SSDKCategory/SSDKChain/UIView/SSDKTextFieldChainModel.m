//
//  SSDKTextFieldChainModel.m
//  SSDKCategory
//
//  Created by maxl on 2018/12/27.
//  Copyright © 2018 mob. All rights reserved.
//

#import "SSDKTextFieldChainModel.h"
#import "UITextField+SSDKCategory.h"
#define SSDKCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(SSDKMethod,SSDKParaType) SSDKCATEGORY_CHAIN_VIEWCLASS_IMPLEMENTATION(SSDKMethod,SSDKParaType, SSDKTextFieldChainModel *,UITextField)

@implementation SSDKTextFieldChainModel

SSDKCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(text, NSString *);
SSDKCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(attributedText, NSAttributedString *);

SSDKCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(font, UIFont *);
SSDKCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(textColor, UIColor *);

SSDKCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(textAlignment, NSTextAlignment);
SSDKCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(borderStyle, UITextBorderStyle);

SSDKCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(defaultTextAttributes, NSDictionary *);

SSDKCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(placeholder, NSString *);
SSDKCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(attributedPlaceholder, NSAttributedString *);

SSDKCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(keyboardType, UIKeyboardType);

SSDKCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(clearsOnBeginEditing, BOOL);
SSDKCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(adjustsFontSizeToFitWidth, BOOL);
SSDKCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(minimumFontSize, CGFloat);

SSDKCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(delegate, id<UITextFieldDelegate>);

SSDKCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(background, UIImage *);
SSDKCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(disabledBackground, UIImage *);

SSDKCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(allowsEditingTextAttributes, BOOL);
SSDKCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(typingAttributes, NSDictionary *);

SSDKCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(clearButtonMode, UITextFieldViewMode);
SSDKCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(leftView, UIView *);
SSDKCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(leftViewMode, UITextFieldViewMode);
SSDKCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(rightView, UIView *);
SSDKCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(rightViewMode, UITextFieldViewMode);
SSDKCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(limitLength, NSUInteger);
SSDKCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(inputView, UIView *);
SSDKCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(inputAccessoryView, UIView *);

#pragma mark - UITextInputTraits -
SSDKCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(autocapitalizationType, UITextAutocapitalizationType);
SSDKCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(autocorrectionType, UITextAutocorrectionType)
SSDKCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(spellCheckingType, UITextSpellCheckingType)

SSDKCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(keyboardAppearance, UIKeyboardAppearance);
SSDKCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(returnKeyType, UIReturnKeyType);
SSDKCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(enablesReturnKeyAutomatically, BOOL);
SSDKCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(secureTextEntry, BOOL);
SSDKCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(textContentType, UITextContentType);


- (SSDKTextFieldChainModel * _Nonnull (^)(UIFont * _Nonnull))placeholderFont{
    return ^(UIFont *font){
        [self enumerateObjectsUsingBlock:^(UITextField * _Nonnull obj) {
            [obj setValue:font forKeyPath:@"_placeholderLabel.font"];
        }];
        return self;
    };
}

- (SSDKTextFieldChainModel * _Nonnull (^)(UIColor * _Nonnull))placeholderColor{
    return ^(UIColor *color){
        [self enumerateObjectsUsingBlock:^(UITextField * _Nonnull obj) {
            [obj setValue:color forKeyPath:@"_placeholderLabel.textColor"];
        }];
        return self;
    };
}

@end
SSDKCATEGORY_VIEW_IMPLEMENTATION(UITextField, SSDKTextFieldChainModel)
#undef SSDKCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION
