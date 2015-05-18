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

///#begin zh-cn
/**
 *	@brief	用户属性集合读取器
 */
///#end
///#begin en
/**
 *	@brief	User attributes reader.
 */
///#end
@interface SSEverNoteUserAttributesReader : NSObject
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
 *	@brief	he location string that should be associated with the user in order to
 *          determine where notes are taken if not otherwise specified.
 */
///#end
///#begin en
/**
 *	@brief	he location string that should be associated with the user in order to
 *          determine where notes are taken if not otherwise specified.
 */
///#end
@property (nonatomic,readonly) NSString *defaultLocationName;

///#begin zh-cn
/**
 *	@brief	if set, this is the latitude that should be assigned to any notes that have no other latitude information.
 */
///#end
///#begin en
/**
 *	@brief	if set, this is the latitude that should be assigned to any notes that have no other latitude information.
 */
///#end
@property (nonatomic,readonly) double defaultLatitude;

///#begin zh-cn
/**
 *	@brief	if set, this is the longitude that should be assigned to any notes that have no other longitude information.
 */
///#end
///#begin en
/**
 *	@brief	if set, this is the longitude that should be assigned to any notes that have no other longitude information.
 */
///#end
@property (nonatomic,readonly) double defaultLongitude;

///#begin zh-cn
/**
 *	@brief	if set, the user account is not yet confirmed for login. I.e.
 *          the account has been created, but we are still waiting for the user to complete the activation step.
 */
///#end
///#begin en
/**
 *	@brief	if set, the user account is not yet confirmed for login. I.e.
 *          the account has been created, but we are still waiting for the user to complete the activation step.
 */
///#end
@property (nonatomic,readonly) BOOL preactivation;

///#begin zh-cn
/**
 *	@brief	a list of promotions the user has seen.
 *          This list may occasionally be modified by the system when promotions are no longer available.
 */
///#end
///#begin en
/**
 *	@brief	a list of promotions the user has seen.
 *          This list may occasionally be modified by the system when promotions are no longer available.
 */
///#end
@property (nonatomic,readonly) NSArray *viewedPromotions;

///#begin zh-cn
/**
 *	@brief	if set, this is the email address that the user may send email to in order
 *          to add an email note directly into the account via the SMTP email gateway.
 *          This is the part of the email address before the '@' symbol ... our domain is not included.
 *          If this is not set, the user may not add notes via the gateway.
 */
///#end
///#begin en
/**
 *	@brief	if set, this is the email address that the user may send email to in order
 *          to add an email note directly into the account via the SMTP email gateway.
 *          This is the part of the email address before the '@' symbol ... our domain is not included.
 *          If this is not set, the user may not add notes via the gateway.
 */
///#end
@property (nonatomic,readonly) NSString *incomingEmailAddress;

///#begin zh-cn
/**
 *	@brief	if set, this will contain a list of email addresses that have recently
 *          been used as recipients of outbound emails by the user.
 *          This can be used to pre-populate a list of possible destinations when a user wishes to send a note via email.
 */
///#end
///#begin en
///#end
@property (nonatomic,readonly) NSArray *recentMailedAddresses;

///#begin zh-cn
/**
 *	@brief	Free-form text field that may hold general support information, etc.
 */
///#end
///#begin en
/**
 *	@brief	Free-form text field that may hold general support information, etc.
 */
///#end
@property (nonatomic,readonly) NSString *comments;

///#begin zh-cn
/**
 *	@brief	The date/time when the user agreed to the terms of service.
 *          This can be used as the effective "start date" for the account.
 */
///#end
///#begin en
/**
 *	@brief	The date/time when the user agreed to the terms of service.
 *          This can be used as the effective "start date" for the account.
 */
///#end
@property (nonatomic,readonly) long long dateAgreedToTermsOfService;

///#begin zh-cn
/**
 *	@brief	The number of referrals that the user is permitted to make.
 */
///#end
///#begin en
/**
 *	@brief	The number of referrals that the user is permitted to make.
 */
