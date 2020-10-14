//
//  MOBPlatformKuaiShouExapmle.m
//  ShareSDKDemo
//
//  Created by maxl on 2020/5/15.
//  Copyright © 2020 mob. All rights reserved.
//

#import "MOBPlatformKuaiShouExapmle.h"

@implementation MOBPlatformKuaiShouExapmle
- (void)setup{
    SSDKWEAK
    [self addListItemWithImage:MOBLinkShareIcon name:@"私信" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareMessage];
    }];
    [self addListItemWithImage:MOBImageShareIcon name:@"相册图片" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareAssetImage];
    }];
    [self addListItemWithImage:MOBVideoShareIcon name:@"相册视频" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareVideoImage];
    }];
    //目前快手scopes仅支持user_info，relation还在内测阶段 cl 2020-09-27
    [self setAuthSetting:@{@"scopes":@[@"user_info"]}];
}

+ (SSDKPlatformType)platformType{
    return SSDKPlatformTypeKuaiShou;
}

- (void)shareMessage{
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];

    [parameters SSDKSetupKuaiShouShareParamsByTitle:@"title"
                                               desc:@"desc"
                                            linkURL:@"https://www.mob.com"
                                         thumbImage:[UIImage imageNamed:@"Icon.png"]
                                             openID:nil
                                     receiverOpenID:nil
                                    localIdentifier:nil
                                               path:nil
                                               tags:nil
                                          extraInfo:@"message"
                                               type:SSDKContentTypeMessage];
    [self shareWithParameters:parameters];
}

- (void)shareAssetImage{
    
    [SSDKImagePickerController initWithNavgationControllerConfigureBlock:^(SSDKImagePickerConfigure * _Nonnull configure) {
        configure.mediaType = SSDKImagePickerMediaTypeImage;
        configure.operationConfigure.maximumNumberOfImageSelection =1;
        configure.operationConfigure.minimumNumberOfImageSelection =1;
    } result:^(SSDKImagePickerCompleteStatus status, SSDKImagePickerResult * _Nullable result) {
        if (status == SSDKImagePickerCompleteStatusCancel) return;
        PHAsset *asset = result.selectedElements.firstObject;
        PHImageRequestOptions *options = [PHImageRequestOptions new];
        options.networkAccessAllowed = YES;
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];

        [parameters SSDKSetupKuaiShouShareParamsByTitle:nil
                                                   desc:nil
                                                linkURL:nil
                                             thumbImage:nil
                                                 openID:nil
                                         receiverOpenID:nil
                                        localIdentifier:asset.localIdentifier
                                                   path:[[NSBundle mainBundle]pathForResource:@"D45" ofType:@"jpg"]
                                                   tags:nil
                                              extraInfo:@"image"
                                                   type:SSDKContentTypeImage];
        [self shareWithParameters:parameters];
    }].presentAnimated();
}


- (void)shareVideoImage{
    
    [SSDKImagePickerController initWithNavgationControllerConfigureBlock:^(SSDKImagePickerConfigure * _Nonnull configure) {
        configure.mediaType = SSDKImagePickerMediaTypeVideo;
        configure.operationConfigure.maximumNumberOfImageSelection =1;
        configure.operationConfigure.minimumNumberOfImageSelection =1;
    } result:^(SSDKImagePickerCompleteStatus status, SSDKImagePickerResult * _Nullable result) {
        if (status == SSDKImagePickerCompleteStatusCancel) return;
        PHAsset *asset = result.selectedElements.firstObject;
        PHImageRequestOptions *options = [PHImageRequestOptions new];
        options.networkAccessAllowed = YES;
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];

        [parameters SSDKSetupKuaiShouShareParamsByTitle:nil
                                                   desc:nil
                                                linkURL:nil
                                             thumbImage:nil
                                                 openID:nil
                                         receiverOpenID:nil
                                        localIdentifier:asset.localIdentifier
                                                   path:[[NSBundle mainBundle]pathForResource:@"shareVideo" ofType:@"mp4"]
                                                   tags:@[@"111",@"2222"]
                                              extraInfo:@"video"
                                                   type:SSDKContentTypeVideo];
        [self shareWithParameters:parameters];
    }].presentAnimated();
}
@end
