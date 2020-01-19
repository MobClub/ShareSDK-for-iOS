//
//  SSDKTableViewChainModel.m
//  SSDKCategory
//
//  Created by maxl on 2018/12/27.
//  Copyright © 2018 mob. All rights reserved.
//

#import "SSDKTableViewChainModel.h"
#import "UIScrollView+SSDKCategory.h"
#define SSDKCATEGORY_CHAIN_TABLEVIEW_IMPLEMENTATION(SSDKMethod,SSDKParaType) SSDKCATEGORY_CHAIN_VIEWCLASS_IMPLEMENTATION(SSDKMethod,SSDKParaType, SSDKTableViewChainModel *,UITableView)
@implementation SSDKTableViewChainModel


SSDKCATEGORY_CHAIN_TABLEVIEW_IMPLEMENTATION(delegate, id<UITableViewDelegate>)
SSDKCATEGORY_CHAIN_TABLEVIEW_IMPLEMENTATION(dataSource, id<UITableViewDataSource>)
- (SSDKTableViewChainModel * _Nonnull (^)(void))adJustedContentIOS11{
    return ^ (){
        if (@available(iOS 11.0, *)) {
            [(UIScrollView *)self.view adJustedContentIOS11];
        }
        return self;
    };
}

SSDKCATEGORY_CHAIN_TABLEVIEW_IMPLEMENTATION(rowHeight, CGFloat)
SSDKCATEGORY_CHAIN_TABLEVIEW_IMPLEMENTATION(sectionHeaderHeight, CGFloat)
SSDKCATEGORY_CHAIN_TABLEVIEW_IMPLEMENTATION(sectionFooterHeight, CGFloat)
SSDKCATEGORY_CHAIN_TABLEVIEW_IMPLEMENTATION(estimatedRowHeight, CGFloat)
SSDKCATEGORY_CHAIN_TABLEVIEW_IMPLEMENTATION(estimatedSectionHeaderHeight, CGFloat)
SSDKCATEGORY_CHAIN_TABLEVIEW_IMPLEMENTATION(estimatedSectionFooterHeight, CGFloat)
SSDKCATEGORY_CHAIN_TABLEVIEW_IMPLEMENTATION(separatorInset, UIEdgeInsets)
SSDKCATEGORY_CHAIN_TABLEVIEW_IMPLEMENTATION(editing, BOOL)
SSDKCATEGORY_CHAIN_TABLEVIEW_IMPLEMENTATION(allowsSelection, BOOL)
SSDKCATEGORY_CHAIN_TABLEVIEW_IMPLEMENTATION(allowsMultipleSelection, BOOL)
SSDKCATEGORY_CHAIN_TABLEVIEW_IMPLEMENTATION(allowsSelectionDuringEditing, BOOL)
SSDKCATEGORY_CHAIN_TABLEVIEW_IMPLEMENTATION(allowsMultipleSelectionDuringEditing, BOOL)
SSDKCATEGORY_CHAIN_TABLEVIEW_IMPLEMENTATION(separatorStyle, UITableViewCellSeparatorStyle)
SSDKCATEGORY_CHAIN_TABLEVIEW_IMPLEMENTATION(separatorColor, UIColor *)
SSDKCATEGORY_CHAIN_TABLEVIEW_IMPLEMENTATION(tableHeaderView, UIView *)
SSDKCATEGORY_CHAIN_TABLEVIEW_IMPLEMENTATION(tableFooterView, UIView *)
SSDKCATEGORY_CHAIN_TABLEVIEW_IMPLEMENTATION(sectionIndexBackgroundColor, UIColor *)
SSDKCATEGORY_CHAIN_TABLEVIEW_IMPLEMENTATION(sectionIndexColor, UIColor *)

- (SSDKTableViewChainModel * _Nonnull (^)(UINib * _Nonnull, NSString * _Nonnull))registerCellNib{
    return ^ (UINib *nib, NSString *identifier){
        [(UITableView *)self.view registerNib:nib forCellReuseIdentifier:identifier];
        return self;
    };
}

- (SSDKTableViewChainModel * _Nonnull (^)(UINib * _Nonnull, NSString * _Nonnull))registerViewNib{
    return ^ (UINib *nib, NSString *identifier){
        [(UITableView *)self.view registerNib:nib forHeaderFooterViewReuseIdentifier:identifier];
        return self;
    };
}

- (SSDKTableViewChainModel * _Nonnull (^)(Class  _Nonnull __unsafe_unretained, NSString * _Nonnull))registerCellClass{
    return ^ (Class class, NSString *identifier){
        [(UITableView *)self.view registerClass:class forCellReuseIdentifier:identifier];
        return self;
    };
}

- (SSDKTableViewChainModel * _Nonnull (^)(Class  _Nonnull __unsafe_unretained, NSString * _Nonnull))registerViewClass{
    return ^ (Class class, NSString *identifier){
        [(UITableView *)self.view registerClass:class forHeaderFooterViewReuseIdentifier:identifier];
        
        return self;
    };
}

@end
SSDKCATEGORY_VIEW_IMPLEMENTATION(UITableView, SSDKTableViewChainModel)
#undef SSDKCATEGORY_CHAIN_TABLEVIEW_IMPLEMENTATION
