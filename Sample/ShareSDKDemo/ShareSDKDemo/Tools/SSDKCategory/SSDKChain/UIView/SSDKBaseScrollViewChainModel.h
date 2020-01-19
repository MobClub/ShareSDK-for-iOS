//
//  SSDKBaseScrollViewChainModel.h
//  SSDKCategory
//
//  Created by maxl on 2019/1/15.
//  Copyright © 2019 mob. All rights reserved.
//

#import "SSDKBaseViewChainModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SSDKBaseScrollViewChainModel <__covariant ObjectType>: SSDKBaseViewChainModel<ObjectType>
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ contentSize) (CGSize contentSize);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ contentOffset) (CGPoint contentOffset);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ contentInset) (UIEdgeInsets contentInset);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ bounces) (BOOL bounces);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ alwaysBounceVertical) (BOOL alwaysBounceVertical);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ alwaysBounceHorizontal) (BOOL alwaysBounceHorizontal);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ pagingEnabled) (BOOL pagingEnabled);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ scrollEnabled) (BOOL scrollEnabled);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ showsHorizontalScrollIndicator) (BOOL showsHorizontalScrollIndicator);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ showsVerticalScrollIndicator) (BOOL showsVerticalScrollIndicator);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ scrollsToTop) (BOOL scrollsToTop);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ indicatorStyle) (BOOL indicatorStyle);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ scrollIndicatorInsets) (UIEdgeInsets scrollIndicatorInsets);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ directionalLockEnabled) (BOOL directionalLockEnabled);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ minimumZoomScale) (CGFloat minimumZoomScale);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ maximumZoomScale) (CGFloat maximumZoomScale);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ zoomScale) (CGFloat zoomScale);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ contentOffsetAnimated)(CGPoint point, BOOL animated);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ contentOffsetToVisible)(CGRect rect, BOOL animated);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ delegate) (id <UIScrollViewDelegate> delegate);
SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ adJustedContentIOS11)(void);
@end

NS_ASSUME_NONNULL_END
