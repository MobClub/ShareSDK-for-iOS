//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "SSEverNoteLazyMapReader.h"

/**
 *	@brief	Note attributes reader.
 */
@interface SSEverNoteNoteAttributesReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	Raw data.
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	time that the note refers to
 */
@property (nonatomic,readonly) long long subjectDate;

/**
 *	@brief	the latitude where the note was taken
 */
@property (nonatomic,readonly) double latitude;

/**
 *	@brief	the longitude where the note was taken
 */
@property (nonatomic,readonly) double longitude;

/**
 *	@brief	the altitude where the note was taken
 */
@property (nonatomic,readonly) double altitude;

/**
 *	@brief	the author of the content of the note
 */
@property (nonatomic,readonly) NSString *author;

/**
 *	@brief	the method that the note was added to the account, if the note wasn't directly authored in an Evernote desktop client.
 */
@property (nonatomic,readonly) NSString *source;

/**
 *	@brief	the original location where the resource was hosted. For web clips, this will be the URL of the page that was clipped.
 */
@property (nonatomic,readonly) NSString *sourceURL;

/**
 *	@brief	an identifying string for the application that created this note.
 *          This string does not have a guaranteed syntax or structure -- it is intended for human inspection and tracking.
 */
@property (nonatomic,readonly) NSString *sourceApplication;

/**
 *	@brief	The date and time when this note was directly shared via its own URL.
 *          This is only set on notes that were individually shared - it is independent of any notebook-level sharing of the containing notepbook.
 *          This field is treated as "read-only" for clients; the server will ignore changes to this field from an external client.
 */
@property (nonatomic,readonly) long long shareDate;

/**
 *	@brief	Allows the user to assign a human-readable location name associated with a note.
 *          Users may assign values like 'Home' and 'Work'.
 *          Place names may also be populated with values from geonames database (e.g., a restaurant name).
 *          Applications are encouraged to normalize values so that grouping values by place name provides a useful result.
 *          Applications MUST NOT automatically add place name values based on geolocation without confirmation from the user;
 *          that is, the value in this field should be more useful than a simple automated lookup based on the note's latitude and longitude.
 */
@property (nonatomic,readonly) NSString *placeName;

/**
 *	@brief	The class (or type) of note. This field is used to indicate to clients that special structured information
 *          is represented within the note such that special rules apply when making modifications.
 *          If contentClass is set and the client application does not specifically support the specified class,
 *          the client MUST treat the note as read-only. In this case, the client MAY modify the note's notebook and tags via the Note.
 *          notebookGuid and Note.tagGuids fields.
 *          Applications should set contentClass only when they are creating notes that contain structured information that needs
 *          to be maintained in order for the user to be able to use the note within that application.
 *          Setting contentClass makes a note read-only in other applications, so there is a trade-off when an application chooses to use contentClass.
 *          Applications that set contentClass when creating notes must use a contentClass string of the
 *          form CompanyName.ApplicationName to ensure uniqueness.
 */
@property (nonatomic,readonly) NSString *contentClass;

/**
 *	@brief	Provides a location for applications to store a relatively small (4kb)
 *          blob of data that is not meant to be visible to the user and that is opaque to the Evernote service.
 *          A single application may use at most one entry in this map, using its API consumer key as the map key.
 *          See the documentation for LazyMap for a description of when the actual map values are returned by the service.
 *          To safely add or modify your application's entry in the map, use NoteStore.setNoteApplicationDataEntry.
 *          To safely remove your application's entry from the map, use NoteStore.unsetNoteApplicationDataEntry.
 */
@property (nonatomic,readonly) SSEverNoteLazyMapReader *applicationData;

/**
 *	@brief	An indication of who made the last change to the note.
 *          If you are accessing the note via a shared notebook to which you have modification rights,
 *          or if you are the owner of the notebook to which the note belongs, then you have access to the value.
 *          In this case, the value will be unset if the owner of the notebook containing the note was the last to make the modification,
 *          else it will be a string describing the guest who made the last edit. If you do not have access to this value,
 *          it will be left unset. This field is read-only by clients. The server will ignore all values set by clients into this field.
 */
@property (nonatomic,readonly) NSString *lastEditedBy;

/**
 *	@brief	A map of classifications applied to the note by clients or by the Evernote service.
 *          The key is the string name of the classification type, and the value is a constant that begins with CLASSIFICATION_.
 */
@property (nonatomic,readonly) NSDictionary *classifications;

/**
 *	@brief	Initialize Reader.
 *
 *	@param 	sourceData 	Raw data
 *
 *	@return	Reader object.
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	Create an note attributes reader
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
+ (SSEverNoteNoteAttributesReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
