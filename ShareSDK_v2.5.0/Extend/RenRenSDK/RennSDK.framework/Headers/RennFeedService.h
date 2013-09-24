//
//  RennFeedService.h
//  RennSDK
//
//  Created by Li Chengliang on 13-4-10.
//  Copyright (c) 2013年 Li Chengliang. All rights reserved.
//

#import "RennParam.h"

extern NSString *kRennServiceTypePutFeed;
extern NSString *kRennServiceTypeListFeed;

/*
 API链接: http://wiki.dev.renren.com/wiki/V2/feed/put
 */
@interface PutFeedParam : RennParam
//必选
@property (nonatomic, retain) NSString *message;
//必选
@property (nonatomic, retain) NSString *title;
//可选
@property (nonatomic, retain) NSString *actionTargetUrl;
//可选
@property (nonatomic, retain) NSString *imageUrl;
//必选
@property (nonatomic, retain) NSString *description;
//可选
@property (nonatomic, retain) NSString *subtitle;
//可选
@property (nonatomic, retain) NSString *actionName;
//必选
@property (nonatomic, retain) NSString *targetUrl;

@end


/*
 API链接: http://wiki.dev.renren.com/wiki/V2/feed/list
 */
@interface ListFeedParam : RennParam
//可选
@property (nonatomic, retain) NSString *feedType;
//可选
@property (nonatomic, retain) NSString *userId;
//可选
@property (nonatomic, assign) NSInteger pageSize;
//可选
@property (nonatomic, assign) NSInteger pageNumber;

@end


