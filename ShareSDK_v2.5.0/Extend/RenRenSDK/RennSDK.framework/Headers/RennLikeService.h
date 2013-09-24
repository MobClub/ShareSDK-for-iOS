//
//  RennLikeService.h
//  RennSDK
//
//  Created by 杨 飞 on 13-5-13.
//  Copyright (c) 2013年 Li Chengliang. All rights reserved.
//

#import "RennParam.h"

extern NSString *kLikeUGCType_VIDEO;    //视频类型
extern NSString *kLikeUGCType_BLOG;     //日志类型
extern NSString *kLikeUGCType_PHOTO;    //照片类型
extern NSString *kLikeUGCType_STATUS;   //状态类型
extern NSString *kLikeUGCType_SHARE;    //分享类型
extern NSString *kLikeUGCType_ALBUM;    //相册类型

extern NSString *kRennServiceTypeRemoveLike;
extern NSString *kRennServiceTypePutLike;
extern NSString *kRennServiceTypeGetUgcInfo;

/*
 API链接: http://wiki.dev.renren.com/wiki/V2/like/ugc/put
 */
@interface PutLikeParam : RennParam
//必选
@property (nonatomic, retain) NSString *ugcOwnerId;
//必选
@property (nonatomic, retain) NSString *likeUGCType;
//必选
@property (nonatomic, retain) NSString *ugcId;

@end

/*
 API链接: http://wiki.dev.renren.com/wiki/V2/like/ugc/remove
 */
@interface RemoveLikeParam : RennParam
//必选
@property (nonatomic, retain) NSString *ugcOwnerId;
//必选
@property (nonatomic, retain) NSString *likeUGCType;
//必选
@property (nonatomic, retain) NSString *ugcId;

@end

/*
 API链接: http://wiki.dev.renren.com/wiki/V2/like/ugc/info/get
 */
@interface GetUgcInfoParam : RennParam

//可选
@property (nonatomic, retain) NSString *limit;

//可选
@property (nonatomic, retain) NSString *withLikeUsers;

//必选
@property (nonatomic, retain) NSString *likeUGCType;

//必选
@property (nonatomic, retain) NSString *ugcId;

@end

