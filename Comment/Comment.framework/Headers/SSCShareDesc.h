//
//  SSCShareDesc.h
//  Comment
//
//  Created by 冯 鸿杰 on 13-12-4.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	分享相关描述
 */
@interface SSCShareDesc : NSObject

/**
 *	@brief	分享平台列表，用于显示在菜单中的平台列表，默认为初始化的所有平台
 */
@property (nonatomic,retain) NSArray *menuItems;

/**
 *	@brief	分享内容实体
 */
@property (nonatomic,retain) id<ISSContent> contentEntity;

/**
 *	@brief	授权选项
 */
@property (nonatomic,retain) id<ISSAuthOptions> authOptions;

/**
 *	@brief	分享选项
 */
@property (nonatomic,retain) id<ISSShareOptions> shareOptions;

/**
 *	@brief	分享事件处理器
 */
@property (nonatomic,copy) SSPublishContentEventHandler shareEventHandler;


@end
