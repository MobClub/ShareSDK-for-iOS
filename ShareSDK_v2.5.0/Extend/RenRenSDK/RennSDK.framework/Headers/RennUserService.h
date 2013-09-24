//
//  RennUserService.h
//  RennSDK
//
//  Created by Li Chengliang on 13-4-10.
//  Copyright (c) 2013年 Li Chengliang. All rights reserved.
//

#import "RennParam.h"

extern NSString *kRennServiceTypeGetUser;
extern NSString *kRennServiceTypeBatchUser;
extern NSString *kRennServiceTypeListUserFriendMutual;
extern NSString *kRennServiceTypeListUserFriend;
extern NSString *kRennServiceTypeListUserFriendApp;
extern NSString *kRennServiceTypeGetLogin;

/*
 API链接: http://wiki.dev.renren.com/wiki/V2/user/get
 */
@interface GetUserParam : RennParam
//必选
@property (nonatomic, retain) NSString *userId;

@end

/*
 API链接: http://wiki.dev.renren.com/wiki/V2/user/batch
 */
@interface BatchUserParam : RennParam
//必选
@property (nonatomic, retain) NSArray *userIds;

@end

/*
 API链接: http://wiki.dev.renren.com/wiki/V2/user/friend/mutual/list
 */
@interface ListUserFriendMutualParam : RennParam
//必选
@property (nonatomic, retain) NSString *userId;

@end

/*
 API链接: http://wiki.dev.renren.com/wiki/V2/user/friend/list
 */
@interface ListUserFriendParam : RennParam
//必选
@property (nonatomic, retain) NSString *userId;
//可选
@property (nonatomic, assign) NSInteger pageSize;
//可选
@property (nonatomic, assign) NSInteger pageNumber;

@end

/*
 API链接: http://wiki.dev.renren.com/wiki/V2/user/friend/app/list
 */
@interface ListUserFriendAppParam : RennParam

@end

/*
 API链接: http://wiki.dev.renren.com/wiki/V2/user/login/get
 */
@interface GetUserLoginParam : RennParam

@end
