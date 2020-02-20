//
//  MobSDK+Privacy.h
//  MOBFoundation
//
//  Created by liyc on 2020/1/21.
//  Copyright © 2020 MOB. All rights reserved.
//

#import <MOBFoundation/MobSDK.h>
#import <UIKit/UIKit.h>

#ifndef MobSDK_Privacy_h
#define MobSDK_Privacy_h

@interface MobSDK (Privacy)


/**
 获取用户隐私协议
 
 @param type 协议类型 (1= url类型, 2=  富文本类型)
 @param data  title=标题,content=内容(type=1，返回url,type = 2时返回富文本)
 */
+ (void)getPrivacyPolicy:(NSString * _Nullable)type
             compeletion:(void (^ _Nullable)(NSDictionary * _Nullable data,NSError * _Nullable error))result;

/**
 上传权限提示框状态
 */
+ (void)uploadWindowPermisionStatus:(NSString *_Nullable)product
                              title:(NSString *_Nullable)title
                            isAgree:(BOOL)isAgree
                           onResult:(void (^_Nullable)(BOOL success))handler;

/**
 上传隐私协议授权状态
 @param isAgree 是否同意
 */
+ (void)uploadPrivacyPermissionStatus:(BOOL)isAgree
                             onResult:(void (^_Nullable)(BOOL success))handler;

/**
 设置是否允许弹窗
 */
+ (void)setAllowShowPrivacyWindow:(BOOL)show;

/**
 设置隐私协议弹窗色调
 */
+ (void)setPrivacyBackgroundColor:(UIColor *_Nullable)backColor
             operationButtonColor:(NSArray <UIColor *>*_Nullable)colors;



@end


#endif /* MobSDK_Privacy_h */
