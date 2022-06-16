//
//  SSDKPickerViewChainModel.h
//  SSDKCategory
//
//  Created by maxl on 2019/1/11.
//  Copyright © 2019 mob. All rights reserved.
//

#import "SSDKBaseViewChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class SSDKPickerViewChainModel;
@interface SSDKPickerViewChainModel : SSDKBaseViewChainModel<SSDKPickerViewChainModel *>
SSDKCATEGORY_CHAIN_PROPERTY SSDKPickerViewChainModel * (^ dataSource) (id<UIPickerViewDataSource> dataSource);
SSDKCATEGORY_CHAIN_PROPERTY SSDKPickerViewChainModel * (^ delegate) (id<UIPickerViewDelegate> delegate);
SSDKCATEGORY_CHAIN_PROPERTY SSDKPickerViewChainModel * (^ showsSelectionIndicator) (BOOL showsSelectionIndicator);
SSDKCATEGORY_CHAIN_PROPERTY NSInteger (^ numberOfRowsInComponent) (NSInteger component);
SSDKCATEGORY_CHAIN_PROPERTY CGSize (^ rowSizeForComponent) (NSInteger component);
SSDKCATEGORY_CHAIN_PROPERTY UIView * (^ viewForRowComponent) (NSInteger row, NSInteger component);
SSDKCATEGORY_CHAIN_PROPERTY SSDKPickerViewChainModel * (^ reloadAllComponents) (void);
SSDKCATEGORY_CHAIN_PROPERTY SSDKPickerViewChainModel * (^ reloadComponent) (NSInteger component);
SSDKCATEGORY_CHAIN_PROPERTY SSDKPickerViewChainModel * (^ selectRowInComponent) (NSInteger row, NSInteger component, BOOL animated);
SSDKCATEGORY_CHAIN_PROPERTY NSInteger (^ selectedRowInComponent) (NSInteger component);

@end
SSDKCATEGORY_EXINTERFACE(UIPickerView, SSDKPickerViewChainModel)
NS_ASSUME_NONNULL_END
