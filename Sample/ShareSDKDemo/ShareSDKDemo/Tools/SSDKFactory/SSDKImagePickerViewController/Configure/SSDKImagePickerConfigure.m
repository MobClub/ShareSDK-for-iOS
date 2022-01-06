//
//  SSDKImagePickerConfigure.m
//  ShareSDKDemo
//
//  Created by PP on 2020/2/19.
//  Copyright © 2020 mob. All rights reserved.
//

#import "SSDKImagePickerConfigure.h"
#import "SSDKImagePickerConfigure_Private.h"
#import "SSDKImagePickerModel.h"
#import "SSDKImagePickerConfigure_custom.h"
#import "SSDKImagePickerResult.h"
#import "SSDKImagePickerProtocol.h"
@implementation SSDKImagePickerOperationConfigure

- (instancetype)init
{
    self = [super init];
    if (self) {
        _isFixOrientation = YES;
        _allowMultipleSelection = YES;
        _minimumNumberOfImageSelection = 0;
        _minimumNumberOfVideoSelection = 0;
        _maximumNumberOfImageSelection = NSUIntegerMax;
        _maximumNumberOfVideoSelection = NSUIntegerMax;
    }
    return self;
}

@end

@implementation SSDKImagePickerInterfaceConfigure

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.numberOfColumnsInPortrait = 4;
        self.numberOfColumnsInLandscape = 7;
    }
    return self;
}
@end

@interface SSDKImagePickerConfigure ()<PHPhotoLibraryChangeObserver>{
    SSDKImagePickerModel * _preferPickerModel;
}

@property (nonatomic, strong) NSMutableArray <SSDKImagePickerModel *> *dataSource;

@property (nonatomic, strong) NSArray *fetchResults;

@property (nonatomic, strong) NSDateFormatter *formatter;

@property (nonatomic, strong) PHFetchOptions *options;

@property (nonatomic, strong) NSArray *defaultSubtypes;


/**
 
 自定义相册时的存储对象
 */
@property (nonatomic, weak) id <SSDKImagePickerAlbumProtocol> albumObject;

@property (nonatomic, weak) id <SSDKImagePickerAssetsProtocol> assetsObject;

@property (nonatomic, strong) NSPointerArray* operationObjects;


//加载图片缓存
@property (nonatomic, strong) PHCachingImageManager *imageManager;

@property (nonatomic, assign) CGRect previousPreheatRect;


//存储结果
@property (nonatomic, strong) SSDKImagePickerResult *pickerResult;

@end

static inline NSMapTable * SSDKImagePickerConfigureMap(){
    static NSMapTable *table = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        table = [NSMapTable mapTableWithKeyOptions:NSPointerFunctionsCopyIn valueOptions:NSPointerFunctionsWeakMemory];
    });
    return table;
}
@class SSDKImagePickerConfigure;
static NSUInteger SSDKImagePickerConfigureId = 0;
static SSDKImagePickerConfigure *_defaultConfigure = nil;
static SSDKImagePickerOperationConfigure *_defaultOperationConfigure = nil;
static SSDKImagePickerInterfaceConfigure *_defaultInterfaceConfigure = nil;

@implementation SSDKImagePickerConfigure

#pragma mark - 初始化 -
+ (SSDKImagePickerConfigure *)defaultConfigure{
    SSDKImagePickerConfigure *configure = _defaultConfigure?[_defaultConfigure copy]: [SSDKImagePickerConfigure new];
    configure.assetCollectionSubtypes = configure.defaultSubtypes;
    return configure;
}

+ (SSDKImagePickerConfigure *)configureWithId:(NSInteger)configureId{
    SSDKImagePickerConfigure *congure = [SSDKImagePickerConfigureMap() objectForKey:@(configureId)];
    return congure;
}

