//
//  RennStatusService.h
//  RennSDK
//
//  Created by Li Chengliang on 13-4-10.
//  Copyright (c) 2013年 Li Chengliang. All rights reserved.
//

#import "RennParam.h"

extern NSString *kRennServiceTypeGetStatus;
extern NSString *kRennServiceTypePutStatus;
extern NSString *kRennServiceTypeListStatus;
extern NSString *kRennServiceTypeShareStatus;

/*
 API链接: http://wiki.dev.renren.com/wiki/V2/status/get
 */
@interface GetStatusParam : RennParam
//必选
@property (nonatomic, retain) NSString *statusId;
//必选
@property (nonatomic, retain) NSString *ownerId;

@end

/*
 API链接: http://wiki.dev.renren.com/wiki/V2/status/put
 */
@interface PutStatusParam : RennParam
//必选
@property (nonatomic, retain) NSString *content;

@end

/*
 API链接: http://wiki.dev.renren.com/wiki/V2/status/list
 */
@interface ListStatusParam : RennParam
//必选
@property (nonatomic, retain) NSString *ownerId;
//可选
@property (nonatomic, assign) NSInteger pageSize;
//可选
@property (nonatomic, assign) NSInteger pageNumber;

@end

/*
 API链接: http://wiki.dev.renren.com/wiki/V2/status/share
 */
@interface ShareStatusParam : RennParam
//必选
@property (nonatomic, retain) NSString *content;
//必选
@property (nonatomic, retain) NSString *statusId;
//必选
@property (nonatomic, retain) NSString *ownerId;

@end
