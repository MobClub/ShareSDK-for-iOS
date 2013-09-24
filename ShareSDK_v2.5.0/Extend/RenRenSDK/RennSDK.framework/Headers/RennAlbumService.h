//
//  AlbumService.h
//  RennSDK
//
//  Created by Li Chengliang on 13-4-10.
//  Copyright (c) 2013年 Li Chengliang. All rights reserved.
//

#import "RennParam.h"

extern const NSString *kAccessControlPrivate;   //仅自己可见
extern const NSString *kAccessControlPublic;    //所有人可见
extern const NSString *kAccessControlPassword;  //密码访问可见
extern const NSString *kAccessControlFriend;    //仅好友可见

extern NSString *kRennServiceTypeGetAlbum;
extern NSString *kRennServiceTypePutAlbum;
extern NSString *kRennServiceTypeListAlbum;

/*
 API链接: http://wiki.dev.renren.com/wiki/V2/album/get
 */
@interface GetAlbumParam : RennParam
//必选
@property (nonatomic, retain) NSString *albumId;
//必选
@property (nonatomic, retain) NSString *ownerId;

@end

/*
 API链接: http://wiki.dev.renren.com/wiki/V2/album/put
 */
@interface PutAlbumParam : RennParam
//可选
@property (nonatomic, retain) NSString *location;
//可选
@property (nonatomic, retain) NSString *description;
//必选
@property (nonatomic, retain) NSString *name;
//可选
@property (nonatomic, retain) NSString *accessControl;
//可选
@property (nonatomic, retain) NSString *password;

@end

/*
 API链接: http://wiki.dev.renren.com/wiki/V2/album/list
 */
@interface ListAlbumParam : RennParam
//必选
@property (nonatomic, retain) NSString *ownerId;
//可选
@property (nonatomic, assign) NSInteger pageSize;
//可选
@property (nonatomic, assign) NSInteger pageNumber;

@end