+ (SSDKImagePickerConfigure *)currentConfigure{
    return [SSDKImagePickerConfigureMap() objectForKey:@(SSDKImagePickerConfigureId)];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup{
    self.defaultSubtypes = @[
        @(PHAssetCollectionSubtypeSmartAlbumUserLibrary),
        @(PHAssetCollectionSubtypeAlbumMyPhotoStream),
        @(PHAssetCollectionSubtypeSmartAlbumPanoramas),
        @(PHAssetCollectionSubtypeSmartAlbumVideos),
        @(PHAssetCollectionSubtypeSmartAlbumBursts)];
    _formatter = [NSDateFormatter new];
    _formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss.SSS";
    
}

- (void)setMediaType:(SSDKImagePickerMediaType)mediaType{
    _mediaType = mediaType;
    PHFetchOptions *options = [PHFetchOptions new];
    switch (mediaType) {
        case SSDKImagePickerMediaTypeImage:
            options.predicate = [NSPredicate predicateWithFormat:@"mediaType == %ld", PHAssetMediaTypeImage];
            break;
        case SSDKImagePickerMediaTypeVideo:
            options.predicate = [NSPredicate predicateWithFormat:@"mediaType == %ld", PHAssetMediaTypeVideo];
            break;
        default:
            break;
    }
    _options = options;
}

- (SSDKImagePickerOperationConfigure *)operationConfigure{
    if (!_operationConfigure) {
        if (_defaultOperationConfigure) {
            _operationConfigure = [_defaultOperationConfigure copy];
        }else{
            _operationConfigure = [SSDKImagePickerOperationConfigure new];
        }
    }
    return _operationConfigure;
}

- (SSDKImagePickerInterfaceConfigure *)interfaceConfigure{
    if (!_interfaceConfigure) {
        if (_defaultInterfaceConfigure) {
            _interfaceConfigure = [_defaultInterfaceConfigure copy];
        }else{
            _interfaceConfigure = [SSDKImagePickerInterfaceConfigure new];
        }
    }
    return _interfaceConfigure;
}


- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}


#pragma mark - 加载 -
- (void)load{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        if ([self setFetchResultsAuthorReult]) {
            [self updateAssetCollections];
            [[PHPhotoLibrary sharedPhotoLibrary] registerChangeObserver:self];
        }
    });
}

- (BOOL)setFetchResultsAuthorReult{
    PHFetchResult *smartAlbums = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum subtype:PHAssetCollectionSubtypeAny options:nil];
    PHFetchResult *userAlbums = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAny options:nil];
    self.fetchResults = @[smartAlbums, userAlbums];
    switch (PHPhotoLibrary.authorizationStatus) {
        case PHAuthorizationStatusNotDetermined:
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(becomActive) name:UIApplicationDidBecomeActiveNotification object:nil];
            break;
        case PHAuthorizationStatusAuthorized:{
            @synchronized (SSDKImagePickerConfigureMap()) {
                SSDKImagePickerConfigureId ++;
                self.configureId = SSDKImagePickerConfigureId;
                [SSDKImagePickerConfigureMap() setObject:self forKey:@(SSDKImagePickerConfigureId)];
            }
            return YES;
        }
            break;
        case PHAuthorizationStatusRestricted:{
            [self updateData:nil];
        }
            break;
        case PHAuthorizationStatusDenied:{
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(becomActive) name:UIApplicationDidBecomeActiveNotification object:nil];
            [self updateData:nil];
        }
            break;
        default:
            break;
    }
    return NO;
}

- (void)becomActive{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidBecomeActiveNotification object:nil];
    [self load];
}



