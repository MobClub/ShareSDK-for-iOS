//
//  SSDKSliderViewChainModel.h
//  SSDKCategory
//
//  Created by maxl on 2019/1/11.
//  Copyright © 2019 mob. All rights reserved.
//

#import "SSDKBaseControlChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class SSDKSliderViewChainModel;
@interface SSDKSliderViewChainModel : SSDKBaseControlChainModel<SSDKSliderViewChainModel *>
SSDKCATEGORY_CHAIN_PROPERTY SSDKSliderViewChainModel * (^ value) (float value);
SSDKCATEGORY_CHAIN_PROPERTY SSDKSliderViewChainModel * (^ minimumValue) (float minimumValue);
SSDKCATEGORY_CHAIN_PROPERTY SSDKSliderViewChainModel * (^ maximumValue) (float maximumValue);
SSDKCATEGORY_CHAIN_PROPERTY SSDKSliderViewChainModel * (^ minimumValueImage) (UIImage * minimumValueImage);
SSDKCATEGORY_CHAIN_PROPERTY SSDKSliderViewChainModel * (^ maximumValueImage) (UIImage * maximumValueImage);
SSDKCATEGORY_CHAIN_PROPERTY SSDKSliderViewChainModel * (^ continuous) (BOOL continuous);
SSDKCATEGORY_CHAIN_PROPERTY SSDKSliderViewChainModel * (^ minimumTrackTintColor) (UIColor * minimumTrackTintColor);
SSDKCATEGORY_CHAIN_PROPERTY SSDKSliderViewChainModel * (^ maximumTrackTintColor) ( UIColor *maximumTrackTintColor);
SSDKCATEGORY_CHAIN_PROPERTY SSDKSliderViewChainModel * (^ thumbTintColor) (UIColor * thumbTintColor);
SSDKCATEGORY_CHAIN_PROPERTY SSDKSliderViewChainModel * (^ setThumbImage) (UIImage *image,UIControlState status);
SSDKCATEGORY_CHAIN_PROPERTY SSDKSliderViewChainModel * (^ setMinimumTrackImage) (UIImage *image,UIControlState status);
SSDKCATEGORY_CHAIN_PROPERTY SSDKSliderViewChainModel * (^ setMaximumTrackImage) (UIImage *image,UIControlState status);
SSDKCATEGORY_CHAIN_PROPERTY SSDKSliderViewChainModel * (^ setValueAnimated) (float value, BOOL animated);
@end

SSDKCATEGORY_EXINTERFACE(UISlider, SSDKSliderViewChainModel)
NS_ASSUME_NONNULL_END