///#end
@property (nonatomic,readonly) long maxReferrals;

///#begin zh-cn
/**
 *	@brief	The number of referrals sent from this account.
 */
///#end
///#begin en
/**
 *	@brief	The number of referrals sent from this account.
 */
///#end
@property (nonatomic,readonly) long referralCount;

///#begin zh-cn
/**
 *	@brief	A code indicating where the user was sent from. AKA promotion code
 */
///#end
///#begin en
/**
 *	@brief	A code indicating where the user was sent from. AKA promotion code
 */
///#end
@property (nonatomic,readonly) NSString *refererCode;

///#begin zh-cn
/**
 *	@brief	The most recent date when the user sent outbound emails from the service.
 *          Used with sentEmailCount to limit the number of emails that can be sent per day.
 */
///#end
///#begin en
/**
 *	@brief	The most recent date when the user sent outbound emails from the service.
 *          Used with sentEmailCount to limit the number of emails that can be sent per day.
 */
///#end
@property (nonatomic,readonly) long long sentEmailDate;

///#begin zh-cn
/**
 *	@brief	The number of emails that were sent from the user via the service on sentEmailDate.
 *          Used to enforce a limit on the number of emails per user per day to prevent spamming.
 */
///#end
///#begin en
/**
 *	@brief	The number of emails that were sent from the user via the service on sentEmailDate.
 *          Used to enforce a limit on the number of emails per user per day to prevent spamming.
 */
///#end
@property (nonatomic,readonly) long sentEmailCount;

///#begin zh-cn
/**
 *	@brief	If set, this is the maximum number of emails that may be sent in a given day from this account.
 *          If unset, the server will use the configured default limit.
 */
///#end
///#begin en
/**
 *	@brief	If set, this is the maximum number of emails that may be sent in a given day from this account.
 *          If unset, the server will use the configured default limit.
 */
///#end
@property (nonatomic,readonly) long dailyEmailLimit;

///#begin zh-cn
/**
 *	@brief	If set, this is the date when the user asked to be excluded from offers and promotions sent by Evernote.
 *          If not set, then the user currently agrees to receive these messages.
 */
///#end
///#begin en
/**
 *	@brief	If set, this is the date when the user asked to be excluded from offers and promotions sent by Evernote.
 *          If not set, then the user currently agrees to receive these messages.
 */
///#end
@property (nonatomic,readonly) long long emailOptOutDate;

///#begin zh-cn
/**
 *	@brief	If set, this is the date when the user asked to be included in offers and promotions sent by Evernote's partners.
 *          If not sent, then the user currently does not agree to receive these emails.
 */
///#end
///#begin en
/**
 *	@brief	If set, this is the date when the user asked to be included in offers and promotions sent by Evernote's partners.
 *          If not sent, then the user currently does not agree to receive these emails.
 */
///#end
@property (nonatomic,readonly) long long partnerEmailOptInDate;

///#begin zh-cn
/**
 *	@brief	a 2 character language codes based on: http://ftp.ics.uci.edu/pub/ietf/http/related/iso639.txt
 *          used for localization purposes to determine what language to use for the web interface and for other
 *          direct communication (e.g. emails).
 */
///#end
///#begin en
/**
 *	@brief	a 2 character language codes based on: http://ftp.ics.uci.edu/pub/ietf/http/related/iso639.txt
 *          used for localization purposes to determine what language to use for the web interface and for other
 *          direct communication (e.g. emails).
 */
///#end
@property (nonatomic,readonly) NSString *preferredLanguage;

///#begin zh-cn
/**
 *	@brief	Preferred country code based on ISO 3166-1-alpha-2 indicating the users preferred country
 */
///#end
///#begin en
/**
 *	@brief	Preferred country code based on ISO 3166-1-alpha-2 indicating the users preferred country
 */
///#end
@property (nonatomic,readonly) NSString *preferredCountry;

///#begin zh-cn
/**
 *	@brief	Boolean flag set to true if the user wants to clip full pages
 *          by default when they use the web clipper without a selection.
 */
