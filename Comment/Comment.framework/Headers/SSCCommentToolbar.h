//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "SSCommentTypeDef.h"
#import "SSCShareDesc.h"
#import "SSCViewDesc.h"

/**
 *	@brief	Comment Toolbar
 */
@interface SSCCommentToolbar : UIView

/**
 *	@brief	Share operate related settings
 */
@property (nonatomic,retain) SSCShareDesc *shareDesc;

/**
 *	@brief	View description.
 */
@property (nonatomic,retain) SSCViewDesc *viewDesc;

/**
 *	@brief	Back button hidden.
 */
@property (nonatomic) BOOL backButtonHidden;

/**
 *	@brief	Initialize comment toolbar.
 *
 *	@param 	contentId 	Content id.
 *	@param 	title 	Title
 *	@param 	frame 	Display rect.
 *
 *	@return	Comment toolbar.
 */
- (id)initWithContentId:(NSString *)contentId
                  title:(NSString *)title
                  frame:(CGRect)frame;

/**
 *	@brief	Set account sources, which allows users to log in using the platform which authorized to comment. The default is nil, that the use of ShareSDK initialized platform as the source account.
 *
 *	@param 	platforms 	Platform list, Composed by the ShareType.
 */
- (void)setAccountSources:(NSArray *)platforms;

/**
 *	@brief	Back event. click the Back button to trigger
 *
 *	@param 	handler 	Event handler.
 */
- (void)setBackEvent:(SSCCommentListPageBackEvent)handler;


@end
