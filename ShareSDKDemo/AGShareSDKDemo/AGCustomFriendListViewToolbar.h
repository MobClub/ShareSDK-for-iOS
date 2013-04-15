//
//  AGCustomFriendListViewToolbar.h
//  AGShareSDKDemo
//
//  Created by 冯 鸿杰 on 13-3-6.
//  Copyright (c) 2013年 vimfung. All rights reserved.
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
 *	@brief	初始化工具栏
 *
 *	@param 	frame 	显示范围
 *	@param 	selectedArray 	选中用户列表
 *  @param  imageCacheManager   图片缓存管理器
 *  @param  shareType   分享类型
 *  @param  itemClickHandler 列表项点击事件处理
 *  @param  completeHandler 完成事件处理
 *
 *	@return	工具栏视图
 */
- (id)initWithFrame:(CGRect)frame
      selectedArray:(NSMutableArray *)selectedArray
  imageCacheManager:(CMImageCacheManager *)imageCacheManager
          shareType:(ShareType)shareType
   itemClickHandler:(void(^)(NSMutableDictionary *userInfo))itemClickHandler
    completeHandler:(void(^)())completeHandler;

/**
 *	@brief	重新加载数据
 */
- (void)reloadData;


@end
