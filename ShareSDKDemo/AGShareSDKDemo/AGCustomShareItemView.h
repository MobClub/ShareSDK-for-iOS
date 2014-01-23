//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <AGCommon/CMHTableViewItem.h>

/**
 *	@brief	Custom Share Item View.
 */
@interface AGCustomShareItemView : CMHTableViewItem
{
@private
    UIImageView *_iconImageView;
    id _clickHandler;
}

/**
 *	@brief	Icon image view.
 */
@property (nonatomic,readonly) UIImageView *iconImageView;

/**
 *	@brief	Initialize custom share item view.
 *
 *	@param 	reuseIdentifier 	Reuse identifier
 *  @param  clickHandler    Click handler.
 *
 *	@return	Item view.
 */
- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier
                 clickHandler:(void(^)(NSIndexPath *indexPath))clickHandler;


@end
