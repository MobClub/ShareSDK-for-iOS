//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "ShareSDKTypeDef.h"
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import "ISSPlatformShareContentEntity.h"

/**
 *	@brief	Share content protocol
 */
@protocol ISSContent <NSObject>

/**
 *	@brief	Get metadata
 *
 *	@param 	name 	Metadata name
 *
 *	@return	Metadata value
 */
- (id)getMetadata:(NSString *)name;

/**
 *	@brief	Set metadata
 *
 *	@param 	name 	Metadata name
 *	@param 	value 	Metadata value
 */
- (void)setMetadata:(NSString *)name value:(id)value;

/**
 *	@brief	Remove metadata.
 *
 *	@param 	name 	Metadata name
 */
- (void)removeMetadata:(NSString *)name;

/**
 *	@brief	Get title(suitable platform：QZone、Renren、WeChat、QQ)
 *
 *	@return	title string
 */
- (NSString *)title;

/**
 *	@brief	Set title.
 *
 *	@param 	title 	Title string.
 */
- (void)setTitle:(NSString *)title;

/**
 *	@brief	Get URL(suitable platform：QZone、Renren、Instapaper、WeChat、QQ)
 *
 *	@return	URL string
 */
- (NSString *)url;

/**
 *	@brief	Set URL.
 *
 *	@param 	url 	URL string
 */
- (void)setUrl:(NSString *)url;

/**
 *	@brief	Get share description(suitable platform：Renren)
 *
 *	@return	Share description string.
 */
- (NSString *)desc;

/**
 *	@brief	Set share description.
 *
 *	@param 	desc 	Share description string.
 */
- (void)setDesc:(NSString *)desc;

/**
 *	@brief	Get media type（suitable platform：WeChat、QQ）
 *
 *	@return	Media type
 */
- (SSPublishContentMediaType)mediaType;

/**
 *	@brief	Set media type.
 *
 *	@param 	mediaType 	Media type.
 */
- (void)setMediaType:(SSPublishContentMediaType)mediaType;

/**
 *	@brief	Get share content(suitable platform：Sina Weibo、Tencent Weibo、NetEase、Sohu、DouBan、Renren、KaiXin、YouDaoNote、Facebook、Twitter、Mail、Print、SMS、WeChat、QQ、Copy)
 *
 *	@return	share content string.
 */
- (NSString *)content;

/**
 *	@brief	Set share content
 *
 *	@param 	content     Share content string.
 */
- (void)setContent:(NSString *)content;

/**
 *	@brief	Get default share content，Used when there is no set content。
 *          (suitable platform：Sina Weibo、Tencent Weibo、NetEase、Sohu、DouBan、Renren、KaiXin、YouDaoNote、Facebook、Twitter、Mail、Print、SMS、WeChat、QQ、Copy)
 *
 *	@return	Default share content string.
 */
- (NSString *)defaultContent;

/**
 *	@brief	Set default share content.
 *
 *	@param 	defaultContent 	Default share content string.
 */
- (void)setDefaultContent:(NSString *)defaultContent;

/**
 *	@brief	Get share image.（uitable platform：Sina Weibo、Tencent Weibo、NetEase、Sohu、DouBan、Renren、KaiXin、Facebook、Twitter、Mai、Print、WeChat、QQ）
 *
 *	@return	image attachment object.
 */
- (id<ISSCAttachment>)image;

/**
 *	@brief	Set share image.
 *
 *	@param 	image 	image attachment object.
 */
- (void)setImage:(id<ISSCAttachment>)image;

/**
 *	@brief	Get location
 *
 *	@return	Location object.
 */
- (SSCLocationCoordinate2D *)locationCoordinate;

/**
 *	@brief	Set location.
 *
 *	@param 	locationCoordinate 	Location object
 */
- (void)setLocationCoordinate:(SSCLocationCoordinate2D *)locationCoordinate;

/**
 *	@brief	Get group id.(uitable platform：VK)
 *
 *	@return	Group id string.
 */
- (NSString *)groupId;

