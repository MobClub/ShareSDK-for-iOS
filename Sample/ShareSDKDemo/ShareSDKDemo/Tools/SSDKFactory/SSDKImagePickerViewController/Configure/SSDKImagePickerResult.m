//
//  SSDKImagePickerResult.m
//  ShareSDKDemo
//
//  Created by PP on 2020/2/23.
//  Copyright © 2020 mob. All rights reserved.
//

#import "SSDKImagePickerResult.h"
#import "SSDKImagePickerConfigure_Private.h"
#import "SSDKImagePickerObject.h"
#import "SSDKImagePickerProtocol.h"
#import <objc/message.h>
@interface SSDKImagePickerMediaSelectedModel : NSObject

@property (nonatomic, assign) NSUInteger minimumNumber;
@property (nonatomic, assign) NSUInteger maximumNumber;
@property (nonatomic, strong) NSMutableArray  <PHAsset *>*dataSource;

@end
@implementation SSDKImagePickerMediaSelectedModel

- (NSMutableArray<PHAsset *> *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (SSDKImagePickerOperationChooseResultStatus)canAddElement{
    if (self.dataSource.count + 1 > _maximumNumber) return SSDKImagePickerOperationChooseResultStatusLarge;
    if (self.dataSource.count + 1 >= _minimumNumber)return SSDKImagePickerOperationChooseResultStatusNormal;
    return SSDKImagePickerOperationChooseResultStatusSmall;
}

- (SSDKImagePickerOperationChooseResultStatus)canRemoveElement{
    if (self.dataSource.count - 1 < _minimumNumber) {return SSDKImagePickerOperationChooseResultStatusSmall;}
    if (self.dataSource.count - 1 <= _maximumNumber) {return SSDKImagePickerOperationChooseResultStatusNormal;}
    return SSDKImagePickerOperationChooseResultStatusLarge;
}

@end
@interface SSDKImagePickerResult ()

@property (nonatomic, strong) SSDKImagePickerChangeInfo *deleteInfo;

@property (nonatomic, strong) NSMutableDictionary *recodeMap;

@property (nonatomic, strong) NSMutableDictionary *deletingMap;

@property (nonatomic, strong) NSMutableArray <PHAsset *>*deleteElements;

@property (nonatomic, strong) NSMutableDictionary <NSNumber *,SSDKImagePickerMediaSelectedModel *>*dataSource;

@property (nonatomic, assign) SSDKImagePickerOperationChooseResultStatus lastStatus;

@property (nonatomic, assign) SSDKImagePickerMediaType lastMediaType;

@property (nonatomic, assign) BOOL isChecking;

@property (nonatomic, assign) BOOL isCheckingAdd;

@property (nonatomic, assign) SSDKImagePickerMediaType checkingMediaType;

@end


@implementation SSDKImagePickerResult

- (void)setConfigureId:(NSUInteger)configureId{
    [super setConfigureId:configureId];
    SSDKImagePickerOperationConfigure *operation = self.configure.operationConfigure;
    NSUInteger _minimumNumberOfSelection  = 0;
    NSUInteger _minimumNumberOfVideoSelection  = operation.minimumNumberOfVideoSelection;
    NSUInteger _minimumNumberOfImageSelection  = operation.minimumNumberOfImageSelection;
    NSUInteger _maximumNumberOfSelection  = 0;
    NSUInteger _maximumNumberOfVideoSelection  = operation.maximumNumberOfVideoSelection;
    NSUInteger _maximumNumberOfImageSelection  = operation.maximumNumberOfImageSelection;
    switch (self.configure.mediaType) {
        case SSDKImagePickerMediaTypeImage:
            _maximumNumberOfSelection = _maximumNumberOfImageSelection;
            _minimumNumberOfSelection =  _minimumNumberOfImageSelection;
            _maximumNumberOfVideoSelection = 0;
            if (_maximumNumberOfImageSelection < _minimumNumberOfImageSelection) {
                _maximumNumberOfImageSelection = _minimumNumberOfImageSelection;
            }
            
            _minimumNumberOfVideoSelection = 0;
            break;
        case SSDKImagePickerMediaTypeVideo:
            _maximumNumberOfSelection = _maximumNumberOfVideoSelection;
            _minimumNumberOfSelection =  _minimumNumberOfVideoSelection;
            _maximumNumberOfImageSelection = 0;
            _minimumNumberOfImageSelection = 0;
            if (_maximumNumberOfVideoSelection < _minimumNumberOfVideoSelection) {
                _maximumNumberOfVideoSelection = _minimumNumberOfVideoSelection;
            }
            break;
        default:
            break;
    }
    _maximumNumberOfSelection = _maximumNumberOfImageSelection == NSUIntegerMax || _maximumNumberOfVideoSelection == NSUIntegerMax ?NSUIntegerMax :_maximumNumberOfImageSelection+_maximumNumberOfVideoSelection;
    _minimumNumberOfSelection = _minimumNumberOfVideoSelection + _minimumNumberOfImageSelection;
    
    
    if (_minimumNumberOfImageSelection > 0 && self.configure.mediaType != SSDKImagePickerMediaTypeVideo) {
        _lastStatus = SSDKImagePickerOperationChooseResultStatusSmall;
        _lastMediaType = SSDKImagePickerMediaTypeImage;
    }
    
    if (_minimumNumberOfVideoSelection > 0 && self.configure.mediaType != SSDKImagePickerMediaTypeImage) {
        _lastStatus = SSDKImagePickerOperationChooseResultStatusSmall;
        _lastMediaType = SSDKImagePickerMediaTypeVideo;
    }
    
    [self dataSourceWithType:SSDKImagePickerMediaTypeImage].minimumNumber = _minimumNumberOfImageSelection;
    [self dataSourceWithType:SSDKImagePickerMediaTypeImage].maximumNumber = _maximumNumberOfImageSelection;
    [self dataSourceWithType:SSDKImagePickerMediaTypeVideo].minimumNumber = _minimumNumberOfVideoSelection;
    [self dataSourceWithType:SSDKImagePickerMediaTypeVideo].maximumNumber = _maximumNumberOfVideoSelection;
    [self dataSourceWithType:SSDKImagePickerMediaTypeBoth].minimumNumber = _minimumNumberOfSelection;
    [self dataSourceWithType:SSDKImagePickerMediaTypeBoth].maximumNumber = _maximumNumberOfSelection;
    
}

- (NSMutableArray<PHAsset *> *)seletedDataSource{
    return [self dataSourceWithType:SSDKImagePickerMediaTypeBoth].dataSource;
}

- (NSMutableArray<PHAsset *> *)videoSelectedDataSource{
    return [self dataSourceWithType:SSDKImagePickerMediaTypeVideo].dataSource;
}

- (NSMutableArray<PHAsset *> *)imageSelectedDataSource{
    return [self dataSourceWithType:SSDKImagePickerMediaTypeImage].dataSource;
}

- (NSArray<PHAsset *> *)selectedElements{
    return self.seletedDataSource.copy;
}

- (BOOL)addElement:(PHAsset *)element{
    if ([self checkElementOperation:element isAdd:YES]) return NO;
    SSDKImagePickerChangeInfo *info = [SSDKImagePickerChangeInfo new];
    [info insertIndex:self.seletedDataSource.count];
    if (element.isImage) {
        [self.imageSelectedDataSource addObject:element];
    }else if (element.isVideo){
        [self.videoSelectedDataSource addObject:element];
    }
    [self.seletedDataSource addObject:element];
    
    [self.seletedDataSource enumerateObjectsUsingBlock:^(PHAsset * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj!=element) {
            [obj updateSeletedStatus];
        }
    }];
    NSArray *operations = self.configure.operationsExistObjects;
    for (id <SSDKImagePickerOperationProtocol> operationObject in operations) {
        if ([operationObject respondsToSelector:@selector(chooseElement:add:changeInfo:)]) {
            [operationObject chooseElement:element add:YES changeInfo:info];
        }
    }
    return YES;
}

