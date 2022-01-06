//
//  SSDKImagePickerConfigure.h
//  ShareSDKDemo
//
//  Created by PP on 2020/2/19.
//  Copyright © 2020 mob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
#import "SSDKImagePickerObject.h"

static inline CGFloat SSDKImagePicerScale(){
    static CGFloat scale = 1;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        scale = [UIScreen mainScreen].scale;
        scale = scale>2?2:scale;
    });
    return scale;
}

@class SSDKImagePickerObject;
@protocol SSDKImagePickerAlbumProtocol,SSDKImagePickerAssetsProtocol,SSDKImagePickerOperationProtocol;
NS_ASSUME_NONNULL_BEGIN
@interface SSDKImagePickerOperationConfigure : SSDKImagePickerObject
//允许多选
@property (nonatomic, assign) BOOL allowMultipleSelection;
@property (nonatomic, assign) NSUInteger minimumNumberOfImageSelection;
@property (nonatomic, assign) NSUInteger maximumNumberOfImageSelection;
@property (nonatomic, assign) NSUInteger minimumNumberOfVideoSelection;
@property (nonatomic, assign) NSUInteger maximumNumberOfVideoSelection;


@property (nonatomic, assign) BOOL showsNumberOfSelectedAssets;

//获取最终选取的图片尺寸
@property (nonatomic, assign) CGSize operationImageSize;

//获取的图片Mode，默认为AspectFit
@property (nonatomic, assign) PHImageContentMode operationContentMode;

//修正图片方向
@property (nonatomic, assign) BOOL isFixOrientation;

@end

@interface SSDKImagePickerInterfaceConfigure : SSDKImagePickerObject

@property (nonatomic, assign) NSUInteger numberOfColumnsInPortrait;

@property (nonatomic, assign) NSUInteger numberOfColumnsInLandscape;

@end

@interface SSDKImagePickerConfigure : SSDKImagePickerObject

+ (SSDKImagePickerConfigure *)defaultConfigure;

+ (SSDKImagePickerConfigure *)currentConfigure;

+ (SSDKImagePickerConfigure *)configureWithId:(NSInteger)configureId;

//相册类型
@property (nonatomic, copy) NSArray *assetCollectionSubtypes;

//相册媒体类型
@property (nonatomic, assign) SSDKImagePickerMediaType mediaType;

//是否默认打开照片
@property (nonatomic, assign) BOOL openSmartAlbumUserLibrary;

//一级页面排序规则，系统的默认在最上面
@property (nonatomic, assign) SSDKImagePickerSortType albumSortType;

//用户相册排序规则
@property (nonatomic, assign) SSDKImagePickerSortType userPhotoSortType;

//系统相册排序规则
@property (nonatomic, assign) SSDKImagePickerSortType sysPhotoSortType;


//界面设置
@property (nonatomic, strong) SSDKImagePickerInterfaceConfigure *interfaceConfigure;

//操作设置
@property (nonatomic, strong) SSDKImagePickerOperationConfigure *operationConfigure;

//如果不同相册的资源一样是否区分，默认为不区分
@property (nonatomic, assign) BOOL assetDistinguish;

//开始加载相册内容
- (void)load;


#pragma mark -  全局block设置 -

//设置全局的configure，此configure中的operationConfigure优先级高于下面两个方法设置的
+ (void)setDefaultConfigure:(SSDKImagePickerConfigure *)configure;
//设置全局操作configure
+ (void)setDefaultOperationConfigure:(SSDKImagePickerConfigure *)configure;
//设置全局展示configure
+ (void)setDefaultInterfaceConfigure:(SSDKImagePickerConfigure *)configure;

@end

NS_ASSUME_NONNULL_END
