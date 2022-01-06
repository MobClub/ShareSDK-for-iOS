//
//  SSDKImagePickerObject.h
//  ShareSDKDemo
//
//  Created by PP on 2020/2/21.
//  Copyright © 2020 mob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSDKImagePickerDefine.h"
NS_ASSUME_NONNULL_BEGIN

@class SSDKImagePickerConfigure,PHAsset;
@interface SSDKImagePickerObject : NSObject
@property (nonatomic, assign) NSUInteger configureId;
@property (nonatomic, strong, readonly) SSDKImagePickerConfigure *configure;
@end

@interface SSDKImagePickerChangeInfo : NSObject

@property (nonatomic, copy, readonly) NSArray * insertIndexs;

@property (nonatomic, copy, readonly) NSArray * removeIndexes;

@property (nonatomic, copy, readonly) NSArray * changeIndexes;

@property (nonatomic, assign) BOOL isChange;

@property (nonatomic, assign) NSInteger insertCount;

@property (nonatomic, assign) NSInteger removeCount;

@property (nonatomic, assign) NSInteger changeCount;

- (void)insertIndex:(NSInteger)index;

- (void)removeIndex:(NSInteger)index;

- (void)changeIndex:(NSInteger)index;

- (SSDKImagePickerChangeInfo *)row;

- (SSDKImagePickerChangeInfo *)item;

- (SSDKImagePickerChangeInfo *)numbers;

@end

NS_ASSUME_NONNULL_END
