//
//  IMOBFForum.h
//  MOBFoundation
//
//  Created by 冯鸿杰 on 17/3/15.
//  Copyright © 2017年 MOB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IMOBFDataModel.h"

/**
 论坛版块
 */
@protocol IMOBFForumSection <IMOBFDataModel>

/**
 获取版块ID

 @return 版块ID
 */
- (NSInteger)fid;

/**
 获取版块名称

 @return 名称
 */
- (NSString *)name;

/**
 获取版块类别：group:分类 forum:普通论坛 sub:子论坛

 @return 版块类别
 */
- (NSString *)type;

/**
 获取显示顺序

 @return 显示顺序
 */
- (NSInteger)displayOrder;

@end
