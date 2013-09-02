//
//  RennCommentService.h
//  RennSDK
//
//  Created by Li Chengliang on 13-4-17.
//  Copyright (c) 2013年 Li Chengliang. All rights reserved.
//

#import "RennParam.h"

extern NSString *kCommentTypeBlog;
extern NSString *kCommentTypeStatus;
extern NSString *kCommentTypePhoto;
extern NSString *kCommentTypeShare;
extern NSString *kCommentTypeAlbum;

extern NSString *kRennServiceTypePutComment;
extern NSString *kRennServiceTypeListComment;

/*
 API链接: http://wiki.dev.renren.com/wiki/V2/comment/put
 */
@interface PutCommentParam : RennParam
//必选
@property (nonatomic, retain) NSString *entryOwnerId;
//必选
@property (nonatomic, retain) NSString *entryId;
//必选
@property (nonatomic, retain) NSString *commentType;
//可选
@property (nonatomic, retain) NSString *targetUserId;
//必选
@property (nonatomic, retain) NSString *content;

@end

/*
 API链接: http://wiki.dev.renren.com/wiki/V2/comment/list
 */
@interface ListCommentParam : RennParam
//必选
@property (nonatomic, retain) NSString *entryOwnerId;
//必选
@property (nonatomic, retain) NSString *entryId;
//必选
@property (nonatomic, retain) NSString *commentType;
//可选
@property (nonatomic, assign) NSInteger pageSize;
//可选
@property (nonatomic, assign) NSInteger pageNumber;

@end
