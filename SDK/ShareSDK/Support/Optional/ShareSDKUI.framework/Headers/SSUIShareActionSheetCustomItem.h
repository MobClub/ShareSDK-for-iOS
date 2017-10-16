//
//  SSUIShareActionSheetCustomItem.h
//  ShareSDKUI
//
//  Created by fenghj on 15/6/18.
//  Copyright (c) 2015年 mob. All rights reserved.
//

#import "SSUIShareActionSheetItem.h"

/**
 *  自定义分享菜单项
 */
@interface SSUIShareActionSheetCustomItem : SSUIShareActionSheetItem

/**
 *  初始化自定义分享菜单项
 *
 *  @param icon         图标
 *  @param label        标签
 *  @param clickHandler 点击事件
 *
 *  @return 分享菜单项对象
 */
- (instancetype)initWithIcon:(UIImage *)icon
                       label:(NSString *)label
                clickHandler:(void(^)())clickHandler;

/**
 *  触发点击
 */
- (void)triggerClick;

@end
