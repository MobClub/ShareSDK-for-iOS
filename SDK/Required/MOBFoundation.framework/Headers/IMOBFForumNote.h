//
//  IMOBForumNote.h
//  MOBFoundation
//
//  Created by 冯鸿杰 on 17/3/15.
//  Copyright © 2017年 MOB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IMOBFDataModel.h"

/**
 论坛帖子
 */
@protocol IMOBFForumNote <IMOBFDataModel>

/**
 帖子id
 */
- (NSInteger)tid;

/**
 版块id
 */
- (NSInteger)fid;

/**
 标题
 */
- (NSString *)subject;

/**
 内容，html文本
 */
- (NSString *)message;

/**
 摘要
 */
- (NSString *)summary;

/**
 图片列表
 */
- (NSArray *)images;

/**
 附件地址列表
 */
- (NSMutableArray *)attachments;

/**
 作者
 */
- (NSString *)author;

/**
 作者id
 */
- (NSInteger)authorId;

/**
 帖子创建时间
 */
- (NSInteger)createdOn;

/**
 头像
 */
- (NSString *)avatar;

/**
 回复数
 */
- (NSInteger)replies;

/**
 浏览数
 */
- (NSInteger)views;

@end
