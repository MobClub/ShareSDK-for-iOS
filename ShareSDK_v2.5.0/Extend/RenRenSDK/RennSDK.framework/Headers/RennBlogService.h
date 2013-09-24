//
//  RennBlogService.h
//  RennSDK
//
//  Created by Li Chengliang on 13-4-10.
//  Copyright (c) 2013年 Li Chengliang. All rights reserved.
//

#import "RennParam.h"

extern const NSString *kTypeGetBlog;
extern const NSString *kTypePutBlog;
extern const NSString *kTypeListBlog;

/*
 API链接: http://wiki.dev.renren.com/wiki/V2/blog/get
 */
@interface GetBlogParam : RennParam
//必选
@property (nonatomic, retain) NSString *blogId;
//必选
@property (nonatomic, retain) NSString *ownerId;
//可选
@property (nonatomic, retain) NSString *password;

@end

/*
 API链接: http://wiki.dev.renren.com/wiki/V2/blog/put
 */
@interface PutBlogParam : RennParam
//必选
@property (nonatomic, retain) NSString *title;
//可选
@property (nonatomic, retain) NSString *accessControl;
//可选
@property (nonatomic, retain) NSString *password;
//必选
@property (nonatomic, retain) NSString *content;

@end

/*
 API链接: http://wiki.dev.renren.com/wiki/V2/blog/list
 */
@interface ListBlogParam : RennParam
//必选
@property (nonatomic, retain) NSString *ownerId;
//可选
@property (nonatomic, assign) NSInteger pageSize;
//必选
@property (nonatomic, assign) NSInteger pageNumber;

@end
