//
//  SSDKImagePicker+Custom.h
//  ShareSDKDemo
//
//  Created by PP on 2020/2/22.
//  Copyright © 2020 mob. All rights reserved.
//

//如果需要自定义相册的话请导入此类进行自定义设置

#import "SSDKImagePickerConfigure.h"
#import "SSDKImagePickerResult.h"
NS_ASSUME_NONNULL_BEGIN

@interface SSDKImagePickerConfigure (Custom)

//当前是否有想立刻加载的相册
@property (nonatomic, strong, readwrite) SSDKImagePickerModel *preferPickerModel;

//设置全局对象
- (void)setAlbumProtocolObject:(id <SSDKImagePickerAlbumProtocol>)object;
 
//设置展示的collectionView
- (void)setAssetsProtocolObject:(id <SSDKImagePickerAssetsProtocol>)object;

//设置操作时间代理
- (void)setAssetsOperationObject:(id <SSDKImagePickerOperationProtocol>)object;


//当前选择的图像结果,可以在send方法中自己获取想要的数据
@property (nonatomic, strong, readonly) SSDKImagePickerResult *pickerResult;

//开始刷新缓存
- (void)updateCachedAssets;
//停止刷新缓存
- (void)resetCachedAssets;

@end

NS_ASSUME_NONNULL_END