/**
 *	@brief	Set group id.
 *
 *	@return	Group id string.
 */
- (void)setGroupId:(NSString *)groupId;

/**
 *	@brief	Get share content entity.
 *
 *	@param 	type 	Platform type.
 *
 *	@return	share content entity.
 */
- (id<ISSPlatformShareContentEntity>)shareContentEntityWithType:(ShareType)type;

/**
 *	@brief	Set share content entity.
 *
 *	@param 	shareContentEntity 	Share content entity.
 *	@param 	type 	Platform type.
 */
- (void)setShareContentEntity:(id<ISSPlatformShareContentEntity>)shareContentEntity
                         type:(ShareType)type;


#pragma mark ContentUnti

/**
 *	@brief	add WeChat session content unit，When custom WeChat share content use this method，If the parameter is set to INHERIT_VALUE. will using the parent parameter value.
 *
 *	@param 	type 	Media type. Please see SSPublishContentMediaType
 *	@param 	content 	Share content string.
 *	@param 	title 	Title string
 *	@param 	url 	URL string
 *	@param 	image 	Image attachment object
 *  @param  musicFileUrl    Music file URL
 *  @param  extInfo     Extension information
 *  @param  fileData    File data
 *  @param  emoticonData    Emoticon Data，Used to store Gif picture data
 */
- (void)addWeixinSessionUnitWithType:(NSNumber *)type
                             content:(NSString *)content
                               title:(NSString *)title
                                 url:(NSString *)url
                               image:(id<ISSCAttachment>)image
                        musicFileUrl:(NSString *)musicFileUrl
                             extInfo:(NSString *)extInfo
                            fileData:(NSData *)fileData
                        emoticonData:(NSData *)emoticonData;

/**
 *	@brief	add WeChat Timeline content unit，When custom WeChat share content use this method，If the parameter is set to INHERIT_VALUE. will using the parent parameter value.
 *
 *	@param 	type 	Media type. Please see SSPublishContentMediaType
 *	@param 	content 	Share content string.
 *	@param 	title 	Title string
 *	@param 	url 	URL string
 *	@param 	image 	Image attachment object
 *  @param  musicFileUrl    Music file URL
 *  @param  extInfo     Extension information
 *  @param  fileData    File data
 *  @param  emoticonData    Emoticon Data，Used to store Gif picture data
 */
- (void)addWeixinTimelineUnitWithType:(NSNumber *)type
                              content:(NSString *)content
                                title:(NSString *)title
                                  url:(NSString *)url
                                image:(id<ISSCAttachment>)image
                         musicFileUrl:(NSString *)musicFileUrl
                              extInfo:(NSString *)extInfo
                             fileData:(NSData *)fileData
                         emoticonData:(NSData *)emoticonData;

/**
 *	@brief	add QQ content unit，When custom QQ share content use this method，If the parameter is set to INHERIT_VALUE. will using the parent parameter value.
 *
 *	@param 	type 	Media type. Please see SSPublishContentMediaType
 *	@param 	content 	Share content string.
 *	@param 	title 	Title string
 *	@param 	url 	URL string
 *	@param 	image 	Image attachment object
 */
- (void)addQQUnitWithType:(NSNumber *)type
                  content:(NSString *)content
                    title:(NSString *)title
                      url:(NSString *)url
                    image:(id<ISSCAttachment>)image;


/**
 *	@brief	add SMS content unit. When custom SMS share content use this method，If the parameter is set to INHERIT_VALUE. will using the parent parameter value.
 *
 *	@param 	content 	Share content string
 */
- (void)addSMSUnitWithContent:(NSString *)content;

/**
 *	@brief	add QZone content unit， When custom QZone share content use this method，If the parameter is set to INHERIT_VALUE. will using the parent parameter value.
 *
 *	@param 	title 	Title string
 *	@param 	url 	URL string
 *	@param 	site 	Shared Source website name.Please fill in the website domain name when applying for registration.
 *	@param 	fromUrl 	Shared source site corresponding website url.
 *	@param 	comment 	Comment content string.
 *	@param 	summary 	Share content summary
 *	@param 	image 	Image attachment object
 *	@param 	type 	Content type:，4 indicate web page；5 indicate video
 *	@param 	playUrl 	SWF play url.，In the type of 5 must be filled
 *	@param 	nswb 	Synchronized to Tencent Weibo, equal to 1 are not synchronized, non-1 represents a synchronization
 */
