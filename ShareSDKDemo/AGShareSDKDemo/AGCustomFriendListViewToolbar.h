//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <AGCommon/CMHTableView.h>
#import <AGCommon/CMImageCacheManager.h>
#import <ShareSDK/ShareSDK.h>

@interface AGCustomFriendListViewToolbar : UIView <CMHTableViewDataSource,
                                                   CMHTableViewDelegate>
{
@private
    UIImageView *_bgView;
    UIButton *_completeButton;
    CMHTableView *_tableView;
    
    NSMutableArray *_selectedArray;
    CMImageCacheManager *_imageCacheManager;
    ShareType _shareType;
    id _itemClickHandler;
    id _completeHandler;
}

/**
 *	@brief	Initialize toolbar.
 *
 *	@param 	frame 	Display rect.
 *	@param 	selectedArray 	Selected user list.
 *  @param  imageCacheManager   Image cache manager.
 *  @param  shareType   Platform type.
 *  @param  itemClickHandler Item click handler.
 *  @param  completeHandler Complete handler.
 *
 *	@return	Toolbar view.
 */
- (id)initWithFrame:(CGRect)frame
      selectedArray:(NSMutableArray *)selectedArray
  imageCacheManager:(CMImageCacheManager *)imageCacheManager
          shareType:(ShareType)shareType
   itemClickHandler:(void(^)(NSMutableDictionary *userInfo))itemClickHandler
    completeHandler:(void(^)())completeHandler;

/**
 *	@brief	Reload data.
 */
- (void)reloadData;


@end
