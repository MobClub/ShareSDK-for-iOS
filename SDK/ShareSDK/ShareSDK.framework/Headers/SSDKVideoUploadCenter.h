//
//  SSDKVideoUploadCenter.h
//  ShareSDK
//
//  Created by youzu on 17/2/28.
//  Copyright © 2017年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MOBFoundation/MOBFoundation.h>
#import "SSDKTypeDefine.h"
#import "SSDKHttpServiceModel.h"

@interface SSDKVideoUploadCenter : NSObject

+ (SSDKVideoUploadCenter *)shareInstance;

//平台注册
- (void)registePlatform:(SSDKPlatformType)platform platformName:(NSString *)platformName;


/**
 用于获取上传Model数据

 @param platformType 分享平台
 @param url 本地资源地址
 @param tag 标签
 @param progressEvent 上传进度
 @return 上传的数据Model
 */
- (SSDKHttpServiceModel *)uploadProgressWithPlatformType:(SSDKPlatformType)platformType
                               fileURL:(NSURL *)url
                                   tag:(NSString *)tag
                         progressEvent:(MOBFHttpUploadProgressEvent)progressEvent;


/**
 指定 上传Model数据 进行暂停操作

 @param model 上传Model数据
 */
- (void)stopWithModel:(SSDKHttpServiceModel *)model;

/**
 指定 上传Model数据 在暂停后进行继续上传
 
 @param model 上传Model数据
 */
- (void)continueWithModel:(SSDKHttpServiceModel *)model;


/**
 指定 上传Model数据 关闭上传操作
 
 @param model 上传Model数据
 */
- (void)closeWithModel:(SSDKHttpServiceModel *)model;

@property (nonatomic,strong) NSMutableArray *httpServiceArray;

@end
