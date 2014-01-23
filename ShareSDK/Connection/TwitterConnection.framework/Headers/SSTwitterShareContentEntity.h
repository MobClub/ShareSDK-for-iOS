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
 *	@brief	Share Content Entity.
 */
@interface SSTwitterShareContentEntity : NSObject <ISSPlatformShareContentEntity,
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
 *	@brief	Image attachment.
 */
@property (nonatomic,retain) id<ISSCAttachment> image;

/**
 *	@brief	Location coordinate.
 */
@property (nonatomic,retain) SSCLocationCoordinate2D *locationCoordinate;

/**
 *	@brief	Parsed entity data by sharing content
 *
 *	@param 	content 	Content object.
 */
- (void)parseWithContent:(id<ISSContent>)content;

@end