- (BOOL)removeElement:(PHAsset *)element{
    if ([self checkElementOperation:element isAdd:NO]) return NO;
    NSUInteger index = [self indexOfObject:element];
    if (index != NSNotFound) {
        SSDKImagePickerChangeInfo *info = [SSDKImagePickerChangeInfo new];
        [info removeIndex:index];
        if (element.isImage) {
            [self.imageSelectedDataSource removeObject:element];
        }else if (element.isVideo){
            [self.videoSelectedDataSource removeObject:element];
        }
        [self.seletedDataSource removeObjectAtIndex:index];
        [self.selectedElements enumerateObjectsUsingBlock:^(PHAsset * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [obj updateSeletedStatus];
        }];
        NSArray *operations = self.configure.operationsExistObjects;
        for (id <SSDKImagePickerOperationProtocol> operationObject in operations) {
            if ([operationObject respondsToSelector:@selector(chooseElement:add:changeInfo:)]) {
                [operationObject chooseElement:element add:NO changeInfo:info];
            }
        }
    }
    return YES;
}


//是否需要停止接下来的操作， 返回NO，略过本次操作，返回YES， 可以操作
- (BOOL)checkElementOperation:(PHAsset *)element isAdd:(BOOL)isAdd{
    _isChecking = YES;
    _isCheckingAdd = isAdd;
    SSDKImagePickerOperationChooseResultStatus status = _lastStatus;
    SSDKImagePickerMediaType mediaType = _lastMediaType;
    NSString *method;
    BOOL stop = NO;
    if (isAdd) {
        method = @"canAddElement";
    }else{
        method = @"canRemoveElement";
    }
    
    if (element.isImage) {
        status = ((SSDKImagePickerOperationChooseResultStatus (*)(id, SEL))objc_msgSend)([self dataSourceWithType:SSDKImagePickerMediaTypeImage],NSSelectorFromString(method));
        
        mediaType = SSDKImagePickerMediaTypeImage;
        
    }else if(element.isVideo){
        status = ((SSDKImagePickerOperationChooseResultStatus (*)(id, SEL))objc_msgSend)([self dataSourceWithType:SSDKImagePickerMediaTypeVideo],NSSelectorFromString(method));
        mediaType = SSDKImagePickerMediaTypeVideo;
    }
    _checkingMediaType = mediaType;
    if (status == SSDKImagePickerOperationChooseResultStatusNormal) {
        status = ((SSDKImagePickerOperationChooseResultStatus (*)(id, SEL))objc_msgSend)([self dataSourceWithType:SSDKImagePickerMediaTypeBoth],NSSelectorFromString(method));
        mediaType = SSDKImagePickerMediaTypeBoth;
    }
    
    if (status != _lastStatus || mediaType != _lastMediaType){
        stop = YES;
    }
    if (stop) {
        if (isAdd) {
            stop = isAdd && SSDKImagePickerOperationChooseResultStatusLarge == status;
        }else{
            stop = NO;
        }
        BOOL visualStop = NO;
        NSArray *operations = self.configure.operationsExistObjects;
        for (id <SSDKImagePickerOperationProtocol> operationObject in operations){
            if ([operationObject respondsToSelector:@selector(albumChooseNumberOfStatus:mediaType:continue:)]) {
                [operationObject albumChooseNumberOfStatus:status
                                                 mediaType:mediaType
                                                  continue:!stop?&visualStop:&stop];
            }
        }
    }
    if (stop == NO) {
        _lastMediaType = mediaType;
        _lastStatus = status;
    }
    _isChecking = NO;
    return stop;
}


