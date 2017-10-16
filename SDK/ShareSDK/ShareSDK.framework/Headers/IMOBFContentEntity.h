//
//  IMOBFContentEntity.h
//  ShareSDK
//
//  Created by youzu on 2017/9/18.
//  Copyright © 2017年 掌淘科技. All rights reserved.
//

#import <MOBFoundation/IMOBFDataModel.h>

@protocol IMOBFContentEntity <IMOBFDataModel>

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
@property (nonatomic, strong) NSArray *images;

/**
 *  分享链接列表,元素为NSURL
 */
@property (nonatomic, strong) NSArray *urls;

/**
 *  原始数据
 */
@property (nonatomic, strong) NSDictionary *rawData;

@end
