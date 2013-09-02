//
//  SSEverNoteUserAttributes.h
//  EverNoteConnection
//
//  Created by vimfung on 13-5-8.
//  Copyright (c) 2013年 vimfung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/SSCDataObject.h>
#import "ISSEverNoteDataOutput.h"

/**
 *	@brief  用户属性信息
 */
@interface SSEverNoteUserAttributes : SSCDataObject

/**
 *	@brief	he location string that should be associated with the user in order to
 *          determine where notes are taken if not otherwise specified.
 */
@property (nonatomic,readonly) NSString *defaultLocationName;

/**
 *	@brief	if set, this is the latitude that should be assigned to any notes that have no other latitude information.
 */
@property (nonatomic,readonly) double defaultLatitude;

/**
 *	@brief	if set, this is the longitude that should be assigned to any notes that have no other longitude information.
 */
@property (nonatomic,readonly) double defaultLongitude;

/**
 *	@brief	if set, the user account is not yet confirmed for login. I.e. 
 *          the account has been created, but we are still waiting for the user to complete the activation step.
 */
@property (nonatomic,readonly) BOOL preactivation;

/**
 *	@brief	a list of promotions the user has seen. 
 *          This list may occasionally be modified by the system when promotions are no longer available.
 */
@property (nonatomic,readonly) NSArray *viewedPromotions;

/**
 *	@brief	if set, this is the email address that the user may send email to in order 
 *          to add an email note directly into the account via the SMTP email gateway. 
 *          This is the part of the email address before the '@' symbol ... our domain is not included. 
 *          If this is not set, the user may not add notes via the gateway.
 */
@property (nonatomic,readonly) NSString *incomingEmailAddress;

/**
 *	@brief	if set, this will contain a list of email addresses that have recently 
 *          been used as recipients of outbound emails by the user. 
 *          This can be used to pre-populate a list of possible destinations when a user wishes to send a note via email.
 */
@property (nonatomic,readonly) NSArray *recentMailedAddresses;

/**
 *	@brief	Free-form text field that may hold general support information, etc.
 */
@property (nonatomic,readonly) NSString *comments;

/**
 *	@brief	The date/time when the user agreed to the terms of service. 
 *          This can be used as the effective "start date" for the account.
 */
@property (nonatomic,readonly) long long dateAgreedToTermsOfService;

/**
 *	@brief	The number of referrals that the user is permitted to make.
 */
@property (nonatomic,readonly) long maxReferrals;

/**
 *	@brief	The number of referrals sent from this account.
 */
@property (nonatomic,readonly) long referralCount;

/**
 *	@brief	A code indicating where the user was sent from. AKA promotion code
 */
@property (nonatomic,readonly) NSString *refererCode;

/**
 *	@brief	The most recent date when the user sent outbound emails from the service. 
 *          Used with sentEmailCount to limit the number of emails that can be sent per day.
 */
@property (nonatomic,readonly) long long sentEmailDate;

/**
 *	@brief	The number of emails that were sent from the user via the service on sentEmailDate.
 *          Used to enforce a limit on the number of emails per user per day to prevent spamming.
 */
@property (nonatomic,readonly) long sentEmailCount;

/**
 *	@brief	If set, this is the maximum number of emails that may be sent in a given day from this account. 
 *          If unset, the server will use the configured default limit.
 */
@property (nonatomic,readonly) long dailyEmailLimit;

/**
 *	@brief	If set, this is the date when the user asked to be excluded from offers and promotions sent by Evernote. 
 *          If not set, then the user currently agrees to receive these messages.
 */
@property (nonatomic,readonly) long long emailOptOutDate;

/**
 *	@brief	If set, this is the date when the user asked to be included in offers and promotions sent by Evernote's partners. 
 *          If not sent, then the user currently does not agree to receive these emails.
 */
@property (nonatomic,readonly) long long partnerEmailOptInDate;

/**
 *	@brief	a 2 character language codes based on: http://ftp.ics.uci.edu/pub/ietf/http/related/iso639.txt 
 *          used for localization purposes to determine what language to use for the web interface and for other 
 *          direct communication (e.g. emails).
 */
@property (nonatomic,readonly) NSString *preferredLanguage;

/**
 *	@brief	Preferred country code based on ISO 3166-1-alpha-2 indicating the users preferred country
 */
@property (nonatomic,readonly) NSString *preferredCountry;

/**
 *	@brief	Boolean flag set to true if the user wants to clip full pages 
 *          by default when they use the web clipper without a selection.
 */
@property (nonatomic,readonly) BOOL clipFullPage;

/**
 *	@brief	The username of the account of someone who has chosen to enable Twittering into Evernote.
 *          This value is subject to change, since users may change their Twitter user name.
 */
@property (nonatomic,readonly) NSString *twitterUserName;

/**
 *	@brief	The unique identifier of the user's Twitter account if that user has chosen to enable Twittering into Evernote.
 */
@property (nonatomic,readonly) NSString *twitterId;

/**
 *	@brief	A name identifier used to identify a particular set of branding and light customization.
 */
@property (nonatomic,readonly) NSString *groupName;

/**
 *	@brief	a 2 character language codes based on: http://ftp.ics.uci.edu/pub/ietf/http/related/iso639.txt 
 *          If set, this is used to determine the language that should be used when processing images 
 *          and PDF files to find text. If not set, then the 'preferredLanguage' will be used.
 */
@property (nonatomic,readonly) NSString *recognitionLanguage;

/**
 *	@brief	a numeric identified which provides a linkage between 
 *          the user record and the direct credit card payment creditcard profile.
 */
@property (nonatomic,readonly) long long customerProfileId;

/**
 *	@brief
 */
@property (nonatomic,readonly) NSString *referralProof;

/**
 *	@brief	
 */
@property (nonatomic,readonly) BOOL educationalDiscount;

/**
 *	@brief	A string recording the business address of a Sponsored Account user who has requested invoicing.
 */
@property (nonatomic,readonly) NSString *businessAddress;

/**
 *	@brief	A flag indicating whether to hide the billing information on a sponsored account owner's settings page
 */
@property (nonatomic,readonly) BOOL hideSponsorBilling;

/**
 *	@brief	A flag indicating the user's sponsored group is exempt from sale tax
 */
@property (nonatomic,readonly) BOOL taxExempt;

/**
 *	@brief	创建用户属性
 *
 *	@param 	reader 	数据读取器
 *
 *	@return	用户属性对象
 */
+ (SSEverNoteUserAttributes *)userAttributesWithResponse:(id<ISSEverNoteDataOutput>)reader;

/**
 *	@brief	解析数据
 *
 *	@param 	reader 	数据读取器
 */
- (void)parse:(id<ISSEverNoteDataOutput>)reader;



@end