- (void)addQQSpaceUnitWithTitle:(NSString *)title
                            url:(NSString *)url
                           site:(NSString *)site
                        fromUrl:(NSString *)fromUrl
                        comment:(NSString *)comment
                        summary:(NSString *)summary
                          image:(id<ISSCAttachment>)image
                           type:(NSNumber *)type
                        playUrl:(NSString *)playUrl
                           nswb:(NSNumber *)nswb;

/**
 *	@brief	Add YouDaoNote content unit.
 *
 *	@param 	content 	Content string
 *	@param 	title   Title string
 *	@param 	author 	Author
 *	@param 	source 	Source
 *	@param 	attachments 	Attachments array
 */
- (void)addYouDaoNoteUnitWithContent:(NSString *)content
                               title:(NSString *)title
                              author:(NSString *)author
                              source:(NSString *)source
                         attachments:(NSArray *)attachments;

/**
 *	@brief	Add Instapaper content unit
 *
 *	@param 	url 	URL string
 *	@param 	title 	Title string，passing nil when there is no title
 *	@param 	description 	Description, passing nil when there is no description
 */
- (void)addInstapaperContentWithUrl:(NSString *)url
                              title:(NSString *)title
                        description:(NSString *)description;

/**
 *	@brief	Add Mail content unit，When custom Mail share content use this method，If the parameter is set to INHERIT_VALUE. will using the parent parameter value.
 *
 *  @since  ver1.2.4
 *
 *	@param 	subject 	Subject string
 *	@param 	content 	Content string
 *	@param 	isHTML      Content format:YES indicate body is HTML format。NO indicate body is Normal text
 *  @param  attachments     Attachments Array
 *  @param  to      Recipient e-mail address list
 *  @param  cc      Cc-mail address list
 *  @param  bcc     Bcc e-mail address list
 */
- (void)addMailUnitWithSubject:(NSString *)subject
                       content:(NSString *)content
                        isHTML:(NSNumber *)isHTML
                   attachments:(NSArray *)attachments
                            to:(NSArray *)to
                            cc:(NSArray *)cc
                           bcc:(NSArray *)bcc;

/**
 *	@brief	Add Renren content unit
 *
 *	@param 	name 	Title. Note: Up to 30 characters.
 *	@param 	description 	Body content. Note: Up to 200 characters.
 *	@param 	url 	Link
 *	@param 	message 	User input custom content. Note: Up to 200 characters.
 *	@param 	image 	Image attachment object
 *	@param 	captions 	Subtitle. Note: Up to 20 characters
 */
- (void)addRenRenUnitWithName:(NSString *)name
                  description:(NSString *)description
                          url:(NSString *)url
                      message:(NSString *)message
                        image:(id<ISSCAttachment>)image
                      caption:(NSString *)captions;

/**
 *	@brief	Add Sohu SuiShenKan content unit.
 *
 *	@param 	url 	Bookmark link
 */
- (void)addSohuKanUnitWithUrl:(NSString *)url;

/**
 *	@brief	Add Pocket content unit.
 *
 *  @since  ver2.2.0
 *
 *	@param 	url 	Share link.
 *	@param 	title 	Title, if the linked content Untitled used.
 *	@param 	tags 	With a comma-separated list of tags
 *	@param 	tweetId 	Tweet ID
 */
- (void)addPocketUnitWithUrl:(NSString *)url
                       title:(NSString *)title
                        tags:(NSString *)tags
                     tweetId:(NSString *)tweetId;

