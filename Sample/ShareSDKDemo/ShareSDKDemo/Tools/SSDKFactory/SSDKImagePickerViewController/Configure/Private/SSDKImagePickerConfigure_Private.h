//
//  SSDKImagePickerConfigure_Private.h
//  ShareSDKDemo
//
//  Created by PP on 2020/2/19.
//  Copyright © 2020 mob. All rights reserved.
//
#import "SSDKImagePickerConfigure.h"
#import "SSDKImagePickerModel.h"
#import "SSDKImagePickerConfigure_custom.h"

NS_ASSUME_NONNULL_BEGIN
@interface SSDKImagePickerConfigure (SSDK)

@property (nonatomic, strong, readonly) NSMutableArray *dataSource;

@property (nonatomic, strong, readonly) NSDateFormatter *formatter;

- (PHImageManager *)managerWithSize:(CGSize)size;

@property (nonatomic, strong, readonly) NSMutableDictionary *configureInfo;

@property (nonatomic, strong, readonly) PHFetchOptions *options;

@property (nonatomic, strong, readonly) NSArray * operationsExistObjects;

@property (nonatomic, weak) id <SSDKImagePickerAssetsProtocol> assetsObject;



@end


@interface SSDKImagePickerModel (SSDK)

@property (nonatomic, strong) PHAssetCollection * collection;

- (void)update:(nullable PHChange *)change complete:(nullable void (^)(SSDKImagePickerModel * model))complete;

- (BOOL)isEqualTo:(SSDKImagePickerModel *)object;

@property (nonatomic, strong) NSMutableArray <PHAsset *>* seletedDataSource;

@end


@interface PHAsset (SSDK)

- (void)updateSeletedStatus;

@property (nonatomic, weak) SSDKImagePickerModel * pickerModel;

@property (nonatomic, copy, readonly) NSString *operationKey;

@end


@interface SSDKImagePickerResult (SSDK)

@property (nonatomic, strong, readonly) NSMutableArray <PHAsset *>* seletedDataSource;

- (BOOL)addElement:(PHAsset *)element;

- (BOOL)removeElement:(PHAsset *)element;

- (void)startAblumChanged;

- (void)deleteElement:(PHAsset *)element;

- (void)endAblumChanged;

- (void)recordElementInfo:(PHAsset *)element;

- (void)checkOprationObject:(id <SSDKImagePickerOperationProtocol>)object;

@end
NS_ASSUME_NONNULL_END
