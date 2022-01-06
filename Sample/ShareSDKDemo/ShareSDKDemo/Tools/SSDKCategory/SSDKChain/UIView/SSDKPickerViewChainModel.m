//
//  SSDKPickerViewChainModel.m
//  SSDKCategory
//
//  Created by maxl on 2019/1/11.
//  Copyright © 2019 mob. All rights reserved.
//

#import "SSDKPickerViewChainModel.h"
#define SSDKCATEGORY_CHAIN_PICKER_IMPLEMENTATION(SSDKMethod,SSDKParaType) SSDKCATEGORY_CHAIN_VIEWCLASS_IMPLEMENTATION(SSDKMethod,SSDKParaType, SSDKPickerViewChainModel *,UIPickerView)
SSDKCATEGORY_VIEW_IMPLEMENTATION(UIPickerView, SSDKPickerViewChainModel)
@implementation SSDKPickerViewChainModel
SSDKCATEGORY_CHAIN_PICKER_IMPLEMENTATION(dataSource, id<UIPickerViewDataSource>)
SSDKCATEGORY_CHAIN_PICKER_IMPLEMENTATION(delegate, id<UIPickerViewDelegate>)
SSDKCATEGORY_CHAIN_PICKER_IMPLEMENTATION(showsSelectionIndicator, BOOL)

- (NSInteger (^)(NSInteger))numberOfRowsInComponent{
    return ^ (NSInteger n){
        return [(UIPickerView *)self.view numberOfRowsInComponent:1];
    };
}

- (SSDKPickerViewChainModel * _Nonnull (^)(void))reloadAllComponents{
    return ^ (){
        [self enumerateObjectsUsingBlock:^(UIPickerView * _Nonnull obj) {
            [obj reloadAllComponents];
        }];
        return self;
    };
}

- (CGSize (^)(NSInteger))rowSizeForComponent{
    return ^ (NSInteger n){
        return [(UIPickerView *)self.view rowSizeForComponent:1];
    };
}

- (SSDKPickerViewChainModel * _Nonnull (^)(NSInteger))reloadComponent{
    return ^ (NSInteger n){
        [self enumerateObjectsUsingBlock:^(UIPickerView * _Nonnull obj) {
            [obj reloadComponent:n];
        }];
        
        return self;
    };
}

- (UIView * _Nonnull (^)(NSInteger, NSInteger))viewForRowComponent{
    return ^ (NSInteger n, NSInteger n1){
        return [(UIPickerView *)self.view viewForRow:n forComponent:n1];
    };
}

- (SSDKPickerViewChainModel * _Nonnull (^)(NSInteger, NSInteger, BOOL))selectRowInComponent{
    return ^ (NSInteger a, NSInteger b, BOOL c){
        [(UIPickerView *)self.view selectRow:a inComponent:b animated:c];
        return self;
    };
}

- (NSInteger (^)(NSInteger))selectedRowInComponent{
    return ^ (NSInteger n){
       return [(UIPickerView *)self.view selectedRowInComponent:1];
    };
}

@end
#undef SSDKCATEGORY_CHAIN_PICKER_IMPLEMENTATION
