//
//  SSDKImagePickerModel.h
//  ShareSDKDemo
//
//  Created by PP on 2020/2/19.
//  Copyright © 2020 mob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSDKImagePickerElementModel.h"
NS_ASSUME_NONNULL_BEGIN
@class SSDKImagePickerChangeInfo;

@interface SSDKImagePickerModel : SSDKImagePickerObject

//-------------------------------------数据源--------------------------------
@property (nonatomic, assign, readonly) PHAssetCollectionSubtype subtype;

@property (nonatomic, strong, readonly) PHAssetCollection * collection;

@property (nonatomic, strong, nullable, readonly) PHFetchResult *fechResult;

//-------------------------------------数据据-------------------------------

@property (nonatomic, assign) NSUInteger count;

@property (nonatomic, copy) NSString * createDate;

@property (nonatomic, copy) NSString * endDate;

@property (nonatomic, copy) NSString *title;


- (void)addUpdateLoadBlock:(void (^ )(SSDKImagePickerModel *model, SSDKImagePickerChangeInfo *details))updateBlock;

- (void)getImagesCount:(NSInteger)count size:(CGSize)size complete:(void (^)(NSArray <UIImage *>* images, SSDKImagePickerModel *sourceMoel))complete;


- (PHAsset *)objectAtIndex:(NSUInteger)index;
- (PHAsset *)objectAtIndexedSubscript:(NSUInteger)idx;

- (NSArray<PHAsset *> *)subarrayWithRange:(NSRange)range;
//-------------------------------------已选数据-------------------------------

@property (nonatomic, strong, readonly) NSArray <PHAsset *>* seletedElemets;

@property (nonatomic, assign, readonly) NSUInteger selectedCount;

@property (nonatomic, assign) BOOL needMoveBottom;

//设置选中时的block
@property (nonatomic, copy) void (^ chooseChangeBlock)(SSDKImagePickerModel * sourceModel);


@end



NS_ASSUME_NONNULL_END
