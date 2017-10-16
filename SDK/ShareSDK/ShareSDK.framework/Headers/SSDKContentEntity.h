//
//  SSDKContentEntity.h
//  ShareSDK
//
//  Created by 冯 鸿杰 on 15/2/9.
//  Copyright (c) 2015年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDK/IMOBFContentEntity.h>
#import <MOBFoundation/MOBFDataModel.h>

/**
 *  内容实体
 */
@interface SSDKContentEntity : MOBFDataModel <IMOBFContentEntity>

/**
 *  内容标识
 */
@property (nonatomic, copy) NSString *cid;

/**
 *  分享文本
 */
@property (nonatomic, copy) NSString *text;

/**
 *  分享图片列表,元素为SSDKImage
 */
@property (nonatomic, retain) NSArray *images;

/**
 *  分享链接列表,元素为NSURL
 */
@property (nonatomic, retain) NSArray *urls;

/**
 *  原始数据
 */
@property (nonatomic, retain) id rawData;

@end
