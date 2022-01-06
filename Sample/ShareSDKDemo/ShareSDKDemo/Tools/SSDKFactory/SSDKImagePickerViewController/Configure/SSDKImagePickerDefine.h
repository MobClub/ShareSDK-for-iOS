//
//  SSDKImagePickerDefine.h
//  ShareSDKDemo
//
//  Created by PP on 2020/2/22.
//  Copyright © 2020 mob. All rights reserved.
//
#ifndef SSDKImagePickerDefine_h
#define SSDKImagePickerDefine_h
#import <Photos/Photos.h>
NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, SSDKImagePickerAseetMediaType) {
    SSDKImagePickerAseetMediaTypeImage,
    SSDKImagePickerAseetMediaTypeGif,
    SSDKImagePickerAseetMediaTypeVideo,
    SSDKImagePickerAseetMediaTypeAudio,
    SSDKImagePickerAseetMediaTypeUnknown
};

typedef enum : NSUInteger {
    SSDKImagePickerMediaTypeBoth,
    SSDKImagePickerMediaTypeImage,
    SSDKImagePickerMediaTypeVideo
} SSDKImagePickerMediaType;


typedef NS_ENUM(NSUInteger, SSDKImagePickerSortType) {
    SSDKImagePickerSortTypeDefault = NSOrderedSame,//默认升序，
    SSDKImagePickerSortTypeAscending = NSOrderedAscending,//升序
    SSDKImagePickerSortTypeDescending = NSOrderedDescending,//降序
};

typedef NS_ENUM(NSUInteger, SSDKImagePickerCompleteStatus) {
    SSDKImagePickerCompleteStatusCancel,
    SSDKImagePickerCompleteStatusSuccess
};

typedef enum : NSUInteger {
    SSDKImagePickerOperationChooseResultStatusUnknow,
    SSDKImagePickerOperationChooseResultStatusSmall,
    SSDKImagePickerOperationChooseResultStatusNormal,
    SSDKImagePickerOperationChooseResultStatusLarge
} SSDKImagePickerOperationChooseResultStatus;
NS_ASSUME_NONNULL_END

#endif /* SSDKImagePickerDefine_h */
