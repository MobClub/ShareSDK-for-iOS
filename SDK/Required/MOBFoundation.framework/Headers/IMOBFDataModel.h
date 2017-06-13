//
//  IJIMDataModel.h
//  Jimu
//
//  Created by 冯鸿杰 on 17/2/10.
//  Copyright © 2017年 Mob. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 数据模型协议
 */
@protocol IMOBFDataModel <NSObject>

/**
 初始化数据模型

 @param dict 初始化数据
 @return 数据模型
 */
- (instancetype)initWithDict:(NSDictionary *)dict;

/**
 设置数据

 @param data 数据
 @param key 名称
 */
- (void)set:(id)data key:(NSString *)key;

/**
 获取数据

 @param key 名称
 */
- (id)get:(NSString *)key;

/**
 返回一个字典结构
 
 @return 字段数据对象
 */
- (NSDictionary *)dictionaryValue;

@end
