//
//  DouyinOpenSDKApiObject.h
//  Api对象，包含所有接口和对象数据定义
//
//  Created by 抖音短视频 on 18/9/2017.
//  Copyright (c) 2018年 抖音短视频. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, DouyinOpenSDKErrorCode) {
    DouyinOpenSDKSuccess                = 0,    /** 成功 */
    DouyinOpenSDKErrorCodeCommon        = -1,   /** 通用错误类型 <包括网络错误> */
    DouyinOpenSDKErrorCodeUserCanceled  = -2,   /** 用户手动取消 */
    DouyinOpenSDKErrorCodeSendFailed    = -3,   /** 发送失败 */
    DouyinOpenSDKErrorCodeAuthDenied    = -4,   /** 权限错误 */
    DouyinOpenSDKErrorCodeUnsupported   = -5,   /** 不支持 */
};

#pragma mark - DouyinOpenSDKBaseReq

@interface DouyinOpenSDKBaseReq : NSObject

@end

#pragma mark - DouyinOpenSDKSendAuthReq

/**
 第三方程序向抖音短视频请求认证授权的消息结构
 
 第三方程序向抖音短视频发送认证用户的某些权限的请求，抖音短视频处理完成后会向第三方回送一个处理结果。
 */
@interface DouyinOpenSDKSendAuthReq : DouyinOpenSDKBaseReq

/**
 第三方应用程序向抖音短视频申请的必需权限类型，最终在抖音短视频App授权完成后根据实际授权结果返回给第三方应用；
 例如 [NSOrderedSet orderedSetWithObjects:@"user_info", ..., nil]
 */
@property (nonatomic, strong, nullable) NSOrderedSet<NSString *> *permissions;

/**
 第三方应用程序向抖音短视频申请的附加权限类型，用户可以勾选是否给予这部分权限，最终在抖音短视频App授权完成后根据实际授权结果返回给第三方应用；
 @key permission 权限
 @key defaultChecked 初始勾选状态，@"1"表示勾选，@"0"表示未勾选
 例如 [NSOrderedSet orderedSetWithObjects:@{@"permission":@"user_info",@"defaultChecked":@"0"}, ..., nil]
 */
@property (nonatomic, strong, nullable) NSOrderedSet<NSDictionary<NSString *,NSString *> *> *additionalPermissions;

/**
 第三方应用程序用来标识请求的唯一性，最后跳转回第三方程序时由抖音短视频App回传
 */
@property (nonatomic, copy, nullable) NSString *state;

@end

#pragma mark - DouyinOpenSDKBaseResp

@interface DouyinOpenSDKBaseResp : NSObject

/**
 错误码
 */
@property (nonatomic, assign) DouyinOpenSDKErrorCode errCode;

/**
 错误描述
 */
@property (nonatomic, copy, nullable) NSString *errString;

@end

#pragma mark - DouyinOpenSDKSendAuthResp

/**
 抖音短视频处理完成第三方应用的认证与权限申请后，回送给第三方应用的处理结果。
 
 第三方程序向抖音短视频申请权限认证，需要调用DouyinOpenSDKApi的[sendAuthReq:viewController:delegate:]函数，向抖音短视频发送DouyinOpenSDKSendAuthReq的请求，抖音短视频处理完成后会向第三方回送一个DouyinOpenSDKSendAuthResp对象的响应。
 */
@interface DouyinOpenSDKSendAuthResp : DouyinOpenSDKBaseResp

/**
 第三方应用向抖音短视频申请某些权限，最终在抖音短视频App授权完成后根据实际授权结果返回给第三方应用
 */
@property (nonatomic, copy, readonly, nullable) NSString *code;

/**
 第三方应用程序用来标识请求的唯一性，最后跳转回第三方程序时由抖音短视频回传
 */
@property (nonatomic, copy, readonly, nullable) NSString *state;

/**
 抖音短视频用户同意给予第三方应用程序的权限，若授权成功则包括全部必需权限和用户勾选的附加权限；
 */
@property (nonatomic, strong, nullable) NSOrderedSet<NSString *> *grantedPermissions;

@end

#pragma mark - DouyinOpenSDKShareReq

typedef NS_ENUM(NSUInteger, DouyinOpenSDKShareMediaType) {
    DouyinOpenSDKShareMediaTypeImage = 0, // 对应 PHAssetMediaTypeImage
    DouyinOpenSDKShareMediaTypeVideo, // 对应 PHAssetMediaTypeVideo
};

@interface DouyinOpenSDKShareReq : DouyinOpenSDKBaseReq

/**
 第三方应用程序向抖音短视频分享的视频或图片在 **相册** 中的中的local identifier，上限为12个，内容须全部为图片，或者全部为视频。
 若内容为视频，视频总时长应该大于3s；
 图片的宽高比应满足：1/2.2<=宽高比<=2.2；
 视频分辨率应满足：1/2.2<=宽高像素比<=2.2；
 请三方应用程序自行检查分享的内容是否满足要求；
 此处需注意，带品牌logo或品牌水印的视频，会命中抖音的审核逻辑，有比较大的概率导致分享视频推荐降权处理/分享视频下架处理/分享账号被封禁处理，请予以重视；
 强烈建议第三方应用自行处理好分享内容中的不合规水印。
 */
@property (nonatomic, strong) NSArray *localIdentifiers;

/**
 urlPaths在相册中对应的Media类型，urlPaths里面的必须都是同一种类型
 */
@property (nonatomic, assign) DouyinOpenSDKShareMediaType mediaType;

/**
 第三方应用程序用来标识请求的唯一性，最后跳转回第三方程序时由抖音短视频App回传
 */
@property (nonatomic, copy, nullable) NSString *state;

@end

#pragma mark - DouyinOpenSDKShareResp

/**
 抖音短视频完成视频分享处理后，给第三方应用的处理结果。
 */
@interface DouyinOpenSDKShareResp : DouyinOpenSDKBaseResp

/**
 第三方应用程序用来标识请求的唯一性，最后跳转回第三方程序时由抖音短视频回传
 */
@property (nonatomic, copy, readonly, nullable) NSString *state;

@end

NS_ASSUME_NONNULL_END

