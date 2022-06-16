//
//  SSDKTableViewCellChainModel.h
//  SSDKCategory
//
//  Created by maxl on 2018/12/28.
//  Copyright © 2018 mob. All rights reserved.
//

#import "SSDKBaseViewChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class SSDKTableViewCellChainModel;

@interface SSDKTableViewCellChainModel : SSDKBaseViewChainModel<SSDKTableViewCellChainModel *>
SSDKCATEGORY_CHAIN_PROPERTY SSDKTableViewCellChainModel * (^ selectionStyle) (UITableViewCellSelectionStyle selectionStyle);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTableViewCellChainModel * (^ accessoryType) (UITableViewCellAccessoryType selectionStyle);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTableViewCellChainModel * (^ separatorInset) (UIEdgeInsets separatorInset);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTableViewCellChainModel * (^ editing) (BOOL editing);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTableViewCellChainModel * (^ editingWithAnimated) (BOOL editing, BOOL animated);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTableViewCellChainModel * (^ focusStyle)(UITableViewCellFocusStyle focusStyle) API_AVAILABLE(ios(9.0));
SSDKCATEGORY_CHAIN_PROPERTY SSDKTableViewCellChainModel * (^ userInteractionEnabledWhileDragging)(BOOL userInteractionEnabledWhileDragging) API_AVAILABLE(ios(11.0));

@end

static inline UITableViewCell * UITableViewCellCreateWithStyleAndIndentify(UITableViewCellStyle style, NSString *identifier){
    return [[UITableViewCell alloc] initWithStyle:style reuseIdentifier:identifier];
}

SSDKCATEGORY_EXINTERFACE(UITableViewCell, SSDKTableViewCellChainModel)
NS_ASSUME_NONNULL_END