/**
 *	@brief	Add EverNote content unit
 *
 *	@param 	content 	Content string
 *	@param 	title 	Title string
 *	@param 	resources 	Image resource list，Element is ISSAttachment protocol object。If the parameter is set to INHERIT_VALUE. will using the parent's image parameter value.
 */
- (void)addEvernoteUnitWithContent:(NSString *)content
                             title:(NSString *)title
                         resources:(NSArray *)resources;

/**
 *	@brief	Add EverNote content unit
 *
 *  @since  ver2.9.0
 *
 *	@param 	content 	Content string
 *	@param 	title 	Title string
 *	@param 	resources 	Image resource list，Element is ISSAttachment protocol object。If the parameter is set to INHERIT_VALUE. will using the parent's image parameter value.
 *  @param  notebookGuid    Notebook guid
 *  @param  tagsGuid        Tag guid list.
 */
- (void)addEvernoteUnitWithContent:(NSString *)content
                             title:(NSString *)title
                         resources:(NSArray *)resources
                      notebookGuid:(NSString *)notebookGuid
                          tagsGuid:(NSArray *)tagsGuid;

/**
 *	@brief	Add Sina Weibo content unit.
 *
 *  @since  ver2.2.0
 *
 *	@param 	content 	Content string.
 *	@param 	image 	Image attachment object.
 */
- (void)addSinaWeiboUnitWithContent:(NSString *)content
                              image:(id<ISSCAttachment>)image;

/**
 *	@brief	Add Sina Weibo content unit
 *
 *  @since  ver2.4.1
 *
 *	@param 	content 	Content string.
 *	@param 	image 	Image attachment object.
 *  @param  locationCoordinate 	Location info.
 */
- (void)addSinaWeiboUnitWithContent:(NSString *)content
                              image:(id<ISSCAttachment>)image
                          locationCoordinate:(SSCLocationCoordinate2D *)locationCoordinate;

/**
 *	@brief	Add Tencent Weibo content unit
 *
 *  @since  ver2.2.0
 *
 *	@param 	content 	Content string.
 *	@param 	image 	Image attachment object.
 */
- (void)addTencentWeiboUnitWithContent:(NSString *)content
                                 image:(id<ISSCAttachment>)image;

/**
 *	@brief	Add Tencent Weibo content unit
 *
 *  @since  ver2.4.1
 *
 *	@param 	aContent 	Content string
 *	@param 	aImage 	Image attachment object.
 *	@param 	locationCoordinate 	Location info.
 */
- (void)addTencentWeiboUnitWithContent:(NSString *)content
                                 image:(id<ISSCAttachment>)image
                    locationCoordinate:(SSCLocationCoordinate2D *)locationCoordinate;


/**
 *	@brief	Add Sohu Weibo content unit
 *
 *  @since  ver2.2.0
 *
 *	@param 	content 	Content string.
 *	@param 	image 	Image attachment object.
 */
- (void)addSohuWeiboUnitWithContent:(NSString *)content
                              image:(id<ISSCAttachment>)image;

/**
 *	@brief	Add NetEase Weibo content unit
 *
 *  @since  ver2.2.0
 *
 *	@param 	content 	Content string.
 *	@param 	image 	Image attachment object.
 */
- (void)add163WeiboUnitWithContent:(NSString *)content
                             image:(id<ISSCAttachment>)image;

/**
 *	@brief	Add Copy content unit
 *
 *  @since  ver2.2.0
 *
 *	@param 	content 	Content string.
 *	@param 	image 	Image attachment object.
 */
- (void)addCopyUnitWithContent:(NSString *)content
                         image:(id<ISSCAttachment>)image;

/**
 *	@brief	Add Print content unit
 *
 *  @since  ver2.2.0
 *
 *	@param 	content 	Content string.
 *	@param 	image 	Image attachment object.
 */
- (void)addAirPrintWithContent:(NSString *)content
                         image:(id<ISSCAttachment>)image;

/**
 *	@brief	Add Douban content unit
 *
 *  @since  ver2.2.0
 *
 *	@param 	content 	Content string.
 *	@param 	image   Image attachment object.
 */
