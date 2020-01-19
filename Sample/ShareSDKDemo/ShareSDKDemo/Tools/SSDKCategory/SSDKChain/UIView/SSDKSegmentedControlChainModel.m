//
//  SSDKSegmentedControlChainModel.m
//  SSDKCategory
//
//  Created by maxl on 2019/1/11.
//  Copyright © 2019 mob. All rights reserved.
//

#import "SSDKSegmentedControlChainModel.h"
#define SSDKCATEGORY_CHAIN_SEGMENT_IMPLEMENTATION(SSDKMethod,SSDKParaType) SSDKCATEGORY_CHAIN_VIEWCLASS_IMPLEMENTATION(SSDKMethod,SSDKParaType, SSDKSegmentedControlChainModel *,UISegmentedControl)
SSDKCATEGORY_VIEW_IMPLEMENTATION(UISegmentedControl, SSDKSegmentedControlChainModel)

#define SSDKCATEGORY_CHAIN_SEGMENT_METHOD_IMPLEMENTATION(SSDKTYPE,METHOD)\
- (SSDKSegmentedControlChainModel * _Nonnull (^)(SSDKTYPE, NSUInteger))METHOD{\
    return ^ (SSDKTYPE t, NSUInteger i){\
        [(UISegmentedControl *)self.view METHOD:t forSegmentAtIndex:i];\
        return self;\
    };\
}\

@implementation SSDKSegmentedControlChainModel

SSDKCATEGORY_CHAIN_SEGMENT_IMPLEMENTATION(momentary, BOOL)
SSDKCATEGORY_CHAIN_SEGMENT_IMPLEMENTATION(apportionsSegmentWidthsByContent, BOOL)

- (SSDKSegmentedControlChainModel * _Nonnull (^)(void))removeAllSegments{
    return ^ (){
        [(UISegmentedControl *)self.view removeAllSegments];
        return self;
    };
}
SSDKCATEGORY_CHAIN_SEGMENT_METHOD_IMPLEMENTATION(NSString * , setTitle)
SSDKCATEGORY_CHAIN_SEGMENT_METHOD_IMPLEMENTATION(UIImage * , setImage)
SSDKCATEGORY_CHAIN_SEGMENT_METHOD_IMPLEMENTATION(CGFloat , setWidth)
SSDKCATEGORY_CHAIN_SEGMENT_METHOD_IMPLEMENTATION(CGSize, setContentOffset)
SSDKCATEGORY_CHAIN_SEGMENT_METHOD_IMPLEMENTATION(BOOL , setEnabled)
SSDKCATEGORY_CHAIN_SEGMENT_IMPLEMENTATION(selectedSegmentIndex, NSInteger)

- (SSDKSegmentedControlChainModel * _Nonnull (^)(UIImage * _Nonnull, UIControlState, UIBarMetrics))setBackgroundImage{
    return ^ (UIImage * _Nonnull a , UIControlState b, UIBarMetrics c){
        [(UISegmentedControl *)self.view setBackgroundImage:a forState:b barMetrics:c];
        return self;
    };
}

- (SSDKSegmentedControlChainModel * _Nonnull (^)(UIImage * _Nonnull, UIControlState, UIControlState, UIBarMetrics))setDividerImage{
    return ^ (UIImage * _Nonnull a , UIControlState b, UIControlState b1, UIBarMetrics c){
        [(UISegmentedControl *)self.view setDividerImage:a forLeftSegmentState:b rightSegmentState:b1 barMetrics:c];
        return self;
    };
}

- (SSDKSegmentedControlChainModel * _Nonnull (^)(NSDictionary<NSAttributedStringKey,id> * _Nonnull, UIControlState))setTitleTextAttributes{
    return ^ (NSDictionary<NSAttributedStringKey,id> * _Nonnull a, UIControlState b){
        [(UISegmentedControl *)self.view setTitleTextAttributes:a forState:b];
        return self;
    };
}


- (SSDKSegmentedControlChainModel * _Nonnull (^)(UIOffset, UISegmentedControlSegment, UIBarMetrics))setContentPositionAdjustment{
    return ^ (UIOffset a, UISegmentedControlSegment b, UIBarMetrics c){
        [(UISegmentedControl *)self.view setContentPositionAdjustment:a forSegmentType:b barMetrics:c];
        return self;
    };
}

@end
#undef SSDKCATEGORY_CHAIN_SEGMENT_IMPLEMENTATION
#undef SSDKCATEGORY_CHAIN_SEGMENT_METHOD_IMPLEMENTATION
