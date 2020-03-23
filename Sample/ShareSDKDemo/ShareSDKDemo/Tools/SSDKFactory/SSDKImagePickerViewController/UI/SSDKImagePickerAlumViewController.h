//
//  SSDKImagePickerAlumViewController.h
//  ShareSDKDemo
//
//  Created by PP on 2020/2/19.
//  Copyright © 2020 mob. All rights reserved.
//

#import "SSDKCommonViewController.h"
#import "SSDKImagePickerModel.h"
NS_ASSUME_NONNULL_BEGIN
@class SSDKImagePickerResult;
@interface SSDKImagePickerAlumViewController : SSDKCommonViewController

@property (nonatomic, strong, nullable) SSDKImagePickerModel *model;

@property (nonatomic, copy) void (^ complete) (SSDKImagePickerCompleteStatus status, SSDKImagePickerResult *result);

@end

NS_ASSUME_NONNULL_END