- (void)addDouBanWithContent:(NSString *)content
                       image:(id<ISSCAttachment>)image;

/**
 *	@brief	Add Facebook content unit
 *
 *  @since  ver2.2.0
 *
 *	@param 	content 	Content string
 *	@param 	image 	Image attachment object.
 */
- (void)addFacebookWithContent:(NSString *)content
                         image:(id<ISSCAttachment>)image;

/**
 *	@brief	Add Twitter content unit
 *
 *  @since  ver2.2.0
 *
 *	@param 	content 	Content string.
 *	@param 	image 	Image attachment object.
 */
- (void)addTwitterWithContent:(NSString *)content
                        image:(id<ISSCAttachment>)image;

/**
 *	@brief	Add Twitter content unit
 *
 *  @since  ver2.4.1
 *
 *	@param 	content 	Content string.
 *	@param 	image 	Image attachment object.
 *	@param 	locationCoordinate 	Location info.
 */
- (void)addTwitterWithContent:(NSString *)content
                        image:(id<ISSCAttachment>)image
           locationCoordinate:(SSCLocationCoordinate2D *)locationCoordinate;

/**
 *	@brief	Add KaiXin content unit
 *
 *  @since  ver2.2.0
 *
 *	@param 	content 	Content string.
 *	@param 	image 	Image attachment object.
 */
- (void)addKaiXinUnitWithContent:(NSString *)content
                           image:(id<ISSCAttachment>)image;

/**
 *	@brief	Add LinkedIn content unit
 *
 *  @since  ver2.4.0
 *
 *	@param 	comment 	Comments for sharing content
 *	@param 	title 	Title string
 *	@param 	description 	Content description
 *	@param 	url 	Url string
 *	@param 	image   Image attachment object（Pictures only allows sharing network）
 *	@param 	visibility  Visible, the default is anyone
 */
- (void)addLinkedInUnitWithComment:(NSString *)comment
                             title:(NSString *)title
                       description:(NSString *)description
                               url:(NSString *)url
                             image:(id<ISSCAttachment>)image
                        visibility:(NSString *)visibility;
/**
 *	@brief	Add Google+ content unit
 *
 *  @since  ver2.4.0
 *
 *	@param 	text 	Content string.
 *  @param  image   Share pictures, if you set this parameter, with links to related parameters will be invalid（contains：url、deepLinkId、title、description、thumbnail）。
 *	@param 	url 	Url string
 *	@param 	deepLinkId 	Deep link
 *	@param 	title 	Deep link title string
 *	@param 	description 	Deep link description
 *	@param 	thumbnail   Thumbnails
 */
- (void)addGooglePlusUnitWithText:(NSString *)text
                            image:(id<ISSCAttachment>)image
                              url:(NSString *)url
                       deepLinkId:(NSString *)deepLinkId
                            title:(NSString *)title
                      description:(NSString *)description
                        thumbnail:(NSString *)thumbnail;
/**
 *	@brief	Add Pinterest content unit
 *
 *  @since  ver2.4.1
 *
 *	@param 	image 	Image attachment object.
 *	@param 	url 	Url string.
 *	@param 	description 	Description.
 */
- (void)addPinterestUnitWithImage:(id<ISSCAttachment>)image
                              url:(NSString *)url
                      description:(NSString *)description;

/**
 *	@brief	Add Flickr content unit
 *
 *	@param 	photo 	Image attachment object.
 *	@param 	title 	Title string.
 *	@param 	description 	Image description。HTML may contain a limited。
 *	@param 	tags 	Suitable for space-separated list of labels photo.
 *	@param 	isPublic 	Set to 0 for no, 1 indicate yes. Specify who can view photos.
 *	@param 	isFriend 	Set to 0 for no, 1 indicate yes. Specify who can view photos.
 *	@param 	isFamily 	Set to 0 for no, 1 indicate yes. Specify who can view photos.
 *	@param 	safetyLevel 	Set to 1 is "safe level", 2 is "PG", 3 is "X-rated."
 *	@param 	contentType 	Set to 1 is the "Photo", 2 is "screen shots", 3 is "Other."
 *	@param 	hidden 	Set to 1 is the "Photo", 2 is "screen shots", 3 is "Other."
 */
