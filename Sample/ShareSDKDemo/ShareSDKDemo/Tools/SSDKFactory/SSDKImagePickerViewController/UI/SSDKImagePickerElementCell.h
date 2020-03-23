//
//  SSDKImagePickerElementCell.h
//  ShareSDKDemo
//
//  Created by PP on 2020/2/19.
//  Copyright © 2020 mob. All rights reserved.
//

#import "SSDKBaseCollectionViewCell.h"
#import "SSDKImagePickerElementModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface SSDKImagePickerElementCell : SSDKBaseCollectionViewCell

@property (nonatomic, strong) PHAsset *model;

@end

NS_ASSUME_NONNULL_END
