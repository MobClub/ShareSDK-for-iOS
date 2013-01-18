//
//  QuiltItemView.h
//  CommonModule
//
//  Created by 冯 鸿杰 on 12-10-16.
//  Copyright (c) 2012年 掌淘科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IQuiltItemView.h"

/**
 *	@brief	瀑布流子项视图
 */
@interface QuiltItemView : UIView <IQuiltItemView>
{
@private
    NSString *_reuseIdentifier;
    id<IQuiltItemViewConstructorDelegate> _constructorDelegate;
}

/**
 *	@brief	复用标识
 */
@property (nonatomic,readonly) NSString *reuseIdentifier;

/**
 *	@brief	构造器协议对象
 */
@property (nonatomic,assign) id<IQuiltItemViewConstructorDelegate> constructorDelegate;



@end
