//
//  SSDKHttpServiceModel.h
//  ShareSDK
//
//  Created by youzu on 17/2/28.
//  Copyright © 2017年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MOBFoundation/MOBFHttpService.h>
#import <ShareSDK/ShareSDK.h>

typedef NS_ENUM(NSUInteger, SSPHttpServiceType){
    SSPHttpServiceInit = 0,
    SSPHttpServiceAppend = 1,
    SSPHttpServiceFinalize = 2,
    SSPHttpServiceFinish = 3
};

@interface SSDKHttpServiceModel : NSObject

@property (nonatomic, copy)NSString *fileURL;

@property (nonatomic)NSInteger totalBytes;

@property (nonatomic)NSInteger uploadedBytes;

@property (nonatomic, copy) NSString *sessionID;

@property (nonatomic, weak) MOBFHttpService *httpService;

@property (nonatomic, copy) NSString *tag;

@property (nonatomic, copy) NSString *callback;

@property (nonatomic, copy) NSString *consumerKey;

@property (nonatomic, copy) NSString *consumerSecret;

@property (nonatomic, copy) NSString *token;

@property (nonatomic, copy) NSString *tokenSecret;

@property (nonatomic, copy) NSString *mediaID; //facebook video_id

@property (nonatomic) NSTimeInterval expiresTime;

@property (nonatomic) NSInteger segmentIndex;

@property (nonatomic) NSInteger maxIndex;

@property (nonatomic, copy)NSString *youtubeJsonString;

@property (nonatomic, copy)NSString *youtubeAuthorization;

@property (nonatomic, copy)NSString *youtubeParts;

@property (nonatomic, copy)NSString *youtubeLocation;

@property (nonatomic, copy)NSString *facebookUploadURL;

@property (nonatomic, copy)NSString *facebookUploadSessionID;

@property (nonatomic)NSInteger facebookStartOffset;

@property (nonatomic)NSInteger facebookEndOffset;

@property (nonatomic, copy) NSString *dropboxUploadSessionID;

@property (nonatomic) SSDKPlatformType platformType;

@property (nonatomic) SSPHttpServiceType serviceType;

@property (nonatomic, copy)MOBFHttpUploadProgressEvent uploadProgressEvent;

@end