- (void)updateAssetCollections{
    
    NSArray *assetCollectionSubtypes = self.assetCollectionSubtypes?:self.defaultSubtypes;
    NSMutableDictionary *smartAlbums = [NSMutableDictionary dictionaryWithCapacity:assetCollectionSubtypes.count];
    
    NSMutableArray <PHAssetCollection *>*userAlbums = [NSMutableArray array];
    for (PHFetchResult *fetchResult in self.fetchResults) {
        [fetchResult enumerateObjectsUsingBlock:^(PHAssetCollection *assetCollection, NSUInteger index, BOOL *stop) {
            PHAssetCollectionSubtype subtype = assetCollection.assetCollectionSubtype;
            if (subtype == PHAssetCollectionSubtypeAlbumRegular) {
                [userAlbums addObject:assetCollection];
            } else if ([assetCollectionSubtypes containsObject:@(PHAssetCollectionSubtypeAny)]|| [assetCollectionSubtypes containsObject:@(subtype)]) {
                if (!smartAlbums[@(subtype)]) {
                    smartAlbums[@(subtype)] = [NSMutableArray array];
                }
                [smartAlbums[@(subtype)] addObject:assetCollection];
            }
        }];
    }
    
    if ([assetCollectionSubtypes containsObject:@(PHAssetCollectionSubtypeAny)]) {
        if (assetCollectionSubtypes.count == 1) {
            assetCollectionSubtypes = self.defaultSubtypes;
        }
        NSMutableArray *keys = [smartAlbums.allKeys sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            return [obj1 integerValue] < [obj2 integerValue];
        }].mutableCopy;
        
        for (NSNumber *assetCollectionSubtype in assetCollectionSubtypes) {
            NSArray *collections = smartAlbums[assetCollectionSubtype];
            [keys removeObject:assetCollectionSubtype];
            if (collections) {
                for (PHAssetCollection *collection in collections) {
                    [self addCollections:collection];
                }
            }
        }
        for (NSString *key in keys) {
            NSArray *collections = smartAlbums[key];
            for (PHAssetCollection *collection in collections) {
                [self addCollections:collection];
            }
        }
    }else{
        // Fetch smart albums
        for (NSNumber *assetCollectionSubtype in assetCollectionSubtypes) {
            NSArray *collections = smartAlbums[assetCollectionSubtype];
            if (collections) {
                for (PHAssetCollection *collection in collections) {
                    [self addCollections:collection];
                }
            }
        }
    }
    
    switch (_albumSortType) {
        case SSDKImagePickerSortTypeAscending:
        {
            [userAlbums enumerateObjectsUsingBlock:^(PHAssetCollection * _Nonnull assetCollection, NSUInteger idx, BOOL * _Nonnull stop) {
                [self addCollections:assetCollection];
            }];
        }
            break;
        case SSDKImagePickerSortTypeDefault:
        case SSDKImagePickerSortTypeDescending:{
            [userAlbums enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(PHAssetCollection * _Nonnull assetCollection, NSUInteger idx, BOOL * _Nonnull stop) {
                [self addCollections:assetCollection];
            }];
            break;
        }
        default:
            break;
    }
    
    
    [self updateData:nil];
    
}

- (SSDKImagePickerModel *)addCollections:(PHAssetCollection *)collection{
    SSDKImagePickerModel *model = [SSDKImagePickerModel new];
    model.configureId = self.configureId;
    model.collection = collection;
    [model update:nil complete:nil];
    [self.dataSource addObject:model];
    if (self.openSmartAlbumUserLibrary && collection.assetCollectionSubtype == PHAssetCollectionSubtypeSmartAlbumUserLibrary && !self.preferPickerModel) {
        self.preferPickerModel = model;
    }
    return model;
}

- (SSDKImagePickerModel *)removeCollections:(SSDKImagePickerModel *)model{
    [self.dataSource removeObject:model];
    return model;
}

- (void)updateData:(id)details{
    if (_albumObject){
        dispatch_async(dispatch_get_main_queue(), ^{
            [_albumObject updateDataSource:_dataSource detail:details];
            _preferPickerModel = nil;
        });
    }
}


