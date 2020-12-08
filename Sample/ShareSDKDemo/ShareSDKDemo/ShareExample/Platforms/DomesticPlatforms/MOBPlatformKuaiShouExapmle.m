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
    [self addListItemWithImage:MOBImageShareIcon name:@"单图片" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareAssetImage];
    }];
    [self addListItemWithImage:MOBVideoShareIcon name:@"单视频" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareVideoImage];
    }];
    [self addListItemWithImage:MOBVideoShareIcon name:@"系统分享-单图（本地/网络图片）" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareImageBySystem];
    }];
    [self addListItemWithImage:MOBVideoShareIcon name:@"系统分享-本地视频" method:^(MOBPlatformBaseModel * _Nonnull model, NSMutableDictionary * _Nonnull parameters) {
        SSDKSTRONG
        [self shareVideoBySystem];
    }];
    //目前快手scopes仅支持user_info，relation还在内测阶段 cl 2020-09-27
    [self setAuthSetting:@{@"scopes":@[@"user_info"]}];
}

+ (SSDKPlatformType)platformType{
    return SSDKPlatformTypeKuaiShou;
}

- (void)shareMessage{
    //私信分享只能通过SDK进行分享
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupKuaiShouShareParamsByTitle:@"title"
                                               desc:@"desc"
                                            linkURL:@"https://www.mob.com"
                                         thumbImage:[UIImage imageNamed:@"Icon.png"]
                                             openID:nil
                                     receiverOpenID:nil
                                    localIdentifier:nil
                                               tags:nil
                                          extraInfo:@"message"
                                               type:SSDKContentTypeMessage];
    [self shareWithParameters:parameters];
}

- (void)shareAssetImage{
    //有SDK时使用该方法通过快手SDK进行分享
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
                                                   tags:nil
                                              extraInfo:@"image"
                                                   type:SSDKContentTypeImage];
        [self shareWithParameters:parameters];
    }].presentAnimated();
}

- (void)shareVideoImage{
    //有SDK时使用该方法通过快手SDK进行分享
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
                                                   tags:@[@"111",@"2222"]
                                              extraInfo:@"video"
                                                   type:SSDKContentTypeVideo];
        [self shareWithParameters:parameters];
    }].presentAnimated();
}

- (void)shareImageBySystem{
    //系统分享单图（网络图片/本地图片）
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:[[NSBundle mainBundle] pathForResource:@"D45" ofType:@"jpg"]
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeImage];
    [self shareByActivityWithParameters:parameters];
}

- (void)shareVideoBySystem{
    //系统分享本地视频
    NSURL *url_1 = [[NSBundle mainBundle] URLForResource:@"cat" withExtension:@"mp4"];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters SSDKSetupShareParamsByText:@"123" images:nil url:url_1 title:nil type:SSDKContentTypeVideo];
    [self shareByActivityWithParameters:parameters];
}
@end
