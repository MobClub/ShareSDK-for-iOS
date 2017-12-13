//
//  KakaoConnector.h
//  ShareSDKConnector
//
//  Created by 冯鸿杰 on 16/9/28.
//  Copyright © 2016年 mob. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Kakao连接器
 */
@interface KakaoConnector : NSObject

/**
 *  链接KaKao以供ShareSDK可以正常使用KaKao进行分享
 *
 *  @param koSessionClass KaKao SDK中的类型，应先导入KakaoOpenSDK.framework，再将[KOSession class]传入到此参数。
 */
+ (void)connect:(Class)koSessionClass;

@end
