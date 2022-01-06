//
//  SSDKSegmentedControlChainModel.h
//  SSDKCategory
//
//  Created by maxl on 2019/1/11.
//  Copyright © 2019 mob. All rights reserved.
//

#import "SSDKBaseControlChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class SSDKSegmentedControlChainModel;
@interface SSDKSegmentedControlChainModel : SSDKBaseControlChainModel<SSDKSegmentedControlChainModel *>
SSDKCATEGORY_CHAIN_PROPERTY SSDKSegmentedControlChainModel* (^ momentary) (BOOL momentary);
SSDKCATEGORY_CHAIN_PROPERTY SSDKSegmentedControlChainModel* (^ apportionsSegmentWidthsByContent) (BOOL apportionsSegmentWidthsByContent);
SSDKCATEGORY_CHAIN_PROPERTY SSDKSegmentedControlChainModel* (^ removeAllSegments) (void);
SSDKCATEGORY_CHAIN_PROPERTY SSDKSegmentedControlChainModel* (^ insertSegmentWithTitle) (NSString * title, NSUInteger index, BOOL animated);
SSDKCATEGORY_CHAIN_PROPERTY SSDKSegmentedControlChainModel* (^ insertSegmentWithImage) (UIImage * image, NSUInteger index, BOOL animated);
SSDKCATEGORY_CHAIN_PROPERTY SSDKSegmentedControlChainModel* (^ removeSegmentAtIndex) (NSUInteger index);
SSDKCATEGORY_CHAIN_PROPERTY SSDKSegmentedControlChainModel* (^ setTitle) (NSString *title, NSUInteger index);
SSDKCATEGORY_CHAIN_PROPERTY SSDKSegmentedControlChainModel* (^ setImage) (UIImage *image, NSUInteger index);
SSDKCATEGORY_CHAIN_PROPERTY SSDKSegmentedControlChainModel* (^ setWidth) (CGFloat width, NSUInteger index);
SSDKCATEGORY_CHAIN_PROPERTY SSDKSegmentedControlChainModel* (^ setContentOffset) (CGSize offset, NSUInteger index);
SSDKCATEGORY_CHAIN_PROPERTY SSDKSegmentedControlChainModel* (^ setEnabled) (BOOL enable, NSUInteger index);
SSDKCATEGORY_CHAIN_PROPERTY SSDKSegmentedControlChainModel* (^ selectedSegmentIndex) (NSInteger selectedSegmentIndex);
SSDKCATEGORY_CHAIN_PROPERTY SSDKSegmentedControlChainModel* (^ setBackgroundImage) (UIImage *image, UIControlState state, UIBarMetrics barMetrics);
SSDKCATEGORY_CHAIN_PROPERTY SSDKSegmentedControlChainModel* (^ setDividerImage) (UIImage *image, UIControlState leftState, UIControlState rightState, UIBarMetrics barMetrics);
SSDKCATEGORY_CHAIN_PROPERTY SSDKSegmentedControlChainModel* (^ setTitleTextAttributes) (NSDictionary <NSAttributedStringKey ,id>* attributes, UIControlState state);
SSDKCATEGORY_CHAIN_PROPERTY SSDKSegmentedControlChainModel* (^ setContentPositionAdjustment) (UIOffset adjustment, UISegmentedControlSegment leftCenterRightOrAlone, UIBarMetrics barMetrics);

@end

SSDKCATEGORY_EXINTERFACE(UISegmentedControl, SSDKSegmentedControlChainModel)
NS_ASSUME_NONNULL_END