- (void)checkOprationObject:(id<SSDKImagePickerOperationProtocol>)object{
    BOOL stop;
    if ([object respondsToSelector:@selector(albumChooseNumberOfStatus:mediaType:continue:)]) {
        [object albumChooseNumberOfStatus:_lastStatus mediaType:_lastMediaType continue:&stop];
    }
}

- (SSDKImagePickerOperationChooseResultStatus)chooseStatusWithMediaType:(SSDKImagePickerMediaType)mediaType{
    switch (mediaType) {
        case SSDKImagePickerMediaTypeImage:
        case SSDKImagePickerMediaTypeVideo:{
            if (self.configure.mediaType != SSDKImagePickerMediaTypeBoth && self.configure.mediaType != mediaType) {
                return SSDKImagePickerOperationChooseResultStatusNormal;
            }
            SSDKImagePickerMediaSelectedModel *model = [self dataSourceWithType:mediaType];
            NSInteger changeCount = _isChecking && _checkingMediaType == mediaType?(_isCheckingAdd?1:-1):0;
            if (model.dataSource.count + changeCount < model.minimumNumber) {
                return SSDKImagePickerOperationChooseResultStatusSmall;
            }else if (model.dataSource.count + changeCount > model.maximumNumber){
                return SSDKImagePickerOperationChooseResultStatusLarge;
            }
            return SSDKImagePickerOperationChooseResultStatusNormal;
        }
            break;
        case SSDKImagePickerMediaTypeBoth:
        {
            SSDKImagePickerOperationChooseResultStatus videoStatus = [self chooseStatusWithMediaType:SSDKImagePickerMediaTypeVideo];
            SSDKImagePickerOperationChooseResultStatus imageStatus = [self chooseStatusWithMediaType:SSDKImagePickerMediaTypeImage];
            if (videoStatus==SSDKImagePickerOperationChooseResultStatusSmall || imageStatus == SSDKImagePickerOperationChooseResultStatusSmall) {
                return SSDKImagePickerOperationChooseResultStatusSmall;
            }else if(videoStatus == SSDKImagePickerOperationChooseResultStatusLarge || imageStatus == SSDKImagePickerOperationChooseResultStatusLarge){
                return SSDKImagePickerOperationChooseResultStatusLarge;
            }
            return SSDKImagePickerOperationChooseResultStatusNormal;
            
        }
            break;
        default:
            break;
    }
    return 0;
}

