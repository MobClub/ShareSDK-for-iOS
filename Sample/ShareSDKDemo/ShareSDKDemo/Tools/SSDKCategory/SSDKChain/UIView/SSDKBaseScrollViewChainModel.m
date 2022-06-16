//
//  SSDKBaseScrollViewChainModel.m
//  SSDKCategory
//
//  Created by maxl on 2019/1/15.
//  Copyright © 2019 mob. All rights reserved.
//

#import "SSDKBaseScrollViewChainModel.h"
#import "UIScrollView+SSDKCategory.h"
#define SSDKCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(SSDKMethod,SSDKParaType) SSDKCATEGORY_CHAIN_VIEWCLASS_IMPLEMENTATION(SSDKMethod,SSDKParaType,  id ,UIScrollView)
@implementation SSDKBaseScrollViewChainModel
SSDKCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(delegate, id<UIScrollViewDelegate>)

- (id _Nonnull (^)(void))adJustedContentIOS11{
    return ^ (){
        if (@available(iOS 11.0, *)) {
            [self enumerateObjectsUsingBlock:^(UIScrollView * _Nonnull obj) {
                [obj adJustedContentIOS11];
            }];
        }
        return self;
    };
}

SSDKCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(contentSize, CGSize)
SSDKCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(contentOffset, CGPoint)
SSDKCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(contentInset, UIEdgeInsets)
SSDKCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(bounces, BOOL)
SSDKCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(alwaysBounceVertical, BOOL)
SSDKCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(alwaysBounceHorizontal, BOOL)
SSDKCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(pagingEnabled, BOOL)
SSDKCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(scrollEnabled, BOOL)
SSDKCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(showsHorizontalScrollIndicator, BOOL)
SSDKCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(showsVerticalScrollIndicator, BOOL)
SSDKCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(scrollsToTop, BOOL)
SSDKCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(indicatorStyle, BOOL)
SSDKCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(scrollIndicatorInsets, UIEdgeInsets)
SSDKCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(directionalLockEnabled, BOOL)
SSDKCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(minimumZoomScale, CGFloat)
SSDKCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(zoomScale, CGFloat)
SSDKCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(maximumZoomScale, CGFloat)

- (id  _Nonnull (^)(CGPoint, BOOL))contentOffsetAnimated{
    return ^ (CGPoint point, BOOL animated){
        [self enumerateObjectsUsingBlock:^(UIScrollView * _Nonnull obj) {
            [obj setContentOffset:point animated:animated];
        }];
        return self;
    };
}

- (id  _Nonnull (^)(CGRect, BOOL))contentOffsetToVisible{
    return ^ (CGRect rect, BOOL animated){
        [self enumerateObjectsUsingBlock:^(UIScrollView * _Nonnull obj) {
            [obj scrollRectToVisible:rect animated:animated];
        }];
        return self;
    };
}
@end
#undef SSDKCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION
