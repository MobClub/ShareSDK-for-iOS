//
//  PHAsset.m
//  ShareSDKDemo
//
//  Created by PP on 2020/2/19.
//  Copyright © 2020 mob. All rights reserved.
//

#import "SSDKImagePickerElementModel.h"
#import "SSDKScenePackage.h"
#import "SSDKImagePickerConfigure_Private.h"
#import <objc/runtime.h>
#import "NSObject+SSDKCategory.h"
#import "SSDKImagePickerProtocol.h"
static void *SSDKImagePickerElementChooseKey = &SSDKImagePickerElementChooseKey;
static void *SSDKImagePickerElemenMediaTypeKey = &SSDKImagePickerElemenMediaTypeKey;
static void *SSDKImagePickerElemenChooseBlockKey = &SSDKImagePickerElemenChooseBlockKey;
static void *SSDKImagePickerElemenOperationKey = &SSDKImagePickerElemenOperationKey;
static void *SSDKImagePickerElemenPickerModelKey = &SSDKImagePickerElemenPickerModelKey;

@implementation PHAsset (SSDKImagePicker)


- (void)setChoose:(BOOL)choose{
    if (choose) {
        if (![self.configure.pickerResult addElement:self]) return;
    }else{
       if (![self.configure.pickerResult removeElement:self]) return;
    }
    [self setChooseOnly:choose];
    if (!self.configure.assetDistinguish) {
        [self updateSeletedStatus];
    }else{
        [[NSNotificationCenter defaultCenter] postNotificationName:self.operationKey object:self];
    }
}



- (void)getImage:(void (^)(UIImage * _Nonnull, PHAsset * _Nonnull))image size:(CGSize)size{

    PHImageRequestOptions *options = [PHImageRequestOptions new];
    options.networkAccessAllowed = YES;
    options.resizeMode = PHImageRequestOptionsResizeModeFast;
    options.deliveryMode = PHImageRequestOptionsDeliveryModeOpportunistic;
    PHImageManager *manager = [self.configure managerWithSize:size];
    if (!manager) {
        manager = [PHImageManager defaultManager];
    }
    __weak typeof(self)weakSelf = self;
    if (CGSizeEqualToSize(CGSizeZero, size)) {
        size = self.configure.assetsObject.displayItemSize;
        if (CGSizeEqualToSize(CGSizeZero, size)) {
            NSUInteger numberOfColumns;
            if (UIInterfaceOrientationIsPortrait([[UIApplication sharedApplication] statusBarOrientation])) {
                numberOfColumns = self.configure.interfaceConfigure.numberOfColumnsInPortrait;
            } else {
                numberOfColumns = self.configure.interfaceConfigure.numberOfColumnsInLandscape;
            }

            CGFloat width = ([UIScreen mainScreen].bounds.size.width - 2.0 * (numberOfColumns - 1)) / numberOfColumns;
            size = CGSizeMake(width, width);
        }
    }
    [manager requestImageForAsset:self targetSize:CGSizeMake(size.width *SSDKImagePicerScale(), size.height * SSDKImagePicerScale()) contentMode:PHImageContentModeAspectFill options:options resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
        image(result, weakSelf);
    }];
}


- (void)asset_choose:(NSNotification *)notification{
    PHAsset *model = notification.object;
    if (model!= self) {
        [self setChooseOnly:model.choose];
    }
}

- (void)updateSeletedStatus{
    [self.pickerModel.seletedDataSource removeObject:self];
    if (self.choose) {
        [self.pickerModel.seletedDataSource addObject:self];
    }
    SSDKImagePickerModel *pickerModel = self.pickerModel;
    if (pickerModel.chooseChangeBlock) {
        pickerModel.chooseChangeBlock(pickerModel);
    }

    if ([self chooseBlock]) {
        [self chooseBlock](self);
    }
}

- (NSInteger)chooseIndex{
    NSUInteger index = [self.configure.pickerResult indexOfObject:self];
    return index == NSNotFound?index = -1:index;
}