- (void)photoLibraryDidChange:(PHChange *)changeInstance
{
    dispatch_async(dispatch_get_main_queue(), ^{
        // Update fetch results
        [self.pickerResult startAblumChanged];
        NSArray *dataSource = self.dataSource.copy;
        NSMutableArray *fetchResults = [self.fetchResults mutableCopy];
        __weak typeof(self)weakSelf = self;
        
        SSDKImagePickerChangeInfo *info = [SSDKImagePickerChangeInfo new];
        [self.fetchResults enumerateObjectsUsingBlock:^(PHFetchResult *fetchResult, NSUInteger index, BOOL *stop) {
            PHFetchResultChangeDetails *changeDetails = [changeInstance changeDetailsForFetchResult:fetchResult];
            if (changeDetails) {
                if (changeDetails.removedObjects.count) {
                    [changeDetails.removedIndexes enumerateIndexesWithOptions:NSEnumerationReverse usingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
                        SSDKImagePickerModel *model = weakSelf.dataSource[idx];
                        [weakSelf removeCollections:model];
                        [info removeIndex:idx];
                    }];
                    
                }
                if (changeDetails.insertedObjects.count) {
                    NSArray *insertedObjects = changeDetails.insertedObjects;
                    __block NSInteger i = 0;
                    [changeDetails.insertedIndexes enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
                        PHAssetCollection *collection = insertedObjects[i];
                        SSDKImagePickerModel *model = [SSDKImagePickerModel new];
                        model.configureId = weakSelf.configureId;
                        model.collection = collection;
                        [weakSelf.dataSource insertObject:model atIndex:idx];
                        i++;
                        [info insertIndex:idx];
                    }];
                }
                if (changeDetails.changedObjects.count) {
                    [changeDetails.changedIndexes enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
                        [info changeIndex:idx];
                    }];
                    [fetchResults replaceObjectAtIndex:index withObject:changeDetails.fetchResultAfterChanges];
                    weakSelf.fetchResults = fetchResults;
                }
            }
        }];
        for (SSDKImagePickerModel *model in weakSelf.dataSource) {
            [model update:changeInstance complete:^(SSDKImagePickerModel * _Nonnull model) {
                [info changeIndex:[weakSelf.dataSource indexOfObject:model]];
            }];
        }
        if (![weakSelf isEqualTo:dataSource]) {
            if (info.isChange) {
                [info row];
                [weakSelf updateData:info];
            }
        }
        [self.pickerResult endAblumChanged];
    });
}

- (BOOL)isEqualTo:(NSArray<SSDKImagePickerModel *>*)dataSource{
    __block BOOL isEqual = YES;
    if (self.dataSource.count != dataSource.count) {
        isEqual = NO;
    }
    [dataSource enumerateObjectsUsingBlock:^(SSDKImagePickerModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        SSDKImagePickerModel *model = self.dataSource[idx];
        if (![model isEqualTo: obj]) {
            * stop = YES;
            isEqual = NO;
        }
    }];
    return isEqual;
}


- (void)dealloc
{
    [_imageManager stopCachingImagesForAllAssets];
    _imageManager = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[PHPhotoLibrary sharedPhotoLibrary] unregisterChangeObserver:self];
}


#pragma mark - 自定义相册相关方法 -
- (void)setPreferPickerModel:(SSDKImagePickerModel *)preferPickerModel{
    _preferPickerModel = preferPickerModel;
}

- (SSDKImagePickerModel *)preferPickerModel{
    return _preferPickerModel;
}

- (void)setAlbumProtocolObject:(id<SSDKImagePickerAlbumProtocol>)object{
    if ([object respondsToSelector:@selector(updateDataSource:detail:)]) {
        _albumObject = object;
    }else{
        _albumObject = nil;
    }
}

- (void)setAssetsProtocolObject:(id<SSDKImagePickerAssetsProtocol> )assetsObject{
    if (assetsObject && [assetsObject respondsToSelector:@selector(viewController)]&& [assetsObject respondsToSelector:@selector(displayCollectionView)]&& [assetsObject respondsToSelector:@selector(sourceModel)]) {
        _assetsObject = assetsObject;
    }else{
        _assetsObject = nil;
    }
}

