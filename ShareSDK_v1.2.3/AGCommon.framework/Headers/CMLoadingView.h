//
//  CMLoadingView.h
//  AppgoFramework
//
//  Created by 冯 鸿杰 on 13-1-22.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMLoadingView : UIView
{
    UIView *_backgroundView;
    UIActivityIndicatorView *_indicatorView;
    UILabel *_label;
    
    BOOL _needLayout;
    
}

/**
 *	@brief	提示信息
 */
@property (nonatomic,copy) NSString *text;

/**
 *	@brief	显示
 */
- (void)show;

/**
 *	@brief	隐藏
 */
- (void)hide;

@end
