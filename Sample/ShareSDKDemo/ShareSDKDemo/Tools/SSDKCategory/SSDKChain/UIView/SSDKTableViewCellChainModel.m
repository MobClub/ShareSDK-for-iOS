//
//  SSDKTableViewCellChainModel.m
//  SSDKCategory
//
//  Created by maxl on 2018/12/28.
//  Copyright © 2018 mob. All rights reserved.
//

#import "SSDKTableViewCellChainModel.h"

#define SSDKCATEGORY_CHAIN_TABLEVIEWCELL_IMPLEMENTATION(SSDKMethod,SSDKParaType) SSDKCATEGORY_CHAIN_VIEWCLASS_IMPLEMENTATION(SSDKMethod,SSDKParaType, SSDKTableViewCellChainModel *,UITableViewCell)
@implementation SSDKTableViewCellChainModel

SSDKCATEGORY_CHAIN_TABLEVIEWCELL_IMPLEMENTATION(selectionStyle, UITableViewCellSelectionStyle)
SSDKCATEGORY_CHAIN_TABLEVIEWCELL_IMPLEMENTATION(accessoryType, UITableViewCellAccessoryType)
SSDKCATEGORY_CHAIN_TABLEVIEWCELL_IMPLEMENTATION(separatorInset, UIEdgeInsets)
SSDKCATEGORY_CHAIN_TABLEVIEWCELL_IMPLEMENTATION(editing, BOOL)
SSDKCATEGORY_CHAIN_TABLEVIEWCELL_IMPLEMENTATION(focusStyle, UITableViewCellFocusStyle)
SSDKCATEGORY_CHAIN_TABLEVIEWCELL_IMPLEMENTATION(userInteractionEnabledWhileDragging, BOOL)

- (SSDKTableViewCellChainModel * _Nonnull (^)(BOOL, BOOL))editingWithAnimated{
    return ^ (BOOL editing, BOOL animated){
        [self enumerateObjectsUsingBlock:^(UITableViewCell * _Nonnull obj) {
            [obj setEditing:editing animated:animated];
        }];
        return self;
    };
}
@end
SSDKCATEGORY_VIEW_IMPLEMENTATION(UITableViewCell, SSDKTableViewCellChainModel)
#undef SSDKCATEGORY_CHAIN_TABLEVIEWCELL_IMPLEMENTATION
