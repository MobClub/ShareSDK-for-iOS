//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.mob.com
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
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
 *	@brief	初始化视图控制器
 *
 *	@param 	type 	社会化平台类型
 *
 *	@return	视图控制器
 */
- (id)initWithType:(ShareType)type;

/**
 *	@brief	初始化视图控制器
 *
 *	@param 	type 	社会化平台类型
 *	@param 	name 	用户昵称
 *  @param  paramType   参数类型
 *
 *	@return	视图控制器
 */
- (id)initWithType:(ShareType)type name:(NSString *)name paramType:(SSUserFieldType)paramType;



@end
