//
//  SSEverNoteResourceReader.h
//  EverNoteConnection
//
//  Created by vimfung on 13-10-24.
//  Copyright (c) 2013年 vimfung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSEverNoteResourceDataReader.h"
#import "SSEverNoteResourceAttributesReader.h"

/**
 *	@brief	资源读取器
 */
@interface SSEverNoteResourceReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

///#begin   en
/**
 *	@brief	The unique identifier of this resource.
 *          Will be set whenever a resource is retrieved from the service, but may be null when a client is creating a resource.
 */
///#end
///#begin   zh-cn
/**
 *	@brief	资源标识
 */
///#end
@property (nonatomic,readonly) NSString *guid;

///#begin   en
/**
 *	@brief	The unique identifier of the Note that holds this Resource.
 *          Will be set whenever the resource is retrieved from the service, but may be null when a client is creating a resource.
 */
///#end
///#begin   zh-cn
/**
 *	@brief	笔记标识
 */
///#end
@property (nonatomic,readonly) NSString *noteGuid;

///#begin   en
/**
 *	@brief	The contents of the resource.
 */
///#end
///#begin   zh-cn
/**
 *	@brief	资源内容
 */
///#end
@property (nonatomic,readonly) SSEverNoteResourceDataReader *data;

///#begin   en
/**
 *	@brief	The MIME type for the embedded resource. E.g. "image/gif"
 */
///#end
///#begin   zh-cn
/**
 *	@brief	MIME类型
 */
///#end
@property (nonatomic,readonly) NSString *mime;

///#begin   en
/**
 *	@brief	If set, this contains the display width of this resource, in pixels.
 */
///#end
///#begin   zh-cn
/**
 *	@brief	宽度
 */
///#end
@property (nonatomic,readonly) int16_t width;

///#begin   en
/**
 *	@brief	If set, this contains the display height of this resource, in pixels.
 */
///#end
///#begin   zh-cn
/**
 *	@brief	高度
 */
///#end
@property (nonatomic,readonly) int16_t height;

///#begin   en
/**
 *	@brief	DEPRECATED: ignored.
 */
///#end
///#begin   zh-cn
/**
 *	@brief	已过时：忽略
 */
///#end
@property (nonatomic,readonly) int16_t duration;

///#begin   en
/**
 *	@brief	DEPRECATED: ignored.
 */
///#end
///#begin   zh-cn
/**
 *	@brief	已过时：忽略
 */
///#end
@property (nonatomic,readonly) BOOL active;

///#begin   en
/**
 *	@brief	If set, this will hold the encoded data that provides information on search and recognition within this resource.
 */
///#end
///#begin   zh-cn
/**
 *	@brief	提供搜索识别资源数据
 */
///#end
@property (nonatomic,readonly) SSEverNoteResourceDataReader *recognition;


///#begin   en
/**
 *	@brief	A list of the attributes for this resource.
 */
///#end
///#begin   zh-cn
/**
 *	@brief	资源属性
 */
///#end
@property (nonatomic,readonly) SSEverNoteResourceAttributesReader *attributes;

///#begin   en
/**
 *	@brief	A number identifying the last transaction to modify the state of this object.
 *          The USN values are sequential within an account, and can be used to compare the order of modifications within the service.
 */
///#end
///#begin   zh-cn
/**
 *	@brief	最后修改此对象的事务标识
 */
///#end
@property (nonatomic,readonly) NSInteger updateSequenceNum;

///#begin   en
/**
 *	@brief	Some Resources may be assigned an alternate data format by the service
 *          which may be more appropriate for indexing or rendering than the original data provided by the user.
 *          In these cases, the alternate data form will be available via this Data element.
 *          If a Resource has no alternate form, this field will be unset.
 */
///#end
///#begin   zh-cn
/**
 *	@brief	备用数据
 */
///#end
@property (nonatomic,readonly) SSEverNoteResourceDataReader *alternateData;

/**
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	创建资源信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSEverNoteResourceReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
