//
//  SSKakaoTalkSendContent.h
//  KakaoTalkConnection
//
//  Created by chenjd on 15/9/8.
//  Copyright (c) 2015年 Mob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/ISSCAttachment.h>
@interface SSKakaoTalkSendContent : NSObject

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

@end
