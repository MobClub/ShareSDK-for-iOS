//
//  SSDKImagePickerController.h
//  ShareSDKDemo
//
//  Created by PP on 2020/2/18.
//  Copyright © 2020 mob. All rights reserved.
//

#import "SSDKCommonViewController.h"

#import "SSDKImagePickerConfigure.h"
NS_ASSUME_NONNULL_BEGIN

@class SSDKImagePickerResult;

typedef void(^ SSDKImagePickerComplete)(SSDKImagePickerCompleteStatus status,  SSDKImagePickerResult *_Nullable result);

@interface SSDKImagePickerController : SSDKCommonViewController

- (instancetype)initWithConfigure:(SSDKImagePickerConfigure *)configure;

- (instancetype)initWithConfigureBlock:(void (^) (SSDKImagePickerConfigure *configure))block;

@property (nonatomic, strong, readonly) SSDKImagePickerConfigure *configure;

- (void)completeWithResult:(SSDKImagePickerComplete)result;

+ (UINavigationController *)initWithNavgationControllerConfigureBlock:(void (^) (SSDKImagePickerConfigure *configure))block result:(SSDKImagePickerComplete)result;

+ (UINavigationController *)initWithConfigure:(SSDKImagePickerConfigure *)configure result:(SSDKImagePickerComplete)result;

@end

NS_ASSUME_NONNULL_END
