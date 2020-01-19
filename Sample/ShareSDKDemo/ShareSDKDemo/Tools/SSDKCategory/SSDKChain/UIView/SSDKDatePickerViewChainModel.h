//
//  SSDKUIDatePickerViewChainModel.h
//  SSDKCategory
//
//  Created by maxl on 2019/1/11.
//  Copyright © 2019 mob. All rights reserved.
//

#import "SSDKBaseControlChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class SSDKDatePickerViewChainModel;
@interface SSDKDatePickerViewChainModel : SSDKBaseControlChainModel<SSDKDatePickerViewChainModel *>
SSDKCATEGORY_CHAIN_PROPERTY SSDKDatePickerViewChainModel * (^ datePickerMode) (UIDatePickerMode datePickerMode);
SSDKCATEGORY_CHAIN_PROPERTY SSDKDatePickerViewChainModel * (^ locale) (NSLocale* locale);
SSDKCATEGORY_CHAIN_PROPERTY SSDKDatePickerViewChainModel * (^ calendar) (NSCalendar* calendar);
SSDKCATEGORY_CHAIN_PROPERTY SSDKDatePickerViewChainModel * (^ timeZone) (NSTimeZone* timeZone);
SSDKCATEGORY_CHAIN_PROPERTY SSDKDatePickerViewChainModel * (^ date) (NSDate * date);
SSDKCATEGORY_CHAIN_PROPERTY SSDKDatePickerViewChainModel * (^ minimumDate) (NSDate * minimumDate);
SSDKCATEGORY_CHAIN_PROPERTY SSDKDatePickerViewChainModel * (^ maximumDate) (NSDate * maximumDate);
SSDKCATEGORY_CHAIN_PROPERTY SSDKDatePickerViewChainModel * (^ countDownDuration) (NSTimeInterval countDownDuration);
SSDKCATEGORY_CHAIN_PROPERTY SSDKDatePickerViewChainModel * (^ minuteInterval) (NSInteger minuteInterval);
SSDKCATEGORY_CHAIN_PROPERTY SSDKDatePickerViewChainModel * (^ setDateWithAnimated) (NSDate *date, BOOL animated);

@end

SSDKCATEGORY_EXINTERFACE(UIDatePicker, SSDKDatePickerViewChainModel)

NS_ASSUME_NONNULL_END
