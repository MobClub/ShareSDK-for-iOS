//
//  SSUIShareContentEditorView.h
//  ShareSDKUI
//
//  Created by fenghj on 15/6/18.
//  Copyright (c) 2015年 mob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <ShareSDK/ShareSDK.h>
#import "SSUITypeDef.h"

/**
 *  内容编辑视图
 */
@interface SSUIShareContentEditorViewController : NSObject

/**
 *  初始化内容编辑视图
 *
 *  @param content       内容
 *  @param image         图片
 *  @param platformTypes 平台列表
 *
 *  @return 内容视图
 */
- (instancetype)initWithContent:(NSString *)content
                          image:(SSDKImage *)image
                  platformTypes:(NSArray *)platformTypes;

/**
 *  显示编辑视图
 */
- (void)show;

/**
 *  关闭编辑视图
 */
- (void)dismiss;

/**
 *  提交事件
 *
 *  @param submitHandler 提交事件触发器
 */
- (void)onSubmit:(SSUIShareContentEditorViewSubmitHandler)submitHandler;

/**
 *  取消事件
 *
 *  @param cancelHandler 取消事件触发器
 */
- (void)onCancel:(SSUIShareContentEditorViewCancelHandler)cancelHandler;

@end
