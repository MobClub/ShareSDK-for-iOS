//
//  SSDKImagePickerModel.m
//  ShareSDKDemo
//
//  Created by PP on 2020/2/19.
//  Copyright © 2020 mob. All rights reserved.
//

#import "SSDKImagePickerModel.h"
#import "SSDKImagePickerConfigure_Private.h"
@interface SSDKImagePickerModel ()

@property (nonatomic, assign) PHAssetCollectionSubtype subtype;

@property (nonatomic, strong) PHAssetCollection * collection;

@property (nonatomic, strong, nullable) PHFetchResult *fechResult;

@property (nonatomic, copy) void (^ updateBlock)(SSDKImagePickerModel * _Nonnull,SSDKImagePickerChangeInfo *);

@property (nonatomic, strong) NSMutableArray <PHAsset *>* seletedDataSource;

@property (nonatomic, assign) SSDKImagePickerSortType sortType;


@end

@implementation SSDKImagePickerModel


- (void)addUpdateLoadBlock:(void (^)(SSDKImagePickerModel * _Nonnull, SSDKImagePickerChangeInfo * _Nonnull))updateBlock{
    _updateBlock = updateBlock;
}

- (void)update:(PHChange *)change complete:(void (^)(SSDKImagePickerModel * _Nonnull))complete{
    if (!self.fechResult) return;
    SSDKImagePickerChangeInfo *info = [SSDKImagePickerChangeInfo new];
    PHFetchResultChangeDetails *details;
    __weak typeof (self)weakSelf = self;
    if (change) {
        details = [change changeDetailsForFetchResult:self.fechResult];
        if (details) {
            if ([details.removedObjects count]) {
                [details.removedIndexes enumerateIndexesWithOptions:NSEnumerationReverse usingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
                    [weakSelf.configure.pickerResult deleteElement:weakSelf[idx]];
                    [info removeIndex:idx];
                }];
            }
            if (details.insertedObjects.count ) {
                __block NSInteger i = 0;
                [details.insertedIndexes enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
                    PHAsset *asset = details.insertedObjects[i];
                    i++;
                    asset.pickerModel = weakSelf;
                    [weakSelf.configure.pickerResult recordElementInfo:asset];
                    [asset setChooseOnly:[weakSelf.configure.pickerResult indexOfObject:asset]!=NSNotFound];
                    [info insertIndex:idx];
                }];
            }
            if (details.changedObjects.count) {
                [details.changedIndexes enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
                    [info changeIndex:idx];
                }];
            }
             _fechResult = [details fetchResultAfterChanges];
        }
    }else{
        if (self.configure.assetDistinguish) {
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                [self.fechResult enumerateObjectsUsingBlock:^(PHAsset*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    if (!obj.pickerModel) {
                        obj.pickerModel = weakSelf;
                    }
                    [weakSelf.configure.pickerResult recordElementInfo:obj];
                }];
            });
        }
    }
    
    
    
    [self update];
    
    _sortType = [self _convertSortype];
    
    if (info.isChange && complete) {
        complete(self);
    }
    
    if (_updateBlock) {
        [info item];
        _updateBlock(self,info.isChange?info:nil);
    }
}

- (SSDKImagePickerSortType)_convertSortype{
    SSDKImagePickerConfigure *configure = self.configure;
    SSDKImagePickerSortType type;
    if (self.subtype != PHAssetCollectionSubtypeAlbumRegular) {
        type = configure.sysPhotoSortType;
        if (type == SSDKImagePickerSortTypeDefault){
            type = SSDKImagePickerSortTypeAscending;
        }
        _needMoveBottom = type == SSDKImagePickerSortTypeAscending;
    }else{
        type = configure.userPhotoSortType;
        if (type == SSDKImagePickerSortTypeDefault){
            type = SSDKImagePickerSortTypeAscending;
        }
        _needMoveBottom = type == SSDKImagePickerSortTypeDescending;
    }
    return type;
}


- (void)getImagesCount:(NSInteger)count size:(CGSize)size complete:(void (^)(NSArray<UIImage *> * _Nonnull, SSDKImagePickerModel * _Nonnull))complete{
    NSArray *assets;
    count = self.count < count ? self.count : count;
    if (_needMoveBottom) {
        assets = [[[self subarrayWithRange:NSMakeRange(self.count - count, count)] reverseObjectEnumerator] allObjects];
    }else{
        assets = [self subarrayWithRange:NSMakeRange(0, count)];
    }
    NSMutableArray *images = [NSMutableArray arrayWithArray:assets];
    NSMutableSet *set = [NSMutableSet set];
    __weak typeof(self)weakSelf = self;
    for (int i = 0 ;i < count ;i ++) {
        PHAsset *model = assets[i];
        [model getImage:^(UIImage * _Nonnull image, PHAsset * _Nonnull model) {
            [images replaceObjectAtIndex:i withObject:image?:[UIImage new]];
            [set addObject:@(i)];
            if (set.count == count) {
                if (complete) {
                    complete(images,weakSelf);
                }
            }
        } size:size];
    }
    
}

- (void)update{
    SSDKImagePickerConfigure *configure = self.configure;
    self.createDate = [configure.formatter stringFromDate:self.collection.startDate];
    self.endDate = [configure.formatter stringFromDate:self.collection.endDate];
    self.title = self.collection.localizedTitle;
    self.count = _fechResult.count;
    self.subtype = self.collection.assetCollectionSubtype;
}

- (BOOL)isEqualTo:(SSDKImagePickerModel *)object{
    if (self != object) {
        __weak typeof(self)weakSelf = self;
        __block BOOL isEqual = YES;
        [object.fechResult enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            PHAsset *assetFirst = obj;
            PHAsset *assetSecond = weakSelf.fechResult[idx];
            BOOL equal = [assetFirst.localIdentifier isEqual:assetSecond.localIdentifier];
            if (!equal) {
                *stop = YES;
                isEqual = NO;
            }
        }];
        return isEqual;
    }
    return NO;
}

- (PHAsset *)objectAtIndex:(NSUInteger)index{
    PHAsset *asset = self.fechResult[_sortType == SSDKImagePickerSortTypeDescending?_count-1-index:index];
    if (!asset.pickerModel) {
        asset.pickerModel = self;
    }
    return asset;
}
- (PHAsset *)objectAtIndexedSubscript:(NSUInteger)idx{
    return [self objectAtIndex:idx];
}


- (NSArray<PHAsset *> *)subarrayWithRange:(NSRange)range{
    NSInteger count = range.location + range.length;
    NSMutableArray *elements = [NSMutableArray array];
    for (NSUInteger i = range.location; i<count; i++) {
        [elements addObject:self[i]];
    }
    return [elements copy];
}

- (NSMutableArray <PHAsset *>*)seletedDataSource{
    if (!_seletedDataSource) {
        _seletedDataSource = [NSMutableArray array];
    }
    return _seletedDataSource;
}

- (NSArray<PHAsset *> *)seletedElemets{
    return _seletedDataSource.copy;
}

- (NSUInteger)selectedCount{
    return _seletedDataSource.count;
}



- (void)setCollection:(PHAssetCollection *)collection{
    _collection = collection;
    PHFetchOptions *options = self.configure.options;
    _fechResult = [PHAsset fetchAssetsInAssetCollection:collection options:options];
    _subtype = collection.assetCollectionSubtype;
}
@end