- (void)setAssetsOperationObject:(id<SSDKImagePickerOperationProtocol>)object{
    if (object) {
        if ([[self.operationObjects allObjects] containsObject:object]) return;
        [self.operationObjects addPointer:(__bridge void *)object];
        [self.pickerResult checkOprationObject:object];
    }
}

- (NSPointerArray *)operationObjects{
    if (!_operationObjects) {
        _operationObjects = [NSPointerArray weakObjectsPointerArray];
    }
    return _operationObjects;
}

- (NSArray *)operationsExistObjects{
    [self.operationObjects addPointer:NULL];
    [self.operationObjects compact];
    return self.operationObjects.allObjects;
}

- (PHCachingImageManager *)imageManager{
    if (!_imageManager) {
        _imageManager = [PHCachingImageManager new];
       
    }
    return _imageManager;
}

#pragma mark - 全局设置 -

+ (void)setDefaultConfigure:(SSDKImagePickerConfigure *)configure{
    _defaultConfigure = configure;
}

+ (void)setDefaultOperationConfigure:(SSDKImagePickerOperationConfigure *)configure{
    _defaultOperationConfigure = configure;
}

+ (void)setDefaultInterfaceConfigure:(SSDKImagePickerInterfaceConfigure *)configure{
    _defaultInterfaceConfigure = configure;
}


@end

@implementation UICollectionView (Convenience)

- (NSArray *)ssdk_indexPathsForElementsInRect:(CGRect)rect
{
    NSArray *allLayoutAttributes = [self.collectionViewLayout layoutAttributesForElementsInRect:rect];
    if (allLayoutAttributes.count == 0) { return nil; }
    
    NSMutableArray *indexPaths = [NSMutableArray arrayWithCapacity:allLayoutAttributes.count];
    for (UICollectionViewLayoutAttributes *layoutAttributes in allLayoutAttributes) {
        NSIndexPath *indexPath = layoutAttributes.indexPath;
        [indexPaths addObject:indexPath];
    }
    return indexPaths;
}

@end

@implementation SSDKImagePickerConfigure(CacheImage)

- (void)resetCachedAssets
{
    if (!_assetsObject) return;
    [self.imageManager stopCachingImagesForAllAssets];
    self.previousPreheatRect = CGRectZero;
}

- (void)updateCachedAssets
{
    if (!_assetsObject) return;
    
    BOOL isViewVisible = [_assetsObject.viewController isViewLoaded] && _assetsObject.viewController.view.window != nil;
    if (!isViewVisible) { return; }
    
    // The preheat window is twice the height of the visible rect
    CGRect preheatRect = _assetsObject.displayCollectionView.bounds;
    preheatRect = CGRectInset(preheatRect, 0.0, -0.5 * CGRectGetHeight(preheatRect));
    
    // If scrolled by a "reasonable" amount...
    CGFloat delta = ABS(CGRectGetMidY(preheatRect) - CGRectGetMidY(_previousPreheatRect));
    if (delta > CGRectGetHeight(_assetsObject.displayCollectionView.bounds) / 3.0) {
        // Compute the assets to start caching and to stop caching
        NSMutableArray *addedIndexPaths = [NSMutableArray array];
        NSMutableArray *removedIndexPaths = [NSMutableArray array];
        
        __weak typeof (self)weakSelf = self;
        [self computeDifferenceBetweenRect:_previousPreheatRect andRect:preheatRect addedHandler:^(CGRect addedRect) {
            NSArray *indexPaths = [weakSelf.assetsObject.displayCollectionView ssdk_indexPathsForElementsInRect:addedRect];
            [addedIndexPaths addObjectsFromArray:indexPaths];
        } removedHandler:^(CGRect removedRect) {
            NSArray *indexPaths = [weakSelf.assetsObject.displayCollectionView ssdk_indexPathsForElementsInRect:removedRect];
            [removedIndexPaths addObjectsFromArray:indexPaths];
        }];
        
        NSArray *assetsToStartCaching = [self assetsAtIndexPaths:addedIndexPaths];
        NSArray *assetsToStopCaching = [self assetsAtIndexPaths:removedIndexPaths];
        CGFloat scale = SSDKImagePicerScale();
        CGSize itemSize = [_assetsObject displayItemSize];
        CGSize targetSize = CGSizeMake(itemSize.width * scale, itemSize.height * scale);
        
        [self.imageManager startCachingImagesForAssets:assetsToStartCaching
                                            targetSize:targetSize
                                           contentMode:PHImageContentModeAspectFill
                                               options:nil];
        [self.imageManager stopCachingImagesForAssets:assetsToStopCaching
                                           targetSize:targetSize
                                          contentMode:PHImageContentModeAspectFill
                                              options:nil];
        
        self.previousPreheatRect = preheatRect;
    }
}

