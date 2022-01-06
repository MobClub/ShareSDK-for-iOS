//
//  SMSDemoCommitCodeVC.h
//  SMSSDKDemo
//
//  Created by hower on 2020/1/2.
//  Copyright © 2020 youzu. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SVDDemoRGBA(r,g,b,a) [UIColor colorWithRed:(r / 255.0) green:(g / 255.0) blue:(b / 255.0) alpha:a]

typedef void(^SMSDCommitCodeResultHanler)(NSDictionary *dict,NSError *error);


@interface SVDMobileAuthCommitCodeVC : UIViewController

/**
 初始化获取验证码视图控制器
 
 *  @param tokenInfo tokens
 */
- (instancetype)initWithTokenInfo:(NSDictionary *)tokenInfo result:(SMSDCommitCodeResultHanler)result;

@end

