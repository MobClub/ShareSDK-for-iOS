//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>

/**
 *	@brief	File information reader.
 */
@interface SSDropboxFileReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	Raw data.
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

@property (nonatomic,readonly) long long bytes;

@property (nonatomic,readonly) NSString *clientMtime;

@property (nonatomic,readonly) NSString *icon;

@property (nonatomic,readonly) BOOL isDir;

@property (nonatomic,readonly) NSString *mimeType;

@property (nonatomic,readonly) NSString *modified;

@property (nonatomic,readonly) NSString *path;

@property (nonatomic,readonly) long long rev;

@property (nonatomic,readonly) NSInteger revision;

@property (nonatomic,readonly) NSString *root;

@property (nonatomic,readonly) NSString *size;

@property (nonatomic,readonly) BOOL thumbExists;

/**
 *	@brief	Initialize reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	Create file reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
+ (SSDropboxFileReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
