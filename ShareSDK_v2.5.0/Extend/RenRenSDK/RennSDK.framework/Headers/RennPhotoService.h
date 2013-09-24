//
//  RennPhotoService.h
//  RennSDK
//
//  Created by Li Chengliang on 13-4-10.
//  Copyright (c) 2013年 Li Chengliang. All rights reserved.
//

#import "RennParam.h"

extern NSString *kRennServiceTypeGetPhoto;
extern NSString *kRennServiceTypeUploadPhoto;
extern NSString *kRennServiceTypeListPhoto;

/*
 API链接: http://wiki.dev.renren.com/wiki/V2/photo/get
 */
@interface GetPhotoParam : RennParam
//可选
@property (nonatomic, retain) NSString *albumId;
//必选
@property (nonatomic, retain) NSString *photoId;
//必选
@property (nonatomic, retain) NSString *ownerId;
//可选
@property (nonatomic, retain) NSString *password;

@end

/*
 API链接: http://wiki.dev.renren.com/wiki/V2/photo/upload
 */
@interface UploadPhotoParam : RennParam
//必选
@property (nonatomic, retain) NSString *albumId;
//可选
@property (nonatomic, retain) NSString *description;
//可选
@property (nonatomic, retain) NSData *file;

@end

/*
 API链接: http://wiki.dev.renren.com/wiki/V2/photo/list
 */
@interface ListPhotoParam : RennParam
//必选
@property (nonatomic, retain) NSString *albumId;
//必选
@property (nonatomic, retain) NSString *ownerId;
//可选
@property (nonatomic, retain) NSString *password;
//可选
@property (nonatomic, assign) NSInteger pageSize;
//可选
@property (nonatomic, assign) NSInteger pageNumber;

@end

