//
//  UIViewController+MLSDKRestore.h
//  MobLink
//
//  Created by chenjd on 16/11/14.
//  Copyright © 2016年 Mob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLSDKScene.h"

@interface UIViewController (MLSDKRestore)

/**
 控制器初始化

 @param scene 场景参数
 @return 控制器对象
 */
- (instancetype)initWithMobLinkScene:(MLSDKScene *)scene;

@end
