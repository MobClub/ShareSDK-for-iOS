//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	Share content entity.
 */
@interface SSEverNoteShareContentEntity : NSObject <ISSPlatformShareContentEntity,
                                                    NSCoding>
{
@private
    NSMutableDictionary *_dict;
}

/**
 *	@brief	Content string.
 */
@property (nonatomic,copy) NSString *content;

/**
 *	@brief	Title string.
 */
@property (nonatomic,copy) NSString *title;

/**
 *	@brief	Image resource list. Element is ISSAttachment protocol object
 */
@property (nonatomic,retain) NSArray *resources;

/**
 *	@brief	Notebook id.
 */
@property (nonatomic,copy) NSString *notebookGuid;

/**
 *	@brief	Tag guid list.
 */
@property (nonatomic,retain) NSArray *tagsGuid;


/**
 *	@brief	By sharing content parsed entity data
 *
 *	@param 	content 	Share content object
 */
- (void)parseWithContent:(id<ISSContent>)content;

@end