- (void)addFlickrUnitWithPhoto:(id<ISSCAttachment>)photo
                         title:(NSString *)title
                   description:(NSString *)description
                          tags:(NSString *)tags
                      isPublic:(NSNumber *)isPublic
                      isFriend:(NSNumber *)isFriend
                      isFamily:(NSNumber *)isFamily
                   safetyLevel:(NSNumber *)safetyLevel
                   contentType:(NSNumber *)contentType
                        hidden:(NSNumber *)hidden;

/**
 *	@brief	Add Tumblr content unit
 *
 *	@param 	text 	Content string, Can with HTML tags.
 *	@param 	title 	Title string.
 *	@param 	image 	Image attachment object
 *	@param 	url 	Jump Links
 *	@param 	blogName 	Blog name, or nil when sent to the main blog
 */
- (void)addTumblrUnitWithText:(NSString *)text
                        title:(NSString *)title
                        image:(id<ISSCAttachment>)image
                          url:(NSString *)url
                     blogName:(NSString *)blogName;

/**
 *	@brief	Add Dropbox content unit.
 *
 *	@param 	file 	File attachment object.
 */
- (void)addDropboxUnitWithFile:(id<ISSCAttachment>)file;

/**
 *	@brief	Add VKontakte content unit
 *
 *	@param 	message 	Message string.
 *	@param 	attachments 	Attachment list
 *	@param 	url 	Url string.
 *	@param 	groupId 	Group Id
 *	@param 	friendsOnly 	Whether to allow only friends to view
 *	@param 	locationCoordinate 	Location info
 */
- (void)addVKontakteUnitWithMessage:(NSString *)message
                        attachments:(NSArray *)attachments
                                url:(NSString *)url
                            groupId:(NSString *)groupId
                        friendsOnly:(NSNumber *)friendsOnly
                 locationCoordinate:(SSCLocationCoordinate2D *)locationCoordinate;

/**
 *	@brief	Add Instagram content unit
 *
 *	@param 	title 	Title string
 *	@param 	image 	Image attachment object
 */
- (void)addInstagramUnitWithTitle:(NSString *)title
                            image:(id<ISSCAttachment>)image;

/**
 *	@brief	Add YiXin session content unit，When custom YiXin session share content use this method，If the parameter is set to INHERIT_VALUE. will using the parent parameter value.
 *
 *  @since ver2.7.0
 *
 *	@param 	type 	Media type,Please see SSPublishContentMediaType
 *	@param 	content 	Content string
 *	@param 	title 	Title string
 *	@param 	url 	URL string
 *  @param  thumbImage  Thumbnails
 *	@param 	image 	Image attachment object
 *  @param  musicFileUrl    Music file url string.
 *  @param  extInfo     Extended Information
 *  @param  fileData    File data
 */
- (void)addYiXinSessionUnitWithType:(NSNumber *)type
                            content:(NSString *)content
                              title:(NSString *)title
                                url:(NSString *)url
                         thumbImage:(id<ISSCAttachment>)thumbImage
                              image:(id<ISSCAttachment>)image
                       musicFileUrl:(NSString *)musicFileUrl
                            extInfo:(NSString *)extInfo
                           fileData:(NSData *)fileData;

/**
 *	@brief	Add YiXin timeline content unit，When custom YiXin timeline share content use this method，If the parameter is set to INHERIT_VALUE. will using the parent parameter value.
 *
 *  @since ver2.7.0
 *
 *	@param 	type 	Media type,Please see SSPublishContentMediaType
 *	@param 	content 	Content string
 *	@param 	title 	Title string
 *	@param 	url 	URL string
 *  @param  thumbImage  Thumbnails
 *	@param 	image 	Image attachment object
 *  @param  musicFileUrl    Music file url string.
 *  @param  extInfo     Extended Information
 *  @param  fileData    File data
 */
