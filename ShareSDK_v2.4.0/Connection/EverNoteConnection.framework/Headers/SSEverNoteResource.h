//
//  SSEverNoteResource.h
//  EverNoteConnection
//
//  Created by 冯 鸿杰 on 13-5-22.
//  Copyright (c) 2013年 vimfung. All rights reserved.
//

#import <ShareSDKCoreService/SSCDataObject.h>
#import "SSEverNoteData.h"
#import "SSEverNoteResourceAttributes.h"
#import "ISSEverNoteDataOutput.h"
#import "ISSEverNoteDataInput.h"

/**
 *	@brief	资源信息
 */
@interface SSEverNoteResource : SSCDataObject

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
@property (nonatomic,readonly) SSEverNoteData *data;

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
@property (nonatomic,readonly) SSEverNoteData *recognition;


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
@property (nonatomic,readonly) SSEverNoteResourceAttributes *attributes;

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
@property (nonatomic,readonly) SSEverNoteData *alternateData;

/**
 *	@brief	创建资源对象
 *
 *	@param 	reader 	数据读取器
 *
 *	@return	资源对象
 */
+ (SSEverNoteResource *)resourceWithResponse:(id<ISSEverNoteDataOutput>)reader;

/**
 *	@brief	创建资源对象
 *
 *	@param 	data 	资源数据
 *  @param  mime    MIME类型
 *
 *	@return	资源对象
 */
+ (SSEverNoteResource *)resourceWithData:(SSEverNoteData *)data mime:(NSString *)mime;

/**
 *	@brief	解析数据
 *
 *	@param 	reader 	数据读取器
 */
- (void)parse:(id<ISSEverNoteDataOutput>)reader;

/**
 *	@brief	设置数据
 *
 *	@param 	writer 	数据写入器
 */
- (void)putData:(id<ISSEverNoteDataInput>)writer;

@end
