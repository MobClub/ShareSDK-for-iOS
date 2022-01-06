//
//  SmallWindowExample.h
//  SecVerifyDemo
//
//  Created by TanXiang on 2020/11/27.
//  Copyright © 2020 yoozoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SecVerify/SVSDKHyVerify.h>

//窗口样式的授权页示例
@interface SmallWindowExample : NSObject<SVSDKVerifyDelegate>

- (instancetype)initWithTarget:(id)target;

//自定义UI
-(void)setupAuthPageCustomStyle:(UIViewController *)authVC userInfo:(SVSDKHyProtocolUserInfo *)userInfo;

@end