///#end
///#begin en
/**
 *	@brief	Boolean flag set to true if the user wants to clip full pages
 *          by default when they use the web clipper without a selection.
 */
///#end
@property (nonatomic,readonly) BOOL clipFullPage;

///#begin zh-cn
/**
 *	@brief	The username of the account of someone who has chosen to enable Twittering into Evernote.
 *          This value is subject to change, since users may change their Twitter user name.
 */
///#end
///#begin en
/**
 *	@brief	The username of the account of someone who has chosen to enable Twittering into Evernote.
 *          This value is subject to change, since users may change their Twitter user name.
 */
///#end
@property (nonatomic,readonly) NSString *twitterUserName;

///#begin zh-cn
/**
 *	@brief	The unique identifier of the user's Twitter account if that user has chosen to enable Twittering into Evernote.
 */
///#end
///#begin en
/**
 *	@brief	The unique identifier of the user's Twitter account if that user has chosen to enable Twittering into Evernote.
 */
///#end
@property (nonatomic,readonly) NSString *twitterId;

///#begin zh-cn
/**
 *	@brief	A name identifier used to identify a particular set of branding and light customization.
 */
///#end
///#begin en
/**
 *	@brief	A name identifier used to identify a particular set of branding and light customization.
 */
///#end
@property (nonatomic,readonly) NSString *groupName;

///#begin zh-cn
/**
 *	@brief	a 2 character language codes based on: http://ftp.ics.uci.edu/pub/ietf/http/related/iso639.txt
 *          If set, this is used to determine the language that should be used when processing images
 *          and PDF files to find text. If not set, then the 'preferredLanguage' will be used.
 */
///#end
///#begin en
/**
 *	@brief	a 2 character language codes based on: http://ftp.ics.uci.edu/pub/ietf/http/related/iso639.txt
 *          If set, this is used to determine the language that should be used when processing images
 *          and PDF files to find text. If not set, then the 'preferredLanguage' will be used.
 */
///#end
@property (nonatomic,readonly) NSString *recognitionLanguage;

///#begin zh-cn
/**
 *	@brief	a numeric identified which provides a linkage between
 *          the user record and the direct credit card payment creditcard profile.
 */
///#end
///#begin en
/**
 *	@brief	a numeric identified which provides a linkage between
 *          the user record and the direct credit card payment creditcard profile.
 */
///#end
@property (nonatomic,readonly) long long customerProfileId;

///#begin zh-cn
/**
 *	@brief None
 */
///#end
///#begin en
/**
 *	@brief None
 */
///#end
@property (nonatomic,readonly) NSString *referralProof;

///#begin zh-cn
/**
 *	@brief None
 */
///#end
///#begin en
/**
 *	@brief None
 */
///#end
@property (nonatomic,readonly) BOOL educationalDiscount;

///#begin zh-cn
/**
 *	@brief	A string recording the business address of a Sponsored Account user who has requested invoicing.
 */
///#end
///#begin en
/**
 *	@brief	A string recording the business address of a Sponsored Account user who has requested invoicing.
 */
///#end
@property (nonatomic,readonly) NSString *businessAddress;

///#begin zh-cn
/**
 *	@brief	A flag indicating whether to hide the billing information on a sponsored account owner's settings page
 */
///#end
///#begin en
/**
 *	@brief	A flag indicating whether to hide the billing information on a sponsored account owner's settings page
 */
///#end
@property (nonatomic,readonly) BOOL hideSponsorBilling;

///#begin zh-cn
/**
 *	@brief	A flag indicating the user's sponsored group is exempt from sale tax
 */
///#end
///#begin en
/**
 *	@brief	A flag indicating the user's sponsored group is exempt from sale tax
 */
///#end
@property (nonatomic,readonly) BOOL taxExempt;

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
 *	@brief	创建用户属性集合信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
///#end
///#begin en
/**
 *	@brief	Create a user attributes reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
///#end
+ (SSEverNoteUserAttributesReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
