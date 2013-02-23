//
//  AGSectionView.h
//  AGShareSDKDemo
//
//  Created by 冯 鸿杰 on 13-1-30.
//  Copyright (c) 2013年 vimfung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AGSectionView : UIView
{
@private
    UILabel *_titleLabel;
}

@property (nonatomic,readonly) UILabel *titleLabel;

@end
