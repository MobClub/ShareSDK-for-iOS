//
//  SSDKImagePickerResult.h
//  ShareSDKDemo
//
//  Created by PP on 2020/2/23.
//  Copyright © 2020 mob. All rights reserved.
//

#import "SSDKImagePickerObject.h"

NS_ASSUME_NONNULL_BEGIN
@class PHAsset,SSDKImagePickerChangeInfo,PHAsset;

@interface SSDKImagePickerResult : SSDKImagePickerObject

@property (nonatomic, strong, readonly) NSArray <PHAsset *>* selectedElements;

- (NSArray <PHAsset *>*)selectedElementsWithMediaType:(SSDKImagePickerMediaType)mediaType;

- (NSUInteger)indexOfObject:(PHAsset *)element;

- (NSInteger)minimumNumberOfSelectionType:(SSDKImagePickerMediaType)mediaType;

- (NSInteger)maximumNumberOfSelectionType:(SSDKImagePickerMediaType)mediaType;

- (NSInteger)countWithSelectionType:(SSDKImagePickerMediaType)mediaType;

- (SSDKImagePickerOperationChooseResultStatus)chooseStatusWithMediaType:(SSDKImagePickerMediaType)mediaType;



@end



NS_ASSUME_NONNULL_END
