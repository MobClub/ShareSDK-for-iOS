//
//  SSDKTableViewChainModel.h
//  SSDKCategory
//
//  Created by maxl on 2018/12/27.
//  Copyright © 2018 mob. All rights reserved.
//

#import "SSDKBaseScrollViewChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class SSDKTableViewChainModel;
@interface SSDKTableViewChainModel : SSDKBaseScrollViewChainModel<SSDKTableViewChainModel *>

SSDKCATEGORY_CHAIN_PROPERTY SSDKTableViewChainModel * (^ delegate) (id <UITableViewDelegate> delegate);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTableViewChainModel * (^ dataSource) (id <UITableViewDataSource> dataSource);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTableViewChainModel * (^ adJustedContentIOS11)(void);

SSDKCATEGORY_CHAIN_PROPERTY SSDKTableViewChainModel *(^ rowHeight)(CGFloat rowHeight);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTableViewChainModel *(^ sectionHeaderHeight)(CGFloat sectionHeaderHeight);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTableViewChainModel *(^ sectionFooterHeight)(CGFloat sectionFooterHeight);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTableViewChainModel *(^ estimatedRowHeight)(CGFloat estimatedRowHeight);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTableViewChainModel *(^ estimatedSectionHeaderHeight)(CGFloat estimatedSectionHeaderHeight);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTableViewChainModel *(^ estimatedSectionFooterHeight)(CGFloat estimatedSectionFooterHeight);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTableViewChainModel *(^ separatorInset)(UIEdgeInsets separatorInset);

SSDKCATEGORY_CHAIN_PROPERTY SSDKTableViewChainModel *(^ editing)(BOOL editing);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTableViewChainModel *(^ allowsSelection)(BOOL allowsSelection);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTableViewChainModel *(^ allowsMultipleSelection)(BOOL allowsMultipleSelection);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTableViewChainModel *(^ allowsSelectionDuringEditing)(BOOL allowsSelectionDuringEditing);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTableViewChainModel *(^ allowsMultipleSelectionDuringEditing)(BOOL allowsMultipleSelectionDuringEditing);

SSDKCATEGORY_CHAIN_PROPERTY SSDKTableViewChainModel *(^ separatorStyle)(UITableViewCellSeparatorStyle separatorStyle);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTableViewChainModel *(^ separatorColor)(UIColor *separatorColor);

SSDKCATEGORY_CHAIN_PROPERTY SSDKTableViewChainModel *(^ tableHeaderView)(UIView * tableHeaderView);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTableViewChainModel *(^ tableFooterView)(UIView * tableFooterView);

SSDKCATEGORY_CHAIN_PROPERTY SSDKTableViewChainModel *(^ sectionIndexBackgroundColor)(UIColor *sectionIndexBackgroundColor);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTableViewChainModel *(^ sectionIndexColor)(UIColor *sectionIndexColor);

SSDKCATEGORY_CHAIN_PROPERTY SSDKTableViewChainModel *(^ registerCellClass)(Class cellClass, NSString *identifier);

SSDKCATEGORY_CHAIN_PROPERTY SSDKTableViewChainModel *(^ registerCellNib)(UINib * nib, NSString *identifier);

SSDKCATEGORY_CHAIN_PROPERTY SSDKTableViewChainModel *(^ registerViewClass)(Class viewClass, NSString *identifier);

SSDKCATEGORY_CHAIN_PROPERTY SSDKTableViewChainModel *(^ registerViewNib)(UINib * viewNib, NSString *identifier);

@end

static inline UITableView * UITableViewCreateWithStyle(UITableViewStyle style){
    return [[UITableView alloc]initWithFrame:CGRectZero style:style];
}
SSDKCATEGORY_EXINTERFACE(UITableView, SSDKTableViewChainModel)
NS_ASSUME_NONNULL_END
