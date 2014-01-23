//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "ISSCComment.h"
#import "SSCShareDesc.h"
#import "SSCViewDesc.h"

/**
 *	@brief	Comment View Controller.
 */
@interface SSCCommentViewController : UIViewController <UITextViewDelegate>

/**
 *	@brief	Share operate related settings
 */
@property (nonatomic,retain) SSCShareDesc *shareDesc;

/**
 *	@brief	View description.
 */
@property (nonatomic,retain) SSCViewDesc *viewDesc;

/**
 *	@brief	Initialize comment view controller.
 *
 *	@param 	contentId 	Content id.
 *	@param 	topic 	Title
 *	@param 	comment 	Comment object.
 *  @param  resultHandler   Result handler.
 *
 *	@return	Comment view controller.
 */
- (id)initWithContentId:(NSString *)contentId
                  topic:(NSString *)topic
                comment:(id<ISSCComment>)comment
                 result:(SSCReplyResultEvent)resultHandler;

/**
 *	@brief	Set account sources，Said platform which allows users to login using authorized to comment. The default is nil, that the use of ShareSDK initialized platform as the source account.
 *
 *	@param 	platforms 	Platfrom list，Composed by the ShareType。
 */
- (void)setAccountSources:(NSArray *)platforms;


@end
