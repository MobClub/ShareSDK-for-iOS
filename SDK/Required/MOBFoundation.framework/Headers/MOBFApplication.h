//
//  MOBFApplicationUtils.h
//  MOBFoundation
//
//  Created by vimfung on 15-1-20.
//  Copyright (c) 2015年 MOB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  应用工具类
 */
@interface MOBFApplication : NSObject

/**
 *  获取应用名称
 *
 *  @return 应用名称
 */
+ (NSString *)name;

/**
 *  获取应用包名
 *
 *  @return 包名
 */
+ (NSString *)bundleId;

/**
 *  获取应用编译版本
 *
 *  @return 编译版本
 */
+ (NSString *)buildVersion;

/**
 *  获取应用版本号
 *
 *  @return 应用版本号
 */
+ (NSString *)shortVersion;

/**
 *  获取应用版本号
 *
 *  @return 版本号
 */
+ (NSString *)version __deprecated_msg("use [buildVersion] method instead");

/**
 *  检测是否启用ATS功能
 */
+ (BOOL)enabledATS;

/**
 *  获取应用运行经过的时间（单位：毫秒）
 *
 *  @return 经过时间
 */
+ (uint64_t)elapsedTime;

/**
 *  判断链接是否能打开
 *
 *  @param url 链接
 *
 *  @return YES 可以打开，NO 不能打开
 */
+ (BOOL)canOpenUrl:(NSURL *)url;

/**
 *  打开链接
 *
 *  @param url 链接
 */
+ (BOOL)openUrl:(NSURL *)url;

/**
 *  获取显示名称
 *
 *  @return 显示名称
 */
+ (NSString *)displayname;

/**
*  获取 NSUserTrackingUsageDescription
*
*  @return NSUserTrackingUsageDescription
*/
+ (id)trackingUsageDes;

/**
*  获取程序状态
*
*  @return 程序状态
*/
+ (UIApplicationState)applicationState;


/**
*  获取infoDictionary
*
*  @return infoDictionary
*/
+ (NSDictionary *)infoDict;

/**
*  获取 操作系统版本字符串
*
*  @return 操作系统版本字符串
*/
+ (NSString *)operatingSysVerStr;

/**
*  获取 状态栏样式
*
*  @return 操作系统版本字符串
*/
+ (UIStatusBarStyle)statusBarStyle;

/**
 *  打开链接
 *
 *  @param url 链接
 *  @param options 选项参数
 *  @param completion 成功与否的回调
 */
+ (void)openURL:(NSURL*)url options:(NSDictionary<UIApplicationOpenExternalURLOptionsKey, id> *)options completionHandler:(void (^ __nullable)(BOOL success))completion;

/**
*  获取 状态栏frame
*
*  @return 操作系统版本字符串
*/
+ (CGRect)statusBarFrame;

/**
*  获取 主窗口
*
*  @return 主窗口
*/
+ (UIWindow * _Nullable)keyWindow;

/**
*  获取 所有窗口
*
*  @return 所有窗口
*/
+ (NSArray * _Nullable)windows;


/**
*  获取 所有窗口
*
*  @return 所有窗口
*/
+ (BOOL)statusBarHidden;

/**
*  获取 状态栏方向
*
*  @return 状态栏方向
*/
+ (UIInterfaceOrientation)statusBarOrientation;

/**
*  获取 网络指示器是否可见
*
*  @return 网络指示器是否可见
*/
+ (BOOL)networkActivityIndicatorVisible;

/**
*  获取 本地信息
*
*  @return 本地信息
*/
+ (NSLocale * _Nullable)currentLocale;

/**
*  获取 本地国家码
*
*  @return 本地国家码
*/
+ (NSString * _Nullable)localecountryCode;
@end
