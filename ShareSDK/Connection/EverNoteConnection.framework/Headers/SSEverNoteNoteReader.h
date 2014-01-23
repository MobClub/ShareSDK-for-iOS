//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "SSEverNoteNoteAttributesReader.h"

/**
 *	@brief	Note info reader.
 */
@interface SSEverNoteNoteReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	Raw data
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	The unique identifier of this note. Will be set by the server,
 *          but will be omitted by clients calling NoteStore.createNote()
 */
@property (nonatomic,readonly) NSString *guid;

/**
 *	@brief	The subject of the note. Can't begin or end with a space.
 */
@property (nonatomic,readonly) NSString *title;

/**
 *	@brief	The XHTML block that makes up the note. This is the canonical form of the note's contents,
 *          so will include abstract Evernote tags for internal resource references.
 *          A client may create a separate transformed version of this content for internal presentation,
 *          but the same canonical bytes should be used for transmission and comparison unless the user chooses to modify their content.
 */
@property (nonatomic,readonly) NSString *content;

/**
 *	@brief	The binary MD5 checksum of the UTF-8 encoded content body.
 *          This will always be set by the server, but clients may choose to omit this when they submit a note with content.
 */
@property (nonatomic,readonly) NSData *contentHash;

/**
 *	@brief	The number of Unicode characters in the content of the note.
 *          This will always be set by the service, but clients may choose to omit this value when they submit a Note.
 */
@property (nonatomic,readonly) NSInteger contentLength;

/**
 *	@brief	The date and time when the note was created in one of the clients.
 *          In most cases, this will match the user's sense of when the note was created,
 *          and ordering between notes will be based on ordering of this field.
 *          However, this is not a "reliable" timestamp if a client has an incorrect clock,
 *          so it cannot provide a true absolute ordering between notes.
 *          Notes created directly through the service (e.g. via the web GUI) will have an absolutely ordered "created" value.
 */
@property (nonatomic,readonly) long long created;

/**
 *	@brief	The date and time when the note was last modified in one of the clients.
 *          In most cases, this will match the user's sense of when the note was modified,
 *          but this field may not be absolutely reliable due to the possibility of client clock errors.
 */
@property (nonatomic,readonly) long long updated;

/**
 *	@brief	If present, the note is considered "deleted",
 *          and this stores the date and time when the note was deleted by one of the clients.
 *          In most cases, this will match the user's sense of when the note was deleted,
 *          but this field may be unreliable due to the possibility of client clock errors.
 */
@property (nonatomic,readonly) long long deleted;

/**
 *	@brief	If the note is available for normal actions and viewing, this flag will be set to true.
 */
@property (nonatomic,readonly) BOOL active;

/**
 *	@brief	A number identifying the last transaction to modify the state of this note (including changes to the note's attributes or resources).
 *          The USN values are sequential within an account, and can be used to compare the order of modifications within the service.
 */
@property (nonatomic,readonly) NSInteger updateSequenceNum;

/**
 *	@brief	The unique identifier of the notebook that contains this note.
 *          If no notebookGuid is provided on a call to createNote(), the default notebook will be used instead.
 */
@property (nonatomic,readonly) NSString *notebookGuid;

/**
 *	@brief	A list of the GUID identifiers for tags that are applied to this note.
 *          This may be provided in a call to createNote() to unambiguously declare the tags that should be assigned to the new note.
 *          Alternately, clients may pass the names of desired tags via the 'tagNames' field during note creation.
 *          If the list of tags are omitted on a call to createNote(),
 *          then the server will assume that no changes have been made to the resources.
 */
@property (nonatomic,readonly) NSArray *tagGuids;

/**
 *	@brief	The list of resources that are embedded within this note.
 *          If the list of resources are omitted on a call to updateNote(),
 *          then the server will assume that no changes have been made to the resources.
 *          The binary contents of the resources must be provided when the resource is first sent to the service,
 *          but it will be omitted by the service when the Note is returned in the future.
 */
@property (nonatomic,readonly) NSArray *resources;

/**
 *	@brief	A list of the attributes for this note.
 *          If the list of attributes are omitted on a call to updateNote(),
 *          then the server will assume that no changes have been made to the resources.
 */
@property (nonatomic,readonly) SSEverNoteNoteAttributesReader *attributes;

/**
 *	@brief	May be provided by clients during calls to createNote() as an alternative to providing the tagGuids of existing tags.
 *          If any tagNames are provided during createNote(), these will be found, or created if they don't already exist.
 *          Created tags will have no parent (they will be at the top level of the tag panel).
 */
@property (nonatomic,readonly) NSArray *tagNames;

/**
 *	@brief	Initialize reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	Create a note reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
+ (SSEverNoteNoteReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
