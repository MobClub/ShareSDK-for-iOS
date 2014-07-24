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
#import "SSEverNoteNoteAttributesReader.h"

///#begin zh-cn
/**
 *	@brief	笔记信息读取器
 */
///#end
///#begin en
/**
 *	@brief	Note info reader.
 */
///#end
@interface SSEverNoteNoteReader : NSObject
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
 *	@brief	Raw data
 */
///#end
@property (nonatomic,readonly) NSDictionary *sourceData;

///#begin   en
/**
 *	@brief	The unique identifier of this note. Will be set by the server,
 *          but will be omitted by clients calling NoteStore.createNote()
 */
///#end
///#begin   zh-cn
/**
 *	@brief	笔记的唯一标识
 */
///#end
@property (nonatomic,readonly) NSString *guid;

///#begin   en
/**
 *	@brief	The subject of the note. Can't begin or end with a space.
 */
///#end
///#begin   zh-cn
/**
 *	@brief	标题,不能前后带空格
 */
///#end
@property (nonatomic,readonly) NSString *title;

///#begin   en
/**
 *	@brief	The XHTML block that makes up the note. This is the canonical form of the note's contents,
 *          so will include abstract Evernote tags for internal resource references.
 *          A client may create a separate transformed version of this content for internal presentation,
 *          but the same canonical bytes should be used for transmission and comparison unless the user chooses to modify their content.
 */
///#end
///#begin   zh-cn
/**
 *	@brief	笔记内容
 */
///#end
@property (nonatomic,readonly) NSString *content;

///#begin   en
/**
 *	@brief	The binary MD5 checksum of the UTF-8 encoded content body.
 *          This will always be set by the server, but clients may choose to omit this when they submit a note with content.
 */
///#end
///#begin   zh-cn
/**
 *	@brief	笔记内容经过MD5的签名值
 */
///#end
@property (nonatomic,readonly) NSData *contentHash;

///#begin   en
/**
 *	@brief	The number of Unicode characters in the content of the note.
 *          This will always be set by the service, but clients may choose to omit this value when they submit a Note.
 */
///#end
///#begin   zh-cn
/**
 *	@brief	内容长度
 */
///#end
@property (nonatomic,readonly) NSInteger contentLength;

///#begin   en
/**
 *	@brief	The date and time when the note was created in one of the clients.
 *          In most cases, this will match the user's sense of when the note was created,
 *          and ordering between notes will be based on ordering of this field.
 *          However, this is not a "reliable" timestamp if a client has an incorrect clock,
 *          so it cannot provide a true absolute ordering between notes.
 *          Notes created directly through the service (e.g. via the web GUI) will have an absolutely ordered "created" value.
 */
///#end
///#begin   zh-cn
/**
 *	@brief	创建时间
 */
///#end
@property (nonatomic,readonly) long long created;

///#begin   en
/**
 *	@brief	The date and time when the note was last modified in one of the clients.
 *          In most cases, this will match the user's sense of when the note was modified,
 *          but this field may not be absolutely reliable due to the possibility of client clock errors.
 */
///#end
///#begin   zh-cn
/**
 *	@brief	最后修改时间
 */
///#end
@property (nonatomic,readonly) long long updated;

///#begin   en
/**
 *	@brief	If present, the note is considered "deleted",
 *          and this stores the date and time when the note was deleted by one of the clients.
 *          In most cases, this will match the user's sense of when the note was deleted,
 *          but this field may be unreliable due to the possibility of client clock errors.
 */
///#end
///#begin   zh-cn
/**
 *	@brief	删除时间
 */
///#end
@property (nonatomic,readonly) long long deleted;

///#begin   en
/**
 *	@brief	If the note is available for normal actions and viewing, this flag will be set to true.
 */
///#end
///#begin   zh-cn
/**
 *	@brief	笔记是否有效标识
 */
///#end
@property (nonatomic,readonly) BOOL active;

///#begin   en
/**
 *	@brief	A number identifying the last transaction to modify the state of this note (including changes to the note's attributes or resources).
 *          The USN values are sequential within an account, and can be used to compare the order of modifications within the service.
 */
///#end
///#begin   zh-cn
/**
 *	@brief	修改文章的事务标识
 */
///#end
@property (nonatomic,readonly) NSInteger updateSequenceNum;

///#begin   en
/**
 *	@brief	The unique identifier of the notebook that contains this note.
 *          If no notebookGuid is provided on a call to createNote(), the default notebook will be used instead.
 */
///#end
///#begin   zh-cn
/**
 *	@brief	笔记本的唯一标识
 */
///#end
@property (nonatomic,readonly) NSString *notebookGuid;

///#begin   en
/**
 *	@brief	A list of the GUID identifiers for tags that are applied to this note.
 *          This may be provided in a call to createNote() to unambiguously declare the tags that should be assigned to the new note.
 *          Alternately, clients may pass the names of desired tags via the 'tagNames' field during note creation.
 *          If the list of tags are omitted on a call to createNote(),
 *          then the server will assume that no changes have been made to the resources.
 */
///#end
///#begin   zh-cn
/**
 *	@brief	此笔记的标签的唯一标识列表
 */
///#end
@property (nonatomic,readonly) NSArray *tagGuids;

///#begin   en
/**
 *	@brief	The list of resources that are embedded within this note.
 *          If the list of resources are omitted on a call to updateNote(),
 *          then the server will assume that no changes have been made to the resources.
 *          The binary contents of the resources must be provided when the resource is first sent to the service,
 *          but it will be omitted by the service when the Note is returned in the future.
 */
///#end
///#begin   zh-cn
/**
 *	@brief	嵌入笔记中的资源列表
 */
///#end
@property (nonatomic,readonly) NSArray *resources;

///#begin   en
/**
 *	@brief	A list of the attributes for this note.
 *          If the list of attributes are omitted on a call to updateNote(),
 *          then the server will assume that no changes have been made to the resources.
 */
///#end
///#begin   zh-cn
/**
 *	@brief	笔记属性列表
 */
///#end
@property (nonatomic,readonly) SSEverNoteNoteAttributesReader *attributes;

///#begin   en
/**
 *	@brief	May be provided by clients during calls to createNote() as an alternative to providing the tagGuids of existing tags.
 *          If any tagNames are provided during createNote(), these will be found, or created if they don't already exist.
 *          Created tags will have no parent (they will be at the top level of the tag panel).
 */
///#end
///#begin   zh-cn
/**
 *	@brief	标签名称列表
 */
///#end
@property (nonatomic,readonly) NSArray *tagNames;

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
 *	@brief	创建笔记信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
///#end
///#begin en
/**
 *	@brief	Create a note reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
///#end
+ (SSEverNoteNoteReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
