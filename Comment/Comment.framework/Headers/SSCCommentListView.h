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
 *	@brief	Comment List View
 */
@interface SSCCommentListView : UIView <UITableViewDataSource,
                                        UITableViewDelegate>

/**
 *	@brief	Share description.
 */
@property (nonatomic,retain) SSCShareDesc *shareDesc;

/**
 *	@brief	View description
 */
@property (nonatomic,retain) SSCViewDesc *viewDesc;

/**
 *	@brief	Initialize comment list view.
 *
 *	@param 	contentId 	Content id.
 *  @param  title   Title
 *  @param  order   Order method
 *	@param 	frame 	Display rect.
 *
 *	@return	Comment list view.
 */
- (id)initWithContentId:(NSString *)contentId
                  title:(NSString *)title
                  order:(NSComparator)order
                  frame:(CGRect)frame;

/**
 *	@brief	Initialize complex comment list view.
 *
 *	@param 	contentId 	Content id
 *	@param 	title 	Title
 *	@param 	menuItems 	Menu items.
 *	@param 	frame 	Display rect.
 *
 *	@return	comment list view.
 */
- (id)initWithContentId:(NSString *)contentId
                  title:(NSString *)title
              menuItems:(NSArray *)menuItems
                  frame:(CGRect)frame;

/**
 *	@brief	Set account sources，Said platform which allows users to login using authorized to comment. The default is nil, that the use of ShareSDK initialized platform as the source account.
 *
 *	@param 	platforms 	Platform list，Composed by the ShareType。
 */
- (void)setAccountSources:(NSArray *)platforms;

/**
 *	@brief	Set header view.
 *
 *	@param 	header 	Header view.
 */
- (void)setHeaderView:(UIView *)headerView;

/**
 *	@brief	reload data.
 */
- (void)reloadData;

@end
