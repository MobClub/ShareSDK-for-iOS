//
//  MOBPlatformBaseModel.h
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/15.
//  Copyright © 2019 mob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MOBPlatformMethodProtocol.h"
#import "MOBPlatfromMethodStyleModel.h"
#import "MOBShareItemUI.h"
#import "SSDKImagePicker.h"
NS_ASSUME_NONNULL_BEGIN


typedef NS_ENUM(NSUInteger, MOBShareSDKShareContentType) {
    MOBShareSDKShareContentTypeText,
    MOBShareSDKShareContentTypeImage,
};



@class MOBPlatformBaseModel;

@interface MOBSharePlatformShareItemModel : NSObject

//所属平台
@property (nonatomic, weak) MOBPlatformBaseModel * platformModel;

//分享需要必要的参数
@property (nonatomic, strong) NSDictionary *parameters;

/// 分享回调,可以在此设置回调事件
@property (nonatomic, copy) void (^ shareHandler) (SSDKResponseState state, NSDictionary *userData, SSDKContentEntity* contentEntity,  NSError *error);

//分享的itm
@property (nonatomic, strong, readonly) MOBShareItemUI *itemUI;


//进行分享
- (void)share;

@end






extern NSBundle * const MOBPlatformBundle (void);

extern void * kMOBPlatformAuthItemModelKey;

@interface MOBPlatformBaseModel : NSObject<MOBPlatformMethodProtocol>



#pragma mark - 分享设置 -

/// 分享回调，可以在此统一的设置回调监听事件

- (void)setShareHandler:(void (^ _Nonnull)(SSDKResponseState state, NSDictionary * _Nonnull userData, SSDKContentEntity * _Nonnull contentEntity, NSError * _Nonnull error))shareHandler;

//设置分享参数，并分享
- (void)shareWithParameters:(NSMutableDictionary *)parameters;

//设置系统分享参数，并分享
- (void)shareByActivityWithParameters:(NSMutableDictionary *)parameters;

#pragma mark -  授权设置  -


//分享需要设置的setting


//进行授权
- (void)auth;

- (void)getUserInfo;



//授权回调


- (void)setAuthHandler:(void (^ _Nonnull)(SSDKResponseState state, SSDKUser * _Nonnull user, NSError * _Nonnull error))authHandler;

//获取用户信息回调


- (void)setGetUserInfoHandler:(void (^ _Nonnull)(SSDKResponseState state, SSDKUser * _Nonnull user, NSError * _Nonnull error))getUserInfoHandler;

//平台是否允许授权
@property (nonatomic, assign, readonly) BOOL isAllowAuth;

//设置授权选项,请至各平台Example查看
- (void)setAuthSetting:(NSDictionary *)setting;










//将如qzone、qqfriend等子平台映射为qq等主平台
+ (SSDKPlatformType)convertPlatformTypeWithPlatformType:(SSDKPlatformType)platformType;

+ (SSDKPlatformType)convertPlatformImageTypeWithPlatformType:(SSDKPlatformType)platformType;

//根据platformType创建对应展示model
+ (instancetype)initWithPlatformType:(SSDKPlatformType)platformType;


#pragma mark - 其他 -

- (void)setup;



//方法map
@property (nonatomic, strong, readonly) NSDictionary <NSString *, MOBSharePlatformShareItemModel *>*typesMap;

//方法列表
@property (nonatomic, strong, readonly) NSArray <MOBSharePlatformShareItemModel *>* platformTyps;

- (void)isInstallApp;



@property (nonatomic, assign, readonly) NSInteger type;





#pragma mark - UI -

@property (nonatomic, strong, readonly) MOBShareItemUI * itemUI;

//在平台中添加一个功能
- (void)addListItemWithImage:(NSString *)image name:(NSString *)name method:(void (^)(MOBPlatformBaseModel *model, NSMutableDictionary *parameters))method;

+ (NSArray <MOBPlatformBaseModel *>*)totalModels;

- (void)cancelAuth;

@end


NS_ASSUME_NONNULL_END
