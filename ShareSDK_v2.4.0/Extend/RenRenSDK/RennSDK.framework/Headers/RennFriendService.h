//
//  RennFriendService.h
//  RennSDK
//
//  Created by 杨 飞 on 13-5-13.
//  Copyright (c) 2013年 YangFei. All rights reserved.
//

#import "RennParam.h"

extern NSString *kRennServiceTypeListFriend;



/*
 API链接: http://wiki.dev.renren.com/wiki/V2/friend/list
 */
@interface ListFriendParam : RennParam

//可选
@property (nonatomic, retain) NSString *userId;

//可选
@property (nonatomic, assign) NSInteger pageSize;

//可选
@property (nonatomic, assign) NSInteger pageNumber;

@end

