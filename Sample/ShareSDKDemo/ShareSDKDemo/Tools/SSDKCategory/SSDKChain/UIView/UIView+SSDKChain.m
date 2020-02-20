//
//  UIView+SSDKChain.m
//  SSDKCategory
//
//  Created by maxl on 2018/12/27.
//  Copyright © 2018 mob. All rights reserved.
//

#import "UIView+SSDKChain.h"

#define SSDKCATEGORY_ADDVIEW(method, ModelClass, ViewClass)\
- (ModelClass * (^)(NSInteger tag))method    \
{   \
    return ^(NSInteger tag) {      \
        ViewClass *view = [[ViewClass alloc] init];       \
        [self addSubview:view];                            \
ModelClass *chainModel = [[ModelClass alloc] initWithTag:tag andView:view modelClass:[ViewClass class]]; \
        return chainModel;      \
    };      \
}
#define SSDKCATEGORY_ADDLAYER(method, ModelClass, LayerClass)\
- (ModelClass * _Nonnull (^)(void))method{\
return ^ (){\
    LayerClass *layer = [LayerClass layer];\
ModelClass *chainModel = [[ModelClass alloc] initWithLayer:layer modelClass:[LayerClass class]];\
    [self.layer addSublayer:layer];\
    return chainModel;\
};\
}


@implementation UIView (SSDKChain)

SSDKCATEGORY_ADDVIEW(addView, SSDKViewChainModel, UIView);
SSDKCATEGORY_ADDVIEW(addLabel, SSDKLabelChainModel, UILabel);
SSDKCATEGORY_ADDVIEW(addImageView, SSDKImageViewChainModel, UIImageView);
SSDKCATEGORY_ADDVIEW(addControl, SSDKControlChainModel, UIControl);
SSDKCATEGORY_ADDVIEW(addTextField, SSDKTextFieldChainModel, UITextField);
SSDKCATEGORY_ADDVIEW(addButton, SSDKButtonChainModel, UIButton);
SSDKCATEGORY_ADDVIEW(addSwitch, SSDKSwitchChainModel, UISwitch);
SSDKCATEGORY_ADDVIEW(addScrollView, SSDKScrollViewChainModel, UIScrollView);
SSDKCATEGORY_ADDVIEW(addTextView, SSDKTextViewChainModel, UITextView);
SSDKCATEGORY_ADDVIEW(addTableView, SSDKTableViewChainModel, UITableView);

- (SSDKCollectionViewChainModel * (^)(NSInteger tag))addCollectionView
{
    return ^(NSInteger tag) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumInteritemSpacing = layout.minimumLineSpacing = 0;
        layout.headerReferenceSize = layout.footerReferenceSize = CGSizeZero;
        layout.sectionInset = UIEdgeInsetsZero;
        UICollectionView *view = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        [self addSubview:view];
        SSDKCollectionViewChainModel *chainModel = [[SSDKCollectionViewChainModel alloc] initWithTag:tag andView:view modelClass:[UICollectionView class]];
        return chainModel;
    };
}

SSDKCATEGORY_ADDLAYER(addLayer, SSDKLayerChainModel, CALayer)
SSDKCATEGORY_ADDLAYER(addShaperLayer, SSDKShaperLayerChainModel, CAShapeLayer)
SSDKCATEGORY_ADDLAYER(addEmiiterLayer, SSDKEmiiterLayerChainModel, CAEmitterLayer)
SSDKCATEGORY_ADDLAYER(addScrollLayer, SSDKScrollLayerChainModel, CAScrollLayer)
SSDKCATEGORY_ADDLAYER(addTextLayer, SSDKTextLayerChainModel, CATextLayer)
SSDKCATEGORY_ADDLAYER(addTiledLayer, SSDKTiledLayerChainModel, CATiledLayer)
SSDKCATEGORY_ADDLAYER(addTransFormLayer, SSDKTransFormLayerChainModel, CATransformLayer)
SSDKCATEGORY_ADDLAYER(addGradientLayer, SSDKGradientLayerChainModel, CAGradientLayer)
SSDKCATEGORY_ADDLAYER(addReplicatorLayer, SSDKReplicatorLayerChainModel, CAReplicatorLayer)

@end
#undef SSDKCATEGORY_ADDVIEW
#undef SSDKCATEGORY_ADDLAYER
