//
//  SSDKSliderViewChainModel.m
//  SSDKCategory
//
//  Created by maxl on 2019/1/11.
//  Copyright © 2019 mob. All rights reserved.
//

#import "SSDKSliderViewChainModel.h"
#define SSDKCATEGORY_CHAIN_SLIDER_IMPLEMENTATION(SSDKMethod,SSDKParaType) SSDKCATEGORY_CHAIN_VIEWCLASS_IMPLEMENTATION(SSDKMethod,SSDKParaType, SSDKSliderViewChainModel *,UISlider)

#define SSDKCATEGORY_CHAIN_SLIDER_METHOND_IMPLEMENTATION(MehodName)\
- (SSDKSliderViewChainModel * _Nonnull (^)(UIImage * _Nonnull, UIControlState))MehodName{\
return ^ (UIImage *image, UIControlState state){\
    [(UISlider *)self.view MehodName:image forState:state];\
    return self;\
};\
}

SSDKCATEGORY_VIEW_IMPLEMENTATION(UISlider, SSDKSliderViewChainModel)
@implementation SSDKSliderViewChainModel
SSDKCATEGORY_CHAIN_SLIDER_IMPLEMENTATION(value ,float);
SSDKCATEGORY_CHAIN_SLIDER_IMPLEMENTATION(minimumValue ,float);
SSDKCATEGORY_CHAIN_SLIDER_IMPLEMENTATION(maximumValue ,float);
SSDKCATEGORY_CHAIN_SLIDER_IMPLEMENTATION(minimumValueImage ,UIImage *);
SSDKCATEGORY_CHAIN_SLIDER_IMPLEMENTATION(maximumValueImage, UIImage *);
SSDKCATEGORY_CHAIN_SLIDER_IMPLEMENTATION(continuous, BOOL);
SSDKCATEGORY_CHAIN_SLIDER_IMPLEMENTATION(minimumTrackTintColor, UIColor *);
SSDKCATEGORY_CHAIN_SLIDER_IMPLEMENTATION(maximumTrackTintColor ,UIColor *);
SSDKCATEGORY_CHAIN_SLIDER_IMPLEMENTATION(thumbTintColor ,UIColor *);

- (SSDKSliderViewChainModel * _Nonnull (^)(float, BOOL))setValueAnimated{
    return ^ (float v, BOOL a){
        [self enumerateObjectsUsingBlock:^(UISlider * _Nonnull obj) {
            [obj setValue:v animated:a];
        }];
        return self;
    };
}



SSDKCATEGORY_CHAIN_SLIDER_METHOND_IMPLEMENTATION(setThumbImage)
SSDKCATEGORY_CHAIN_SLIDER_METHOND_IMPLEMENTATION(setMinimumTrackImage);
SSDKCATEGORY_CHAIN_SLIDER_METHOND_IMPLEMENTATION(setMaximumTrackImage);

@end
#undef SSDKCATEGORY_CHAIN_SLIDER_IMPLEMENTATION
#undef SSDKCATEGORY_CHAIN_SLIDER_METHOND_IMPLEMENTATION
