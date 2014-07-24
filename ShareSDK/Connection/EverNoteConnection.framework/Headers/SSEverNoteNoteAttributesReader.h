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
 *	@brief	笔记属性集合读取器
 */
///#end
///#begin en
/**
 *	@brief	Note attributes reader.
 */
///#end
@interface SSEverNoteNoteAttributesReader : NSObject
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
 *	@brief	time that the note refers to
 */
///#end
///#begin en
/**
 *	@brief	time that the note refers to
 */
///#end
@property (nonatomic,readonly) long long subjectDate;

///#begin zh-cn
/**
 *	@brief	the latitude where the note was taken
 */
///#end
///#begin en
/**
 *	@brief	the latitude where the note was taken
 */
///#end
@property (nonatomic,readonly) double latitude;

///#begin zh-cn
/**
 *	@brief	the longitude where the note was taken
 */
///#end
///#begin en
/**
 *	@brief	the longitude where the note was taken
 */
///#end
@property (nonatomic,readonly) double longitude;

///#begin zh-cn
/**
 *	@brief	the altitude where the note was taken
 */
///#end
///#begin en
/**
 *	@brief	the altitude where the note was taken
 */
///#end
@property (nonatomic,readonly) double altitude;

///#begin zh-cn
/**
 *	@brief	the author of the content of the note
 */
///#end
///#begin en
/**
 *	@brief	the author of the content of the note
 */
///#end
@property (nonatomic,readonly) NSString *author;

///#begin zh-cn
/**
 *	@brief	the method that the note was added to the account, if the note wasn't directly authored in an Evernote desktop client.
 */
///#end
///#begin en
/**
 *	@brief	the method that the note was added to the account, if the note wasn't directly authored in an Evernote desktop client.
 */
///#end
@property (nonatomic,readonly) NSString *source;

///#begin zh-cn
/**
 *	@brief	the original location where the resource was hosted. For web clips, this will be the URL of the page that was clipped.
 */
///#end
///#begin en
/**
 *	@brief	the original location where the resource was hosted. For web clips, this will be the URL of the page that was clipped.
 */
///#end
@property (nonatomic,readonly) NSString *sourceURL;

///#begin zh-cn
/**
 *	@brief	an identifying string for the application that created this note.
 *          This string does not have a guaranteed syntax or structure -- it is intended for human inspection and tracking.
 */
///#end
///#begin en
/**
 *	@brief	an identifying string for the application that created this note.
 *          This string does not have a guaranteed syntax or structure -- it is intended for human inspection and tracking.
 */
///#end
@property (nonatomic,readonly) NSString *sourceApplication;

///#begin zh-cn
/**
 *	@brief	The date and time when this note was directly shared via its own URL.
 *          This is only set on notes that were individually shared - it is independent of any notebook-level sharing of the containing notepbook.
 *          This field is treated as "read-only" for clients; the server will ignore changes to this field from an external client.
 */
///#end
///#begin en
/**
 *	@brief	The date and time when this note was directly shared via its own URL.
 *          This is only set on notes that were individually shared - it is independent of any notebook-level sharing of the containing notepbook.
 *          This field is treated as "read-only" for clients; the server will ignore changes to this field from an external client.
 */
///#end
@property (nonatomic,readonly) long long shareDate;

///#begin zh-cn
/**
 *	@brief	Allows the user to assign a human-readable location name associated with a note.
 *          Users may assign values like 'Home' and 'Work'.
 *          Place names may also be populated with values from geonames database (e.g., a restaurant name).
 *          Applications are encouraged to normalize values so that grouping values by place name provides a useful result.
 *          Applications MUST NOT automatically add place name values based on geolocation without confirmation from the user;
 *          that is, the value in this field should be more useful than a simple automated lookup based on the note's latitude and longitude.
 */