- (NSInteger)elementChooseIndex{
    return [self.pickerModel.seletedElemets indexOfObject:self];
}

- (NSString *)operationKey{
    id key = objc_getAssociatedObject(self, SSDKImagePickerElemenOperationKey);
    if (!key) {
        key = [NSString stringWithFormat:@"%@--%ld", [self valueForKeyPath:@"uuid"],(long)self.pickerModel.configureId];
        objc_setAssociatedObject(self, SSDKImagePickerElemenOperationKey, key, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
    return key;
}

- (BOOL)isImage{
    return self.mediaType == SSDKImagePickerAseetMediaTypeGif||self.mediaType == SSDKImagePickerAseetMediaTypeImage;
}

- (BOOL)isVideo{
    return self.mediaType == SSDKImagePickerAseetMediaTypeVideo;
}


- (SSDKImagePickerConfigure *)configure{
    return self.pickerModel.configure;
}



- (BOOL)choose{
    return [objc_getAssociatedObject(self, SSDKImagePickerElementChooseKey) boolValue];
}

- (void)setChooseOnly:(BOOL)choose{
    objc_setAssociatedObject(self, SSDKImagePickerElementChooseKey, @(choose), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self updateSeletedStatus];
}

- (void)setChooseBlock:(void (^)(PHAsset * _Nonnull))chooseBlock{
    objc_setAssociatedObject(self, SSDKImagePickerElemenChooseBlockKey, chooseBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void (^) (id))chooseBlock{
    return objc_getAssociatedObject(self, SSDKImagePickerElemenChooseBlockKey);
}

- (SSDKImagePickerModel *)pickerModel{
    return objc_getAssociatedObject(self, SSDKImagePickerElemenPickerModelKey);
}

- (void)setPickerModel:(SSDKImagePickerModel *)pickerModel{
    objc_setAssociatedObject(self, SSDKImagePickerElemenPickerModelKey, pickerModel, OBJC_ASSOCIATION_ASSIGN);
    if (self.configure.assetDistinguish) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(asset_choose:) name:self.operationKey object:nil];
    }
    switch (self.mediaType) {
        case PHAssetMediaTypeVideo:
            self.ssdk_mediaType = SSDKImagePickerAseetMediaTypeVideo;
            break;
        case PHAssetMediaTypeAudio:
        {
            self.ssdk_mediaType = SSDKImagePickerAseetMediaTypeAudio;
        }
            break;
        case PHAssetMediaTypeImage:{
            if ([[self valueForKey:@"filename"] containsString:@"GIF"]) {
                self.ssdk_mediaType = SSDKImagePickerAseetMediaTypeGif;
            }else{
                self.ssdk_mediaType = SSDKImagePickerAseetMediaTypeImage;
            }
        }
            break;
        case PHAssetMediaTypeUnknown:
            self.ssdk_mediaType = SSDKImagePickerAseetMediaTypeUnknown;
        default:
            break;
    }
    __weak typeof (self)weakSelf = self;
    [self addDeallocTask:^(PHAsset*  _Nonnull object) {
        if (object.configure.assetDistinguish) {
            [[NSNotificationCenter defaultCenter] removeObserver:object name:object.operationKey object:nil];
        }
    }];
    [pickerModel addDeallocTask:^(id  _Nonnull object) {
        objc_setAssociatedObject(weakSelf, SSDKImagePickerElemenPickerModelKey, nil, OBJC_ASSOCIATION_ASSIGN);
    }];
}

- (void)setSsdk_mediaType:(SSDKImagePickerAseetMediaType)ssdk_mediaType{
    objc_setAssociatedObject(self, SSDKImagePickerElemenMediaTypeKey, @(ssdk_mediaType), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (SSDKImagePickerAseetMediaType)ssdk_mediaType{
    return [objc_getAssociatedObject(self, SSDKImagePickerElemenMediaTypeKey) integerValue];
}

@end

