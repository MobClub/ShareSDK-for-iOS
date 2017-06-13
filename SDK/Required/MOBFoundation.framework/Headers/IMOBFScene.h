//
//  IMOBFScene.h
//  MOBFoundation
//
//  Created by 冯鸿杰 on 2017/4/25.
//  Copyright © 2017年 MOB. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 场景信息，MobLink还原场景返回的相关场景信息
 */
@protocol IMOBFScene <NSObject>

/**
 路径
 */
@property (nonatomic, copy) NSString *path;

/**
 来源标识
 */
@property (nonatomic, copy) NSString *source;

/**
 自定义参数
 */
@property (nonatomic, strong) NSDictionary *params;

/**
 MobId
 */
@property (nonatomic, copy, readonly) NSString *mobid;

@end
