//
//  RennShareService.h
//  RennSDK
//
//  Created by Li Chengliang on 13-4-8.
//  Copyright (c) 2013年 Li Chengliang. All rights reserved.
//

#import "RennParam.h"

extern NSString *kShareTypeBlog;
extern NSString *kShareTypePhoto;
extern NSString *kShareTypeShare;
extern NSString *kShareTypeAlbum;

extern NSString *kRennServiceTypeGetShare;
extern NSString *kRennServiceTypePutShareUgc;
extern NSString *kRennServiceTypePutShareUrl;
extern NSString *kRennServiceTypeListShare;
extern NSString *kRennServiceTypeListHotShare;

/*
 API链接: http://wiki.dev.renren.com/wiki/V2/share/get
 */
@interface GetShareParam : RennParam
//必选
@property (nonatomic, retain) NSString *shareId;
//必选
@property (nonatomic, retain) NSString *ownerId;

@end

/*
 API链接: http://wiki.dev.renren.com/wiki/V2/share/ugc/put
 */
@interface PutShareUgcParam : RennParam
//必选
@property (nonatomic, retain) NSString *ugcOwnerId;
//可选
@property (nonatomic, retain) NSString *comment;
//必选
@property (nonatomic, retain) NSString *ugcId;
//必选
@property (nonatomic, retain) NSString *ugcType;

@end

/*
 API链接: http://wiki.dev.renren.com/wiki/V2/share/url/put
 */
@interface PutShareUrlParam : RennParam
//可选
@property (nonatomic, retain) NSString *comment;
//必选
@property (nonatomic, retain) NSString *url;

@end

/*
 API链接: http://wiki.dev.renren.com/wiki/V2/share/list
 */
@interface ListShareParam : RennParam
//必选
@property (nonatomic, retain) NSString *ownerId;
//可选
@property (nonatomic, assign) NSInteger pageSize;
//可选
@property (nonatomic, assign) NSInteger pageNumber;

@end

/*
 API链接: http://wiki.dev.renren.com/wiki/V2/share/hot/list
 */
@interface ListHotShareParam : RennParam
//必选
@property (nonatomic, retain) NSString * shareType;
//可选
@property (nonatomic, assign) NSInteger pageSize;
//可选
@property (nonatomic, assign) NSInteger pageNumber;

@end
