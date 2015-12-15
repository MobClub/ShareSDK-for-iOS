//
//  SSKakaoTalkShareContentEntity.h
//  KakaoTalkConnection
//
//  Created by chenjd on 15/9/8.
//  Copyright (c) 2015年 Mob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDK/ShareSDKPlugin.h>
@interface SSKakaoTalkShareContentEntity : NSObject <ISSPlatformShareContentEntity,
                                                    NSCoding>
{
@private
    NSMutableDictionary *_dict;
}

/**
 *	@brief	分享类型
 */
@property (nonatomic, strong) NSNumber *mediaType;

/**
 *	@brief	发送内容
 */
@property (nonatomic, copy) NSString *content;

/**
 *	@brief	链接按钮标题
 */
@property (nonatomic, copy) NSString *newsButtonTitle;

/**
 *	@brief	链接路径
 */
@property (nonatomic, copy) NSString *url;

/**
 *	@brief	图片
 */
@property (nonatomic, strong) id<ISSCAttachment> image;

/**
 *  @brief 图片尺寸
 */
@property (nonatomic, strong) NSValue *imageSizeValue;

/**
 *  brief 应用分享按钮标题
 */
@property (nonatomic, copy)NSString *appButtonTitle;

/**
 *  @brief 启动安卓版应用时传入参数
 */
@property (nonatomic, strong)NSDictionary *andriodExecParam;

/**
 *  @brief 启动iphone版应用时传入参数
 */
@property (nonatomic, strong)NSDictionary *iphoneExecParam;

/**
 *  @brief 启动ipad版应用时传入参数
 */
@property (nonatomic, strong)NSDictionary *ipadExecParam;

/**
 *	@brief	通过分享内容解析实体数据
 *
 *	@param 	content 	分享内容
 */
- (void)parseWithContent:(id<ISSContent>)content;

@end