- (void)addYiXinTimelineUnitWithType:(NSNumber *)type
                             content:(NSString *)content
                               title:(NSString *)title
                                 url:(NSString *)url
                          thumbImage:(id<ISSCAttachment>)thumbImage
                               image:(id<ISSCAttachment>)image
                        musicFileUrl:(NSString *)musicFileUrl
                             extInfo:(NSString *)extInfo
                            fileData:(NSData *)fileData;

/**
 *	@brief	Add WeChat session content unit，When custom WeChat session share content use this method，If the parameter is set to INHERIT_VALUE. will using the parent parameter value.
 *
 *  @since  ver2.7.0    增加缩略图参数
 *
 *	@param 	type 	Media type,Please see SSPublishContentMediaType
 *	@param 	content 	Content string
 *	@param 	title 	Title string
 *	@param 	url 	URL string
 *  @param  thumbImage  Thumbnails
 *	@param 	image 	Image attachment object
 *  @param  musicFileUrl    Music file url string.
 *  @param  extInfo     Extended Information
 *  @param  fileData    File data
 *  @param  emoticonData    Emoticon Data，Used to store Gif picture data
 */
- (void)addWeixinSessionUnitWithType:(NSNumber *)type
                             content:(NSString *)content
                               title:(NSString *)title
                                 url:(NSString *)url
                          thumbImage:(id<ISSCAttachment>)thumbImage
                               image:(id<ISSCAttachment>)image
                        musicFileUrl:(NSString *)musicFileUrl
                             extInfo:(NSString *)extInfo
                            fileData:(NSData *)fileData
                        emoticonData:(NSData *)emoticonData;

/**
 *	@brief	Add WeChat timeline content unit，When custom WeChat timeline share content use this method，If the parameter is set to INHERIT_VALUE. will using the parent parameter value.
 *
 *  @since  ver2.7.0    增加缩略图参数
 *
 *	@param 	type 	Media type,Please see SSPublishContentMediaType
 *	@param 	content 	Content string
 *	@param 	title 	Title string
 *	@param 	url 	URL string
 *  @param  thumbImage  Thumbnails
 *	@param 	image 	Image attachment object
 *  @param  musicFileUrl    Music file url string.
 *  @param  extInfo     Extended Information
 *  @param  fileData    File data
 *  @param  emoticonData    Emoticon Data，Used to store Gif picture data
 */
- (void)addWeixinTimelineUnitWithType:(NSNumber *)type
                              content:(NSString *)content
                                title:(NSString *)title
                                  url:(NSString *)url
                           thumbImage:(id<ISSCAttachment>)thumbImage
                                image:(id<ISSCAttachment>)image
                         musicFileUrl:(NSString *)musicFileUrl
                              extInfo:(NSString *)extInfo
                             fileData:(NSData *)fileData
                         emoticonData:(NSData *)emoticonData;

/**
 *	@brief	Add WeChat Favorite content unit，When custom WeChat timeline share content use this method，If the parameter is set to INHERIT_VALUE. will using the parent parameter value.
 *
 *	@param 	type 	Media type,Please see SSPublishContentMediaType
 *	@param 	content 	Content string
 *	@param 	title 	Title string
 *	@param 	url 	URL string
 *  @param  thumbImage  Thumbnails
 *	@param 	image 	Image attachment object
 *  @param  musicFileUrl    Music file url string.
 *  @param  extInfo     Extended Information
 *  @param  fileData    File data
 *  @param  emoticonData    Emoticon Data，Used to store Gif picture data
 */
- (void)addWeixinFavUnitWithType:(NSNumber *)type
                         content:(NSString *)content
                           title:(NSString *)title
                             url:(NSString *)url
                      thumbImage:(id<ISSCAttachment>)thumbImage
                           image:(id<ISSCAttachment>)image
                    musicFileUrl:(NSString *)musicFileUrl
                         extInfo:(NSString *)extInfo
                        fileData:(NSData *)fileData
                    emoticonData:(NSData *)emoticonData;


@end
