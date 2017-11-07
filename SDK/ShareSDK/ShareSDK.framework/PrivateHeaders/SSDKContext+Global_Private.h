//
//  SSDKContext+Global_Private.h
//  ShareSDK
//
//  Created by youzu on 2017/8/14.
//  Copyright © 2017年 掌淘科技. All rights reserved.
//

@interface SSDKContext (Global)

//仅用于 微博应用内分享 授权 由于微博的执行逻辑是直接调用 application:openURL:sourceApplication:annotation:方法回传授权状态的 所以必须hook application:openURL:sourceApplication:annotation:
- (void)hookOpenURL;
- (void)unHookOpenURL;

@end
