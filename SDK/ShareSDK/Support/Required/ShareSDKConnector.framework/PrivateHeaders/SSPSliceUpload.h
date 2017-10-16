//
//  SSPSliceUpload.h
//  ShareSDKConnector
//
//  Created by youzu on 2017/4/21.
//  Copyright © 2017年 mob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDK/SSDKTypeDefine.h>
#import <ShareSDK/SSDKVideoUploadCenter.h>

//子类需要添加此协议

@protocol ISSPSliceUpload <NSObject>

//平台ID
- (SSDKPlatformType)setPlatform;
//平台名称
- (NSString *)setPlatformName;
//开始上传
- (void)upLoadInit:(SSDKHttpServiceModel *)model;
//续传
- (void)upLoadAppend:(SSDKHttpServiceModel *)model;
//完成
- (void)upLoadFinalize:(SSDKHttpServiceModel *)model;
@end

@interface SSPSliceUpload : NSObject
{
    NSString *platformName;
    SSDKPlatformType platform;
}

/**
 校验视频数据是否合规
 
 @param mediaURL 视频本地地址
 @return 返回数据 返回数据中，没有 error_code 则说明通过校验 可以从中获取到 fileSize
 */
- (NSDictionary *)checkMedia:(NSString *)mediaURL;


/**
 文件根据路径 与文件大小获取 model

 @param mediaURL 文件路径
 @param fileSize 文件大小
 @return 文件model
 */
- (SSDKHttpServiceModel *)getModelWithMedia:(NSString *)mediaURL fileSize:(NSInteger)fileSize;


/**
 开始上传

 @param model 文件model
 */
- (void)startUPLoadWithModel:(SSDKHttpServiceModel *)model;
@end
