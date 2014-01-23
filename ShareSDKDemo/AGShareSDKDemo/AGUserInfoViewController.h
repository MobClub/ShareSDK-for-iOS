//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <ShareSDK/ShareSDK.h>

@class AGAppDelegate;

@interface AGUserInfoViewController : UIViewController <UITableViewDataSource,
                                                        UITableViewDelegate>
{
@private
    NSMutableDictionary *_infoDict;
    ShareType _type;
    SSUserFieldType _paramType;
    NSInteger _flag;
    NSString *_name;
    BOOL _initialized;
    
    UITableView *_tableView;
    AGAppDelegate *_appDelegate;
}

/**
 *	@brief	Initialize user information view controller.
 *
 *	@param 	type 	Platform type
 *
 *	@return	View controller.
 */
- (id)initWithType:(ShareType)type;

/**
 *	@brief	initialize user information view controller.
 *
 *	@param 	type 	Platform type.
 *	@param 	name 	Nickname
 *  @param  paramType   Parameter type.
 *
 *	@return	View controller.
 */
- (id)initWithType:(ShareType)type name:(NSString *)name paramType:(SSUserFieldType)paramType;



@end
