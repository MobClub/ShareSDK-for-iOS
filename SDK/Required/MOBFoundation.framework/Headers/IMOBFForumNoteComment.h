//
//  IMOBFNoteComment.h
//  MOBFoundation
//
//  Created by 冯鸿杰 on 17/3/15.
//  Copyright © 2017年 MOB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IMOBFDataModel.h"

/**
 论坛的帖子评论
 */
@protocol IMOBFForumNoteComment <IMOBFDataModel>

/**
 帖子所属版块id
 */
- (NSInteger)fid;

/**
 主题帖子id
 */
- (NSInteger)tid;

/**
 回帖id
 */
- (NSInteger)pid;

/**
 回帖内容（html文本）
 */
- (NSString *)message;

/**
 父评论
 */
- (id<IMOBFForumNoteComment>)prepost;

/**
 回帖者昵称
 */
- (NSString *)author;

/**
 回帖者id
 */
- (NSInteger)authorId;

/**
 回帖者头像URL
 */
- (NSString *)avatar;

/**
 回帖时间
 */
- (NSInteger)createdOn;

/**
 回帖楼层/位置
 */
- (NSInteger)position;

@end
