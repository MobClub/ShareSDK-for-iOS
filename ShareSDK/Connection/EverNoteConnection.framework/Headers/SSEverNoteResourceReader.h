//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "SSEverNoteResourceDataReader.h"
#import "SSEverNoteResourceAttributesReader.h"

/**
 *	@brief	Resource reader.
 */
@interface SSEverNoteResourceReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	Raw data.
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	The unique identifier of this resource.
 *          Will be set whenever a resource is retrieved from the service, but may be null when a client is creating a resource.
 */
@property (nonatomic,readonly) NSString *guid;

/**
 *	@brief	The unique identifier of the Note that holds this Resource.
 *          Will be set whenever the resource is retrieved from the service, but may be null when a client is creating a resource.
 */
@property (nonatomic,readonly) NSString *noteGuid;

/**
 *	@brief	The contents of the resource.
 */
@property (nonatomic,readonly) SSEverNoteResourceDataReader *data;

/**
 *	@brief	The MIME type for the embedded resource. E.g. "image/gif"
 */
@property (nonatomic,readonly) NSString *mime;

/**
 *	@brief	If set, this contains the display width of this resource, in pixels.
 */
@property (nonatomic,readonly) int16_t width;

/**
 *	@brief	If set, this contains the display height of this resource, in pixels.
 */
@property (nonatomic,readonly) int16_t height;

/**
 *	@brief	DEPRECATED: ignored.
 */
@property (nonatomic,readonly) int16_t duration;

/**
 *	@brief	DEPRECATED: ignored.
 */
@property (nonatomic,readonly) BOOL active;

/**
 *	@brief	If set, this will hold the encoded data that provides information on search and recognition within this resource.
 */
@property (nonatomic,readonly) SSEverNoteResourceDataReader *recognition;


/**
 *	@brief	A list of the attributes for this resource.
 */
@property (nonatomic,readonly) SSEverNoteResourceAttributesReader *attributes;

/**
 *	@brief	A number identifying the last transaction to modify the state of this object.
 *          The USN values are sequential within an account, and can be used to compare the order of modifications within the service.
 */
@property (nonatomic,readonly) NSInteger updateSequenceNum;

/**
 *	@brief	Some Resources may be assigned an alternate data format by the service
 *          which may be more appropriate for indexing or rendering than the original data provided by the user.
 *          In these cases, the alternate data form will be available via this Data element.
 *          If a Resource has no alternate form, this field will be unset.
 */
@property (nonatomic,readonly) SSEverNoteResourceDataReader *alternateData;

/**
 *	@brief	Initialize reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	Create a resource reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
+ (SSEverNoteResourceReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
