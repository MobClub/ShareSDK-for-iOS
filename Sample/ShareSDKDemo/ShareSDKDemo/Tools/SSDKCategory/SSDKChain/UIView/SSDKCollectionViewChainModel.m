//
//  SSDKCollectionViewChainModel.m
//  SSDKCategory
//
//  Created by maxl on 2018/12/27.
//  Copyright © 2018 mob. All rights reserved.
//

#import "SSDKCollectionViewChainModel.h"
#define SSDKCATEGORY_CHAIN_COLLECTIONVIEW_IMPLEMENTATION(SSDKMethod,SSDKParaType) SSDKCATEGORY_CHAIN_VIEWCLASS_IMPLEMENTATION(SSDKMethod,SSDKParaType, SSDKCollectionViewChainModel *,UICollectionView)
@implementation SSDKCollectionViewChainModel

SSDKCATEGORY_CHAIN_COLLECTIONVIEW_IMPLEMENTATION(collectionViewLayout, UICollectionViewLayout *)
SSDKCATEGORY_CHAIN_COLLECTIONVIEW_IMPLEMENTATION(delegate, id<UICollectionViewDelegate>)
SSDKCATEGORY_CHAIN_COLLECTIONVIEW_IMPLEMENTATION(dataSource, id<UICollectionViewDataSource>)

SSDKCATEGORY_CHAIN_COLLECTIONVIEW_IMPLEMENTATION(allowsSelection, BOOL)
SSDKCATEGORY_CHAIN_COLLECTIONVIEW_IMPLEMENTATION(allowsMultipleSelection, BOOL)

- (SSDKCollectionViewChainModel * _Nonnull (^)(void))adJustedContentIOS11{
    return ^ (){
        if (@available(iOS 11.0, *)) {
            [self enumerateObjectsUsingBlock:^(UICollectionView * _Nonnull obj) {
                [obj setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
            }];
        }
        return self;
    };
}

- (SSDKCollectionViewChainModel * _Nonnull (^)(UINib * _Nonnull, NSString * _Nonnull))registerCellNib{
    return ^ (UINib *nib, NSString *identifier){
        [self enumerateObjectsUsingBlock:^(UICollectionView * _Nonnull obj) {
            [obj registerNib:nib forCellWithReuseIdentifier:identifier];
        }];
        return self;
    };
}

- (SSDKCollectionViewChainModel * _Nonnull (^)(Class  _Nonnull __unsafe_unretained, NSString * _Nonnull))registerCellClass{
    return ^ (Class class, NSString *identifier){
        [self enumerateObjectsUsingBlock:^(UICollectionView * _Nonnull obj) {
            [obj registerClass:class forCellWithReuseIdentifier:identifier];
        }];
        return self;
    };
}

- (SSDKCollectionViewChainModel * _Nonnull (^)(Class  _Nonnull __unsafe_unretained, NSString * _Nonnull, NSString * _Nonnull))registerViewClass{
    return ^ (Class class, NSString *identifier, NSString *kind){
        [(UICollectionView *)self.view registerClass:class forSupplementaryViewOfKind:kind withReuseIdentifier:identifier];
        return self;
    };
}
- (SSDKCollectionViewChainModel * _Nonnull (^)(UINib * _Nonnull, NSString * _Nonnull, NSString * _Nonnull))registerViewNib{
    return ^ (UINib * nib, NSString *identifier, NSString *kind){
        [(UICollectionView *)self.view registerNib:nib forSupplementaryViewOfKind:kind withReuseIdentifier:identifier];
        return self;
    };
}

- (SSDKCollectionViewChainModel * _Nonnull (^)(void))reloadData{
    return ^ (){
        [CATransaction begin];
        [CATransaction setDisableActions:YES];
        [(UICollectionView *)self.view reloadData];
        [CATransaction commit];
        
        return self;
    };
}

@end
SSDKCATEGORY_VIEW_IMPLEMENTATION(UICollectionView, SSDKCollectionViewChainModel)
#undef SSDKCATEGORY_CHAIN_COLLECTIONVIEW_IMPLEMENTATION