///#end
///#begin en
/**
 *	@brief	Allows the user to assign a human-readable location name associated with a note.
 *          Users may assign values like 'Home' and 'Work'.
 *          Place names may also be populated with values from geonames database (e.g., a restaurant name).
 *          Applications are encouraged to normalize values so that grouping values by place name provides a useful result.
 *          Applications MUST NOT automatically add place name values based on geolocation without confirmation from the user;
 *          that is, the value in this field should be more useful than a simple automated lookup based on the note's latitude and longitude.
 */
///#end
@property (nonatomic,readonly) NSString *placeName;

///#begin zh-cn
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
///#end
///#begin en
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
///#end
@property (nonatomic,readonly) NSString *contentClass;

///#begin zh-cn
/**
 *	@brief	Provides a location for applications to store a relatively small (4kb)
 *          blob of data that is not meant to be visible to the user and that is opaque to the Evernote service.
 *          A single application may use at most one entry in this map, using its API consumer key as the map key.
 *          See the documentation for LazyMap for a description of when the actual map values are returned by the service.
 *          To safely add or modify your application's entry in the map, use NoteStore.setNoteApplicationDataEntry.
 *          To safely remove your application's entry from the map, use NoteStore.unsetNoteApplicationDataEntry.
 */
///#end
///#begin en
/**
 *	@brief	Provides a location for applications to store a relatively small (4kb)
 *          blob of data that is not meant to be visible to the user and that is opaque to the Evernote service.
 *          A single application may use at most one entry in this map, using its API consumer key as the map key.
 *          See the documentation for LazyMap for a description of when the actual map values are returned by the service.
 *          To safely add or modify your application's entry in the map, use NoteStore.setNoteApplicationDataEntry.
 *          To safely remove your application's entry from the map, use NoteStore.unsetNoteApplicationDataEntry.
 */
///#end
@property (nonatomic,readonly) SSEverNoteLazyMapReader *applicationData;

///#begin zh-cn
/**
 *	@brief	An indication of who made the last change to the note.
 *          If you are accessing the note via a shared notebook to which you have modification rights,
 *          or if you are the owner of the notebook to which the note belongs, then you have access to the value.
 *          In this case, the value will be unset if the owner of the notebook containing the note was the last to make the modification,
 *          else it will be a string describing the guest who made the last edit. If you do not have access to this value,
 *          it will be left unset. This field is read-only by clients. The server will ignore all values set by clients into this field.
 */
///#end
///#begin en
/**
 *	@brief	An indication of who made the last change to the note.
 *          If you are accessing the note via a shared notebook to which you have modification rights,
 *          or if you are the owner of the notebook to which the note belongs, then you have access to the value.
 *          In this case, the value will be unset if the owner of the notebook containing the note was the last to make the modification,
 *          else it will be a string describing the guest who made the last edit. If you do not have access to this value,
 *          it will be left unset. This field is read-only by clients. The server will ignore all values set by clients into this field.
 */
///#end
@property (nonatomic,readonly) NSString *lastEditedBy;

///#begin zh-cn
/**
 *	@brief	A map of classifications applied to the note by clients or by the Evernote service.
 *          The key is the string name of the classification type, and the value is a constant that begins with CLASSIFICATION_.
 */
///#end
///#begin en
/**
 *	@brief	A map of classifications applied to the note by clients or by the Evernote service.
 *          The key is the string name of the classification type, and the value is a constant that begins with CLASSIFICATION_.
 */
///#end
@property (nonatomic,readonly) NSDictionary *classifications;

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
 *	@brief	Initialize Reader.
 *
 *	@param 	sourceData 	Raw data
 *
 *	@return	Reader object.
 */
///#end
- (id)initWithSourceData:(NSDictionary *)sourceData;

///#begin zh-cn
/**
 *	@brief	创建笔记属性集合读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
///#end
///#begin en
/**
 *	@brief	Create an note attributes reader
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
///#end
+ (SSEverNoteNoteAttributesReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
