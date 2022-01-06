//
//  SSDKUIDatePickerViewChainModel.m
//  SSDKCategory
//
//  Created by maxl on 2019/1/11.
//  Copyright © 2019 mob. All rights reserved.
//

#import "SSDKDatePickerViewChainModel.h"
#define SSDKCATEGORY_CHAIN_DATEPICKER_IMPLEMENTATION(SSDKMethod,SSDKParaType) SSDKCATEGORY_CHAIN_VIEWCLASS_IMPLEMENTATION(SSDKMethod,SSDKParaType, SSDKDatePickerViewChainModel *,UIDatePicker)
@implementation SSDKDatePickerViewChainModel
SSDKCATEGORY_CHAIN_DATEPICKER_IMPLEMENTATION(datePickerMode, UIDatePickerMode)
SSDKCATEGORY_CHAIN_DATEPICKER_IMPLEMENTATION(locale, NSLocale *)
SSDKCATEGORY_CHAIN_DATEPICKER_IMPLEMENTATION(calendar, NSCalendar *)
SSDKCATEGORY_CHAIN_DATEPICKER_IMPLEMENTATION(timeZone, NSTimeZone *)
SSDKCATEGORY_CHAIN_DATEPICKER_IMPLEMENTATION(date, NSDate *)
SSDKCATEGORY_CHAIN_DATEPICKER_IMPLEMENTATION(minimumDate, NSDate *)
SSDKCATEGORY_CHAIN_DATEPICKER_IMPLEMENTATION(maximumDate, NSDate *)
SSDKCATEGORY_CHAIN_DATEPICKER_IMPLEMENTATION(countDownDuration, NSTimeInterval)
SSDKCATEGORY_CHAIN_DATEPICKER_IMPLEMENTATION(minuteInterval, NSInteger)

- (SSDKDatePickerViewChainModel * _Nonnull (^)(NSDate * _Nonnull, BOOL))setDateWithAnimated{
    return ^ (NSDate *date, BOOL animated){
        [self enumerateObjectsUsingBlock:^(UIDatePicker * _Nonnull obj) {
            [obj setDate:date animated:animated];
        }];
        return self;
    };
}

@end
SSDKCATEGORY_VIEW_IMPLEMENTATION(UIDatePicker, SSDKDatePickerViewChainModel)
#undef SSDKCATEGORY_CHAIN_DATEPICKER_IMPLEMENTATION
