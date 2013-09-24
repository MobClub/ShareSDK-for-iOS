//
//  RennProfileService.h
//  RennSDK
//
//  Created by Li Chengliang on 13-4-10.
//  Copyright (c) 2013年 Li Chengliang. All rights reserved.
//

#import "RennParam.h"

extern NSString *kRennServiceTypeGetProfile;

/*
 API链接: http://wiki.dev.renren.com/wiki/V2/profile/get
 */
@interface GetProfileParam : RennParam
//必选
@property (nonatomic, retain) NSString *userId;

@end