- (NSArray *)assetsAtIndexPaths:(NSArray *)indexPaths
{
    if (indexPaths.count == 0) { return nil; }
    
    NSMutableArray *assets = [NSMutableArray arrayWithCapacity:indexPaths.count];
    for (NSIndexPath *indexPath in indexPaths) {
        if (indexPath.item < _assetsObject.sourceModel.count) {
            PHAsset *asset = _assetsObject.sourceModel[indexPath.item];
            [assets addObject:asset];
        }
    }
    return assets;
}


- (void)computeDifferenceBetweenRect:(CGRect)oldRect andRect:(CGRect)newRect addedHandler:(void (^)(CGRect addedRect))addedHandler removedHandler:(void (^)(CGRect removedRect))removedHandler
{
    if (CGRectIntersectsRect(newRect, oldRect)) {
        CGFloat oldMaxY = CGRectGetMaxY(oldRect);
        CGFloat oldMinY = CGRectGetMinY(oldRect);
        CGFloat newMaxY = CGRectGetMaxY(newRect);
        CGFloat newMinY = CGRectGetMinY(newRect);
        
        if (newMaxY > oldMaxY) {
            CGRect rectToAdd = CGRectMake(newRect.origin.x, oldMaxY, newRect.size.width, (newMaxY - oldMaxY));
            addedHandler(rectToAdd);
        }
        if (oldMinY > newMinY) {
            CGRect rectToAdd = CGRectMake(newRect.origin.x, newMinY, newRect.size.width, (oldMinY - newMinY));
            addedHandler(rectToAdd);
        }
        if (newMaxY < oldMaxY) {
            CGRect rectToRemove = CGRectMake(newRect.origin.x, newMaxY, newRect.size.width, (oldMaxY - newMaxY));
            removedHandler(rectToRemove);
        }
        if (oldMinY < newMinY) {
            CGRect rectToRemove = CGRectMake(newRect.origin.x, oldMinY, newRect.size.width, (newMinY - oldMinY));
            removedHandler(rectToRemove);
        }
    } else {
        addedHandler(newRect);
        removedHandler(oldRect);
    }
}

#pragma mark -  -

- (SSDKImagePickerResult *)pickerResult{
    if (!_pickerResult) {
        _pickerResult = [SSDKImagePickerResult new];
        _pickerResult.configureId = self.configureId;
    }
    return _pickerResult;
}

- (PHImageManager *)managerWithSize:(CGSize)size{
    CGSize itemSize = [_assetsObject displayItemSize];
    if (CGSizeEqualToSize(CGSizeZero, size)) {
        return nil;
    }
    else if (CGSizeEqualToSize( itemSize, size))
    {
            return _imageManager;
    }
    else{
        return [PHImageManager defaultManager];
    }
}

@end
