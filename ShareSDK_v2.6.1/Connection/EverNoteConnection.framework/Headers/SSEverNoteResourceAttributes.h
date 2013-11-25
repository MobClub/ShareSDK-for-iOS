//
//  SSEverNoteResourceAttributes.h
//  EverNoteConnection
//
//  Created by 冯 鸿杰 on 13-5-23.
//  Copyright (c) 2013年 vimfung. All rights reserved.
//

#import <ShareSDKCoreService/SSCDataObject.h>
#import "SSEverNoteLazyMap.h"
#import "ISSEverNoteDataOutput.h"
#import "ISSEverNoteDataInput.h"

/**
 *	@brief	资源属性
 */
@interface SSEverNoteResourceAttributes : SSCDataObject

/**
 *	@brief	the original location where the resource was hosted 
 */
@property (nonatomic,readonly) NSString *sourceURL;

/**
 *	@brief	the date and time that is associated with this resource (e.g. the time embedded in an image from a digital camera with a clock)
 */
@property (nonatomic,readonly) long long timestamp;

/**
 *	@brief	the latitude where the resource was captured
 */
@property (nonatomic,readonly) double latitude;

/**
 *	@brief	the longitude where the resource was captured
 */
@property (nonatomic,readonly) double longitude;

/**
 *	@brief	the altitude where the resource was captured
 */
@property (nonatomic,readonly) double altitude;

/**
 *	@brief	information about an image's camera, e.g. as embedded in the image's EXIF data 
 */
@property (nonatomic,readonly) NSString *cameraMake;

/**
 *	@brief	information about an image's camera, e.g. as embedded in the image's EXIF data 
 */
@property (nonatomic,readonly) NSString *cameraModel;

/**
 *	@brief	if true, then the original client that submitted the resource plans to submit the recognition index for this resource at a later time.
 */
@property (nonatomic,readonly) BOOL clientWillIndex;

/**
 *	@brief	DEPRECATED - this field is no longer set by the service, so should be ignored.
 */
@property (nonatomic,readonly) NSString *recoType;

/**
 *	@brief	if the resource came from a source that provided an explicit file name, 
 *          the original name will be stored here. Many resources come from unnamed sources, so this will not always be set.
 */
@property (nonatomic,readonly) NSString *fileName;

/**
 *	@brief	this will be true if the resource should be displayed as an attachment, 
 *          or false if the resource should be displayed inline (if possible).
 */
@property (nonatomic,readonly) BOOL attachment;

/**
 *	@brief	Provides a location for applications to store a relatively small (4kb) blob of data associated 
 *          with a Resource that is not visible to the user and that is opaque to the Evernote service. 
 *          A single application may use at most one entry in this map, using its API consumer key as the map key. 
 *          See the documentation for LazyMap for a description of when the actual map values are returned by the service.
 *          To safely add or modify your application's entry in the map, use NoteStore.setResourceApplicationDataEntry. 
 *          To safely remove your application's entry from the map, use NoteStore.unsetResourceApplicationDataEntry.
 */
@property (nonatomic,readonly) SSEverNoteLazyMap *applicationData;

/**
 *	@brief	创建资源属性对象
 *
 *	@param 	reader 	数据读取器
 *
 *	@return	资源属性对象
 */
+ (SSEverNoteResourceAttributes *)resourceAttributesWithResponse:(id<ISSEverNoteDataOutput>)reader;

/**
 *	@brief	解析数据
 *
 *	@param 	reader 	数据读取器
 */
- (void)parse:(id<ISSEverNoteDataOutput>)reader;

/**
 *	@brief	放入数据
 *
 *	@param 	writer 	数据写入器
 */
- (void)putData:(id<ISSEverNoteDataInput>)writer;


@end
