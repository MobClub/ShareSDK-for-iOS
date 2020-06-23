//
//  MOBShareExample.h
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/15.
//  Copyright © 2019 mob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MOBPlatformBaseModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MOBShareExample : NSObject



+ (MOBShareExample *)defaultExample;


//分享状态回调弹框处理
- (void)sharePlatType:(SSDKPlatformType)type userData:(NSDictionary *)userData state:(SSDKResponseState)state error:(NSError *)error;

//授权回调弹框处理
- (void)authResponseStatus:(SSDKResponseState)state error:(NSError *)error;

//弹出分享菜单
- (void)popShareWithView:(UIView *)view;

//截图分享
- (void)shotShare;

//摇一摇分享
- (void)shakeShare;

//新浪LinkCard分享
- (void)sinaLinkCardShare;




//闭环分享
- (void)shareLink;

@end

NS_ASSUME_NONNULL_END
