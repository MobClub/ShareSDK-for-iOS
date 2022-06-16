//
//  SSDKCollectionViewChainModel.h
//  SSDKCategory
//
//  Created by maxl on 2018/12/27.
//  Copyright © 2018 mob. All rights reserved.
//

#import "SSDKBaseScrollViewChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class SSDKCollectionViewChainModel;
@interface SSDKCollectionViewChainModel : SSDKBaseScrollViewChainModel<SSDKCollectionViewChainModel *>

SSDKCATEGORY_CHAIN_PROPERTY SSDKCollectionViewChainModel *(^ collectionViewLayout)(UICollectionViewLayout *collectionViewLayout);
SSDKCATEGORY_CHAIN_PROPERTY SSDKCollectionViewChainModel *(^ delegate)(id<UICollectionViewDelegate> delegate);
SSDKCATEGORY_CHAIN_PROPERTY SSDKCollectionViewChainModel *(^ dataSource)(id<UICollectionViewDataSource> dataSource);
SSDKCATEGORY_CHAIN_PROPERTY SSDKCollectionViewChainModel *(^ allowsSelection)(BOOL allowsSelection);

SSDKCATEGORY_CHAIN_PROPERTY SSDKCollectionViewChainModel *(^ allowsMultipleSelection)(BOOL allowsMultipleSelection);

SSDKCATEGORY_CHAIN_PROPERTY SSDKCollectionViewChainModel *(^ registerCellClass)(Class cellClass, NSString *identifier);

SSDKCATEGORY_CHAIN_PROPERTY SSDKCollectionViewChainModel *(^ registerCellNib)(UINib * nib, NSString *identifier);

SSDKCATEGORY_CHAIN_PROPERTY SSDKCollectionViewChainModel *(^ registerViewClass)(Class viewClass, NSString *identifier, NSString *kind);

SSDKCATEGORY_CHAIN_PROPERTY SSDKCollectionViewChainModel *(^ registerViewNib)(UINib * viewNib, NSString *identifier, NSString *kind);

SSDKCATEGORY_CHAIN_PROPERTY SSDKCollectionViewChainModel * (^ adJustedContentIOS11)(void);
SSDKCATEGORY_CHAIN_PROPERTY SSDKCollectionViewChainModel * (^ reloadData)(void);
@end

static inline UICollectionView *UICollectionViewCreateWithLayout(UICollectionViewFlowLayout *layout){
    return [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
}
SSDKCATEGORY_EXINTERFACE_(UICollectionView, SSDKCollectionViewChainModel)
NS_ASSUME_NONNULL_END
