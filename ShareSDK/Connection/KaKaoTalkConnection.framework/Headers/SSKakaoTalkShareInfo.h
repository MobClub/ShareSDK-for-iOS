//
//  SSKakaoTalkShareInfo.h
//  KakaoTalkConnection
//
//  Created by chenjd on 15/9/8.
//  Copyright (c) 2015年 Mob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDK/ShareSDK.h>
@interface SSKakaoTalkShareInfo : NSObject<ISSPlatformShareInfo,
                                           NSCoding,
                                           ISSCDataObject>

/**
 *	@brief	分享内容
 */
@property (nonatomic, copy) NSString *text;

/**
 *	@brief	分享的链接列表
 */
@property (nonatomic, strong) NSArray *urls;

/**
 *	@brief	分享的图片列表
 */
@property (nonatomic, strong) NSArray *imgs;

/**
 *	@brief	扩展信息
 */
@property (nonatomic, strong) NSDictionary *extInfo;

@end
