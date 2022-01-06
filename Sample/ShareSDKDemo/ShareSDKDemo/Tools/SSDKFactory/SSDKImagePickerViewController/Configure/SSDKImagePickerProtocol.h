//
//  SSDKImagePickerProtocol.h
//  ShareSDKDemo
//
//  Created by PP on 2020/2/22.
//  Copyright © 2020 mob. All rights reserved.
//

#ifndef SSDKImagePickerProtocol_h
#define SSDKImagePickerProtocol_h
#import "SSDKImagePickerDefine.h"
/**
 如果香自定义相册，请配合
 SSDKImagePickerConfigure_custom.h
 文件，并参考SSDKImagePickerController中模板的用法。
 */

@class SSDKImagePickerConfigure,SSDKImagePickerModel,
SSDKImagePickerChangeInfo,SSDKImagePickerResult,PHAsset;

@protocol SSDKImagePickerAlbumProtocol <NSObject>

//开始加载数据源
- (void)updateDataSource:(NSArray <SSDKImagePickerModel *>*)dataSource
                  detail:(SSDKImagePickerChangeInfo *)details;

@end

@protocol SSDKImagePickerAssetsProtocol <NSObject>

//当前显示的控制器
- (UIViewController *)viewController;
//当前展示的视图
- (UICollectionView *)displayCollectionView;
//当前显示的model
- (SSDKImagePickerModel *)sourceModel;

- (CGSize)displayItemSize;

@end



@protocol SSDKImagePickerOperationProtocol <NSObject>

//参数1：当前选中的元素 参数2：是否是增加  参数3，在选择结果中的位置信息
- (void)chooseElement:(PHAsset *)element
                add:(BOOL)isAdd
           changeInfo:(SSDKImagePickerChangeInfo *)changeInfo;

//当选中的超出设置的最大选择或最小选择数时回调，优先回调具体的MediaType，continue是否继续，默认不继续，如果继续则回调上面的方法
- (void)albumChooseNumberOfStatus:(SSDKImagePickerOperationChooseResultStatus)status mediaType:(SSDKImagePickerMediaType)mediaType continue:(BOOL *)stop;

//此方法会在选中的相册变化的时候调用，如果configure的assetDistinguish为YES则会在所有照片被删除后调用
//此位置变化信息是被选中的相册中的位置信息，在选择结果变化前回调。
- (void)albumChooseDidChange:(SSDKImagePickerChangeInfo *)changeInfo;


@end

#endif /* SSDKImagePickerProtocol_h */