- (NSUInteger)indexOfObject:(PHAsset *)element{
    NSMutableArray *assets = self.seletedDataSource;
    NSUInteger index;
    if (element.configure.assetDistinguish) {
        index = [assets indexOfObject:element];
    }else{
        NSUInteger realIndex = [assets indexOfObject:element];
        if (realIndex != NSNotFound) {
            if (element != assets[realIndex]) {
                NSInteger count = assets.count;
                BOOL isFind = NO;
                for (NSUInteger i = realIndex; i< count; i++) {
                    if (assets[i] == element) {
                        realIndex = i;
                        isFind = YES;
                        break;
                    }
                }
                if (!isFind) {
                    realIndex = NSNotFound;
                }
            }
        }
        index = realIndex;
    }
    
    return index;
}

- (NSArray<PHAsset *> *)selectedElementsWithMediaType:(SSDKImagePickerMediaType)mediaType{
    switch (mediaType) {
        case SSDKImagePickerMediaTypeImage:
            return self.imageSelectedDataSource.copy;
            break;
        case SSDKImagePickerMediaTypeVideo:
            return self.videoSelectedDataSource.copy;
            break;
        case SSDKImagePickerMediaTypeBoth:
            return self.seletedDataSource.copy;
            break;
        default:
            break;
    }
    return nil;
}

- (void)startAblumChanged{
    _deleteInfo = [SSDKImagePickerChangeInfo new];
    if (!self.configure.configure.assetDistinguish) return;
    _deletingMap = self.recodeMap.mutableCopy;
}

- (void)deleteElement:(PHAsset *)element{
    @synchronized (self.deleteElements) {
        if (!_deleteInfo) return;
        if ([self indexOfObject:element] == NSNotFound) return;
        if (self.configure.assetDistinguish) {
            NSNumber *number = _deletingMap[element.operationKey];
            NSInteger albumCount = [number integerValue] - 1;
            if (albumCount <= 0) {
                [self.deleteElements addObject:element];
                [element setChoose:NO];
                _deletingMap[element.operationKey] = nil;
            }else{
                _deletingMap[element.operationKey] = @(albumCount);
            }
        }else{
            [self.deleteElements addObject:element];
        }
    }
}

- (void)endAblumChanged{
    if (self.deleteElements.count > 0) {
        for (PHAsset *element in self.deleteElements) {
            [_deleteInfo removeIndex:[self indexOfObject:element]];
            [element setChoose:NO];
        }
        [self.seletedDataSource removeObjectsInArray:_deleteElements];
        [self.videoSelectedDataSource removeObjectsInArray:_deleteElements];
        [self.imageSelectedDataSource removeObjectsInArray:_deleteElements];
        [self.selectedElements enumerateObjectsUsingBlock:^(PHAsset * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [obj updateSeletedStatus];
        }];
        
        NSArray *operations = self.configure.operationsExistObjects;
        for (id <SSDKImagePickerOperationProtocol> operationObject in operations) {
            if ([operationObject respondsToSelector:@selector(albumChooseDidChange:)]) {
                [operationObject albumChooseDidChange:_deleteInfo];
            }
        }
    }
    _deletingMap = nil;
    _deleteInfo = nil;
}


- (void)recordElementInfo:(PHAsset *)element{
    if (!self.configure.configure.assetDistinguish) return;
    @synchronized (self.recodeMap) {
        NSNumber *number = self.recodeMap[element.operationKey];
        number = @([number integerValue]+1);
        [self.recodeMap setObject:number forKey:element.operationKey];
    }
}


- (NSUInteger)selectedCount{
    return self.seletedDataSource.count;
}

- (NSUInteger)selectedImageCount{
    return self.imageSelectedDataSource.count;
}

- (NSUInteger)selectedVideoCount{
    return self.videoSelectedDataSource.count;
}



- (NSInteger)minimumNumberOfSelectionType:(SSDKImagePickerMediaType)type{
    return [self dataSourceWithType:type].minimumNumber;
}

- (NSInteger)maximumNumberOfSelectionType:(SSDKImagePickerMediaType)type{
    return [self dataSourceWithType:type].maximumNumber;
}

- (NSInteger)countWithSelectionType:(SSDKImagePickerMediaType)type{
    return [self dataSourceWithType:type].dataSource.count;
}

- (SSDKImagePickerMediaSelectedModel *)dataSourceWithType:(SSDKImagePickerMediaType)mediaType{
    SSDKImagePickerMediaSelectedModel *model = self.dataSource[@(mediaType)];
    if (!model) {
        model = [SSDKImagePickerMediaSelectedModel new];
        self.dataSource[@(mediaType)] = model;
    }
    return model;
}

- (NSMutableDictionary *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableDictionary dictionary];
    }
    return _dataSource;
}

- (NSMutableArray<PHAsset *> *)deleteElements{
    if (!_deleteElements) {
        _deleteElements = [NSMutableArray array];
    }
    return _deleteElements;
}

- (NSMutableDictionary *)recodeMap{
    if (!_recodeMap) {
        _recodeMap = [NSMutableDictionary dictionary];
    }
    return _recodeMap;
}

@end
