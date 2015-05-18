///#begin zh-cn
//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
///#end
///#begin en
//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
///#end

#import <Foundation/Foundation.h>
#import "SSEverNoteLazyMapReader.h"

///#begin zh-cn
/**
 *	@brief	资源属性集合读取器
 */
///#end
///#begin en
/**
 *	@brief	Resource attributes reader.
 */
///#end
@interface SSEverNoteResourceAttributesReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

///#begin zh-cn
/**
 *	@brief	源数据
 */
///#end
///#begin en
/**
 *	@brief	Raw data.
 */
///#end
@property (nonatomic,readonly) NSDictionary *sourceData;

///#begin zh-cn
/**
 *	@brief	the original location where the resource was hosted
 */
///#end
///#begin en
/**
 *	@brief	the original location where the resource was hosted
 */
///#end
@property (nonatomic,readonly) NSString *sourceURL;

///#begin zh-cn
/**
 *	@brief	the date and time that is associated with this resource (e.g. the time embedded in an image from a digital camera with a clock)
 */
///#end
///#begin en
/**
 *	@brief	the date and time that is associated with this resource (e.g. the time embedded in an image from a digital camera with a clock)
 */
///#end
@property (nonatomic,readonly) long long timestamp;

///#begin zh-cn
/**
 *	@brief	the latitude where the resource was captured
 */
///#end
///#begin en
/**
 *	@brief	the latitude where the resource was captured
 */
///#end
@property (nonatomic,readonly) double latitude;

///#begin zh-cn
/**
 *	@brief	the longitude where the resource was captured
 */
///#end
///#begin en
/**
 *	@brief	the longitude where the resource was captured
 */
///#end
@property (nonatomic,readonly) double longitude;

///#begin zh-cn
/**
 *	@brief	the altitude where the resource was captured
 */
///#end
///#begin en
/**
 *	@brief	the altitude where the resource was captured
 */
///#end
@property (nonatomic,readonly) double altitude;

///#begin zh-cn
/**
 *	@brief	information about an image's camera, e.g. as embedded in the image's EXIF data
 */
///#end
///#begin en
/**
 *	@brief	information about an image's camera, e.g. as embedded in the image's EXIF data
 */
///#end
@property (nonatomic,readonly) NSString *cameraMake;

///#begin zh-cn
/**
 *	@brief	information about an image's camera, e.g. as embedded in the image's EXIF data
 */
///#end
///#begin en
/**
 *	@brief	information about an image's camera, e.g. as embedded in the image's EXIF data
 */
///#end
@property (nonatomic,readonly) NSString *cameraModel;

///#begin zh-cn
/**
 *	@brief	if true, then the original client that submitted the resource plans to submit the recognition index for this resource at a later time.
 */
///#end
///#begin en
/**
 *	@brief	if true, then the original client that submitted the resource plans to submit the recognition index for this resource at a later time.
 */
///#end
@property (nonatomic,readonly) BOOL clientWillIndex;

///#begin zh-cn
/**
 *	@brief	DEPRECATED - this field is no longer set by the service, so should be ignored.
 */
///#end
///#begin en
/**
 *	@brief	DEPRECATED - this field is no longer set by the service, so should be ignored.
 */
///#end
@property (nonatomic,readonly) NSString *recoType;

///#begin zh-cn
/**
 *	@brief	if the resource came from a source that provided an explicit file name,
 *          the original name will be stored here. Many resources come from unnamed sources, so this will not always be set.
 */
///#end
///#begin en
/**
 *	@brief	if the resource came from a source that provided an explicit file name,
 *          the original name will be stored here. Many resources come from unnamed sources, so this will not always be set.
 */
///#end
@property (nonatomic,readonly) NSString *fileName;

///#begin zh-cn
/**
 *	@brief	this will be true if the resource should be displayed as an attachment,
 *          or false if the resource should be displayed inline (if possible).
 */
///#end
///#begin en
/**
 *	@brief	this will be true if the resource should be displayed as an attachment,
 *          or false if the resource should be displayed inline (if possible).
 */
///#end
@property (nonatomic,readonly) BOOL attachment;

///#begin zh-cn
/**
 *	@brief	Provides a location for applications to store a relatively small (4kb) blob of data associated
 *          with a Resource that is not visible to the user and that is opaque to the Evernote service.
 *          A single application may use at most one entry in this map, using its API consumer key as the map key.
 *          See the documentation for LazyMap for a description of when the actual map values are returned by the service.
 *          To safely add or modify your application's entry in the map, use NoteStore.setResourceApplicationDataEntry.
 *          To safely remove your application's entry from the map, use NoteStore.unsetResourceApplicationDataEntry.
 */
///#end
///#begin en
/**
 *	@brief	Provides a location for applications to store a relatively small (4kb) blob of data associated
 *          with a Resource that is not visible to the user and that is opaque to the Evernote service.
 *          A single application may use at most one entry in this map, using its API consumer key as the map key.
 *          See the documentation for LazyMap for a description of when the actual map values are returned by the service.
 *          To safely add or modify your application's entry in the map, use NoteStore.setResourceApplicationDataEntry.
 *          To safely remove your application's entry from the map, use NoteStore.unsetResourceApplicationDataEntry.
 */
///#end
@property (nonatomic,readonly) SSEverNoteLazyMapReader *applicationData;

///#begin zh-cn
/**
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
///#end
///#begin en
/**
 *	@brief	Initialize reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
///#end
- (id)initWithSourceData:(NSDictionary *)sourceData;

///#begin zh-cn
/**
 *	@brief	创建资源信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
///#end
///#begin en
/**
 *	@brief	Create a resource attributes reader.
 *
 *	@param 	sourceData 	Raw data
 *
 *	@return	Reader object.
 */
///#end
+ (SSEverNoteResourceAttributesReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
