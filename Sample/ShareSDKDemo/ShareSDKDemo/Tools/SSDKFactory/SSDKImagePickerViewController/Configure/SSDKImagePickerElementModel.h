//
//  PHAsset.h
//  ShareSDKDemo
//
//  Created by PP on 2020/2/19.
//  Copyright © 2020 mob. All rights reserved.
//

#import "SSDKImagePickerObject.h"
#import <Photos/Photos.h>

NS_ASSUME_NONNULL_BEGIN



@interface PHAsset (SSDKImagePicker)

@property (nonatomic, strong, readonly) SSDKImagePickerConfigure *configure;

//资源类型
@property (nonatomic, assign, readonly) SSDKImagePickerAseetMediaType ssdk_mediaType;

//设置选中或者取消选中
@property (nonatomic, assign) BOOL  choose;

//选择的数据在选择数据中的序列
@property (nonatomic, assign, readonly) NSInteger  chooseIndex;

//选择数据在所属相册的序列
@property (nonatomic, assign, readonly) NSInteger elementChooseIndex;

@property (nonatomic, assign, readonly) BOOL isImage;

@property (nonatomic, assign, readonly) BOOL isVideo;

//设置选中时的block
- (void)setChooseBlock:(void (^ _Nonnull)(PHAsset * _Nonnull))chooseBlock;


- (void)setChooseOnly:(BOOL)choose;


//获取图片
- (void)getImage:(void (^)(UIImage *image, PHAsset *model))image size:(CGSize)size;

@end


NS_ASSUME_NONNULL_END
