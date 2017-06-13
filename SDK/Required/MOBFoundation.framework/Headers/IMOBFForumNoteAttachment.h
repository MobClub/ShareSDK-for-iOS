//
//  IMOBFForumNoteAttachment.h
//  MOBFoundation
//
//  Created by 冯鸿杰 on 17/3/15.
//  Copyright © 2017年 MOB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IMOBFDataModel.h"

/**
 论坛的帖子附件
 */
@protocol IMOBFForumNoteAttachment <IMOBFDataModel>

/**
 附件名称
 */
- (NSString *)fileName;

/**
 上传时间
 */
- (NSInteger)createdOn;

/**
 附件大小
 */
- (NSInteger)fileSize;

/**
 阅读权限
 */
- (NSInteger)readPerm;

/**
 是否为图片（1为图片）
 */
- (NSInteger)isImage;

/**
 若为图片，该字段表示图片宽度
 */
- (NSInteger)width;

/**
 价格
 */
- (NSInteger)price;

/**
 会员id
 */
- (NSInteger)uid;

/**
 附件链接地址
 */
- (NSString *)url;

/**
 附件文件类型
 */
- (NSString *)extension;

@end
