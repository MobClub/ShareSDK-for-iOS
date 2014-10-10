//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.mob.com
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
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
