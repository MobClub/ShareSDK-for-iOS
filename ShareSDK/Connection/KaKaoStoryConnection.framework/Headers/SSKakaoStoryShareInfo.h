//
//  SSKakaoStoryShareInfo.h
//  KakaoStoryConnection
//
//  Created by chenjd on 15/11/18.
//  Copyright © 2015年 Mob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDK/ISSPlatformShareInfo.h>
#import <ShareSDKCoreService/ISSCDataObject.h>
@interface SSKakaoStoryShareInfo : NSObject <ISSPlatformShareInfo,
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

/**
 *	@brief	分享标识
 */
@property (nonatomic, copy) NSString *sid;

@end
