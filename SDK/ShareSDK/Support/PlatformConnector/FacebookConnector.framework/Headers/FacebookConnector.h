//
//  FacebookConnector.h
//  ShareSDKConnector
//
//  Created by 冯鸿杰 on 16/9/28.
//  Copyright © 2016年 mob. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Facebook连接器
 */
@interface FacebookConnector : NSObject

/**
 *  链接Facebook Messenger以供ShareSDK可以正常使用Facebook Messenger的相关功能
 *
 *  @param fbmApiClass Facebook Messenger SDK中的类型，应先导入FBSDKMessengerShareKit.framework，再将[FBSDKMessengerSharer class]传入到参数中。
 */
+ (void)connectMessenger:(Class)fbmApiClass;

@end
